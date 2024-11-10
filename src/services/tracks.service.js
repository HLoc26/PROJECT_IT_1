import db from "../config/knex.js";

export default {
	findByArtistId(artist_id) {
		const songs = db("tracks as t")
			.join("artist_perform as ap", "t.track_id", "ap.track_id") // Join artist_perform
			.join("artists as a", "ap.artist_id", "a.artist_id")
			.where("a.artist_id", artist_id);
		return songs;
	},

	findAll() {
		return db("tracks as t")
			.leftJoin("artist_perform as ap", "t.track_id", "ap.track_id")
			.leftJoin("artists as a", "ap.artist_id", "a.artist_id")
			.select(
				"t.track_id",
				"t.track_title",
				"t.track_mp3_path", // Additional track field
				db.raw("STRING_AGG(a.artist_name, ', ') AS artist_name"), // Aggregate artist names
				db.raw("MIN(a.artist_pic_path) AS artist_pic") // Use MAX or any aggregate function for non-grouped fields
			)
			.groupBy("t.track_id", "t.track_title", "t.track_mp3_path"); // Group by all non-aggregated fields
	},

	findByAlbumId(album_id) {
		const tracks = db("tracks as t")
			.join("track_album as ta", "ta.track_id", "t.track_id") // Join track_album
			.join("albums as a", "a.album_id", "ta.album_id")
			.where("a.album_id", album_id);
		return tracks;
	},

	findById(track_id) {
		const track = db("tracks as t").select("*").where("t.track_id", track_id).first();
		return track;
	},

	add(entity) {
		// TODO: Insert to user_upload
		const ret = db("tracks").insert(entity);
		return ret;
	},
};
