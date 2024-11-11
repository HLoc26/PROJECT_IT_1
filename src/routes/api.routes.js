import { Router } from "express";
import apiController from "../controllers/api.controller.js";

import trackService from "../services/tracks.service.js";
import albumService from "../services/albums.service.js";
import artistService from "../services/artists.service.js";

const router = Router();

// Get information of a track: id, name, mp3 path, duration,...
router.get("/tracks/:id", async function (req, res) {
	const track_id = req.params.id;

	const track = await trackService.findById(track_id);
	const album = await albumService.findByTrackId(track_id);
	const artist = await artistService.findByTrackId(track_id);

	const ret = { ...track, ...album, ...artist };

	console.log("RET: ", ret);

	res.status(200).json(ret);
});

export default router;
