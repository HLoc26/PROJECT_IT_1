// document.addEventListener("DOMContentLoaded", () => {
// 	const links = document.querySelectorAll("a.side-link");
// 	const content = document.getElementById("content");

// 	links.forEach((link) => {
// 		link.addEventListener("click", (e) => {
// 			e.preventDefault();
// 			const url = e.target.href;
// 			history.pushState(null, "", url);
// 			// Fetch nội dung của trang mới mà không làm mới trang
// 			fetch(url)
// 				.then((response) => response.text())
// 				.then((html) => {
// 					// Lấy nội dung cần thay đổi từ server
// 					const newContent = new DOMParser().parseFromString(html, "text/html").querySelector("#content").innerHTML;
// 					content.innerHTML = newContent;
// 					initHomepage();
// 				})
// 				.catch((err) => console.error("Error:", err));
// 		});
// 	});
// });

// Set links for song-links
const songLinks = document.querySelectorAll(".song-link");

songLinks.forEach((link) => {
	link.addEventListener("click", function (e) {
		e.preventDefault();

		const mp3Path = this.getAttribute("data-mp3-path");
		const title = this.getAttribute("data-title");
		const artist = this.getAttribute("data-artist");

		playTrack(mp3Path, title, artist);
	});
});
