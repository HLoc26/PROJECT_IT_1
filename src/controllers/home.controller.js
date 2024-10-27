// Các hàm trả về dữ liệu cho routes/web.js
const getHomepage = (req, res) => {
	// process data
	// call model
	res.render("homepage.ejs");
};

const getNewPage = (req, res) => {
	res.send("Hello, this is a new page");
};

const renderSample = (req, res) => {
	res.render("sample.ejs");
};

module.exports = { getHomepage, getNewPage, renderSample };
