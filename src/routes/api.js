import { Router } from "express";
import Album from "../models/Album.js";

const router = Router();
// Example of an Express.js endpoint
router.get("/album/:title", async (req, res) => {
	const trackTitle = req.params.title;
	// console.log("/api/album/:title >>>", trackTitle);
	try {
		// Fetch album information from your database (pseudo-code)
		const album = await Album.getAlbum(trackTitle); // Replace with your actual DB query
		if (!album) {
			return res.status(404).send("Album not found");
		}
		res.json(album); // Send album data as JSON
	} catch (error) {
		console.error(error);
		res.status(500).send("Internal Server Error");
	}
});

export default router;
