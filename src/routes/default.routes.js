// Điều hướng trang
import { Router, urlencoded, json } from "express";
const router = Router();

import controllers from "../controllers/main.controller.js";

router.get("/", function (req, res) {
	res.redirect("/home");
});

router.get("/home", controllers.getHomepage);

router.get("/login", controllers.getLogin);

router.get("/profile", controllers.getProfilePage);

router.post("/register", controllers.postRegister);

router.post("/login", controllers.postLogin);

router.get("/logout", controllers.getLogout);

export default router;
