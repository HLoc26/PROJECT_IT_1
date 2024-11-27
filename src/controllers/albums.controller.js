import artistsService from "../services/artists.service.js";
import albumService from "../services/albums.service.js";
import trackService from "../services/tracks.service.js";
import likeService from "../services/like.service.js";

export default {
	async getAlbum(req, res) {
		// console.log(req.query);
		const album_id = +req.params.id; // album_id
		console.log(album_id);
		if (album_id) {
			const album = await albumService.findById(album_id);
			const artist = await artistsService.findByAlbumId(album_id);
			const tracks = await trackService.findByAlbumId(album_id);

			const liked = await likeService.checkLikedAlbum(res.locals.user_id, album_id);

			// console.log(artist);
			return res.render("vwAlbum/album_detail", {
				album: album,
				artist: artist,
				tracks: tracks,
				liked: liked,
			});
		} else {
			return res.status(404).send("Album not found!");
		}
	},
};
