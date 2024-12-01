import { Router } from "express";
import apiController from "../controllers/api.controller.js";

const router = Router();

// Get information of a track: id, name, mp3 path, duration,...
router.get("/tracks/:id", apiController.getTrackInfo);

router.post("/history", apiController.addHistory);

router.post("/queue", apiController.getNewQueue);

router.post("/like", apiController.like);

router.delete("/unlike", apiController.unlike);

export default router;
