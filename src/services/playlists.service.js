import db from "../config/knex.js";

export default {
	create(entity) {
		// Create a playlist
		const ret = db("playlists").insert(entity).returning("playlist_id");
		return ret;
	},

	findById(playlist_id) {
		const playlist = db("playlists").where("playlist_id", playlist_id).first();
		return playlist;
	},

	findByUserId(user_id) {
		const playlists = db("playlists").where("owner_id", user_id);
		return playlists;
	},

	findPublicByUserId(user_id) {
		const playlists = db("playlists").where({ owner_id: user_id, playlist_visibility_mode: "public" });
		return playlists;
	},

	addTrack(track_id, playlist_id) {
		const entity = { track_id: track_id, playlist_id: playlist_id };
		return db("track_playlist").insert(entity);
	},

	updateVisibility(playlist_id, visibility) {
		return db("playlists").where("playlist_id", playlist_id).update({ playlist_visibility_mode: visibility });
	},
};
