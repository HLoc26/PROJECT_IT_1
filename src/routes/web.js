// Điều hướng trang
import { Router, urlencoded, json } from "express";
const router = Router();

import controllers from "../controllers/home.controller.js";

router.get("/", controllers.getHomepage);

router.get("/login", controllers.getLogin);

router.get("/artists", controllers.getArtistsPage);

router.get("/tracks", controllers.getTracksPage);

router.get("/profile", controllers.getProfilePage);

router.post("/register", [urlencoded({ extended: true }), json()], controllers.postRegister);

router.post("/login", [urlencoded({ extended: true }), json()], controllers.postLogin);

export default router;
