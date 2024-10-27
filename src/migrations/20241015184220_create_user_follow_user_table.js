/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export function up(knex) {
	return knex.schema.createTable("user_follow_user", function (table) {
		table.integer("user_id").unsigned().references("user_id").inTable("users").notNullable();
		table.integer("follow_id").unsigned().references("user_id").inTable("users").notNullable();
		table.timestamp("time").notNullable().defaultTo(knex.fn.now());
		table.primary(["user_id", "follow_id"]);
		table.check("user_id != follow_id"); // Không cho phép người dùng theo dõi chính mình
		table.timestamps(true, true);
	});
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
export function down(knex) {
	return knex.schema.dropTableIfExists("user_follow_user");
}
