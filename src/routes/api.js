import { Router } from "express";
import Album from "../models/Album.js";
import Artist from "../models/Artist.js";

const router = Router();
// Example of an Express.js endpoint
router.get("/track/img/:title", async (req, res) => {
	const trackTitle = req.params.title;
	// console.log("/api/album/:title >>>", trackTitle);
	try {
		const album = await Album.getAlbum(trackTitle);
		const track = await Artist.getArtistInfoByTrack(trackTitle);
		if (!album.album_id) {
			res.json(track);
			return;
		}
		res.json(album); // Send album data as JSON
	} catch (error) {
		console.error(error);
		res.status(500).send("Internal Server Error");
	}
});

export default router;
