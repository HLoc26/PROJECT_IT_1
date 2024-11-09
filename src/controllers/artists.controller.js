import artistService from "../services/artists.service.js";
import albumService from "../services/albums.service.js";
import trackService from "../services/tracks.service.js";

export default {
	async getArtistsPage(req, res) {
		const artists = await artistService.findAll();
		res.render("vwArtists/artists", { artists: artists });
	},

	async getArtistInfo(req, res) {
		const artist_id = req.params.id;

		const artist = artistService.findById(artist_id);
		const artist_albums = albumService.findByArtistId(artist_id); // Artists albums
		const artist_tracks = trackService.findByArtistId(artist_id); // Artists tracks

		return res.render("vwArtists/artist_home", { artist: artist, albums: artist_albums, tracks: artist_tracks });
	},
};
