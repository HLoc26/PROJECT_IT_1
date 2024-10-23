document.addEventListener("DOMContentLoaded", () => {
	const links = document.querySelectorAll("a.nav-link");
	const content = document.getElementById("content");

	links.forEach((link) => {
		link.addEventListener("click", (e) => {
			e.preventDefault();
			const url = e.target.href;

			// Fetch nội dung của trang mới mà không làm mới trang
			fetch(url)
				.then((response) => response.text())
				.then((html) => {
					// Lấy nội dung cần thay đổi từ server
					const newContent = new DOMParser().parseFromString(html, "text/html").querySelector("#content").innerHTML;
					content.innerHTML = newContent;
					initHomepage();
				})
				.catch((err) => console.error("Error:", err));
		});
	});
});
