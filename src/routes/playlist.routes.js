// Điều hướng trang
import { Router } from "express";

const router = Router();

router.get("/", function (req, res) {
	res.render("vwPlaylist/playlist");
});

export default router;
