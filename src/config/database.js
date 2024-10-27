const mysql = require("mysql2");
// Create connection to the database
const connection = mysql.createConnection({
	host: process.env.DB_HOST,
	port: process.env.DB_PORT,
	database: process.env.DB_NAME,
	user: process.env.DB_USER,
	password: process.env.DB_PWD,
});

module.exports = connection;
