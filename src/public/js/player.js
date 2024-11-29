const audioPlayer = document.getElementById("audio-player");
const progressInput = document.getElementById("progress");
const volumeInput = document.getElementById("volume");

let trackQueue = [];

let queueIndex = 0;
let isLoop = false;
let isShuffling = false;
let originalQueue = [...trackQueue];

var readyState = audioPlayer.readyState;

if (readyState == 0) {
	const song_info = document.getElementById("player-song-info");
	song_info.style.opacity = 0;
}

function playAudio() {
	const playbtn = document.getElementsByClassName("play-btn")[0]; // Get the first play button
	const playIcon = playbtn.querySelector("i"); // Assuming the icon is an <i> element inside the button

	if (audioPlayer.paused) {
		audioPlayer.play();
		playIcon.classList.remove("bi-play-fill");
		playIcon.classList.add("bi-pause-fill");
	} else {
		audioPlayer.pause();
		playIcon.classList.remove("bi-pause-fill");
		playIcon.classList.add("bi-play-fill");
	}
}

// Update progress bar as the audio plays
audioPlayer.addEventListener("timeupdate", () => {
	if (!isDragging && audioPlayer.duration > 0) {
		const percentage = (audioPlayer.currentTime / audioPlayer.duration) * 100;
		progressInput.value = percentage;
	}
});

// Function to change the current time based on progress bar
function setProgress() {
	const newTime = (progressInput.value / 100) * audioPlayer.duration;
	audioPlayer.currentTime = newTime;
}
let isDragging = false;
// Add event listeners for drag events
progressInput.addEventListener("mousedown", () => {
	isDragging = true; // User is dragging
});

progressInput.addEventListener("mouseup", () => {
	isDragging = false; // User finished dragging
});

progressInput.addEventListener("touchstart", () => {
	isDragging = true; // For mobile support
});

progressInput.addEventListener("touchend", () => {
	isDragging = false; // For mobile support
});

const volumeIcon = document.getElementById("volume-icon");

let previousVolume = 100; // Stores the last non-zero volume level

// Function to set volume and update the icon in real-time
function setVolume() {
	const volumeLevel = volumeInput.value;
	audioPlayer.volume = volumeLevel / 100;
	updateVolumeIcon(volumeLevel);
}

// Function to update the volume icon based on volume level
function updateVolumeIcon(volumeLevel) {
	if (volumeLevel == 0) {
		volumeIcon.className = "bi bi-volume-mute-fill";
	} else if (volumeLevel > 0 && volumeLevel <= 30) {
		volumeIcon.className = "bi bi-volume-off-fill";
	} else if (volumeLevel > 30 && volumeLevel <= 70) {
		volumeIcon.className = "bi bi-volume-down-fill";
	} else {
		volumeIcon.className = "bi bi-volume-up-fill";
	}
}

// Event listener to update volume icon continuously while dragging the slider
volumeInput.addEventListener("input", () => {
	setVolume();
	if (volumeInput.value > 0) previousVolume = volumeInput.value; // Update previous volume level if not muted
});

// Event listener to toggle mute on icon click
volumeIcon.addEventListener("click", () => {
	if (audioPlayer.volume > 0) {
		// If currently unmuted, mute and update icon
		volumeInput.value = 0;
		audioPlayer.volume = 0;
		updateVolumeIcon(0);
	} else {
		// If currently muted, restore previous volume level
		volumeInput.value = previousVolume;
		audioPlayer.volume = previousVolume / 100;
		updateVolumeIcon(previousVolume);
	}
});

// Set initial volume and icon
setVolume();

// Add this event listener to automatically play next track
audioPlayer.addEventListener("ended", async () => {
	if (!isLoop && queueIndex < trackQueue.length - 1) {
		queueIndex++;
	}
	const track_id = trackQueue[queueIndex].track_id;
	const track = await fetchTrack(track_id);
	updatePlayerUI(track);
	play(track.track_mp3_path);
});

async function prevAudio() {
	if (queueIndex > 0) {
		queueIndex--;
		const track_id = trackQueue[queueIndex].track_id;
		const track = await fetchTrack(track_id);
		updatePlayerUI(track);
		play(track.track_mp3_path);
		console.log("Prev: ", queueIndex);
	}
}

