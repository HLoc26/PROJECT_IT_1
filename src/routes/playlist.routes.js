// Điều hướng trang
import { Router } from "express";
import playlistController from "../controllers/playlist.controller.js";

const router = Router();

router.get("/", playlistController.getDefault);

router.get("/create", playlistController.getCreate);

router.get("/:id", playlistController.getDetail);

router.post("/create", playlistController.postCreate);

export default router;
