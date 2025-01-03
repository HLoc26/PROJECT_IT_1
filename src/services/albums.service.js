import db from "../config/knex.js";

export default {
	findById(albumId) {
		try {
			const album = db("albums").select("*").where("album_id", albumId).first();
			return album;
		} catch (error) {
			console.error(`Error retrieving album by id ${albumId}:`, error);
			throw error;
		}
	},

	findByArtistId(artist_id) {
		try {
			const albums = db("albums").select("*").where("artist_id", artist_id);
			return albums;
		} catch (error) {
			console.error(`Error retrieving album by artist id ${artist_id}:`, error);
			throw error;
		}
	},

	findByTrackTitle(track_title) {
		try {
			const album = db("tracks as t")
				.leftJoin("albums as a", "t.album_id", "a.album_id")
				.select("a.album_id", "a.album_name", "a.album_cover_image")
				.where("t.track_title", track_title) // Filter by track title
				.first();

			return album;
		} catch (error) {
			console.error(`Error retrieving album by track title ${track_title}:`, error);
			throw error;
		}
	},
	findByTrackId(track_id) {
		const album = db("tracks as t")
			.join("albums as a", "a.album_id", "t.album_id") // join albums
			.select("a.album_id", "a.album_name", "a.album_cover_image")
			.where("t.track_id", track_id)
			.first();
		return album;
	},

	findTop(number) {
		// Subquery t1: Count play count per track
		const t1 = db("user_listen_history") // Count
			.select("track_id")
			.count("track_id as play_count")
			.groupBy("track_id")
			.as("t1");

		// Subquery t: Aggregate play counts per album
		const t = db("tracks")
			.join(t1, "t1.track_id", "tracks.track_id")
			.whereNotNull("tracks.album_id")
			.groupBy("tracks.album_id")
			.select("tracks.album_id")
			.sum("t1.play_count as total_play_count")
			.as("t");

		// Main query: Join albums and artists
		const result = db("albums as a") // Get all
			.join(t, "a.album_id", "t.album_id")
			.join("artists as ar", "a.artist_id", "ar.artist_id")
			.limit(number);
		return result;
	},

	findByName(album_name) {
		return db("albums").where("album_name", "like", `%${album_name}%`);
	},
};
