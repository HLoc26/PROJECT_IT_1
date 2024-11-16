export function setUsername(req, res, next) {
	if (req.session && req.session.username) {
		res.locals.username = req.session.username;
		res.locals.uid = req.session.userId;
	} else {
		res.locals.username = null;
		res.locals.uid = null;
	}
	next();
}
