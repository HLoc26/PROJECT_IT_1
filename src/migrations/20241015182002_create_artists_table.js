/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export function up(knex) {
	return knex.schema.createTable("artists", function (table) {
		table.increments("artist_id").primary();
		table.string("artist_name").unique().notNullable();
		table.string("artist_pic_path").unique().nullable();
		table.timestamps(true, true);
	});
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export function down(knex) {
	return knex.schema.dropTableIfExists("artists");
}
