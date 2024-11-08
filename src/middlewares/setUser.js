export function setUsername(req, res, next) {
	if (req.session && req.session.username) {
		res.locals.username = req.session.username;
	} else {
		res.locals.username = null;
	}
	next();
}
