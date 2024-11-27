import artistService from "../services/artists.service.js";
import albumService from "../services/albums.service.js";
import trackService from "../services/tracks.service.js";
import likeService from "../services/like.service.js";

export default {
	async getArtistsPage(req, res) {
		const artists = await artistService.findAll();
		res.render("vwArtists/artists", { artists: artists });
	},

	async getArtistInfo(req, res) {
		const artist_id = req.params.id;

		const artist = await artistService.findById(artist_id);
		const artist_albums = await albumService.findByArtistId(artist_id); // Artists albums
		const artist_tracks = await trackService.findByArtistId(artist_id); // Artists tracks

		const liked = await likeService.checkLikedArtist(res.locals.user_id, artist_id);

		return res.render("vwArtists/artist_detail", {
			artist: artist,
			albums: artist_albums,
			tracks: artist_tracks,
			liked: liked,
		});
	},
};
