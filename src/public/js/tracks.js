function playTrack(src, title, artist) {
	const audioPlayer = document.getElementById("audio-player");
	const audioPlayerSrc = document.getElementById("audio-player-src");
	const trackTitle = document.querySelector(".player-track-title");
	const trackArtist = document.querySelector(".player-track-artist");
	const playbtn = document.getElementsByClassName("play-btn")[0]; // Get the first play button
	const playIcon = playbtn.querySelector("i");
	playIcon.classList.remove("bi-play-fill");
	playIcon.classList.add("bi-pause-fill");

	// Update the audio source and play
	audioPlayer.src = src;
	audioPlayerSrc.src = src;
	audioPlayer.play();

	// Update song information
	getAlbumImg(title);
	trackTitle.textContent = title;
	trackArtist.textContent = artist;
}

function getAlbumImg(title) {
	// Encode the album title to handle spaces and special characters
	const encodedTitle = encodeURIComponent(title);
	const url = `/api/album/${encodedTitle}`; // Use a proper endpoint format

	fetch(url)
		.then((response) => {
			if (!response.ok) {
				throw new Error("Network response was not ok");
			}
			return response.json(); // Parse the JSON response
		})
		.then((albumData) => {
			// Use the album data here
			// console.log("Album data", albumData.album_cover_image); // Log or process the album data
			// Example: display album image
			const imgPath = albumData.album_cover_image;
			if (imgPath) {
				document.querySelector(".player-album-img").src = "/images" + albumData.album_cover_image; // Assuming the album data contains an image property
			} else {
				document.querySelector(".player-album-img").src = "/images/albums/default.jpg";
			}
		})
		.catch((error) => {
			console.error("There was a problem with the fetch operation:", error);
		});
}
