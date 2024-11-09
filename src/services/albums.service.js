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
				.leftJoin("track_album as ta", "t.track_id", "ta.track_id")
				.leftJoin("albums as a", "ta.album_id", "a.album_id")
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
		const album = knex("tracks as t")
			.join("track_album as ta", "t.track_id", "ta.track_id") // Join track_album
			.join("albums as a", "a.album_id", "ta.album_id")
			.select("*")
			.where("t.track_id", track_id)
			.first();
		return album;
	},
};
