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

export async function getTrackDetail(req, res) {
	try {
		const id = req.params.id; // Track id
		const track = await Track.getTrackInfo(id);
		const artist = await Track.getArtistInfo(id);
		const album = await Track.getAlbumInfo(id);

		console.log(track);
		console.log(artist);
		console.log(album);

		return res.render("vwTracks/track_detail", { track: track, artist: artist, album: album });
	} catch (error) {
		console.error(error);
		res.status(500).send("An error occurred while retrieving the track's information");
	}
}
