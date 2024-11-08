import { compare, hash } from "bcrypt";
import knex from "../config/knex.js";
import { getTracksPage, getTrackDetail } from "./tracks.controller.js";
import { getArtistsPage, getArtistInfo, getAlbum } from "./artists.controller.js";
import { getHomepage } from "./homepage.controller.js";

// Các hàm trả về dữ liệu cho routes/web.js
const getLogin = (req, res) => {
	res.render("layouts/login", { layout: false });
};

const getProfilePage = (req, res) => {
	res.render("profile");
};

const getLogout = (req, res) => {
	req.session.destroy(function (err) {
		if (err) {
			return res.send("Error logging out");
		}
		console.log("Logged out");
		res.render("layouts/login", { layout: false });
	});
};

const postRegister = async (req, res) => {
	const { user_name, user_email, user_password } = req.body;
	try {
		// Query
		const existing = await knex("users").select("user_email").where("user_email", user_email);
		console.log("Existing:", existing);
		if (existing.length) {
			console.log("Email in use");
			return res.status(400).json({ error: "Email already in use" });
		}
		const hashedPwd = await hash(user_password, 10);

		console.log("HashedPWD:", hashedPwd);

		await knex("users").insert({
			user_name,
			user_password: hashedPwd,
			user_email,
			user_profile_pic: null,
			user_role: "user",
		});
		console.log("Created!"); // TO-DO: Show success alert
		return res.status(201).json({ message: "Account created successfully!" });
	} catch (error) {
		console.error(error);
		return res.status(500).json({ error: "Internal server error" });
	}
};

const postLogin = async (req, res) => {
	// console.log(req.body); // Debug
	const { login_email, login_password } = req.body;

	try {
		const user = await knex("users").where({ user_email: login_email }).first();
		// console.log(user); // Debug
		if (!user) {
			console.log("Wrong email");
			return res.status(401).json({ error: "Wrong email or password!" });
		}

		const match = await compare(login_password, user.user_password);
		if (!match) {
			console.log("Wrong pwd");
			return res.status(401).json({ error: "Wrong email or password" });
		}

		req.session.userId = user.user_id;
		req.session.username = user.user_name;
		req.session.role = user.user_role;
		req.session.isAuthentication = true;
		console.log("Login OK");
		return res.status(200).redirect("/home");
	} catch (error) {
		console.log(error);
		return res.status(500).json({ error: "Internal server error" });
	}
};

export default {
	getHomepage,
	getArtistsPage,
	getArtistInfo,
	getAlbum,
	getTracksPage,
	getTrackDetail,
	getProfilePage,
	getLogin,
	getLogout,
	postRegister,
	postLogin,
};
