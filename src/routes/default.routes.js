// Điều hướng trang
import { Router } from "express";
import controllers from "../controllers/default.controller.js";

const router = Router();

router.get("/", function (req, res) {
	res.redirect("/home");
});

router.get("/home", controllers.getHomepage);

router.get("/login", controllers.getLogin);

router.get("/profile", controllers.getProfilePage);

router.get("/password", controllers.getChangePass);

router.post("/register", controllers.postRegister);

router.post("/login", controllers.postLogin);

router.get("/logout", controllers.getLogout);

export default router;
