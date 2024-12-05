export function setUsername(req, res, next) {
	if (req.session && req.session.username) {
		res.locals.username = req.session.username;
		res.locals.user_id = req.session.user_id;
		res.locals.user = req.session.user;
	} else {
		res.locals.username = null;
		res.locals.user_id = null;
		res.locals.user = null;
	}
	next();
}
