/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export function up(knex) {
	return knex.schema
		.table("tracks", function (table) {
			table.integer("uploader_id").unsigned().references("user_id").inTable("users").notNullable();
			table.timestamp("upload_time").notNullable().defaultTo(knex.fn.now());
			table.integer("album_id").unsigned().references("album_id").inTable("albums").onDelete("CASCADE").nullable();
		})
		.table("playlists", function (table) {
			table.integer("owner_id").unsigned().references("user_id").inTable("users").notNullable();
			table.timestamp("create_time").notNullable().defaultTo(knex.fn.now());
		});
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export function down(knex) {
	return knex.schema
		.table("tracks", function (table) {
			// Drop any columns added in the 'up' migration
			table.dropColumn("album_id");
		})
		.table("playlists", function (table) {
			// Drop any columns added in the 'up' migration
			table.dropColumn("user_id");
		});
}
