import trackService from "../services/tracks.service.js";
import albumService from "../services/albums.service.js";
import artistService from "../services/artists.service.js";
import historyService from "../services/history.service.js";
import likeService from "../services/like.service.js";
export default {
	async getTrackInfo(req, res) {
		const track_id = req.params.id;

		const track = await trackService.findById(track_id);
		const album = await albumService.findByTrackId(track_id);
		const artist = await artistService.findByTrackId(track_id);

		const ret = { ...track, ...album, ...artist };

		// console.log("RET: ", ret);

		res.status(200).json(ret);
	},

	async addHistory(req, res) {
		console.log("AddHistory: ", req.body);
		const { user_id, track_id } = req.body;
		console.log(user_id, track_id);
		const entity = {
			user_id: user_id,
			track_id: track_id,
			time: new Date().toISOString(),
		};

		const ret = await historyService.addHistory(entity);
		console.log(ret);
		res.status(200).json({ message: "Saved history" });
	},

	async getSession(req, res) {
		if (req.session && req.session.user_id) {
			res.json({
				user_id: req.session.user_id,
				username: req.session.username,
			});
		} else {
			res.status(401).json({ message: "User not authenticated" });
		}
	},

	async like(req, res) {
		// console.log("like:", req.body);
		const { type, id } = req.body;
		const user_id = res.locals.user_id;
		const time = new Date().toISOString();
		try {
			switch (type) {
				case "track":
					await likeService.likeTrack(user_id, id, time);
					break;
				case "artist":
					await likeService.likeArtist(user_id, id, time);
					break;
				case "playlist":
					await likeService.likePlaylist(user_id, id, time);
					break;
				case "album":
					await likeService.likeAlbum(user_id, id, time);
					break;
				default:
					break;
			}
			return res.status(200).json({ message: "Success" });
		} catch (error) {
			return res.status(400).json({ message: error });
		}
	},

	async unlike(req, res) {
		// console.log("unlike:", req.body);
		const { type, id } = req.body;
		const user_id = res.locals.user_id;
		try {
			switch (type) {
				case "track":
					await likeService.unlikeTrack(user_id, id);
					break;
				case "artist":
					await likeService.unlikeArtist(user_id, id);
					break;
				case "playlist":
					await likeService.unlikePlaylist(user_id, id);
					break;
				case "album":
					await likeService.unlikeAlbum(user_id, id);
					break;
				default:
					break;
			}
			return res.status(200).json({ message: "Success" });
		} catch (error) {
			return res.status(400).json({ message: error });
		}
	},
};
