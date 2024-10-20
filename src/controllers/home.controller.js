import { hash } from "bcrypt";
import knex from "../config/knex.js";

// Các hàm trả về dữ liệu cho routes/web.js
const getLogin = (req, res) => {
	res.render("login");
};

const getHomepage = (req, res) => {
	res.render("container", { view: "homepage" });
};

const getArtistsPage = (req, res) => {
	res.render("container", { view: "artists" });
};

const getTracksPage = (req, res) => {
	res.render("container", { view: "tracks" });
};

const getProfilePage = (req, res) => {
	res.render("container", { view: "profile" });
};

const postRegister = async (req, res) => {
	const { user_name, user_email, user_password } = req.body;
	try {
		// console.log(user_name, user_email, user_password);
		// Check if email is undefined
		if (!user_email) {
			console.log("Email is required");
			return res.status(400).json({ error: "Email is required" });
		}
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
		res.status(201).json({ message: "Account created successfully!" });
	} catch (error) {
		console.error(error);
		res.status(500).json({ error: "Internal server error" });
	}
};

const postLogin = (req, res) => {
	res.send("Logged in!");
};

export default {
	getHomepage,
	getArtistsPage,
	getTracksPage,
	getProfilePage,
	getLogin,
	postRegister,
	postLogin,
};
