document.addEventListener("DOMContentLoaded", () => {
	const content = document.getElementById("content");

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
				})
				.catch((err) => {
					console.error("Error:", err);
				});
		}
	});
});

function loginRedirect() {
	console.log("Calling redirect");
	history.replaceState(null, "", "/login");
	fetch("/logout", {
		method: "POST",
	}).then(() => {
		window.location.reload();
	});
}

async function getSessionUserId() {
	try {
		const response = await fetch("/api/session");
		if (!response.ok) {
			console.error("Failed to fetch session data.");
			return null;
		}
		const data = await response.json();
		sessionStorage.setItem("user_id", data.user_id);
		return data.user_id;
	} catch (error) {
		console.error("Error fetching session data:", error);
		return null;
	}
}

getSessionUserId().then((user_id) => {
	if (!user_id) {
		console.log("User not logged in.");
	} else {
		console.log("User ID:", user_id);
	}
});
