import artistsService from "../services/artists.service.js";
import albumService from "../services/albums.service.js";
import trackService from "../services/tracks.service.js";

export default {
	async getAlbum(req, res) {
		// console.log(req.query);
		const album_id = Number.parseInt(req.params.id); // album_id
		console.log(album_id);
		if (album_id) {
			const album = await albumService.findById(album_id);
			const artist = await artistsService.findByAlbumId(album_id);
			const tracks = await trackService.findByAlbumId(album_id);
			console.log(artist);
			return res.render("vwArtists/artist_album", { album: album, artist: artist, tracks: tracks });
		} else {
			return res.status(404).send("Album not found!");
		}
	},
};
