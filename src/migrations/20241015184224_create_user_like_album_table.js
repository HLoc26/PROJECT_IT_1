/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
	return knex.schema.createTable("user_like_album", function (table) {
		table.integer("user_id").unsigned().references("user_id").inTable("users").notNullable();
		table.integer("album_id").unsigned().references("album_id").inTable("albums").notNullable();
		table.timestamp("time").notNullable().defaultTo(knex.fn.now());
		table.primary(["user_id", "album_id"]);
		table.timestamps(true, true);
	});
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
	return knex.schema.dropTableIfExists("user_like_album");
};
