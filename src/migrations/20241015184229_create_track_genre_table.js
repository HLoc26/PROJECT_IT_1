/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
	return knex.schema.createTable("track_genre", function (table) {
		table.integer("track_id").unsigned().references("track_id").inTable("tracks").notNullable();
		table.integer("genre_id").unsigned().references("genre_id").inTable("genres").notNullable();
		table.primary(["track_id", "genre_id"]);
		table.timestamps(true, true);
	});
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
	return knex.schema.dropTableIfExists("track_genre");
};
