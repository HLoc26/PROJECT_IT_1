import "dotenv/config";
import knex from "knex";

const knexInstance = knex({
	client: "mssql",
	connection: {
		host: process.env.DB_SERVER,
		user: process.env.DB_USER,
		password: process.env.DB_PASSWORD,
		database: process.env.DB_DATABASE,
		port: +process.env.DB_PORT,
		options: {
			encrypt: true,
			trustServerCertificate: true,
		},
	},
});

export default knexInstance;
