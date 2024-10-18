/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
	return knex.schema.createTable("albums", function (table) {
		table.increments("album_id").primary();
		table.string("album_name").notNullable();
		table.string("album_cover_image").defaultTo("/uploads/albums/default.jpg");
		table.integer("artist_id").unsigned().references("artist_id").inTable("artists");
		table.date("publish_date").notNullable();
		table.check("publish_date <= CURRENT_DATE");
		table.timestamps(true, true);
	});
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
	return knex.schema.dropTableIfExists("albums");
};
