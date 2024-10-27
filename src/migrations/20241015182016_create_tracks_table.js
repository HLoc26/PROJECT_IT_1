/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export function up(knex) {
	return knex.schema.createTable("tracks", function (table) {
		table.increments("track_id").primary();
		table.string("track_title").notNullable();
		table.float("track_duration").notNullable().checkPositive();
		table.string("track_mp3_path").notNullable();
		table.string("track_lyrics_path");
		table.enu("visibility", ["public", "private", "unlisted"]).notNullable();
		table.timestamps(true, true);
	});
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export function down(knex) {
	return knex.schema.dropTableIfExists("tracks");
}
