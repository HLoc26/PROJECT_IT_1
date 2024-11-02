import Artist from "../models/Artist.js";
export async function getHomepage(req, res) {
	const artists = await Artist.get10Artists();
	res.render("homepage", { artists: artists });
}
