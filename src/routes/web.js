// Điều hướng trang
const express = require("express");
const { getHomepage, getNewPage, renderSample } = require("../controllers/home.controller");
const router = express.Router();

router.get("/", getHomepage);

router.get("/newpage", getNewPage);

router.get("/ejs", renderSample);

module.exports = router;
