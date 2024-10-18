/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
	return knex.schema.createTable("track_album", function (table) {
		table.integer("track_id").unsigned().references("track_id").inTable("tracks").notNullable();
		table.integer("album_id").unsigned().references("album_id").inTable("albums").notNullable();
		table.primary(["track_id", "album_id"]);
		table.timestamps(true, true);
	});
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
	return knex.schema.dropTableIfExists("track_album");
};
