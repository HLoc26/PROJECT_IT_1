import { Router } from "express";
import apiController from "../controllers/api.controller.js";

const router = Router();
// Example of an Express.js endpoint
router.get("/track/img/:title", apiController.getAlbumInfo);

export default router;
