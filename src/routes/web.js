// Điều hướng trang
import { Router, urlencoded, json } from "express";
const router = Router();

import controllers from "../controllers/main.controller.js";

router.get("/", function (req, res) {
	res.redirect("/home");
});

router.get("/home", controllers.getHomepage);

router.get("/login", controllers.getLogin);

router.get("/artists", controllers.getArtistsPage);

router.get("/artists/:id", controllers.getArtistInfo);

router.get("/album/:id", controllers.getAlbum);

router.get("/tracks", controllers.getTracksPage);

router.get("/tracks/:id", controllers.getTrackDetail);

router.get("/profile", controllers.getProfilePage);

router.post("/register", [urlencoded({ extended: true }), json()], controllers.postRegister);

router.post("/login", [urlencoded({ extended: true }), json()], controllers.postLogin);

export default router;
