import express from "express";
import albumController from "../controllers/albums.controller.js";

const router = express.Router();

router.get("/:id", albumController.getAlbum);

export default router;
