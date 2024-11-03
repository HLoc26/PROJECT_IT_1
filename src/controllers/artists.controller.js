import Artist from "../models/Artist.js";
export async function getArtistsPage(req, res) {
	const artists = await Artist.getArtists();
	console.log(">>>>", artists);
	res.render("vwArtists/artists", { artists: artists });
}

export async function getArtistInfo(req, res) {
	const artist_id = req.params.id;
	// const artist_albums = await Artist.getArtistAlbums();
	// const artist_tracks = await Artist.getArtistSongs();
	// Artists albums

	// Artists
}
