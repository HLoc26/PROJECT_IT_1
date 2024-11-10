/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export function up(knex) {
	return knex.schema.dropTableIfExists("track_album").dropTableIfExists("user_upload").dropTableIfExists("user_playlist");
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export function down(knex) {}
