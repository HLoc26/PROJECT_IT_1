/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export function up(knex) {
	return knex.schema.createTable("track_playlist", function (table) {
		table.integer("track_id").unsigned().references("track_id").inTable("tracks").notNullable();
		table.integer("playlist_id").unsigned().references("playlist_id").inTable("playlists").notNullable();
		table.primary(["track_id", "playlist_id"]);
		table.timestamps(true, true);
	});
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export function down(knex) {
	return knex.schema.dropTableIfExists("track_playlist");
}
