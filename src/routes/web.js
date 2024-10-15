// Điều hướng trang
const express = require("express");
const router = express.Router();

// prettier-ignore
const {
    getHomepage,
    getArtistsPage,
    getTracksPage,
    getProfilePage,
    getLogin,
    postRegister,
    postLogin
} = require("../controllers/home.controller");

router.get("/", getHomepage);

router.get("/login", getLogin);

router.get("/artists", getArtistsPage);

router.get("/tracks", getTracksPage);

router.get("/profile", getProfilePage);

router.post("/register", postRegister);

router.post("/login", postLogin);

module.exports = router;
