async function playTrack(track_id) {
	const audioPlayer = document.getElementById("audio-player");
	const audioPlayerSrc = document.getElementById("audio-player-src");
	const trackTitle = document.querySelector(".player-track-title");
	const trackArtist = document.querySelector(".player-track-artist");
	const playbtn = document.getElementsByClassName("play-btn")[0];
	const playIcon = playbtn.querySelector("i");
	playIcon.classList.remove("bi-play-fill");
	playIcon.classList.add("bi-pause-fill");

	const song_info = document.getElementById("player-song-info");
	song_info.style.opacity = 100;

	const url = `/api/tracks/${+track_id}`;

	const response = await fetch(url);
	if (!response.ok) {
		throw new Error("PlayTrack: Error fetching track information");
	}
	const track_data = await response.json();
	console.log(track_data); // debug

	// Update the audio source and play
	audioPlayer.src = `/uploads/music/${track_data.track_mp3_path}`;
	audioPlayerSrc.src = `/uploads/music/${track_data.track_mp3_path}`;
	audioPlayer.play();

	// Update song information
	const albumImg = document.querySelector(".player-album-img");
	if (track_data.album_cover_image) {
		albumImg.src = track_data.album_cover_image;
	} else if (track_data.artist_pic_path) {
		albumImg.src = track_data.artist_pic_path;
	} else {
		albumImg.src = "/images/albums/default.jpg";
	}
	trackTitle.textContent = track_data.track_title;
	trackArtist.textContent = track_data.artist_name;

	// Add song to history
	const user_id = sessionStorage.getItem("user_id");
	if (!user_id) {
		console.log("user_id is null");
		return;
	}

	try {
		const response = await fetch("/api/history/", {
			method: "POST",
			headers: { "Content-Type": "application/json" },
			body: JSON.stringify({ user_id, track_id }),
		});
		const result = await response.json();
		console.log(result.message);
	} catch (error) {
		console.error("Error saving history:", error);
	}
}

document.addEventListener("DOMContentLoaded", () => {
	const trackImages = document.querySelectorAll(".track-image");

	trackImages.forEach(async function (img) {
		const title = img.getAttribute("data-title");
		const encodedTitle = encodeURIComponent(title);

		const imgPath = await getAlbumImg(encodedTitle);
		console.log("DOM: ", title, imgPath);
		img.src = imgPath;
	});
});
