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
