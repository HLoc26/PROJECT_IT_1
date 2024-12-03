import db from "../config/knex.js";

export default {
	findByEmail(user_email) {
		return db("users").where("user_email", user_email);
	},

	findById(user_id) {
		return db("users").where("user_id", user_id).first();
	},

	add(entity) {
		return db("users").insert(entity);
	},

	countFollower(user_id) {
		return db("user_follow_user")
			.count("* as follower_count") // Count follower
			.where("follow_id", user_id) // By follow_id
			.first();
	},

	countFollowing(user_id) {
		return db("user_follow_user")
			.count("* as following_count") // Count following
			.where("user_id", user_id) // by user_id
			.first();
	},

	countUploadedTrack(user_id) {
		return db("tracks")
			.count("* as tracks_count")
			.where("uploader_id", user_id) // Count uploaded tracks
			.first();
	},

	findByName(user_name) {
		return db("users").where("user_name", "like", `%${user_name}%`);
	},
};
