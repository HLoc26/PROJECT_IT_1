import express from "express";
import artistsController from "../controllers/artists.controller.js";

const router = express.Router();

router.get("/", artistsController.getArtistsPage);

router.get("/:id", artistsController.getArtistInfo);

export default router;
