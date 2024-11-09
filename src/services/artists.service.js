import db from "../config/knex.js";
export default {
	getArtists() {
		return db("artists").select("*");
	},

	get10Artists() {
		return db.raw("SELECT TOP 10 * FROM artists");
	},

	findById(artist_id) {
		const artist = db("artists").select("*").where("artist_id", artist_id).first();
		return artist;
	},
	findByTrackTitle(track_title) {
		try {
			const tracks = db("tracks as t")
				.join("artist_perform as ap", "t.track_id", "ap.track_id") // Join artist_perform
				.join("artists as a", "ap.artist_id", "a.artist_id")
				.where("t.track_title", track_title)
				.first();
			return tracks;
		} catch (error) {
			console.error(`Error find artist by track title ${track_title}:`, error);
			throw error;
		}
	},
	findByAlbumId(album_id) {
		try {
			// Lấy thông tin của artist dựa vào album_id
			const artist = db("artists as ar")
				.join("albums as al", "ar.artist_id", "al.artist_id") // Join with albums
				.select("ar.artist_id", "ar.artist_name", "ar.artist_pic_path")
				.where("al.album_id", album_id)
				.first();
			return artist;
		} catch (error) {
			console.error(`Error retrieving artist by album id ${album_id}:`, error);
			throw error;
		}
	},
	findByTrackId(track_id) {
		const artist = knex("tracks as t")
			.join("artist_perform as ap", "t.track_id", "ap.track_id") // Join artist_perform
			.join("artists as a", "a.artist_id", "ap.artist_id")
			.select(
				"t.track_id",
				knex.raw("STRING_AGG(a.artist_name, ', ') AS artist_name"), // Aggregate artist names
				knex.raw("MIN(a.artist_pic_path) AS artist_pic") // Use MAX or any aggregate function for non-grouped fields
			)
			.where("t.track_id", track_id)
			.groupBy("t.track_id")
			.first();
		return artist;
	},
};
