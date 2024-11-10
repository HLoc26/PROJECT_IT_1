import express from "express";
import tracksController from "../controllers/tracks.controller.js";

import upload from "../config/fileUpload.js";

const router = express.Router();

router.get("/", tracksController.getTracksPage);

router.get("/upload", function (req, res) {
	res.render("vwTracks/upload");
});

router.post("/upload", upload.single("mp3_file"), tracksController.uploadFile);

router.get("/:id", tracksController.getTrackDetail);

export default router;
