document.addEventListener("DOMContentLoaded", () => {
	const content = document.getElementById("content");

	// Lắng nghe sự kiện click trên toàn bộ document
	document.addEventListener("click", (e) => {
		const target = e.target;

		// Kiểm tra xem target có phải là một link hoặc có phần tử cha là link không
		let linkElement = target.matches("a") ? target : target.closest("a");

		if (linkElement) {
			if (linkElement.href.includes("/logout")) {
				history.replaceState(null, "", "/login");
				fetch("/logout", {
					method: "POST",
				}).then(() => {
					window.location.reload();
				});
				return;
			}
			e.preventDefault();
			const url = linkElement.href;
			history.pushState(null, "", url);

			// Fetch nội dung của trang mới mà không làm mới trang
			fetch(url)
				.then((response) => response.text())
				.then((html) => {
					const newContent = new DOMParser().parseFromString(html, "text/html").querySelector("#content").innerHTML;
					content.innerHTML = newContent;
				})
				.catch((err) => console.error("Error:", err));
		}

		// Kiểm tra nếu phần tử được click là song-link
		if (target.matches(".song-link")) {
			e.preventDefault();

			const mp3Path = target.getAttribute("data-mp3-path");
			const title = target.getAttribute("data-title");
			const artist = target.getAttribute("data-artist");

			playTrack(mp3Path, title, artist); // Gọi hàm playTrack để chơi bài hát
		}
	});
});
