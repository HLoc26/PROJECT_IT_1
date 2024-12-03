import playlistsService from "../services/playlists.service.js";
import usersService from "../services/users.service.js";
import tracksService from "../services/tracks.service.js";
import likeService from "../services/like.service.js";
import albumService from "../services/albums.service.js";
import historyService from "../services/history.service.js";
import artistsService from "../services/artists.service.js";

export default {
	async getDefault(req, res) {
		try {
			// Get user's playlists
			const user_playlists = await playlistsService.findByUserId(req.session.user_id);

			// Get playlists liked by the user
			const liked_playlists = await likeService.findLikedPlaylists(req.session.user_id);

			const playlists = [];
			const playlist_id = new Set();

			liked_playlists.forEach((playlist) => {
				playlist.liked = true;
				if (!playlist_id.has(playlist.playlist_id)) {
					playlists.push(playlist);
					playlist_id.add(playlist.playlist_id);
				}
			});
			user_playlists.forEach((playlist) => {
				if (!playlist_id.has(playlist.playlist_id)) {
					playlists.push(playlist);
					playlist_id.add(playlist.playlist_id);
				}
			});

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
			for (const playlist of playlists) {
				playlist.cover = await getPlaylistCover(playlist.playlist_id);
			}

			// console.log(playlists);
			// Render the playlists view
			res.render("vwPlaylist/playlist", {
				playlists: playlists,
			});
		} catch (error) {
			console.error("Error in getDefault:", error);
			res.status(500).send("An error occurred while loading playlists.");
		}
	},

	async getCreate(req, res) {
		// Get user listen history
		const history = await historyService.findByUserId(req.session.user_id);

		const track_list = [];
		await Promise.all(
			history.map(async (track) => {
				// console.log(album);
				const tracks = await tracksService.findById(track.track_id);
				track_list.push(tracks);
				return tracks;
			})
		);

		await Promise.all(
			track_list.map(async (track) => {
				const artist = await artistsService.findByTrackId(track.track_id);
				if (!artist) {
					// console.log("FOUND HERE: ", track, artist);
					track.artist = "";
				} else {
					track.artist = artist;
				}
			})
		);

		// console.log(track_list);

		res.render("vwPlaylist/create", { history: track_list });
	},

	async getDetail(req, res) {
		const playlist_id = +req.params.id;
		const request_user = res.locals.user_id;
		const playlist_info = await playlistsService.findById(playlist_id);

		if (playlist_info.playlist_visibility_mode === "private" && request_user != playlist_info.owner_id) {
			return res.send("404 Not Found");
		}

		// Get owner name
		const owner_info = await usersService.findById(playlist_info.owner_id);
		// Get playlist tracks
		const tracks = await tracksService.findByPlaylistId(playlist_id);
		res.render("vwPlaylist/playlist_detail", { playlist: playlist_info, owner: owner_info, tracks: tracks });
	},

	async postCreate(req, res) {
		const user_id = req.session.user_id;
		const { new_playlist_name, visibility, track_ids } = req.body;
		const playlists = await playlistsService.findByUserId(user_id);
		const playlist_count = playlists.length;
		const entity = {
			playlist_name: new_playlist_name || `Your playlist #${playlist_count}`,
			playlist_visibility_mode: visibility,
			owner_id: user_id,
			create_time: new Date().toISOString(),
		};

		const created_playlist = await playlistsService.create(entity);
		const new_playlist_id = created_playlist[0].playlist_id;

		// Add tracks to playlist
		if (track_ids) {
			await Promise.all(
				track_ids.map(async (track_id) => {
					await playlistsService.addTrack(+track_id, new_playlist_id);
				})
			);
		}
		res.redirect(`/playlists/${new_playlist_id}`);
	},
};
