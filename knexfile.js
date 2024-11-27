// Update with your config settings.

/**
 * @type { Object.<string, import("knex").Knex.Config> }
 */
import "dotenv/config";

export default {
	development: {
		client: "mssql", // Or 'mysql2'
		connection: {
			host: process.env.AZURE_SQL_SERVER,
			user: process.env.AZURE_SQL_USER,
			password: process.env.AZURE_SQL_PASSWORD,
			database: process.env.AZURE_SQL_DATABASE,
			port: +process.env.AZURE_SQL_PORT, // Default port for SQL Server
			options: {
				encrypt: true, // Use encryption
				trustServerCertificate: true, // Only for development, not recommended for production
			},
		},
		migrations: {
			directory: "./src/migrations",
		},
		seeds: {
			directory: "./src/seeds",
		},
	},
}["development"];
