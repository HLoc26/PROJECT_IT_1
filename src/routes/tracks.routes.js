import express from "express";
import tracksController from "../controllers/tracks.controller.js";

import upload from "../config/fileUpload.js";
import containerClient from "../config/azureStorage.js";

const router = express.Router();

router.get("/", tracksController.getTracksPage);

router.get("/upload", function (req, res) {
	res.render("vwTracks/upload");
});

router.post("/upload", upload.single("musicFile"), tracksController.uploadFile);

router.get("/:id", tracksController.getTrackDetail);

export default router;
