/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export function up(knex) {
	return knex.schema.createTable("artist_perform", function (table) {
		table.integer("artist_id").unsigned().references("artist_id").inTable("artists").notNullable();
		table.integer("track_id").unsigned().references("track_id").inTable("tracks").notNullable();
		table.primary(["artist_id", "track_id"]);
		table.timestamps(true, true);
	});
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export function down(knex) {
	return knex.schema.dropTableIfExists("artist_perform");
}
