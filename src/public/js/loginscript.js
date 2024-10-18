const container = document.getElementById("container");
const registerBtn = document.getElementById("register");
const loginBtn = document.getElementById("login");

registerBtn.addEventListener("click", () => {
	container.classList.add("active");
});

loginBtn.addEventListener("click", () => {
	container.classList.remove("active");
});

document.querySelector(".sign-up form").addEventListener("submit", async function (e) {
	console.log("Prevented");
	e.preventDefault(); // Ngăn chặn hành động mặc định của form

	const formData = new FormData(this);
	const data = Object.fromEntries(formData.entries()); // Chuyển đổi FormData thành đối tượng

	console.log("Data:", data); // Kiểm tra giá trị của các trường

	const response = await fetch("/register", {
		method: "POST",
		headers: {
			"Content-Type": "application/json", // Đặt Content-Type để sử dụng JSON
		},
		body: JSON.stringify(data), // Chuyển đổi đối tượng thành JSON
	});

	console.log("loginscript got the response: ", response);

	if (response.ok) {
		window.location.href = "/login"; // Chuyển hướng sau khi đăng ký thành công
	} else {
		const result = await response.json();
		const errorElement = document.getElementById("register-email-error");
		errorElement.textContent = result.error; // Hiển thị thông báo lỗi
	}
});
