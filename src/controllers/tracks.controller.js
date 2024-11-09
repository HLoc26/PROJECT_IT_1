import artistService from "../services/artists.service.js";
import albumService from "../services/albums.service.js";
import trackService from "../services/tracks.service.js";

export default {
	// Controller or Service function to get tracks with artists
	async getTracksPage(req, res) {
		try {
			const tracks = await trackService.findAll();

			// Debugging
			// tracks.forEach((track) => {
			// 	console.log(track.track_title, track.artist_name);
			// });

			res.render("vwTracks/tracks", { tracks: tracks });
		} catch (error) {
			console.error(error);
			res.status(500).send("An error occurred while retrieving the tracks");
		}
	},

	async getTrackDetail(req, res) {
		try {
			const track_id = req.params.id; // Track id
			const track = await trackService.findById(track_id);
			const artist = await artistService.findByTrackId(track_id);
			const album = await albumService.findByTrackId(track_id);

			// Debugging
			// console.log(track);
			// console.log(artist);
			// console.log(album);

			return res.render("vwTracks/track_detail", { track: track, artist: artist, album: album });
		} catch (error) {
			console.error(error);
			res.status(500).send("An error occurred while retrieving the track's information");
		}
	},
};
