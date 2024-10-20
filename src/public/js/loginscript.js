const container = document.getElementById("container");
const registerBtn = document.getElementById("register");
const loginBtn = document.getElementById("login");

registerBtn.addEventListener("click", () => {
	container.classList.add("active");
});

loginBtn.addEventListener("click", () => {
	container.classList.remove("active");
});

// Register validation
document.querySelector(".sign-up form").addEventListener("submit", async function (e) {
	e.preventDefault(); // Ngăn chặn hành động mặc định của form

	const formData = new FormData(this);
	const data = Object.fromEntries(formData.entries()); // Chuyển đổi FormData thành đối tượng

	const response = await fetch("/register", {
		method: "POST",
		headers: {
			"Content-Type": "application/json", // Đặt Content-Type để sử dụng JSON
		},
		body: JSON.stringify(data), // Chuyển đổi đối tượng thành JSON
	});

	if (response.ok) {
		window.location.href = "/login"; // Chuyển hướng sau khi đăng ký thành công
	} else {
		const result = await response.json();
		const registerError = document.getElementById("register-email-error");
		registerError.textContent = result.error; // Hiển thị thông báo lỗi
	}
});

// Log/sign in
document.querySelector(".sign-in form").addEventListener("submit", async function (e) {
	e.preventDefault(); // Ngăn chặn hành động mặc định của form

	const formData = new FormData(this);
	const data = Object.fromEntries(formData.entries()); // Chuyển đổi FormData thành đối tượng

	console.log("Data: ", data);

	const response = await fetch("/login", {
		method: "POST",
		headers: {
			"Content-Type": "application/json", // Đặt Content-Type để sử dụng JSON
		},
		body: JSON.stringify(data), // Chuyển đổi đối tượng thành JSON
	});

	if (response.ok) {
		window.location.href = "/"; // Chuyển hướng sau khi đăng ký thành công
	} else {
		const result = await response.json();
		const registerError = document.getElementById("login-error");
		registerError.textContent = result.error; // Hiển thị thông báo lỗi
	}
});
