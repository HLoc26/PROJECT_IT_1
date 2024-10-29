const audioPlayer = document.getElementById("audio-player");
const progressInput = document.getElementById("progress");
const volumeInput = document.getElementById("volume");
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

function prevAudio() {
	/* Add functionality to go to the previous track */
}
function nextAudio() {
	/* Add functionality to go to the next track */
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
