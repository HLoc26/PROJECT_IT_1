// Các hàm trả về dữ liệu cho routes/web.js
const getLogin = (req, res) => {
	res.render("login");
};

const getHomepage = (req, res) => {
	res.render("container", { view: "homepage" });
};

const getArtistsPage = (req, res) => {
	res.render("container", { view: "artists" });
};

const getTracksPage = (req, res) => {
	res.render("container", { view: "tracks" });
};

const getProfilePage = (req, res) => {
	res.render("container", { view: "profile" });
};

const postRegister = (req, res) => {
	res.send("Created!");
};

const postLogin = (req, res) => {
	res.send("Logged in!");
};

module.exports = {
	getHomepage,
	getArtistsPage,
	getTracksPage,
	getProfilePage,
	getLogin,
	postRegister,
	postLogin,
};
