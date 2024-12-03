document.addEventListener("DOMContentLoaded", () => {
	const content = document.getElementById("content");

	const scrollPrev = document.getElementById("scroll-prev");
	if (scrollPrev) {
		scrollPrev.disabled = true;
	}
	const body = document.getElementsByTagName("body")[0];
	body.addEventListener("scroll", () => {
		console.log("Scrolling");
		const profileDrop = document.getElementById("dropdown-profile");
		if (profileDrop.classList.contains("show")) {
			profileDrop.classList.remove("show");
		}
	});

	// Lắng nghe sự kiện click trên toàn bộ document
	document.addEventListener("click", (e) => {
		const target = e.target;

		if (!e.target.closest(".dropbtn")) {
			var profileDrop = document.getElementById("dropdown-profile");
			if (profileDrop.classList.contains("show")) {
				profileDrop.classList.remove("show");
			}
		}
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
	document.querySelector("#content").addEventListener("click", (e) => {
		const recentTracksList = document.getElementById("recent-tracks");
		const playlistTracksList = document.getElementById("playlist-tracks");

		// Add to Playlist functionality
		if (e.target.classList.contains("add-to-playlist-btn")) {
			const trackItem = e.target.closest(".track-item");

			// Create a clone of the track item
			const clonedTrackItem = trackItem.cloneNode(true);

			// Replace "Add to Playlist" button with "Remove" button
			const addButton = clonedTrackItem.querySelector(".add-to-playlist-btn");
			const removeButton = document.createElement("button");
			removeButton.type = "button";
			removeButton.textContent = "Remove";
			removeButton.classList.add("remove-from-playlist-btn");
			addButton.replaceWith(removeButton);

			// Hide original track instead of removing
			trackItem.classList.add("hidden");

			// Add to playlist tracks
			playlistTracksList.appendChild(clonedTrackItem);
		}

		// Remove from Playlist functionality
		if (e.target.classList.contains("remove-from-playlist-btn")) {
			const trackItem = e.target.closest(".track-item");

			// Find the original track in the recent tracks list
			const originalTrackId = trackItem.dataset.trackId;
			const originalTrack = Array.from(recentTracksList.querySelectorAll(".track-item")).find((item) => item.dataset.trackId === originalTrackId);

			if (originalTrack) {
				// Remove hidden class to make the original track visible again
				originalTrack.classList.remove("hidden");
			}

			// Remove the cloned track from the playlist
			trackItem.remove();
		}

		// Before form submission, collect track IDs
		if (e.target.classList.contains("submit-button")) {
			const trackIds = Array.from(playlistTracksList.querySelectorAll(".track-item")).map((item) => item.dataset.trackId);

			// Create hidden inputs to send track IDs with the form
			const form = e.target.closest("form");
			trackIds.forEach((trackId) => {
				const hiddenInput = document.createElement("input");
				hiddenInput.type = "hidden";
				hiddenInput.name = "track_ids";
				hiddenInput.value = trackId;
				form.appendChild(hiddenInput);
			});
		}
	});

	document.querySelector("#content").addEventListener("click", async (e) => {
		if (e.target.closest("#search-btn")) {
			const query = document.getElementById("search-input").value;
			const category = document.getElementById("search-category").value;

			if (!query) {
				return;
			}

			try {
				const response = await fetch(`/api/search?q=${encodeURIComponent(query)}&c=${category}`);
				const results = await response.json();
				const resultsContainer = document.getElementById("search-results");
				resultsContainer.classList.remove("hidden");
				resultsContainer.innerHTML = ""; // Clear previous results

				if (results.length === 0) {
					resultsContainer.innerHTML = "<p>No results found.</p>";
				} else {
					results.forEach((result) => {
						const resultItem = document.createElement("div");
						resultItem.classList.add("search-result-item"); // Add class for styling

						let resultLink = "";

						// Depending on the result type, create a link
						if (result.track_id) {
							resultLink = `/tracks/${result.track_id}`;
							resultItem.innerHTML = `<a href="${resultLink}" class="result-link">${result.track_title}</a>`;
						} else if (result.artist_id) {
							resultLink = `/artists/${result.artist_id}`;
							resultItem.innerHTML = `<a href="${resultLink}" class="result-link">${result.artist_name}</a>`;
						} else if (result.album_id) {
							resultLink = `/albums/${result.album_id}`;
							resultItem.innerHTML = `<a href="${resultLink}" class="result-link">${result.album_name}</a>`;
						} else if (result.user_id) {
							resultLink = `/users/${result.user_id}`;
							resultItem.innerHTML = `<a href="${resultLink}" class="result-link">${result.user_name}</a>`;
						}

						resultsContainer.appendChild(resultItem);
					});
				}
			} catch (error) {
				console.error(error);
			}
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
	// console.log("Calling redirect");
	history.replaceState(null, "", "/login");
	fetch("/logout", {
		method: "POST",
	}).then(() => {
		window.location.reload();
	});
}

async function openPlaylistPopup(trackId) {
	const popup = document.querySelector("#playlist-popup-container");
	const playlistsDiv = popup.querySelector(".playlists");
	const overlay = document.querySelector("#overlay");
	const saveBtn = popup.querySelector(".save-playlists");
	const popupErr = popup.querySelector(".popup-error");

	// Clear previous error messages
	popupErr.innerHTML = "";

	// Assign track ID to the save button
	saveBtn.dataset.trackId = trackId;

	// Show the popup and overlay
	popup.style.display = "block";
	overlay.style.display = "block";

	try {
		// Fetch playlists dynamically
		const response = await fetch("/api/playlists");
		const data = await response.json();

		// Populate playlists into the popup
		playlistsDiv.innerHTML = data.playlists
			.map(
				(playlist) => `
                <label>
                    <input type="checkbox" data-playlist-id="${playlist.playlist_id}">
                    ${playlist.playlist_name}
                </label>
            `
			)
			.join("");
	} catch (error) {
		console.error("Error fetching playlists:", error);
		playlistsDiv.innerHTML = "Failed to load playlists.";
	}
}

document.addEventListener("click", async function (event) {
	if (event.target.closest(".like-btn")) {
		const likeBtn = event.target.closest(".like-btn");
		const id = likeBtn.dataset.id;
		const type = likeBtn.dataset.type;

		toggleLike(id, type, likeBtn);
	}
});

async function toggleLike(id, type, btn) {
	// console.log("Toggling like");
	const icon = btn.querySelector("i.bi");
	// console.log(icon);
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
				// console.log(icon);
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
				// console.log(icon);
			} else {
				console.error("Failed to toggle like status:", result.message);
			}
		}
	} catch (error) {
		console.error("Error toggling like:", error);
	}
}

function closePlaylist() {
	const popup = document.querySelector("#playlist-popup-container");
	const overlay = document.querySelector("#overlay");
	popup.style.display = "none";
	overlay.style.display = "none";
}

async function savePlaylist() {
	const popup = document.querySelector("#playlist-popup-container");
	const selectedCheckboxes = popup.querySelectorAll("input[type='checkbox']:checked");
	const saveBtn = popup.querySelector(".save-playlists");
	const popupErr = popup.querySelector(".popup-error");
	const trackId = saveBtn.dataset.trackId; // Get the track ID
	const selectedPlaylistIds = [];

	const audioPlayer = document.getElementById("audio-player");
	const mp3_path = decodeURIComponent(audioPlayer.src.split("/").pop()); // Extracts the file name from the URL
	// console.log("current track:", mp3_path); // "song1.mp3"

	const track_info = trackId ? trackId : mp3_path; // Collect selected playlist IDs

	selectedCheckboxes.forEach((checkbox) => {
		selectedPlaylistIds.push(checkbox.dataset.playlistId);
	});

	if (selectedPlaylistIds.length === 0) {
		popupErr.innerHTML = "Please select at least one playlist.";
		return;
	}

	try {
		const response = await fetch("/api/save-track-playlists", {
			method: "POST",
			headers: { "Content-Type": "application/json" },
			body: JSON.stringify({
				track_info: track_info,
				playlists: selectedPlaylistIds,
			}),
		});

		const result = await response.json();

		if (response.ok) {
			// console.log("Track added to playlists:", result.message);
			closePlaylist();
		} else {
			console.error("Failed to save playlists:", result.message);
		}
	} catch (error) {
		console.error("Error saving playlists:", error);
	}
}
