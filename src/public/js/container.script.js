document.addEventListener("DOMContentLoaded", () => {
	const content = document.getElementById("content");

	// Lắng nghe sự kiện click trên toàn bộ document
	document.addEventListener("click", (e) => {
		const target = e.target;

		// Kiểm tra xem target có phải là một link hoặc có phần tử cha là link không
		let linkElement = target.matches("a") ? target : target.closest("a");

		if (linkElement) {
			e.preventDefault();
			const url = linkElement.href;
			history.pushState(null, "", url);

			// Fetch nội dung của trang mới mà không làm mới trang
			fetch(url)
				.then((response) => response.text())
				.then((html) => {
					const newContent = new DOMParser().parseFromString(html, "text/html").querySelector("#content").innerHTML;
					content.innerHTML = newContent;

					// Kiểm tra xem link có class là side-link không
					if (linkElement.matches("a.side-link")) {
						initHomepage(); // Khởi tạo lại nếu cần
					}

					// Kiểm tra xem link có class là artist-link không
					if (linkElement.matches("a.artist-link")) {
						initArtistPage(); // Khởi tạo lại cho trang nghệ sĩ nếu cần
					}
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
