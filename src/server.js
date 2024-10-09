require("dotenv").config();
const express = require("express");
const configViewEngine = require("./config/viewEngine");
const webRoutes = require("./routes/web");
const connection = require("./config/database");

const app = express(); // Express app
const port = process.env.PORT || 8080; // Port
const hostname = process.env.HOST_NAME;

// config template engine
configViewEngine(app);

// Route definition for 127.0.0.1/
app.use("/", webRoutes);

connection.query("SELECT * FROM test", (err, results, fields) => {
	console.log(results);
	console.log(fields);
});

app.listen(port, hostname, () => {
	console.log(`App listening on ${hostname}:${port}`);
});
