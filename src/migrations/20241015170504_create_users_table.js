/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
	return knex.schema.createTable("users", (table) => {
		table.increments("user_id").primary();
		table.string("user_name").notNullable();
		table.string("user_password").notNullable().checkLength(">=", 8);
		table.string("user_email").unique().notNullable();
		table.string("user_profile_pic").defaultTo("/uploads/profile/default.jpg");
		table.enu("user_role", ["admin", "user", "vip_user"]);
		// Tạo cột created_at và updated_at
		table.timestamps(true, true);
	});
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
	return knex.schema.dropTableIfExists("users");
};
