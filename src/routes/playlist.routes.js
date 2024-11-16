// Điều hướng trang
import { Router } from "express";
import playlistsService from "../services/playlists.service.js";
import usersService from "../services/users.service.js";
import tracksService from "../services/tracks.service.js";

const router = Router();

router.get("/", function (req, res) {
	res.render("vwPlaylist/playlist");
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

router.get("/create/:uid", async function (req, res) {
	const uid = +req.params.uid;
	const playlists = await playlistsService.findByUserId(uid);
	const playlist_count = playlists.length;
	const entity = {
		playlist_name: `Your playlist #${playlist_count}`,
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
