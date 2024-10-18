require("dotenv").config();
const knex = require("knex");

const knexInstance = knex({
	client: "mssql",
	connection: {
		host: process.env.AZURE_SQL_SERVER,
		user: process.env.AZURE_SQL_USER,
		password: process.env.AZURE_SQL_PASSWORD,
		database: process.env.AZURE_SQL_DATABASE,
		port: +process.env.AZURE_SQL_PORT,
		options: {
			encrypt: true,
			trustServerCertificate: true,
		},
	},
});

module.exports = knexInstance;
