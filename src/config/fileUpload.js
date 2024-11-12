import multer from "multer";

export default multer({
	storage: multer.memoryStorage(),
	limits: { fileSize: 15 * 1024 * 1024 }, // 15 MB file
});
