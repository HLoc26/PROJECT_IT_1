import knex from "../config/knex.js";

class Track {
	static async getTracksArtists() {
		return await knex("tracks as t")
			.leftJoin("artist_perform as ap", "t.track_id", "ap.track_id")
			.leftJoin("artists as a", "ap.artist_id", "a.artist_id")
			.select(
				"t.track_id",
				"t.track_title",
				"t.track_mp3_path", // Additional track field
				knex.raw("STRING_AGG(a.artist_name, ', ') AS artist_name"), // Aggregate artist names
				knex.raw("MAX(a.artist_pic_path) AS artist_pic") // Use MAX or any aggregate function for non-grouped fields
			)
			.groupBy("t.track_id", "t.track_title", "t.track_mp3_path"); // Group by all non-aggregated fields
	}
}

export default Track;
