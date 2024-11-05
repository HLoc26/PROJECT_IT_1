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
}

export default Album;
