import Artist from "../models/Artist.js";
export async function getArtistsPage(req, res) {
	const artists = await Artist.getArtists();
	res.render("vwArtists/artists", { artists: artists });
}

export async function getArtistInfo(req, res) {
	const artist_id = req.params.id;

	const artist = await Artist.getArtistInfo(artist_id);
	const artist_albums = await Artist.getArtistAlbums(artist_id); // Artists albums
	const artist_tracks = await Artist.getArtistTracks(artist_id); // Artists tracks

	console.log(artist);

	return res.render("vwArtists/artist_home", { artist: artist, albums: artist_albums, tracks: artist_tracks });
}
