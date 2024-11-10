import express from "express";
import tracksController from "../controllers/tracks.controller.js";

import upload from "../config/fileUpload.js";
import containerClient from "../config/azureStorage.js";

const router = express.Router();

router.get("/", tracksController.getTracksPage);

router.get("/upload", function (req, res) {
	res.render("vwTracks/upload");
});

router.post("/upload", upload.single("musicFile"), async function (req, res) {
	if (!req.file) {
		return res.status(400).redirect("/tracks/upload");
	}
	const blobName = req.file.filename;
	const blockBlobClient = containerClient.getBlockBlobClient(blobName);

	try {
		await blockBlobClient.upload(req.file.buffer, req.file.size);

		const fileUrl = `https://${process.env.AZURE_STORAGE_ACCOUNT_NAME}.blob.core.windows.net/${containerName}/${blobName}`;
	} catch (error) {}
});

router.get("/:id", tracksController.getTrackDetail);

export default router;
