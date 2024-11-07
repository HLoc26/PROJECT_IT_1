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
				knex.raw("MIN(a.artist_pic_path) AS artist_pic") // Use MAX or any aggregate function for non-grouped fields
			)
			.groupBy("t.track_id", "t.track_title", "t.track_mp3_path"); // Group by all non-aggregated fields
	}

	static async getTracksAlbum(album_id) {
		const tracks = await knex("tracks as t")
			.join("track_album as ta", "ta.track_id", "t.track_id") // Join track_album
			.join("albums as a", "a.album_id", "ta.album_id")
			.where("a.album_id", album_id);
		return tracks;
	}

	static async getTrackInfo(track_id) {
		const track = await knex("tracks as t").select("*").where("t.track_id", track_id).first();
		return track;
	}
	static async getArtistInfo(track_id) {
		const artist = await knex("tracks as t")
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
	}

	static async getAlbumInfo(track_id) {
		const album = await knex("tracks as t")
			.join("track_album as ta", "t.track_id", "ta.track_id") // Join track_album
			.join("albums as a", "a.album_id", "ta.album_id")
			.select("*")
			.where("t.track_id", track_id)
			.first();
		return album;
	}
}

export default Track;
