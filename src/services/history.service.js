import db from "../config/knex.js";

export default {
	findByUserId(user_id) {
		const history = db("user_listen_history as u")
			.join("tracks as t", "t.track_id", "u.track_id") // Join track
			.where("u.user_id", user_id)
			.distinct("t.*");
		return history;
	},

	addHistory(entity) {
		const ret = db("user_listen_history").insert(entity);
		return ret;
	},
};
