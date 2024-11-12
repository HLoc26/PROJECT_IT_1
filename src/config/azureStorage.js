import { BlobServiceClient } from "@azure/storage-blob";

const conn_str = process.env.STORAGE_CONN_STR;
const blobServiceClient = BlobServiceClient.fromConnectionString(conn_str);
const containerName = "music";
const containerClient = blobServiceClient.getContainerClient(containerName);

export default containerClient;
