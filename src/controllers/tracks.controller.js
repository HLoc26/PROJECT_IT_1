import artistService from "../services/artists.service.js";
import albumService from "../services/albums.service.js";
import trackService from "../services/tracks.service.js";
import likeService from "../services/like.service.js";

import { parseFile } from "music-metadata";
import path from "path";
import { fileURLToPath } from "url";

export default {
	// Controller or Service function to get tracks with artists
	async getTracksPage(req, res) {
		try {
			const tracks = await trackService.findAll();

			// Debugging
			// tracks.forEach((track) => {
			// 	console.log(track.track_title, track.artist_name);
			// });

			res.render("vwTracks/tracks", { tracks: tracks });
		} catch (error) {
			console.error(error);
			res.status(500).send("An error occurred while retrieving the tracks");
		}
	},

	async getTrackDetail(req, res) {
		try {
			const track_id = req.params.id; // Track id
			const track = await trackService.findById(track_id);
			const artist = await artistService.findByTrackId(track_id);
			const album = await albumService.findByTrackId(track_id);

			const isLiked = await likeService.checkLikedTrack(res.locals.user_id, track_id);

			// Debugging
			// console.log(track);
			// console.log(artist);
			// console.log(album);

			return res.render("vwTracks/track_detail", { track: track, artist: artist, album: album, liked: isLiked });
		} catch (error) {
			console.error(error);
			res.status(500).send("An error occurred while retrieving the track's information");
		}
	},
	async uploadFile(req, res) {
		if (!req.file) {
			return res.status(400).redirect("/tracks/upload");
		}
		// console.log(req.file);

		// Gather information from req.body
		const { upload_track_name, isVisible, upload_lyrics } = req.body;
		const visibility = isVisible === "on" ? "public" : "private";
		const lyrics = upload_lyrics && upload_lyrics.trim() ? upload_lyrics : null;
		const uploader_id = res.locals.user_id;
		try {
			// Get the current module's directory path
			const __filename = fileURLToPath(import.meta.url);
			const __dirname = path.dirname(__filename);

			// Construct full path to the saved file
			const fullFilePath = path.join(__dirname, "..", "public", "uploads", "music", req.file.filename);

			// console.log(fullFilePath);

			// track_duration
			const metadata = await parseFile(fullFilePath);
			// console.log(metadata);
			const duration = Math.floor(metadata.format.duration);

			// track_mp3_path (local path)
			const filePath = req.file.filename;

			// Insert to db
			const entity = {
				track_title: upload_track_name,
				track_duration: duration,
				track_mp3_path: filePath, // Local path
				uploader_id: uploader_id,
				lyrics: lyrics,
				visibility: visibility,
			};

			// console.log(">>>>> entity: ", entity);
			await trackService.add(entity);
			// TODO: Redirect to track detail page
			res.status(200).redirect("/tracks");
		} catch (error) {
			console.log("ERROR: ", error);
			res.status(500).send("Internal server error");
		}
	},
};
