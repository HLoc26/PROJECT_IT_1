import Artist from "../models/Artist.js";
import Album from "../models/Album.js";
import Track from "../models/Track.js";
export async function getArtistsPage(req, res) {
	const artists = await Artist.getArtists();
	res.render("vwArtists/artists", { artists: artists });
}

export async function getArtistInfo(req, res) {
	const artist_id = req.params.id;

	const artist = await Artist.getArtistInfo(artist_id);
	const artist_albums = await Artist.getArtistAlbums(artist_id); // Artists albums
	const artist_tracks = await Artist.getArtistTracks(artist_id); // Artists tracks

	return res.render("vwArtists/artist_home", { artist: artist, albums: artist_albums, tracks: artist_tracks });
}

export async function getAlbum(req, res) {
	// console.log(req.query);
	const album_id = Number.parseInt(req.params.id); // album_id
	console.log(album_id);
	if (album_id) {
		const artist = await Album.getArtistInfo(album_id);
		const album = await Album.getAlbumByID(album_id);
		const tracks = await Track.getTracksAlbum(album_id);
		console.log(artist);
		return res.render("vwArtists/artist_album", { artist: artist, album: album, tracks: tracks });
	} else {
		return res.status(404).send("Album not found!");
	}
}
