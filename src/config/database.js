// "mssql" is a commonJS file
import "dotenv/config";
import sql from "mssql";

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

// Export the pool and the retry connection function
export const connectWithRetry = async (retryCount = 5, delay = 3000) => {
	let attempt = 0;
	while (attempt < retryCount) {
		try {
			const pool = new sql.ConnectionPool(config);
			const poolConnect = pool.connect();
			await poolConnect;
			console.log("Database connected successfully.");
			return pool;
		} catch (err) {
			attempt++;
			console.error(`Database connection failed (attempt ${attempt}/${retryCount}):`, err.message);
			if (attempt < retryCount) {
				console.log(`Retrying connection in ${delay / 1000} seconds...`);
				await new Promise((res) => setTimeout(res, delay));
			} else {
				throw new Error("Max retry attempts reached. Could not connect to the database.");
			}
		}
	}
};
