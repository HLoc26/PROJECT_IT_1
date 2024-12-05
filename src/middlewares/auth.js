// Middleware to check authentication
export function isAuthenticated(req, res, next) {
	if (req.session && req.session.user_id) {
		return next();
	} else {
		// console.log("Redirect to login");
		// Check if request is an AJAX/fetch request
		if (req.xhr || req.headers["x-requested-with"] === "XMLHttpRequest") {
			return res.status(303).send("/login"); // Send the login URL without a redirect
		} else {
			return res.redirect("/login"); // Regular redirect for non-AJAX requests
		}
	}
}
