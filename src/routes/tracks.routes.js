import express from "express";
import tracksController from "../controllers/tracks.controller.js";

const router = express.Router();

router.get("/", tracksController.getTracksPage);

router.get("/:id", tracksController.getTrackDetail);

export default router;
