import "dotenv/config";
import express from "express";
import session from "express-session";
import configViewEngine from "./config/viewEngine.js";
import { isAuthenticated } from "./middlewares/auth.js";
import { setUsername } from "./middlewares/setUser.js";
import webRoutes from "./routes/web.js";
import apiRoutes from "./routes/api.js";
import { connectWithRetry } from "./config/database.js";

const app = express();
const port = process.env.PORT || 8080;
const hostname = process.env.HOST_NAME;

// config template engine
configViewEngine(app);

// Dùng session để lưu trạng thái đăng nhập
app.use(
	session({
		secret: process.env.SESSION_SECRET,
		resave: false,
		saveUninitialized: true,
		cookie: {
			maxage: 1000 * 60 * 60, // 1 h
			secure: false,
		},
	})
);

// Lưu username vào locals
app.use(setUsername);

// Đảm bảo đã đăng nhập
app.use(function (req, res, next) {
	const public_routes = ["/login", "/register"];
	if (public_routes.includes(req.path)) {
		return next();
	} else {
		return isAuthenticated(req, res, next);
	}
});

// Route definition for 127.0.0.1/
app.use("/", webRoutes);
app.use("/api", apiRoutes);
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
