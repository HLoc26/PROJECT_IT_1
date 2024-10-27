function playTrack(filePath) {
	const audioPlayer = document.querySelector(".footer-player audio");
	audioPlayer.src = filePath;
	console.log(audioPlayer.src);
	audioPlayer.play();
}
