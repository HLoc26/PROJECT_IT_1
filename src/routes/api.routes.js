import { Router } from "express";
import apiController from "../controllers/api.controller.js";
import playlistService from "../services/playlists.service.js";

const router = Router();

// Get information of a track: id, name, mp3 path, duration,...
router.get("/tracks/:id", apiController.getTrackInfo);

router.get("/playlists", apiController.getPlaylists);

router.get("/search", apiController.getSearchResult);

router.post("/save-track-playlists", apiController.saveTrackPlaylists);

router.post("/history", apiController.addHistory);

router.post("/queue", apiController.getNewQueue);

router.post("/like", apiController.like);

router.delete("/unlike", apiController.unlike);

export default router;
