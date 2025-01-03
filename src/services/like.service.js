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

	// Remove from user_like_track
	unlikeTrack(user_id, track_id) {
		return db("user_like_track").where({ user_id: user_id, track_id: track_id }).del();
	},

	// Remove from user_like_artist
	unlikeArtist(user_id, artist_id) {
		return db("user_like_artist").where({ user_id: user_id, artist_id: artist_id }).del();
	},

	// Remove from user_like_playlist
	unlikePlaylist(user_id, playlist_id, time) {
		return db("user_like_playlist").where({ user_id: user_id, playlist_id: playlist_id }).del();
	},

	// Remove from user_like_album
	unlikeAlbum(user_id, album_id, time) {
		return db("user_like_album").where({ user_id: user_id, album_id: album_id }).del();
	},

	checkLikedTrack(user_id, track_id) {
		return db("user_like_track").where({ user_id: user_id, track_id: track_id }).first();
	},

	checkLikedPlaylist(user_id, playlist_id) {
		return db("user_like_playlist").where({ user_id: user_id, playlist_id: playlist_id }).first();
	},

	checkLikedArtist(user_id, artist_id) {
		return db("user_like_artist").where({ user_id: user_id, artist_id: artist_id }).first();
	},

	checkLikedAlbum(user_id, album_id) {
		return db("user_like_album").where({ user_id: user_id, album_id: album_id }).first();
	},

	findLikedArtists(user_id) {
		return db("user_like_artist as u")
			.select("a.*") // Select artist info
			.where("user_id", user_id)
			.join("artists as a", "a.artist_id", "u.artist_id");
	},

	findLikedPlaylists(user_id) {
		return db("user_like_playlist as u")
			.select("p.*") // Select only playlist info
			.where("user_id", user_id)
			.join("playlists as p", "p.playlist_id", "u.playlist_id");
	},

	findLikedTracks(user_id) {
		return db("user_like_track as u")
			.select("t.*") // Select only tracks info
			.where("user_id", user_id)
			.join("tracks as t", "t.track_id", "u.track_id");
	},

	findLikedUsers(user_id) {
		return db("user_follow_user as u")
			.select("users.*") // Select followed
			.where("u.user_id", user_id)
			.join("users", "users.user_id", "u.follow_id");
	},
};
