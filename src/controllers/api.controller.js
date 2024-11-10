import artistsService from "../services/artists.service.js";
import albumService from "../services/albums.service.js";

export default {
	async getAlbumInfo(req, res) {
		const trackTitle = req.params.title;
		// console.log("/api/album/:title >>>", trackTitle);
		try {
			const album = await albumService.findByTrackTitle(trackTitle);
			const track = await artistsService.findByTrackTitle(trackTitle);
			if (!album.album_id) {
				res.json(track);
				return;
			}
			res.json(album); // Send album data as JSON
		} catch (error) {
			console.error(error);
			res.status(500).send("Internal Server Error");
		}
	},
};
