// Các hàm trả về dữ liệu cho routes/web.js
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

module.exports = { getHomepage, getArtistsPage, getTracksPage, getProfilePage };
