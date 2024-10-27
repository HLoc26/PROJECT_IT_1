import knex from "../config/knex.js";

// Controller or Service function to get tracks with artists
export async function getTracksPage(req, res) {
	try {
		const tracks = await knex("tracks")
			.join("artist_perform", "tracks.track_id", "=", "artist_perform.track_id")
			.join("artists", "artist_perform.artist_id", "=", "artists.artist_id")
			.select("tracks.*", "artists.*");

		tracks.forEach((track) => {
			console.log(track.track_title, track.artist_name);
		});

		res.render("container", { view: "tracks", tracks: tracks });
	} catch (error) {
		console.error(error);
		res.status(500).send("An error occurred while retrieving the tracks");
	}
}
