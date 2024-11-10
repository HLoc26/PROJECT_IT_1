import express from "express";
import tracksController from "../controllers/tracks.controller.js";

const router = express.Router();

router.get("/", tracksController.getTracksPage);

router.get("/:id", tracksController.getTrackDetail);

router.get("/upload", function (req, res) {
	res.render("vwTracks/upload");
});

export default router;
