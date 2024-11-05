import knex from "../config/knex.js";

class Album {
	static async getAlbum(trackTitle) {
		try {
			const albumData = await knex("tracks as t")
				.leftJoin("track_album as ta", "t.track_id", "ta.track_id")
				.leftJoin("albums as a", "ta.album_id", "a.album_id")
				.select("a.album_id", "a.album_name", "a.album_cover_image")
				.where("t.track_title", trackTitle) // Filter by track title
				.first();

			return albumData;
		} catch (error) {
			console.error("Error retrieving album:", error);
			throw error;
		}
	}

	static async getAlbumByID(album_id) {
		try {
			const albumData = await knex("albums").select("*").where("album_id", album_id).first();
			return albumData;
		} catch (error) {
			console.error("Error retrieving album:", error);
			throw error;
		}
	}

	static async getArtistInfo(album_id) {
		try {
			// Lấy thông tin của artist dựa vào album_id
			const artist = await knex("artists as ar")
				.join("albums as al", "ar.artist_id", "al.artist_id") // Join with albums
				.select("ar.artist_id", "ar.artist_name", "ar.artist_pic_path")
				.where("al.album_id", album_id)
				.first();
			return artist;
		} catch (error) {
			console.error("Error retrieving artist:", error);
			throw error;
		}
	}
}

export default Album;
