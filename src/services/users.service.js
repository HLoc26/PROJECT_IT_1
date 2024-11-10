import db from "../config/knex.js";

export default {
	findByEmail(user_email) {
		return db("users").where("user_email", user_email);
	},

	add(entity) {
		return db("users").insert(entity);
	},
};
