import playlistsService from "../services/playlists.service.js";
import usersService from "../services/users.service.js";
import tracksService from "../services/tracks.service.js";
import likeService from "../services/like.service.js";

export default {
	async getDefault(req, res) {
		// Get user's playlist
		const user_playlists = await playlistsService.findByUserId(req.session.user_id);

		const liked_playlists = await likeService.findLikedPlaylists(req.session.user_id);
		console.log(user_playlists);

		// Get each playlist's top 5 songs
		res.render("vwPlaylist/playlist", {
			created_playlists: user_playlists,
			liked_playlists: liked_playlists,
		});
	},

	getCreate(req, res) {
		res.render("vwPlaylist/create");
	},

	async getDetail(req, res) {
		const playlist_id = +req.params.id;
		const request_user = res.locals.user_id;
		const playlist_info = await playlistsService.findById(playlist_id);

		if (playlist_info.playlist_visibility_mode === "private" && request_user != playlist_info.owner_id) {
			return res.send("404 Not Found");
		}

		// Get owner name
		const owner_info = await usersService.findById(playlist_info.owner_id);
		// Get playlist tracks
		const tracks = await tracksService.findByPlaylistId(playlist_id);
		res.render("vwPlaylist/playlist_detail", { playlist: playlist_info, owner: owner_info, tracks: tracks });
	},

	async postCreate(req, res) {
		const uid = res.locals.user_id;
		const { new_playlist_name } = req.body;
		const playlists = await playlistsService.findByUserId(uid);
		const playlist_count = playlists.length;
		const entity = {
			playlist_name: new_playlist_name || `Your playlist #${playlist_count}`,
			playlist_visibility_mode: "private",
			owner_id: uid,
			create_time: new Date().toISOString(),
		};

		const created_playlist = await playlistsService.create(entity);
		const new_playlist = created_playlist[0];
		console.log(new_playlist);
		res.redirect(`/playlists/${new_playlist.playlist_id}`);
	},
};
