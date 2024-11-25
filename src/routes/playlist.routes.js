// Điều hướng trang
import { Router } from "express";
import playlistsService from "../services/playlists.service.js";
import usersService from "../services/users.service.js";
import tracksService from "../services/tracks.service.js";

const router = Router();

router.get("/", async function (req, res) {
	// Get user's playlist
	const user_playlists = await playlistsService.findByUserId(res.locals.user_id);
	console.log(user_playlists);
	var playlist_tracks = {};

	for (let i = 0; i < user_playlists.length; i++) {
		var playlist_id = user_playlists[i].playlist_id;
		var tracks = await tracksService.findByPlaylistId(playlist_id);
		playlist_tracks[playlist_id] = tracks;
	}

	console.log(playlist_tracks);

	// Get each playlist's top 5 songs
	res.render("vwPlaylist/playlist", { playlists: user_playlists, tracks: playlist_tracks });
});

router.get("/create", async function (req, res) {
	res.render("vwPlaylist/create");
});

router.get("/:id", async function (req, res) {
	const playlist_id = +req.params.id;
	const request_user = res.locals.uid;
	const playlist_info = await playlistsService.findById(playlist_id);

	if (playlist_info.playlist_visibility_mode === "private" && request_user != playlist_info.owner_id) {
		return res.send("404 Not Found");
	}

	// Get owner name
	const owner_info = await usersService.findById(playlist_info.owner_id);
	// Get playlist tracks
	const tracks = await tracksService.findByPlaylistId(playlist_id);
	res.render("vwPlaylist/playlist_detail", { playlist: playlist_info, owner: owner_info, tracks: tracks });
});

router.post("/create", async function (req, res) {
	const uid = res.locals.uid;
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
});

export default router;
