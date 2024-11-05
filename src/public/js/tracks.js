function playTrack(src, title, artist) {
	const audioPlayer = document.getElementById("audio-player");
	const trackTitle = document.querySelector(".player-track-title");
	const trackArtist = document.querySelector(".player-track-artist");
	const playbtn = document.getElementsByClassName("play-btn")[0];
	const playIcon = playbtn.querySelector("i");
	playIcon.classList.remove("bi-play-fill");
	playIcon.classList.add("bi-pause-fill");

	// Update the audio source and play
	audioPlayer.src = src;
	audioPlayer.play();

	// Update song information
	const albumImg = document.querySelectorAll(".player-album-img");
	albumImg.forEach(async (img) => {
		const imgPath = await getAlbumImg(title); // Wait for the async function to resolve
		img.src = imgPath;
	});
	trackTitle.textContent = title;
	trackArtist.textContent = artist;
}

async function getAlbumImg(title) {
	// Encode the album title to handle spaces and special characters
	const encodedTitle = encodeURIComponent(title);
	const url = `/api/track/img/${title}`;

	try {
		const response = await fetch(url);
		if (!response.ok) {
			throw new Error("Network response was not ok");
		}
		const albumData = await response.json();

		console.log(title, albumData);

		if (albumData.album_cover_image) {
			return  albumData.album_cover_image;
		} else if (albumData.artist_pic_path) {
			return albumData.artist_pic_path;
		} else {
			return "/images/albums/default.jpg";
		}
	} catch (error) {
		console.error("There was a problem with the fetch operation:", error);
		return "/images/albums/default.jpg"; // Default image in case of an error
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
