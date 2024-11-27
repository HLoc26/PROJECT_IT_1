import trackService from "../services/tracks.service.js";
import albumService from "../services/albums.service.js";
import artistService from "../services/artists.service.js";
import historyService from "../services/history.service.js";

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
};
