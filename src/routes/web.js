// Điều hướng trang
const express = require("express");
const router = express.Router();
const { getHomepage, getArtistsPage, getTracksPage, getProfilePage } = require("../controllers/home.controller");

router.get("/", getHomepage);

router.get("/artists", getArtistsPage);

router.get("/tracks", getTracksPage);

router.get("/profile", getProfilePage);

module.exports = router;
