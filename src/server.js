require("dotenv").config();
const express = require("express");
const configViewEngine = require("./config/viewEngine");
const webRoutes = require("./routes/web");
const { ensureConnection } = require("./config/database");

const app = express();
const port = process.env.PORT || 8080;
const hostname = process.env.HOST_NAME;

// config template engine
configViewEngine(app);

// Route definition for 127.0.0.1/
app.use("/", webRoutes);

// Use an async function to handle database queries
const queryDatabase = async () => {
	try {
		const pool = await ensureConnection();
		const result = await pool.request().query("SELECT * FROM test");
		console.log(result.recordset);
	} catch (err) {
		console.error("Error executing query: ", err);
	}
};

// Call the async function to query the database
queryDatabase();

// Start the server
app.listen(port, hostname, () => {
	console.log(`App listening on ${hostname}:${port}`);
});
