import db from "../config/knex.js";

export default {
	// Add to user_like_track
	likeTrack(user_id, track_id, time) {
		const entity = { user_id: user_id, track_id: track_id, time: time };
		return db("user_like_track").insert(entity);
	},

	// Add to user_like_artist
	likeArtist(user_id, artist_id, time) {
		const entity = { user_id: user_id, artist_id: artist_id, time: time };
		return db("user_like_artist").insert(entity);
	},

	// Add to user_like_playlist
	likePlaylist(user_id, playlist_id, time) {
		const entity = { user_id: user_id, playlist_id: playlist_id, time: time };
		return db("user_like_playlist").insert(entity);
	},

	likeAlbum(user_id, album_id, time) {
		const entity = { user_id: user_id, album_id: album_id, time: time };
		return db("user_like_album").insert(entity);
	},
};
