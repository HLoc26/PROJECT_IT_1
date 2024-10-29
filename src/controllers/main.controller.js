import { compare, hash } from "bcrypt";
import knex from "../config/knex.js";
import { getTracksPage } from "./tracks.controller.js";
import { getArtistsPage } from "./artists.controller.js";
import { getHomepage } from "./homepage.controller.js";

// Các hàm trả về dữ liệu cho routes/web.js
const getLogin = (req, res) => {
	res.render("login");
};

const getProfilePage = (req, res) => {
	res.render("container", { view: "profile" });
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
			console.log("Wro ng email");
			return res.status(401).json({ error: "Wrong email or password!" });
		}

		const match = await compare(login_password, user.user_password);
		if (!match) {
			console.log("Wrong pwd");
			return res.status(401).json({ error: "Wrong email or password" });
		}

		return res.status(200).json({ message: "Login success!" });
	} catch (error) {
		console.log(error);
		return res.status(500).json({ error: "Internal server error" });
	}
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
