require("dotenv").config();
const sql = require("mssql");

// // Load environment variables
// if (process.env.NODE_ENV === "development") {
// 	require("dotenv").config({ path: `.env.${process.env.NODE_ENV}`, debug: true });
// }

// Connection configuration
const config = {
	server: process.env.AZURE_SQL_SERVER,
	database: process.env.AZURE_SQL_DATABASE,
	port: +process.env.AZURE_SQL_PORT,
	user: process.env.AZURE_SQL_USER,
	password: process.env.AZURE_SQL_PASSWORD,
	options: {
		encrypt: true,
	},
};

// Create a connection pool
const pool = new sql.ConnectionPool(config);
const poolConnect = pool.connect();

// Export the pool and a function to ensure connection
module.exports = {
	pool,
	poolConnect,
	ensureConnection: async () => {
		await poolConnect;
		return pool;
	},
};
