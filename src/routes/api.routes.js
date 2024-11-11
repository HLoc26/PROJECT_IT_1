import { Router } from "express";
import apiController from "../controllers/api.controller.js";

const router = Router();

// Get information of a track: id, name, mp3 path, duration,...
router.get("/tracks/:id", apiController.getTrackInfo);

export default router;
