const path = require("path");
const express = require("express");

// Set view to render html from ./views/sample.ejs
const configViewEngine = (app) => {
	app.set("views", path.join("./src", "views"));
	app.set("view engine", "ejs");

	// Config static files
	app.use(express.static(path.join("./src", "public")));
};

module.exports = configViewEngine;
