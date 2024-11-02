import Track from "../models/Track.js";
import Album from "../models/Album.js";
// Controller or Service function to get tracks with artists
export async function getTracksPage(req, res) {
	try {
		const tracks = await Track.getTracksArtists();

		tracks.forEach((track) => {
			console.log(track.track_title, track.artist_name);
		});

		res.render("vwTracks/tracks", { tracks: tracks });
	} catch (error) {
		console.error(error);
		res.status(500).send("An error occurred while retrieving the tracks");
	}
}
