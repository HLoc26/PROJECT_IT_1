import trackService from "../services/tracks.service.js";
import albumService from "../services/albums.service.js";
import artistService from "../services/artists.service.js";

export default {
	async getTrackInfo(req, res) {
		const track_id = req.params.id;

		const track = await trackService.findById(track_id);
		const album = await albumService.findByTrackId(track_id);
		const artist = await artistService.findByTrackId(track_id);

		const ret = { ...track, ...album, ...artist };

		console.log("RET: ", ret);

		res.status(200).json(ret);
	},
};