async function nextAudio() {
	if (queueIndex < trackQueue.length - 1) {
		queueIndex++;
		const track_id = trackQueue[queueIndex].track_id;
		const track = await fetchTrack(track_id);
		updatePlayerUI(track);
		play(track.track_mp3_path);
		console.log("Next: ", queueIndex);
	}
}

// Update the UI
function updatePlayerUI(track_data) {
	// console.log("Update: ", track_data);
	// Update song information
	const trackTitle = document.querySelector(".player-track-title");
	const trackArtist = document.querySelector(".player-track-artist");
	const albumImg = document.querySelector(".player-album-img");
	const likeBtn = document.querySelector(".like-btn");
	const likeIcon = document.querySelector(".like-btn i");
	if (track_data.liked) {
		likeBtn.classList.add("liked");
		likeIcon.classList.add("bi-heart-fill");
		likeIcon.classList.remove("bi-heart");
	} else {
		likeIcon.classList.add("bi-heart");
		likeIcon.classList.remove("bi-heart-fill");
	}

	if (track_data.album_cover_image) {
		albumImg.src = track_data.album_cover_image;
	} else if (track_data.artist_pic_path) {
		albumImg.src = track_data.artist_pic_path;
	} else {
		albumImg.src = "/images/albums/album_default.jpg";
	}
	trackTitle.textContent = track_data.track_title;
	trackArtist.textContent = track_data.artist_name;
}

async function fetchTrack(track_id) {
	const response = await fetch(`/api/tracks/${+track_id}`);
	if (!response.ok) {
		throw new Error("PlayTrack: Error fetching track information");
	}
	const track_data = await response.json();
	// console.log(track_data); // debug
	return track_data;
}

async function playTrack(track_id) {
	const playbtn = document.getElementsByClassName("play-btn")[0];
	const playIcon = playbtn.querySelector("i");
	playIcon.classList.remove("bi-play-fill");
	playIcon.classList.add("bi-pause-fill");

	const song_info = document.getElementById("player-song-info");
	song_info.style.opacity = 100;

	fetchNewQueue(track_id);
	queueIndex = 0;

	const track_data = await fetchTrack(track_id);

	updatePlayerUI(track_data);
	play(track_data.track_mp3_path);
	addHistory(track_id);
}

async function addHistory(track_id) {
	// Add song to history

	try {
		const response = await fetch("/api/history/", {
			method: "POST",
			headers: { "Content-Type": "application/json" },
			body: JSON.stringify({ track_id }),
		});
		const result = await response.json();
		// console.log(result.message);
	} catch (error) {
		console.error("Error saving history:", error);
	}
}

async function fetchNewQueue(track_id) {
	try {
		const response = await fetch("/api/queue", {
			method: "POST",
			headers: { "Content-Type": "application/json" },
			body: JSON.stringify({ track_id: track_id }),
		});

		if (!response.ok) {
			throw new Error("Failed to fetch queue");
		}

		const { queue } = await response.json();
		// console.log(queue);
		// Load the new queue into the player
		loadQueue(queue);
	} catch (error) {
		console.error(error);
	}
}

function loadQueue(tracks) {
	trackQueue = tracks; // Replace the queue with new tracks
	currentIndex = 0; // Reset the current index
	originalQueue = [...trackQueue];
}

function play(path) {
	const audioPlayerSrc = document.getElementById("audio-player-src");
	// Update the audio source and play
	audioPlayer.src = `/uploads/music/${path}`;
	audioPlayerSrc.src = `/uploads/music/${path}`;
	audioPlayer.play();
}

document.querySelectorAll(".manip-btn").forEach((btn) => {
	btn.addEventListener("click", () => {
		btn.classList.toggle("active");
	});
});

function shuffle() {
	if (isShuffling) {
		trackQueue = [...originalQueue];
	} else {
		for (let i = trackQueue.length - 1; i > 0; i--) {
			const j = Math.floor(Math.random() * (i + 1));
			[trackQueue[i], trackQueue[j]] = [trackQueue[j], trackQueue[i]];
		}
	}
	queueIndex = 0; // Reset to first track after shuffling
	isShuffling = !isShuffling;
	console.log("shuffle: ", queueIndex);
}

function loop() {
	isLoop = !isLoop;
}
