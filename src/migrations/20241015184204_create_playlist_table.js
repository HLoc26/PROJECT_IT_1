/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export function up(knex) {
	return knex.schema.createTable("playlists", function (table) {
		table.increments("playlist_id").primary();
		table.string("playlist_name").notNullable().unique();
		table.enu("playlist_visibility_mode", ["public", "private", "unlisted"]).notNullable();
		table.timestamps(true, true);
	});
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export function down(knex) {
	return knex.schema.dropTableIfExists("playlists");
}
