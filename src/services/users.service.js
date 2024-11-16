import db from "../config/knex.js";

export default {
	findByEmail(user_email) {
		return db("users").where("user_email", user_email);
	},

	findById(user_id) {
		return db("users").where("user_id", user_id);
	},

	add(entity) {
		return db("users").insert(entity);
	},
};
