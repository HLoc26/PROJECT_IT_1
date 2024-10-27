/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export function up(knex) {
	return knex.schema.createTable("user_playlist", function (table) {
		table.integer("playlist_id").unsigned().references("playlist_id").inTable("playlists").notNullable();
		table.integer("user_id").unsigned().references("user_id").inTable("users").notNullable();
		table.timestamp("time").notNullable().defaultTo(knex.fn.now());
		table.primary(["playlist_id", "user_id"]);
		table.timestamps(true, true);
	});
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export function down(knex) {
	return knex.schema.dropTableIfExists("user_playlist");
}
