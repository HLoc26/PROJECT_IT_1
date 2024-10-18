require("dotenv").config();
const express = require("express");
const configViewEngine = require("./config/viewEngine");
const webRoutes = require("./routes/web");
const { connectWithRetry } = require("./config/database");
const knex = require("./config/knex");
const app = express();
const port = process.env.PORT || 8080;
const hostname = process.env.HOST_NAME;

// config template engine
configViewEngine(app);

// Route definition for 127.0.0.1/
app.use("/", webRoutes);

// Kiểm tra kết nối
const startServer = async () => {
	try {
		// Đảm bảo kết nối với database
		await connectWithRetry();

		// Khởi động server
		app.listen(port, hostname, () => {
			console.log(`App listening on ${hostname}:${port}`);
		});
	} catch (err) {
		console.error("Could not start the server:", err.message);
		process.exit(1); // Kết thúc chương trình nếu không thể kết nối với database
	}
};

startServer();
