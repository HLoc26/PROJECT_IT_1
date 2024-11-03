import knex from "../config/knex.js";

class Artist {
	static async getArtists() {
		return await knex("artists").select("*");
	}

	static async get10Artists() {
		return await knex.raw("SELECT TOP 10 * FROM artists");
	}

	static async getArtistTracks(artist_id) {
		const songs = await knex("tracks as t")
			.join("artist_perform as ap", "t.track_id", "ap.track_id") // Join artist_perform
			.join("artists as a", "ap.artist_id", "a.artist_id")
			.where("a.artist_id", artist_id);
		return songs;
	}

	static async getArtistAlbums(artist_id) {
		const albums = await knex("albums").select("*").where("artist_id", artist_id);
		return albums;
	}

	static async getArtistInfo(artist_id) {
		const artist = await knex("artists").select("*").where("artist_id", artist_id).first();
		return artist;
	}
}

export default Artist;
