import express from "express";
import artistsController from "../controllers/artists.controller";

const router = express.Router();

router.get("/", artistsController.getArtistsPage);

router.get("/:id", artistsController.getArtistInfo);

export default router;
