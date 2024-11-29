document.addEventListener("DOMContentLoaded", () => {
	const content = document.getElementById("content");

	const scrollPrev = document.getElementById("scroll-prev");
	if (scrollPrev) {
		scrollPrev.disabled = true;
	}

	// Lắng nghe sự kiện click trên toàn bộ document
	document.addEventListener("click", (e) => {
		const target = e.target;
		// Kiểm tra xem target có phải là một link hoặc có phần tử cha là link không
		let linkElement = target.matches("a") ? target : target.closest("a");

		if (linkElement) {
			if (linkElement.href.includes("/logout")) {
				loginRedirect();
				return;
			}
			e.preventDefault();
			const url = linkElement.href;
			history.pushState(null, "", url);
			// Fetch nội dung của trang mới mà không làm mới trang
			// Fetch content of the new page without refreshing
			fetch(url, {
				headers: {
					"X-Requested-With": "XMLHttpRequest",
				},
			})
				.then((response) => {
					if (response.status === 303) {
						// alert("303 See other");
						// Redirect by manually setting the window location to "/login"
						loginRedirect();
						return;
					}
					return response.text();
				})
				.then((html) => {
					const newContent = new DOMParser().parseFromString(html, "text/html").querySelector("#content").innerHTML;
					content.innerHTML = newContent;

					const scrollPrev = document.getElementById("scroll-prev");
					if (scrollPrev) {
						scrollPrev.disabled = true;
					}
				})
				.catch((err) => {
					console.error("Error:", err);
				});
		}
	});

	document.querySelector("#content").addEventListener("click", (e) => {
		// Kiểm tra xem click có xảy ra trên phần tử playlist-header không
		const header = e.target.closest(".playlist-header");
		if (!header) return; // Nếu không, bỏ qua sự kiện

		// Prevent the click from triggering if clicking on the playlist name link
		if (e.target.tagName === "A") return;

		// Toggle the active class on the parent playlist div
		const playlist = header.closest(".playlist");
		playlist.classList.toggle("active");

		// Rotate arrow when playlist is active
		const arrow = header.querySelector(".arrow-btn i");
		if (playlist.classList.contains("active")) {
			arrow.style.transform = "rotate(180deg)";
		} else {
			arrow.style.transform = "rotate(0deg)";
		}
	});
	document.querySelector("#content").addEventListener("click", (e) => {
		const scrollPrev = e.target.closest("#scroll-prev");
		const scrollNext = e.target.closest("#scroll-next");

		if (scrollPrev || scrollNext) {
			// Select the gallery
			const gallery = document.querySelector(".gallery");
			const scrollAmount = 1000; // Adjust this value based on how much you want to scroll each time

			// Handle the scroll actions
			if (scrollPrev) {
				gallery.scrollBy({
					left: -scrollAmount,
					behavior: "smooth",
				});
			} else if (scrollNext) {
				gallery.scrollBy({
					left: scrollAmount,
					behavior: "smooth",
				});
			}
		}

		// Handle the scroll position (disabling/enabling buttons based on scroll position)
		const gallery = document.querySelector(".gallery");
		if (gallery) {
			gallery.addEventListener("scroll", () => {
				const scrollPrev = document.getElementById("scroll-prev");
				const scrollNext = document.getElementById("scroll-next");

				if (gallery.scrollLeft <= 0) {
					scrollPrev.disabled = true;
				} else {
					scrollPrev.disabled = false;
				}

				if (gallery.scrollLeft + gallery.clientWidth >= gallery.scrollWidth) {
					scrollNext.disabled = true;
				} else {
					scrollNext.disabled = false;
				}
			});
		}
	});
});

function toggleDropdown() {
	const dropdownMenu = document.querySelector(".dropdown-menu");
	dropdownMenu.style.display = dropdownMenu.style.display === "block" ? "none" : "block";
}

window.onclick = function (event) {
	if (!event.target.matches(".user-profile") && !event.target.closest(".user-profile")) {
		const dropdowns = document.getElementsByClassName("dropdown-menu");
		for (let i = 0; i < dropdowns.length; i++) {
			let openDropdown = dropdowns[i];
			if (openDropdown.style.display === "block") {
				openDropdown.style.display = "none";
			}
		}
	}
};

function loginRedirect() {
	console.log("Calling redirect");
	history.replaceState(null, "", "/login");
	fetch("/logout", {
		method: "POST",
	}).then(() => {
		window.location.reload();
	});
}

document.addEventListener("click", function (event) {
	if (event.target.closest(".like-btn")) {
		const likeBtn = event.target.closest(".like-btn");
		const id = likeBtn.dataset.id;
		const type = likeBtn.dataset.type;

		// Gửi yêu cầu lên server để xử lý trạng thái like/unlike
		toggleLike(id, type, likeBtn);
	}
});

async function toggleLike(id, type, btn) {
	console.log("Toggling like");
	const icon = btn.querySelector("i.bi");
	console.log(icon);
	try {
		const isLiked = btn.classList.contains("liked");
		if (!isLiked) {
			const response = await fetch("/api/like", {
				method: "POST",
				headers: { "Content-Type": "application/json" },
				body: JSON.stringify({ type: type, id: id }),
			});
			const result = response.json();

			if (response.ok) {
				btn.classList.toggle("liked");
				icon.classList.remove("bi-heart");
				icon.classList.add("bi-heart-fill");
				console.log(icon);
			} else {
				console.error("Failed to toggle like status:", result.message);
			}
		} else {
			const response = await fetch("/api/unlike", {
				method: "DELETE",
				headers: { "Content-Type": "application/json" },
				body: JSON.stringify({ type: type, id: id }),
			});
			const result = response.json();

			if (response.ok) {
				btn.classList.toggle("liked");
				icon.classList.remove("bi-heart-fill");
				icon.classList.add("bi-heart");
				console.log(icon);
			} else {
				console.error("Failed to toggle like status:", result.message);
			}
		}
	} catch (error) {
		console.error("Error toggling like:", error);
	}
}
