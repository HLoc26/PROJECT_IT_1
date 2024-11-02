import Artist from "../models/Artist.js";
export async function getArtistsPage(req, res) {
	const artists = await Artist.getArtists();
	console.log(">>>>", artists);
	res.render("vwArtists/artists", { artists: artists });
}
