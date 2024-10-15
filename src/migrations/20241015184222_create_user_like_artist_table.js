/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
	return knex.schema.createTable("user_like_artist", function (table) {
		table.integer("user_id").unsigned().references("user_id").inTable("users").notNullable();
		table.integer("artist_id").unsigned().references("artist_id").inTable("artists").notNullable();
		table.timestamp("time").notNullable().defaultTo(knex.fn.now());
		table.primary(["user_id", "artist_id"]);
		table.timestamps(true, true);
	});
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
	return knex.schema.dropTableIfExists("user_like_artist");
};
