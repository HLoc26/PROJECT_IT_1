import userService from "../services/users.service.js";
import tracksService from "../services/tracks.service.js";
import albumService from "../services/albums.service.js";
import likeService from "../services/like.service.js";
import playlistsService from "../services/playlists.service.js";

export default {
	async getUserPage(req, res) {
		const user_id = req.params.id;

		if (user_id == req.session.user_id) {
			res.redirect("/profile");
		}

		const user = await userService.findById(user_id);

		// Get user's playlists
		const user_playlists = await playlistsService.findPublicByUserId(user_id);

		// Function to get playlist cover
		async function getPlaylistCover(playlistId) {
			const tracks = await tracksService.findByPlaylistId(playlistId);
			const firstTrack = tracks[0];
			// console.log(playlistId, firstTrack);
			if (!firstTrack) return "/images/albums/album_default.png";

			const album = await albumService.findById(firstTrack.album_id);
			return album && album.album_cover_image ? album.album_cover_image : "/images/albums/album_default.png";
		}

		// Add cover images to created playlists
		for (const playlist of user_playlists) {
			playlist.cover = await getPlaylistCover(playlist.playlist_id);
		}

		const liked_artists = await likeService.findLikedArtists(user_id);
		const follower_count = await userService.countFollower(user_id);
		const following_count = await userService.countFollowing(user_id);
		const tracks_count = await userService.countUploadedTrack(user_id);
		// console.log(liked_artists);
		// console.log(track_history);
		// console.log(user);

		const followed = await userService.isFollowed(req.session.user_id, user_id);

		res.render("vwProfile/user_profile", {
			target_user: user,
			playlists: user_playlists,
			liked_artists: liked_artists,
			follower_count: follower_count.follower_count,
			following_count: following_count.following_count,
			tracks_count: tracks_count.tracks_count,
			followed: followed ? true : false,
		});
	},
};
