import { compare, hash } from "bcrypt";
import artistService from "../services/artists.service.js";
import userService from "../services/users.service.js";
import trackService from "../services/tracks.service.js";
import albumService from "../services/albums.service.js";
import historyService from "../services/history.service.js";
import likeService from "../services/like.service.js";

export default {
	// Các hàm trả về dữ liệu cho routes/web.js
	getLogin(req, res) {
		res.render("layouts/login", { layout: false });
	},

	async getHomepage(req, res) {
		const username = req.session.username;
		const recent_tracks = await historyService.findByUserId(res.locals.user_id);

		// Map recent_tracks to fetch additional details
		const history = await Promise.all(
			recent_tracks.map(async (recentTrack) => {
				const track = await trackService.findById(recentTrack.track_id);
				const album = await albumService.findByTrackId(recentTrack.track_id);
				const artist = await artistService.findByTrackId(recentTrack.track_id);
				const uploader = await userService.findById(track.uploader_id);
				return { ...track, ...album, ...artist, ...uploader };
			})
		);

		console.log(history);

		res.render("homepage", { track_history: history, username: username });
	},

	async getProfilePage(req, res) {
		const user_id = res.locals.user_id;
		const user = await userService.findById(user_id);
		const track_history = await historyService.findByUserId(user_id);

		const liked_artists = await likeService.findLikedArtists(user_id);
		// console.log(liked_artists);
		// console.log(track_history);

		res.render("vwProfile/my_profile", { user: user, track_history: track_history, liked_artists: liked_artists });
	},

	async getLogout(req, res) {
		req.session.destroy(function (err) {
			if (err) {
				return res.send("Error logging out");
			}
			console.log("Logged out");
			res.render("layouts/login", { layout: false });
		});
	},

	async postRegister(req, res) {
		const { user_name, user_email, user_password } = req.body;
		try {
			// Query
			const existing = await userService.findByEmail(user_email);
			console.log("Existing:", existing);
			if (existing.length) {
				console.log("Email in use");
				return res.status(400).json({ error: "Email already in use" });
			}
			const hashedPwd = await hash(user_password, 10);

			console.log("HashedPWD:", hashedPwd);

			const new_user = {
				user_name: user_name,
				user_password: hashedPwd,
				user_email: user_email,
				user_role: "user",
			};

			const ret = await userService.add(new_user);

			console.log(`Created ${ret} row`); // TO-DO: Show success alert
			return res.status(201).json({ message: "Account created successfully!" });
		} catch (error) {
			console.error(error);
			return res.status(500).json({ error: "Internal server error" });
		}
	},

	async postLogin(req, res) {
		// console.log(req.body); // Debug
		const { login_email, login_password } = req.body;

		try {
			const users = await userService.findByEmail(login_email);
			// console.log(user); // Debug
			if (users.length === 0) {
				console.log("Wrong email");
				return res.status(401).json({ error: "Wrong email or password!" });
			}
			const user = users[0];
			const match = await compare(login_password, user.user_password);
			if (!match) {
				console.log("Wrong pwd");
				return res.status(401).json({ error: "Wrong email or password" });
			}

			req.session.user_id = user.user_id;
			req.session.username = user.user_name;
			req.session.role = user.user_role;
			req.session.isAuthentication = true;

			console.log("Login OK");
			return res.status(200).redirect("/home");
		} catch (error) {
			console.log(error);
			return res.status(500).json({ error: "Internal server error" });
		}
	},
};
