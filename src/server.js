require("dotenv").config();
const express = require("express");
const configViewEngine = require("./config/viewEngine");
const webRoutes = require("./routes/web");
const knex = require("./config/knex");
const app = express();
const port = process.env.PORT || 8080;
const hostname = process.env.HOST_NAME;

// config template engine
configViewEngine(app);

// Route definition for 127.0.0.1/
app.use("/", webRoutes);

// Kiểm tra kết nối
knex.raw("SELECT 1+1 AS result")
	.then(() => console.log("Database connection is working!"))
	.catch((err) => console.error("Database connection failed!", err));

// Start the server
app.listen(port, hostname, () => {
	console.log(`App listening on ${hostname}:${port}`);
});
