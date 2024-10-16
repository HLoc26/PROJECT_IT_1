/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
	return knex.schema.createTable("user_like_track", function (table) {
		table.integer("user_id").unsigned().references("user_id").inTable("users").notNullable();
		table.integer("track_id").unsigned().references("track_id").inTable("tracks").notNullable();
		table.timestamp("time").notNullable().defaultTo(knex.fn.now());
		table.primary(["user_id", "track_id"]);
		table.timestamps(true, true);
	});
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
	return knex.schema.dropTableIfExists("user_like_track");
};