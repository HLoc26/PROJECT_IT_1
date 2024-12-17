/*
 Navicat Premium Dump SQL

 Source Server         : mssql
 Source Server Type    : SQL Server
 Source Server Version : 16001135 (16.00.1135)
 Source Host           : localhost:1433
 Source Catalog        : music-streaming-platform
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 16001135 (16.00.1135)
 File Encoding         : 65001

 Date: 17/12/2024 11:28:51
*/

DROP DATABASE "music-streaming-platform" IF EXISTS;

CREATE DATABASE "music-streaming-platform";

-- ----------------------------
-- Table structure for albums
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[albums]') AND type IN ('U'))
	DROP TABLE [dbo].[albums]
GO

CREATE TABLE [dbo].[albums] (
  [album_id] int  IDENTITY(1,1) NOT NULL,
  [album_name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [album_cover_image] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT '/uploads/albums/default.jpg' NULL,
  [artist_id] int  NULL,
  [publish_date] date  NOT NULL,
  [created_at] datetime2(7) DEFAULT getdate() NOT NULL,
  [updated_at] datetime2(7) DEFAULT getdate() NOT NULL
)
GO

ALTER TABLE [dbo].[albums] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of albums
-- ----------------------------
SET IDENTITY_INSERT [dbo].[albums] ON
GO

INSERT INTO [dbo].[albums] ([album_id], [album_name], [album_cover_image], [artist_id], [publish_date], [created_at], [updated_at]) VALUES (N'1', N'ALL OUT', N'/images/albums/allout.png', N'1', N'2020-11-06', N'2024-10-27 17:28:24.7966667', N'2024-10-27 17:28:24.7966667')
GO

INSERT INTO [dbo].[albums] ([album_id], [album_name], [album_cover_image], [artist_id], [publish_date], [created_at], [updated_at]) VALUES (N'2', N'Lover', N'/images/albums/lover_ts.jpg', N'14', N'2019-08-13', N'2024-11-03 13:28:48.3433333', N'2024-11-03 13:28:48.3433333')
GO

INSERT INTO [dbo].[albums] ([album_id], [album_name], [album_cover_image], [artist_id], [publish_date], [created_at], [updated_at]) VALUES (N'3', N'Autumn Variations', N'/images/albums/Autumn_Variations.png', N'11', N'2019-11-29', N'2024-11-28 19:14:22.2033333', N'2024-11-28 19:14:22.2033333')
GO

INSERT INTO [dbo].[albums] ([album_id], [album_name], [album_cover_image], [artist_id], [publish_date], [created_at], [updated_at]) VALUES (N'4', N'After Hours', N'/images/albums/After_Hours.jpg', N'15', N'2020-03-20', N'2024-11-28 20:41:17.8200000', N'2024-11-28 20:41:17.8200000')
GO

SET IDENTITY_INSERT [dbo].[albums] OFF
GO


-- ----------------------------
-- Table structure for artist_perform
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[artist_perform]') AND type IN ('U'))
	DROP TABLE [dbo].[artist_perform]
GO

CREATE TABLE [dbo].[artist_perform] (
  [artist_id] int  NOT NULL,
  [track_id] int  NOT NULL,
  [created_at] datetime2(7) DEFAULT getdate() NOT NULL,
  [updated_at] datetime2(7) DEFAULT getdate() NOT NULL
)
GO

ALTER TABLE [dbo].[artist_perform] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of artist_perform
-- ----------------------------
INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-10-27 17:34:35.5800000', N'2024-10-27 17:34:35.5800000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'1', N'2', N'2024-10-27 17:34:35.5833333', N'2024-10-27 17:34:35.5833333')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'1', N'3', N'2024-10-27 17:34:35.5866667', N'2024-10-27 17:34:35.5866667')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'2', N'1', N'2024-10-27 17:34:27.4866667', N'2024-10-27 17:34:27.4866667')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'2', N'2', N'2024-10-27 17:34:27.4900000', N'2024-10-27 17:34:27.4900000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'2', N'3', N'2024-10-27 17:34:27.4900000', N'2024-10-27 17:34:27.4900000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'11', N'29', N'2024-11-28 19:24:33.7333333', N'2024-11-28 19:24:33.7333333')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'11', N'30', N'2024-11-28 19:24:41.7700000', N'2024-11-28 19:24:41.7700000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'11', N'33', N'2024-11-28 19:24:41.7700000', N'2024-11-28 19:24:41.7700000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'11', N'34', N'2024-11-28 19:24:41.7700000', N'2024-11-28 19:24:41.7700000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'11', N'36', N'2024-11-28 19:24:41.7700000', N'2024-11-28 19:24:41.7700000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'11', N'37', N'2024-11-28 19:24:41.7700000', N'2024-11-28 19:24:41.7700000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'11', N'38', N'2024-11-28 19:24:41.7700000', N'2024-11-28 19:24:41.7700000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'14', N'4', N'2024-11-03 19:55:31.4500000', N'2024-11-03 19:55:31.4500000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'14', N'5', N'2024-11-03 19:55:31.4500000', N'2024-11-03 19:55:31.4500000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'14', N'6', N'2024-11-03 19:55:31.4500000', N'2024-11-03 19:55:31.4500000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'14', N'7', N'2024-11-03 19:55:31.4500000', N'2024-11-03 19:55:31.4500000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'14', N'8', N'2024-11-03 19:55:31.4500000', N'2024-11-03 19:55:31.4500000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'14', N'9', N'2024-11-03 19:55:31.4500000', N'2024-11-03 19:55:31.4500000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'14', N'10', N'2024-11-03 19:55:31.4500000', N'2024-11-03 19:55:31.4500000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'14', N'11', N'2024-11-03 19:55:31.4500000', N'2024-11-03 19:55:31.4500000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'14', N'12', N'2024-11-03 19:55:31.4500000', N'2024-11-03 19:55:31.4500000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'14', N'13', N'2024-11-03 19:55:31.4500000', N'2024-11-03 19:55:31.4500000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'14', N'14', N'2024-11-03 19:55:31.4500000', N'2024-11-03 19:55:31.4500000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'14', N'15', N'2024-11-03 19:55:31.4500000', N'2024-11-03 19:55:31.4500000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'14', N'16', N'2024-11-03 19:55:31.4500000', N'2024-11-03 19:55:31.4500000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'14', N'17', N'2024-11-03 19:55:31.4500000', N'2024-11-03 19:55:31.4500000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'14', N'18', N'2024-11-03 19:55:31.4500000', N'2024-11-03 19:55:31.4500000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'14', N'19', N'2024-11-03 19:55:31.4500000', N'2024-11-03 19:55:31.4500000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'14', N'20', N'2024-11-03 19:55:31.4500000', N'2024-11-03 19:55:31.4500000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'14', N'21', N'2024-11-03 19:55:31.4500000', N'2024-11-03 19:55:31.4500000')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'15', N'41', N'2024-11-28 20:46:33.2266667', N'2024-11-28 20:46:33.2266667')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'15', N'43', N'2024-11-28 20:46:33.2266667', N'2024-11-28 20:46:33.2266667')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'15', N'45', N'2024-11-28 20:46:33.2266667', N'2024-11-28 20:46:33.2266667')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'15', N'46', N'2024-11-28 20:46:33.2266667', N'2024-11-28 20:46:33.2266667')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'15', N'47', N'2024-11-28 20:46:33.2266667', N'2024-11-28 20:46:33.2266667')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'15', N'48', N'2024-11-28 20:46:33.2266667', N'2024-11-28 20:46:33.2266667')
GO

INSERT INTO [dbo].[artist_perform] ([artist_id], [track_id], [created_at], [updated_at]) VALUES (N'15', N'50', N'2024-11-28 20:46:33.2266667', N'2024-11-28 20:46:33.2266667')
GO


-- ----------------------------
-- Table structure for artists
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[artists]') AND type IN ('U'))
	DROP TABLE [dbo].[artists]
GO

CREATE TABLE [dbo].[artists] (
  [artist_id] int  IDENTITY(1,1) NOT NULL,
  [artist_name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [artist_pic_path] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [created_at] datetime2(7) DEFAULT getdate() NOT NULL,
  [updated_at] datetime2(7) DEFAULT getdate() NOT NULL
)
GO

ALTER TABLE [dbo].[artists] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of artists
-- ----------------------------
SET IDENTITY_INSERT [dbo].[artists] ON
GO

INSERT INTO [dbo].[artists] ([artist_id], [artist_name], [artist_pic_path], [created_at], [updated_at]) VALUES (N'1', N'K/DA', N'/images/artists/KDA.png', N'2024-10-27 16:26:52.5300000', N'2024-10-27 16:26:52.5300000')
GO

INSERT INTO [dbo].[artists] ([artist_id], [artist_name], [artist_pic_path], [created_at], [updated_at]) VALUES (N'2', N'League of Legends', N'/images/artists/LOL.png', N'2024-10-27 17:13:58.6933333', N'2024-10-27 17:13:58.6933333')
GO

INSERT INTO [dbo].[artists] ([artist_id], [artist_name], [artist_pic_path], [created_at], [updated_at]) VALUES (N'4', N'Adele', N'/images/artists/Adele.jpg', N'2024-10-29 03:28:58.3766667', N'2024-10-29 03:28:58.3766667')
GO

INSERT INTO [dbo].[artists] ([artist_id], [artist_name], [artist_pic_path], [created_at], [updated_at]) VALUES (N'5', N'Ariana Grande', N'/images/artists/ArianaGrande.jpg', N'2024-10-29 03:28:58.3766667', N'2024-10-29 03:28:58.3766667')
GO

INSERT INTO [dbo].[artists] ([artist_id], [artist_name], [artist_pic_path], [created_at], [updated_at]) VALUES (N'6', N'Beyoncé', N'/images/artists/Beyonce.jpg', N'2024-10-29 03:28:58.3766667', N'2024-10-29 03:28:58.3766667')
GO

INSERT INTO [dbo].[artists] ([artist_id], [artist_name], [artist_pic_path], [created_at], [updated_at]) VALUES (N'7', N'Billie Eilish', N'/images/artists/BillieEilish.jpg', N'2024-10-29 03:28:58.3766667', N'2024-10-29 03:28:58.3766667')
GO

INSERT INTO [dbo].[artists] ([artist_id], [artist_name], [artist_pic_path], [created_at], [updated_at]) VALUES (N'8', N'BlackPink', N'/images/artists/BlackPink.jpg', N'2024-10-29 03:28:58.3766667', N'2024-10-29 03:28:58.3766667')
GO

INSERT INTO [dbo].[artists] ([artist_id], [artist_name], [artist_pic_path], [created_at], [updated_at]) VALUES (N'9', N'Bruno Mars', N'/images/artists/BrunoMars.jpg', N'2024-10-29 03:28:58.3766667', N'2024-10-29 03:28:58.3766667')
GO

INSERT INTO [dbo].[artists] ([artist_id], [artist_name], [artist_pic_path], [created_at], [updated_at]) VALUES (N'10', N'Drake', N'/images/artists/Drake.jpg', N'2024-10-29 03:28:58.3766667', N'2024-10-29 03:28:58.3766667')
GO

INSERT INTO [dbo].[artists] ([artist_id], [artist_name], [artist_pic_path], [created_at], [updated_at]) VALUES (N'11', N'Ed Sheeran', N'/images/artists/EdSheeran.jpg', N'2024-10-29 03:28:58.3766667', N'2024-10-29 03:28:58.3766667')
GO

INSERT INTO [dbo].[artists] ([artist_id], [artist_name], [artist_pic_path], [created_at], [updated_at]) VALUES (N'12', N'Justin Bieber', N'/images/artists/JustinBieber.jpg', N'2024-10-29 03:28:58.3766667', N'2024-10-29 03:28:58.3766667')
GO

INSERT INTO [dbo].[artists] ([artist_id], [artist_name], [artist_pic_path], [created_at], [updated_at]) VALUES (N'13', N'Kanye West', N'/images/artists/KanyeWest.jpg', N'2024-10-29 03:28:58.3766667', N'2024-10-29 03:28:58.3766667')
GO

INSERT INTO [dbo].[artists] ([artist_id], [artist_name], [artist_pic_path], [created_at], [updated_at]) VALUES (N'14', N'Taylor Swift', N'/images/artists/TaylorSwift.jpg', N'2024-10-29 03:28:58.3766667', N'2024-10-29 03:28:58.3766667')
GO

INSERT INTO [dbo].[artists] ([artist_id], [artist_name], [artist_pic_path], [created_at], [updated_at]) VALUES (N'15', N'The Weeknd', N'/images/artists/TheWeeknd.png', N'2024-10-29 03:28:58.3766667', N'2024-10-29 03:28:58.3766667')
GO

SET IDENTITY_INSERT [dbo].[artists] OFF
GO


-- ----------------------------
-- Table structure for genres
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[genres]') AND type IN ('U'))
	DROP TABLE [dbo].[genres]
GO

CREATE TABLE [dbo].[genres] (
  [genre_id] int  IDENTITY(1,1) NOT NULL,
  [genre_name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [created_at] datetime2(7) DEFAULT getdate() NOT NULL,
  [updated_at] datetime2(7) DEFAULT getdate() NOT NULL
)
GO

ALTER TABLE [dbo].[genres] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of genres
-- ----------------------------
SET IDENTITY_INSERT [dbo].[genres] ON
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'1', N'Music', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'2', N'Alternative Rock', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'3', N'Ambient', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'4', N'Classical', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'5', N'Country', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'6', N'Dance & EDM', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'7', N'Dancehall', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'8', N'Deep House', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'9', N'Disco', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'10', N'Drum & Bass', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'11', N'Dubstep', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'12', N'Electronic', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'13', N'Folk & Singer-Songwriter', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'14', N'Hip-hop & Rap', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'15', N'House', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'16', N'Indie', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'17', N'Jazz & Blues', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'18', N'Latin', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'19', N'Metal', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'20', N'Piano', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'21', N'Pop', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'22', N'R&B & Soul', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'23', N'Reggae', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'24', N'Reggaeton', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'25', N'Rock', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'26', N'Soundtrack', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'27', N'Techno', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'28', N'Trance', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'29', N'Trap', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'30', N'Triphop', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

INSERT INTO [dbo].[genres] ([genre_id], [genre_name], [created_at], [updated_at]) VALUES (N'31', N'World', N'2024-10-27 17:22:33.9266667', N'2024-10-27 17:22:33.9266667')
GO

SET IDENTITY_INSERT [dbo].[genres] OFF
GO


-- ----------------------------
-- Table structure for knex_migrations
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[knex_migrations]') AND type IN ('U'))
	DROP TABLE [dbo].[knex_migrations]
GO

CREATE TABLE [dbo].[knex_migrations] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [batch] int  NULL,
  [migration_time] datetime2(7)  NULL
)
GO

ALTER TABLE [dbo].[knex_migrations] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of knex_migrations
-- ----------------------------
SET IDENTITY_INSERT [dbo].[knex_migrations] ON
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'54', N'20241015170504_create_users_table.js', N'1', N'2024-10-27 16:15:55.9166667')
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'55', N'20241015182002_create_artists_table.js', N'1', N'2024-10-27 16:15:57.0400000')
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'56', N'20241015182016_create_tracks_table.js', N'1', N'2024-10-27 16:15:57.6800000')
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'57', N'20241015182043_create_genres_table.js', N'1', N'2024-10-27 16:15:58.4966667')
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'58', N'20241015182051_create_albums_table.js', N'1', N'2024-10-27 16:15:58.9900000')
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'59', N'20241015184204_create_playlist_table.js', N'1', N'2024-10-27 16:15:59.7666667')
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'60', N'20241015184220_create_user_follow_user_table.js', N'1', N'2024-10-27 16:16:00.2800000')
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'61', N'20241015184221_create_user_like_track_table.js', N'1', N'2024-10-27 16:16:00.8533333')
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'62', N'20241015184222_create_user_like_artist_table.js', N'1', N'2024-10-27 16:16:01.4700000')
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'63', N'20241015184224_create_user_like_album_table.js', N'1', N'2024-10-27 16:16:02.0266667')
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'64', N'20241015184225_create_user_like_playlist_table.js', N'1', N'2024-10-27 16:16:02.5266667')
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'65', N'20241015184226_create_user_listen_history_table.js', N'1', N'2024-10-27 16:16:03.1066667')
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'66', N'20241015184227_create_artist_perform_table.js', N'1', N'2024-10-27 16:16:03.6166667')
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'67', N'20241015184228_create_track_playlist_table.js', N'1', N'2024-10-27 16:16:04.2333333')
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'68', N'20241015184229_create_track_genre_table.js', N'1', N'2024-10-27 16:16:04.7466667')
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'69', N'20241015184230_create_track_album_table.js', N'1', N'2024-10-27 16:16:05.2966667')
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'70', N'20241015184231_create_user_upload_table.js', N'1', N'2024-10-27 16:16:05.7900000')
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'71', N'20241015184643_create_user_playlist_table.js', N'1', N'2024-10-27 16:16:06.3833333')
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'72', N'20241110184144_drop_relation_tables.js', N'2', N'2024-11-10 18:45:04.8433333')
GO

INSERT INTO [dbo].[knex_migrations] ([id], [name], [batch], [migration_time]) VALUES (N'73', N'20241110184625_update_tracks_playlists_table.js', N'3', N'2024-11-10 18:59:35.1166667')
GO

SET IDENTITY_INSERT [dbo].[knex_migrations] OFF
GO


-- ----------------------------
-- Table structure for knex_migrations_lock
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[knex_migrations_lock]') AND type IN ('U'))
	DROP TABLE [dbo].[knex_migrations_lock]
GO

CREATE TABLE [dbo].[knex_migrations_lock] (
  [index] int  IDENTITY(1,1) NOT NULL,
  [is_locked] int  NULL
)
GO

ALTER TABLE [dbo].[knex_migrations_lock] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of knex_migrations_lock
-- ----------------------------
SET IDENTITY_INSERT [dbo].[knex_migrations_lock] ON
GO

INSERT INTO [dbo].[knex_migrations_lock] ([index], [is_locked]) VALUES (N'1', N'0')
GO

SET IDENTITY_INSERT [dbo].[knex_migrations_lock] OFF
GO


-- ----------------------------
-- Table structure for playlists
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[playlists]') AND type IN ('U'))
	DROP TABLE [dbo].[playlists]
GO

CREATE TABLE [dbo].[playlists] (
  [playlist_id] int  IDENTITY(1,1) NOT NULL,
  [playlist_name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [playlist_visibility_mode] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [owner_id] int  NOT NULL,
  [create_time] datetime2(7) DEFAULT getdate() NOT NULL,
  [created_at] datetime2(7) DEFAULT getdate() NOT NULL,
  [updated_at] datetime2(7) DEFAULT getdate() NOT NULL
)
GO

ALTER TABLE [dbo].[playlists] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of playlists
-- ----------------------------
SET IDENTITY_INSERT [dbo].[playlists] ON
GO

INSERT INTO [dbo].[playlists] ([playlist_id], [playlist_name], [playlist_visibility_mode], [owner_id], [create_time], [created_at], [updated_at]) VALUES (N'6', N'Your playlist #0', N'public', N'1', N'2024-11-16 12:41:57.6650000', N'2024-11-16 19:41:57.6700000', N'2024-11-16 19:41:57.6700000')
GO

INSERT INTO [dbo].[playlists] ([playlist_id], [playlist_name], [playlist_visibility_mode], [owner_id], [create_time], [created_at], [updated_at]) VALUES (N'7', N'Your playlist #1', N'private', N'1', N'2024-11-16 12:42:19.3780000', N'2024-11-16 19:42:19.3833333', N'2024-11-16 19:42:19.3833333')
GO

INSERT INTO [dbo].[playlists] ([playlist_id], [playlist_name], [playlist_visibility_mode], [owner_id], [create_time], [created_at], [updated_at]) VALUES (N'8', N'Hello this is my new playlist', N'private', N'1', N'2024-11-16 14:43:09.9130000', N'2024-11-16 21:43:09.9200000', N'2024-11-16 21:43:09.9200000')
GO

INSERT INTO [dbo].[playlists] ([playlist_id], [playlist_name], [playlist_visibility_mode], [owner_id], [create_time], [created_at], [updated_at]) VALUES (N'9', N'new hehe', N'private', N'1', N'2024-11-25 11:30:40.1440000', N'2024-11-25 18:30:40.1500000', N'2024-11-25 18:30:40.1500000')
GO

INSERT INTO [dbo].[playlists] ([playlist_id], [playlist_name], [playlist_visibility_mode], [owner_id], [create_time], [created_at], [updated_at]) VALUES (N'10', N'hehe', N'private', N'1', N'2024-11-25 11:56:11.6750000', N'2024-11-25 18:56:11.6900000', N'2024-11-25 18:56:11.6900000')
GO

INSERT INTO [dbo].[playlists] ([playlist_id], [playlist_name], [playlist_visibility_mode], [owner_id], [create_time], [created_at], [updated_at]) VALUES (N'13', N'My favs', N'public', N'1', N'2024-12-01 09:51:34.2020000', N'2024-12-01 16:51:34.2200000', N'2024-12-01 16:51:34.2200000')
GO

INSERT INTO [dbo].[playlists] ([playlist_id], [playlist_name], [playlist_visibility_mode], [owner_id], [create_time], [created_at], [updated_at]) VALUES (N'14', N'my public #1', N'public', N'1', N'2024-12-03 09:02:50.5210000', N'2024-12-03 16:02:50.5266667', N'2024-12-03 16:02:50.5266667')
GO

INSERT INTO [dbo].[playlists] ([playlist_id], [playlist_name], [playlist_visibility_mode], [owner_id], [create_time], [created_at], [updated_at]) VALUES (N'15', N'My public #2', N'public', N'1', N'2024-12-03 09:57:27.2220000', N'2024-12-03 16:57:27.2200000', N'2024-12-03 16:57:27.2200000')
GO

INSERT INTO [dbo].[playlists] ([playlist_id], [playlist_name], [playlist_visibility_mode], [owner_id], [create_time], [created_at], [updated_at]) VALUES (N'16', N'My public #3', N'public', N'1', N'2024-12-03 09:58:48.2170000', N'2024-12-03 16:58:48.2166667', N'2024-12-03 16:58:48.2166667')
GO

SET IDENTITY_INSERT [dbo].[playlists] OFF
GO


-- ----------------------------
-- Table structure for test
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[test]') AND type IN ('U'))
	DROP TABLE [dbo].[test]
GO

CREATE TABLE [dbo].[test] (
  [id] int  NULL,
  [usrname] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[test] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO [dbo].[test] ([id], [usrname]) VALUES (N'1', N'Loc')
GO

INSERT INTO [dbo].[test] ([id], [usrname]) VALUES (N'2', N'Sang')
GO

INSERT INTO [dbo].[test] ([id], [usrname]) VALUES (N'3', N'Dat')
GO

INSERT INTO [dbo].[test] ([id], [usrname]) VALUES (N'4', N'Light')
GO

INSERT INTO [dbo].[test] ([id], [usrname]) VALUES (N'5', N'L')
GO


-- ----------------------------
-- Table structure for track_genre
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[track_genre]') AND type IN ('U'))
	DROP TABLE [dbo].[track_genre]
GO

CREATE TABLE [dbo].[track_genre] (
  [track_id] int  NOT NULL,
  [genre_id] int  NOT NULL,
  [created_at] datetime2(7) DEFAULT getdate() NOT NULL,
  [updated_at] datetime2(7) DEFAULT getdate() NOT NULL
)
GO

ALTER TABLE [dbo].[track_genre] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of track_genre
-- ----------------------------
INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'1', N'14', N'2024-10-27 17:24:33.7666667', N'2024-10-27 17:24:33.7666667')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'1', N'21', N'2024-10-27 17:24:33.7666667', N'2024-10-27 17:24:33.7666667')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'2', N'14', N'2024-10-27 17:24:33.7666667', N'2024-10-27 17:24:33.7666667')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'2', N'21', N'2024-10-27 17:24:33.7666667', N'2024-10-27 17:24:33.7666667')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'3', N'14', N'2024-10-27 17:24:33.7666667', N'2024-10-27 17:24:33.7666667')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'3', N'21', N'2024-10-27 17:24:33.7666667', N'2024-10-27 17:24:33.7666667')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'4', N'21', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'5', N'16', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'5', N'21', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'6', N'21', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'7', N'21', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'8', N'16', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'8', N'21', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'9', N'21', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'10', N'21', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'10', N'25', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'11', N'16', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'11', N'21', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'12', N'21', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'13', N'21', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'14', N'14', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'14', N'21', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'15', N'13', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'15', N'21', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'16', N'21', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'17', N'14', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'17', N'21', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'18', N'21', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'19', N'14', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'19', N'21', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'20', N'3', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'20', N'21', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO

INSERT INTO [dbo].[track_genre] ([track_id], [genre_id], [created_at], [updated_at]) VALUES (N'21', N'21', N'2024-11-03 19:57:34.6200000', N'2024-11-03 19:57:34.6200000')
GO


-- ----------------------------
-- Table structure for track_playlist
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[track_playlist]') AND type IN ('U'))
	DROP TABLE [dbo].[track_playlist]
GO

CREATE TABLE [dbo].[track_playlist] (
  [track_id] int  NOT NULL,
  [playlist_id] int  NOT NULL,
  [created_at] datetime2(7) DEFAULT getdate() NOT NULL,
  [updated_at] datetime2(7) DEFAULT getdate() NOT NULL
)
GO

ALTER TABLE [dbo].[track_playlist] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of track_playlist
-- ----------------------------
INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'1', N'6', N'2024-11-16 20:58:37.8300000', N'2024-11-16 20:58:37.8300000')
GO

INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'1', N'7', N'2024-11-16 20:59:46.1133333', N'2024-11-16 20:59:46.1133333')
GO

INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'1', N'13', N'2024-12-01 16:51:34.2300000', N'2024-12-01 16:51:34.2300000')
GO

INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'1', N'14', N'2024-12-03 16:02:50.5366667', N'2024-12-03 16:02:50.5366667')
GO

INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'2', N'6', N'2024-11-16 20:58:37.8300000', N'2024-11-16 20:58:37.8300000')
GO

INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'2', N'7', N'2024-11-16 20:59:46.1133333', N'2024-11-16 20:59:46.1133333')
GO

INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'2', N'10', N'2024-12-02 19:33:56.0200000', N'2024-12-02 19:33:56.0200000')
GO

INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'2', N'13', N'2024-12-01 16:51:34.2300000', N'2024-12-01 16:51:34.2300000')
GO

INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'2', N'14', N'2024-12-03 16:02:50.5366667', N'2024-12-03 16:02:50.5366667')
GO

INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'3', N'7', N'2024-11-16 20:59:46.1133333', N'2024-11-16 20:59:46.1133333')
GO

INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'3', N'10', N'2024-12-02 19:34:22.4866667', N'2024-12-02 19:34:22.4866667')
GO

INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'3', N'13', N'2024-12-01 16:51:34.2300000', N'2024-12-01 16:51:34.2300000')
GO

INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'4', N'13', N'2024-12-01 16:51:34.2300000', N'2024-12-01 16:51:34.2300000')
GO

INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'5', N'9', N'2024-12-02 19:34:39.1100000', N'2024-12-02 19:34:39.1100000')
GO

INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'5', N'13', N'2024-12-01 16:51:34.2300000', N'2024-12-01 16:51:34.2300000')
GO

INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'5', N'14', N'2024-12-03 16:02:50.5366667', N'2024-12-03 16:02:50.5366667')
GO

INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'6', N'13', N'2024-12-01 16:51:34.2300000', N'2024-12-01 16:51:34.2300000')
GO

INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'13', N'6', N'2024-11-16 20:58:37.8300000', N'2024-11-16 20:58:37.8300000')
GO

INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'41', N'9', N'2024-12-02 02:27:04.3700000', N'2024-12-02 02:27:04.3700000')
GO

INSERT INTO [dbo].[track_playlist] ([track_id], [playlist_id], [created_at], [updated_at]) VALUES (N'41', N'10', N'2024-12-02 02:27:04.3700000', N'2024-12-02 02:27:04.3700000')
GO


-- ----------------------------
-- Table structure for tracks
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[tracks]') AND type IN ('U'))
	DROP TABLE [dbo].[tracks]
GO

CREATE TABLE [dbo].[tracks] (
  [track_id] int  IDENTITY(1,1) NOT NULL,
  [track_title] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [track_duration] float(53)  NOT NULL,
  [track_mp3_path] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [lyrics] nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [visibility] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [uploader_id] int  NOT NULL,
  [upload_time] datetime2(7) DEFAULT getdate() NOT NULL,
  [album_id] int  NULL,
  [created_at] datetime2(7) DEFAULT getdate() NOT NULL,
  [updated_at] datetime2(7) DEFAULT getdate() NOT NULL
)
GO

ALTER TABLE [dbo].[tracks] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of tracks
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tracks] ON
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'1', N'POP/STARS', N'202', N'popstars.mp3', NULL, N'public', N'1', N'2024-10-27 16:30:48.1366667', N'1', N'2024-10-27 16:30:48.1366667', N'2024-10-27 16:30:48.1366667')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'2', N'THE BADDEST', N'175', N'the_baddest.mp3', NULL, N'public', N'1', N'2024-10-27 16:30:48.1433333', N'1', N'2024-10-27 16:30:48.1433333', N'2024-10-27 16:30:48.1433333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'3', N'MORE', N'231', N'more.mp3', NULL, N'public', N'1', N'2024-10-27 16:30:48.1466667', N'1', N'2024-10-27 16:30:48.1466667', N'2024-10-27 16:30:48.1466667')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'4', N'I Forgot That You Existed', N'171', N'I_Forgot_That_You_Existed.mp3', NULL, N'public', N'1', N'2024-11-03 13:28:59.8633333', N'2', N'2024-11-03 13:28:59.8633333', N'2024-11-03 13:28:59.8633333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'5', N'Cruel Summer', N'178', N'Cruel_Summer.mp3', N'(Yeah, yeah, yeah, yeah)

Fever dream high in the quiet of the night
You know that I caught it (oh yeah, you''re right, I want it)
Bad, bad boy, shiny toy with a price
You know that I bought it (oh yeah, you''re right, I want it)

Killing me slow, out the window
I''m always waiting for you to be waiting below
Devils roll the dice, angels roll their eyes
What doesn''t kill me makes me want you more

And it''s new, the shape of your body
It''s blue, the feeling I''ve got
And it''s ooh, whoa-oh
It''s a cruel summer

"It''s cool," that''s what I tell ''em
No rules in breakable heaven
But ooh, whoa-oh
It''s a cruel summer with you

Hang your head low in the glow of the vending machine
I''m not dying (oh yeah, you''re right, I want it)
You say that we''ll just screw it up in these trying times
We''re not trying (oh yeah, you''re right, I want it)

So cut the headlights, summer''s a knife
I''m always waiting for you just to cut to the bone
Devils roll the dice, angels roll their eyes
And if I bleed, you''ll be the last to know, oh

It''s new, the shape of your body
It''s blue, the feeling I''ve got
And it''s ooh, whoa-oh
It''s a cruel summer

"It''s cool," that''s what I tell ''em
No rules in breakable heaven
But ooh, whoa-oh
It''s a cruel summer with you

I''m drunk in the back of the car
And I cried like a baby coming home from the bar (oh)
Said, "I''m fine," but it wasn''t true
I don''t wanna keep secrets just to keep you

And I snuck in through the garden gate
Every night that summer, just to seal my fate (oh)
And I screamed, "For whatever it''s worth
I love you, ain''t that the worst thing you ever heard?"
He looks up, grinnin'' like a devil

It''s new, the shape of your body
It''s blue, the feeling I''ve got
And it''s ooh, whoa-oh
It''s a cruel summer

"It''s cool," that''s what I tell ''em
No rules in breakable heaven
But ooh, whoa-oh
It''s a cruel summer with you

I''m drunk in the back of the car
And I cried like a baby coming home from the bar (oh)
Said, "I''m fine," but it wasn''t true
I don''t wanna keep secrets just to keep you

And I snuck in through the garden gate
Every night that summer, just to seal my fate (oh)
And I screamed, "For whatever it''s worth
I love you, ain''t that the worst thing you ever heard?"
(Yeah, yeah, yeah, yeah)
', N'public', N'1', N'2024-11-03 13:28:59.8633333', N'2', N'2024-11-03 13:28:59.8633333', N'2024-11-03 13:28:59.8633333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'6', N'Lover', N'221', N'Lover.mp3', NULL, N'public', N'1', N'2024-11-03 13:28:59.8633333', N'2', N'2024-11-03 13:28:59.8633333', N'2024-11-03 13:28:59.8633333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'7', N'The Man', N'190', N'The_Man.mp3', NULL, N'public', N'1', N'2024-11-03 13:28:59.8633333', N'2', N'2024-11-03 13:28:59.8633333', N'2024-11-03 13:28:59.8633333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'8', N'The Archer', N'211', N'The_Archer.mp3', NULL, N'public', N'1', N'2024-11-03 13:28:59.8633333', N'2', N'2024-11-03 13:28:59.8633333', N'2024-11-03 13:28:59.8633333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'9', N'I Think He Knows', N'173', N'I_Think_He_Knows.mp3', NULL, N'public', N'1', N'2024-11-03 13:28:59.8633333', N'2', N'2024-11-03 13:28:59.8633333', N'2024-11-03 13:28:59.8633333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'10', N'Miss Americana & the Heartbreak Prince', N'234', N'Miss_Americana_&_the_Heartbreak_Prince.mp3', NULL, N'public', N'1', N'2024-11-03 13:28:59.8633333', N'2', N'2024-11-03 13:28:59.8633333', N'2024-11-03 13:28:59.8633333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'11', N'Paper Rings', N'222', N'Paper_Rings.mp3', NULL, N'public', N'1', N'2024-11-03 13:28:59.8633333', N'2', N'2024-11-03 13:28:59.8633333', N'2024-11-03 13:28:59.8633333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'12', N'Cornelia Street', N'287', N'Cornelia_Street.mp3', NULL, N'public', N'1', N'2024-11-03 13:28:59.8633333', N'2', N'2024-11-03 13:28:59.8633333', N'2024-11-03 13:28:59.8633333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'13', N'Death by a Thousand Cuts', N'199', N'Death_by_a_Thousand_Cuts.mp3', NULL, N'public', N'1', N'2024-11-03 13:28:59.8633333', N'2', N'2024-11-03 13:28:59.8633333', N'2024-11-03 13:28:59.8633333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'14', N'London Boy', N'190', N'London_Boy.mp3', NULL, N'public', N'1', N'2024-11-03 13:28:59.8633333', N'2', N'2024-11-03 13:28:59.8633333', N'2024-11-03 13:28:59.8633333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'15', N'Soon You''ll Get Better', N'202', N'Soon_Youll_Get_Better.mp3', NULL, N'public', N'1', N'2024-11-03 13:28:59.8633333', N'2', N'2024-11-03 13:28:59.8633333', N'2024-11-03 13:28:59.8633333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'16', N'False God', N'200', N'False_God.mp3', NULL, N'public', N'1', N'2024-11-03 13:28:59.8633333', N'2', N'2024-11-03 13:28:59.8633333', N'2024-11-03 13:28:59.8633333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'17', N'You Need to Calm Down', N'171', N'You_Need_to_Calm_Down.mp3', NULL, N'public', N'1', N'2024-11-03 13:28:59.8633333', N'2', N'2024-11-03 13:28:59.8633333', N'2024-11-03 13:28:59.8633333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'18', N'Afterglow', N'223', N'Afterglow.mp3', NULL, N'public', N'1', N'2024-11-03 13:28:59.8633333', N'2', N'2024-11-03 13:28:59.8633333', N'2024-11-03 13:28:59.8633333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'19', N'Me!', N'193', N'Me.mp3', NULL, N'public', N'1', N'2024-11-03 13:28:59.8633333', N'2', N'2024-11-03 13:28:59.8633333', N'2024-11-03 13:28:59.8633333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'20', N'It''s Nice to Have a Friend', N'150', N'Its_Nice_to_Have_a_Friend.mp3', NULL, N'public', N'1', N'2024-11-03 13:28:59.8633333', N'2', N'2024-11-03 13:28:59.8633333', N'2024-11-03 13:28:59.8633333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'21', N'Daylight', N'293', N'Daylight.mp3', NULL, N'public', N'1', N'2024-11-03 13:28:59.8633333', N'2', N'2024-11-03 13:28:59.8633333', N'2024-11-03 13:28:59.8633333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'22', N'Hello this is test track name', N'175', N'sample_baddest.mp3', NULL, N'public', N'1', N'2024-11-11 01:14:36.0666667', N'2', N'2024-11-11 01:14:36.0666667', N'2024-11-11 01:14:36.0666667')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'27', N'hehe', N'175', N'1732710655761-78549926.mp3', N'hello lyrics', N'private', N'1', N'2024-11-27 19:30:55.8600000', NULL, N'2024-11-27 19:30:55.8600000', N'2024-11-27 19:30:55.8600000')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'29', N'Blue', N'153', N'05 Blue.mp3', NULL, N'public', N'1', N'2024-11-28 19:16:48.0000000', N'3', N'2024-11-28 19:16:54.0000000', N'2024-11-28 19:16:56.0000000')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'30', N'Spring', N'178', N'10 Spring.mp3', NULL, N'public', N'1', N'2024-11-28 19:17:54.0000000', N'3', N'2024-11-28 19:18:01.0000000', N'2024-11-28 19:18:03.0000000')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'33', N'Midnight', N'179', N'09 Midnight.mp3', NULL, N'public', N'1', N'2024-11-28 19:19:29.0000000', N'3', N'2024-11-28 19:19:33.7133333', N'2024-11-28 19:19:33.7133333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'34', N'When Will I Be Alright', N'175', N'12 When Will I Be Alright.mp3', NULL, N'public', N'1', N'2024-11-28 19:20:28.0000000', N'3', N'2024-11-28 19:20:35.8066667', N'2024-11-28 19:20:35.8066667')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'36', N'Plastic Bag', N'229', N'04 Plastic Bag.mp3', NULL, N'public', N'1', N'2024-11-28 19:21:01.0000000', N'3', N'2024-11-28 19:21:18.8133333', N'2024-11-28 19:21:18.8133333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'37', N'American Town', N'198', N'06 American Town.mp3', NULL, N'public', N'1', N'2024-11-28 19:21:48.6733333', N'3', N'2024-11-28 19:21:48.6733333', N'2024-11-28 19:21:48.6733333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'38', N'Magical', N'194', N'01 Magical.mp3', NULL, N'public', N'1', N'2024-11-28 19:22:22.6633333', N'3', N'2024-11-28 19:22:22.6633333', N'2024-11-28 19:22:22.6633333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'41', N'Alone Again', N'250', N'01 Alone Again.m4a', NULL, N'public', N'1', N'2024-11-28 20:00:17.8200000', N'4', N'1900-01-01 00:00:00.0000000', N'2024-11-28 20:00:17.8200000')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'43', N'Hardest To Love', N'211', N'03 Hardest To Love.m4a', NULL, N'public', N'1', N'2024-11-28 20:42:24.2400000', N'4', N'2024-11-28 20:42:24.2400000', N'2024-11-28 20:42:24.2400000')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'45', N'Escape From LA', N'356', N'06 Escape From LA.m4a', NULL, N'public', N'1', N'2024-11-28 20:43:02.2600000', N'4', N'2024-11-28 20:43:02.2600000', N'2024-11-28 20:43:02.2600000')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'46', N'Heartless', N'218', N'07 Heartless.m4a', NULL, N'public', N'1', N'2024-11-28 20:43:28.4866667', N'4', N'2024-11-28 20:43:28.4866667', N'2024-11-28 20:43:28.4866667')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'47', N'Faith', N'283', N'08 Faith.m4a', NULL, N'public', N'1', N'2024-11-28 20:43:49.0366667', N'4', N'2024-11-28 20:43:49.0366667', N'2024-11-28 20:43:49.0366667')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'48', N'Blinding Lights', N'200', N'09 Blinding Lights.m4a', NULL, N'public', N'1', N'2024-11-28 20:44:14.9333333', N'4', N'2024-11-28 20:44:14.9333333', N'2024-11-28 20:44:14.9333333')
GO

INSERT INTO [dbo].[tracks] ([track_id], [track_title], [track_duration], [track_mp3_path], [lyrics], [visibility], [uploader_id], [upload_time], [album_id], [created_at], [updated_at]) VALUES (N'50', N'After Hours', N'361', N'13 After Hours.m4a', NULL, N'public', N'1', N'2024-11-28 20:44:47.0100000', N'4', N'2024-11-28 20:44:47.0100000', N'2024-11-28 20:44:47.0100000')
GO

SET IDENTITY_INSERT [dbo].[tracks] OFF
GO


-- ----------------------------
-- Table structure for user_follow_user
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[user_follow_user]') AND type IN ('U'))
	DROP TABLE [dbo].[user_follow_user]
GO

CREATE TABLE [dbo].[user_follow_user] (
  [user_id] int  NOT NULL,
  [follow_id] int  NOT NULL,
  [time] datetime2(7) DEFAULT getdate() NOT NULL,
  [created_at] datetime2(7) DEFAULT getdate() NOT NULL,
  [updated_at] datetime2(7) DEFAULT getdate() NOT NULL
)
GO

ALTER TABLE [dbo].[user_follow_user] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of user_follow_user
-- ----------------------------
INSERT INTO [dbo].[user_follow_user] ([user_id], [follow_id], [time], [created_at], [updated_at]) VALUES (N'2', N'1', N'2024-12-04 22:31:59.9366667', N'2024-12-04 22:31:59.9366667', N'2024-12-04 22:31:59.9366667')
GO


-- ----------------------------
-- Table structure for user_like_album
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[user_like_album]') AND type IN ('U'))
	DROP TABLE [dbo].[user_like_album]
GO

CREATE TABLE [dbo].[user_like_album] (
  [user_id] int  NOT NULL,
  [album_id] int  NOT NULL,
  [time] datetime2(7) DEFAULT getdate() NOT NULL,
  [created_at] datetime2(7) DEFAULT getdate() NOT NULL,
  [updated_at] datetime2(7) DEFAULT getdate() NOT NULL
)
GO

ALTER TABLE [dbo].[user_like_album] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of user_like_album
-- ----------------------------

-- ----------------------------
-- Table structure for user_like_artist
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[user_like_artist]') AND type IN ('U'))
	DROP TABLE [dbo].[user_like_artist]
GO

CREATE TABLE [dbo].[user_like_artist] (
  [user_id] int  NOT NULL,
  [artist_id] int  NOT NULL,
  [time] datetime2(7) DEFAULT getdate() NOT NULL,
  [created_at] datetime2(7) DEFAULT getdate() NOT NULL,
  [updated_at] datetime2(7) DEFAULT getdate() NOT NULL
)
GO

ALTER TABLE [dbo].[user_like_artist] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of user_like_artist
-- ----------------------------
INSERT INTO [dbo].[user_like_artist] ([user_id], [artist_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-05 17:22:31.1270000', N'2024-12-06 00:22:31.1300000', N'2024-12-06 00:22:31.1300000')
GO

INSERT INTO [dbo].[user_like_artist] ([user_id], [artist_id], [time], [created_at], [updated_at]) VALUES (N'1', N'2', N'2024-11-27 07:57:02.9700000', N'2024-11-27 14:57:02.9733333', N'2024-11-27 14:57:02.9733333')
GO

INSERT INTO [dbo].[user_like_artist] ([user_id], [artist_id], [time], [created_at], [updated_at]) VALUES (N'1', N'4', N'2024-11-27 07:57:05.0270000', N'2024-11-27 14:57:05.0300000', N'2024-11-27 14:57:05.0300000')
GO

INSERT INTO [dbo].[user_like_artist] ([user_id], [artist_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-12-01 10:09:11.7690000', N'2024-12-01 17:09:11.7733333', N'2024-12-01 17:09:11.7733333')
GO

INSERT INTO [dbo].[user_like_artist] ([user_id], [artist_id], [time], [created_at], [updated_at]) VALUES (N'1', N'6', N'2024-11-27 07:57:08.5550000', N'2024-11-27 14:57:08.5566667', N'2024-11-27 14:57:08.5566667')
GO

INSERT INTO [dbo].[user_like_artist] ([user_id], [artist_id], [time], [created_at], [updated_at]) VALUES (N'1', N'7', N'2024-11-27 07:57:11.5430000', N'2024-11-27 14:57:11.5466667', N'2024-11-27 14:57:11.5466667')
GO

INSERT INTO [dbo].[user_like_artist] ([user_id], [artist_id], [time], [created_at], [updated_at]) VALUES (N'1', N'14', N'2024-12-05 17:22:35.1690000', N'2024-12-06 00:22:35.1700000', N'2024-12-06 00:22:35.1700000')
GO


-- ----------------------------
-- Table structure for user_like_playlist
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[user_like_playlist]') AND type IN ('U'))
	DROP TABLE [dbo].[user_like_playlist]
GO

CREATE TABLE [dbo].[user_like_playlist] (
  [user_id] int  NOT NULL,
  [playlist_id] int  NOT NULL,
  [time] datetime2(7) DEFAULT getdate() NOT NULL,
  [created_at] datetime2(7) DEFAULT getdate() NOT NULL,
  [updated_at] datetime2(7) DEFAULT getdate() NOT NULL
)
GO

ALTER TABLE [dbo].[user_like_playlist] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of user_like_playlist
-- ----------------------------
INSERT INTO [dbo].[user_like_playlist] ([user_id], [playlist_id], [time], [created_at], [updated_at]) VALUES (N'1', N'6', N'2024-12-01 14:00:49.0000000', N'2024-12-01 14:00:51.0000000', N'2024-12-01 14:00:53.0000000')
GO


-- ----------------------------
-- Table structure for user_like_track
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[user_like_track]') AND type IN ('U'))
	DROP TABLE [dbo].[user_like_track]
GO

CREATE TABLE [dbo].[user_like_track] (
  [user_id] int  NOT NULL,
  [track_id] int  NOT NULL,
  [time] datetime2(7) DEFAULT getdate() NOT NULL,
  [created_at] datetime2(7) DEFAULT getdate() NOT NULL,
  [updated_at] datetime2(7) DEFAULT getdate() NOT NULL
)
GO

ALTER TABLE [dbo].[user_like_track] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of user_like_track
-- ----------------------------
INSERT INTO [dbo].[user_like_track] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-04 14:22:06.5970000', N'2024-12-04 21:22:06.6833333', N'2024-12-04 21:22:06.6833333')
GO

INSERT INTO [dbo].[user_like_track] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:33:15.1120000', N'2024-11-30 17:33:15.1133333', N'2024-11-30 17:33:15.1133333')
GO


-- ----------------------------
-- Table structure for user_listen_history
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[user_listen_history]') AND type IN ('U'))
	DROP TABLE [dbo].[user_listen_history]
GO

CREATE TABLE [dbo].[user_listen_history] (
  [user_id] int  NOT NULL,
  [track_id] int  NOT NULL,
  [time] datetime2(7) DEFAULT getdate() NOT NULL,
  [created_at] datetime2(7) DEFAULT getdate() NOT NULL,
  [updated_at] datetime2(7) DEFAULT getdate() NOT NULL
)
GO

ALTER TABLE [dbo].[user_listen_history] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of user_listen_history
-- ----------------------------
INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-11-27 22:45:31.5300000', N'2024-11-27 22:45:31.5300000', N'2024-11-27 22:45:31.5300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-11-27 22:49:40.5866667', N'2024-11-27 22:49:40.5866667', N'2024-11-27 22:49:40.5866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-11-29 12:19:36.3010000', N'2024-11-29 19:19:36.3166667', N'2024-11-29 19:19:36.3166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-11-29 13:02:16.8420000', N'2024-11-29 20:02:16.8433333', N'2024-11-29 20:02:16.8433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-11-29 13:03:27.5710000', N'2024-11-29 20:03:27.5700000', N'2024-11-29 20:03:27.5700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-11-29 13:50:40.7180000', N'2024-11-29 20:50:40.7300000', N'2024-11-29 20:50:40.7300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-11-29 13:50:56.2110000', N'2024-11-29 20:50:56.2133333', N'2024-11-29 20:50:56.2133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-11-29 14:03:34.3350000', N'2024-11-29 21:03:34.3400000', N'2024-11-29 21:03:34.3400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-11-29 15:33:59.7550000', N'2024-11-29 22:33:59.7566667', N'2024-11-29 22:33:59.7566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-11-29 15:45:02.0090000', N'2024-11-29 22:45:02.0266667', N'2024-11-29 22:45:02.0266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-11-29 15:46:39.5890000', N'2024-11-29 22:46:39.6266667', N'2024-11-29 22:46:39.6266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-11-29 15:47:28.0020000', N'2024-11-29 22:47:28.0033333', N'2024-11-29 22:47:28.0033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-11-29 15:47:29.8350000', N'2024-11-29 22:47:29.8366667', N'2024-11-29 22:47:29.8366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-11-30 10:19:39.6980000', N'2024-11-30 17:19:39.7000000', N'2024-11-30 17:19:39.7000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 07:14:06.3850000', N'2024-12-01 14:14:06.3833333', N'2024-12-01 14:14:06.3833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 09:51:41.7270000', N'2024-12-01 16:51:41.7400000', N'2024-12-01 16:51:41.7400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 10:04:18.3650000', N'2024-12-01 17:04:18.3666667', N'2024-12-01 17:04:18.3666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 10:05:29.8420000', N'2024-12-01 17:05:29.8533333', N'2024-12-01 17:05:29.8533333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 10:08:41.2090000', N'2024-12-01 17:08:41.2100000', N'2024-12-01 17:08:41.2100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 16:54:30.5350000', N'2024-12-01 23:54:30.5400000', N'2024-12-01 23:54:30.5400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 16:56:07.8510000', N'2024-12-01 23:56:07.8500000', N'2024-12-01 23:56:07.8500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:00:29.4200000', N'2024-12-02 00:00:29.4200000', N'2024-12-02 00:00:29.4200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:00:48.7270000', N'2024-12-02 00:00:48.7266667', N'2024-12-02 00:00:48.7266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:10:47.2580000', N'2024-12-02 00:10:47.2700000', N'2024-12-02 00:10:47.2700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:11:45.5730000', N'2024-12-02 00:11:45.5800000', N'2024-12-02 00:11:45.5800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:16:31.1210000', N'2024-12-02 00:16:31.1233333', N'2024-12-02 00:16:31.1233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:19:17.3700000', N'2024-12-02 00:19:17.3833333', N'2024-12-02 00:19:17.3833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:19:53.6860000', N'2024-12-02 00:19:53.6900000', N'2024-12-02 00:19:53.6900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:20:59.7540000', N'2024-12-02 00:20:59.7600000', N'2024-12-02 00:20:59.7600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:22:21.4860000', N'2024-12-02 00:22:21.4866667', N'2024-12-02 00:22:21.4866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:23:39.3190000', N'2024-12-02 00:23:39.3200000', N'2024-12-02 00:23:39.3200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:32:30.4330000', N'2024-12-02 00:32:30.4300000', N'2024-12-02 00:32:30.4300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:32:51.3590000', N'2024-12-02 00:32:51.3600000', N'2024-12-02 00:32:51.3600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:33:10.6760000', N'2024-12-02 00:33:10.6766667', N'2024-12-02 00:33:10.6766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:33:18.2810000', N'2024-12-02 00:33:18.2800000', N'2024-12-02 00:33:18.2800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:34:43.5440000', N'2024-12-02 00:34:43.5433333', N'2024-12-02 00:34:43.5433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:37:13.6060000', N'2024-12-02 00:37:13.6100000', N'2024-12-02 00:37:13.6100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:37:18.5360000', N'2024-12-02 00:37:18.5400000', N'2024-12-02 00:37:18.5400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:38:06.0990000', N'2024-12-02 00:38:06.1033333', N'2024-12-02 00:38:06.1033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:38:10.4200000', N'2024-12-02 00:38:10.4233333', N'2024-12-02 00:38:10.4233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:43:36.2720000', N'2024-12-02 00:43:36.2700000', N'2024-12-02 00:43:36.2700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:46:18.1060000', N'2024-12-02 00:46:18.1066667', N'2024-12-02 00:46:18.1066667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:48:27.4900000', N'2024-12-02 00:48:27.4900000', N'2024-12-02 00:48:27.4900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:48:52.4340000', N'2024-12-02 00:48:52.4366667', N'2024-12-02 00:48:52.4366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:50:04.3390000', N'2024-12-02 00:50:04.3400000', N'2024-12-02 00:50:04.3400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 17:50:51.7960000', N'2024-12-02 00:50:51.7966667', N'2024-12-02 00:50:51.7966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 18:28:02.7870000', N'2024-12-02 01:28:02.7900000', N'2024-12-02 01:28:02.7900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 18:35:38.4410000', N'2024-12-02 01:35:38.4500000', N'2024-12-02 01:35:38.4500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 18:36:29.5880000', N'2024-12-02 01:36:29.5900000', N'2024-12-02 01:36:29.5900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 18:37:55.5020000', N'2024-12-02 01:37:55.5166667', N'2024-12-02 01:37:55.5166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 18:38:38.7110000', N'2024-12-02 01:38:38.7166667', N'2024-12-02 01:38:38.7166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 18:38:53.8730000', N'2024-12-02 01:38:53.8800000', N'2024-12-02 01:38:53.8800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 18:40:25.0840000', N'2024-12-02 01:40:25.0800000', N'2024-12-02 01:40:25.0800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 18:41:20.8280000', N'2024-12-02 01:41:20.8300000', N'2024-12-02 01:41:20.8300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 18:41:46.7750000', N'2024-12-02 01:41:46.7766667', N'2024-12-02 01:41:46.7766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 18:43:30.9000000', N'2024-12-02 01:43:30.8966667', N'2024-12-02 01:43:30.8966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 18:44:19.2310000', N'2024-12-02 01:44:19.2300000', N'2024-12-02 01:44:19.2300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 18:49:41.7150000', N'2024-12-02 01:49:41.7166667', N'2024-12-02 01:49:41.7166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 18:50:19.7340000', N'2024-12-02 01:50:19.7333333', N'2024-12-02 01:50:19.7333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 18:55:27.8590000', N'2024-12-02 01:55:27.8600000', N'2024-12-02 01:55:27.8600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 18:55:58.5040000', N'2024-12-02 01:55:58.5033333', N'2024-12-02 01:55:58.5033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 18:56:51.1000000', N'2024-12-02 01:56:51.1033333', N'2024-12-02 01:56:51.1033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 19:01:47.4370000', N'2024-12-02 02:01:47.4400000', N'2024-12-02 02:01:47.4400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 19:12:17.8300000', N'2024-12-02 02:12:17.8333333', N'2024-12-02 02:12:17.8333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 19:12:26.5930000', N'2024-12-02 02:12:26.5933333', N'2024-12-02 02:12:26.5933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 19:12:31.3570000', N'2024-12-02 02:12:31.3566667', N'2024-12-02 02:12:31.3566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 19:13:44.7760000', N'2024-12-02 02:13:44.7800000', N'2024-12-02 02:13:44.7800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 19:14:31.9830000', N'2024-12-02 02:14:31.9900000', N'2024-12-02 02:14:31.9900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-01 19:20:38.9160000', N'2024-12-02 02:20:38.9166667', N'2024-12-02 02:20:38.9166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-02 12:40:46.6590000', N'2024-12-02 19:40:46.6600000', N'2024-12-02 19:40:46.6600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-03 04:51:33.3910000', N'2024-12-03 11:51:33.3966667', N'2024-12-03 11:51:33.3966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-04 14:12:31.5710000', N'2024-12-04 21:12:31.6466667', N'2024-12-04 21:12:31.6466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-04 14:14:03.5670000', N'2024-12-04 21:14:03.5933333', N'2024-12-04 21:14:03.5933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-04 14:15:58.3240000', N'2024-12-04 21:15:58.3733333', N'2024-12-04 21:15:58.3733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-04 14:17:04.1660000', N'2024-12-04 21:17:04.2000000', N'2024-12-04 21:17:04.2000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-04 14:18:45.8010000', N'2024-12-04 21:18:45.8533333', N'2024-12-04 21:18:45.8533333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-04 14:19:47.2220000', N'2024-12-04 21:19:47.2833333', N'2024-12-04 21:19:47.2833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-04 14:20:16.8060000', N'2024-12-04 21:20:16.8300000', N'2024-12-04 21:20:16.8300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-04 14:20:27.8940000', N'2024-12-04 21:20:27.9333333', N'2024-12-04 21:20:27.9333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-04 14:20:36.2240000', N'2024-12-04 21:20:36.2500000', N'2024-12-04 21:20:36.2500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-04 14:22:00.7180000', N'2024-12-04 21:22:00.7800000', N'2024-12-04 21:22:00.7800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-05 17:36:27.9930000', N'2024-12-06 00:36:27.9933333', N'2024-12-06 00:36:27.9933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'1', N'2024-12-05 17:36:34.5200000', N'2024-12-06 00:36:34.5200000', N'2024-12-06 00:36:34.5200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'2', N'2024-11-25 09:37:08.9470000', N'2024-11-25 16:37:08.9533333', N'2024-11-25 16:37:08.9533333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'2', N'2024-11-25 11:07:35.3490000', N'2024-11-25 18:07:35.3500000', N'2024-11-25 18:07:35.3500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'2', N'2024-11-27 22:45:20.9033333', N'2024-11-27 22:45:20.9033333', N'2024-11-27 22:45:20.9033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'2', N'2024-11-28 03:38:57.1700000', N'2024-11-28 10:38:57.1700000', N'2024-11-28 10:38:57.1700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'2', N'2024-11-28 03:39:01.6930000', N'2024-11-28 10:39:01.6933333', N'2024-11-28 10:39:01.6933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'2', N'2024-11-29 14:33:55.8370000', N'2024-11-29 21:33:55.8366667', N'2024-11-29 21:33:55.8366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'2', N'2024-11-29 15:47:27.0460000', N'2024-11-29 22:47:27.0466667', N'2024-11-29 22:47:27.0466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'2', N'2024-11-30 10:19:38.8050000', N'2024-11-30 17:19:38.8200000', N'2024-11-30 17:19:38.8200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'2', N'2024-11-30 10:27:36.3540000', N'2024-11-30 17:27:36.3533333', N'2024-11-30 17:27:36.3533333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'2', N'2024-11-30 10:53:07.0580000', N'2024-11-30 17:53:07.0600000', N'2024-11-30 17:53:07.0600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'2', N'2024-11-30 10:53:43.7260000', N'2024-11-30 17:53:43.7266667', N'2024-11-30 17:53:43.7266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'2', N'2024-11-30 11:36:23.2140000', N'2024-11-30 18:36:23.2133333', N'2024-11-30 18:36:23.2133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'2', N'2024-12-01 09:51:43.2550000', N'2024-12-01 16:51:43.2700000', N'2024-12-01 16:51:43.2700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'2', N'2024-12-01 17:19:15.9450000', N'2024-12-02 00:19:15.9566667', N'2024-12-02 00:19:15.9566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'2', N'2024-12-02 12:42:30.1430000', N'2024-12-02 19:42:30.1400000', N'2024-12-02 19:42:30.1400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'2', N'2024-12-03 04:55:14.3100000', N'2024-12-03 11:55:14.3100000', N'2024-12-03 11:55:14.3100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'3', N'2024-11-29 15:47:28.9840000', N'2024-11-29 22:47:28.9866667', N'2024-11-29 22:47:28.9866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'3', N'2024-11-30 10:27:58.7240000', N'2024-11-30 17:27:58.7233333', N'2024-11-30 17:27:58.7233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'3', N'2024-11-30 10:54:39.8430000', N'2024-11-30 17:54:39.8433333', N'2024-11-30 17:54:39.8433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'3', N'2024-12-01 09:51:44.1480000', N'2024-12-01 16:51:44.1633333', N'2024-12-01 16:51:44.1633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'3', N'2024-12-02 12:40:58.2800000', N'2024-12-02 19:40:58.2800000', N'2024-12-02 19:40:58.2800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'3', N'2024-12-02 12:41:33.3090000', N'2024-12-02 19:41:33.3100000', N'2024-12-02 19:41:33.3100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'3', N'2024-12-03 09:48:36.5370000', N'2024-12-03 16:48:36.5366667', N'2024-12-03 16:48:36.5366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'4', N'2024-11-27 08:31:54.1460000', N'2024-11-27 15:31:54.1500000', N'2024-11-27 15:31:54.1500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'4', N'2024-11-29 13:53:00.7580000', N'2024-11-29 20:53:00.7566667', N'2024-11-29 20:53:00.7566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'4', N'2024-11-29 14:33:50.3240000', N'2024-11-29 21:33:50.3233333', N'2024-11-29 21:33:50.3233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'4', N'2024-11-29 14:34:06.2150000', N'2024-11-29 21:34:06.2166667', N'2024-11-29 21:34:06.2166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'4', N'2024-11-30 10:19:37.1550000', N'2024-11-30 17:19:37.1600000', N'2024-11-30 17:19:37.1600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'4', N'2024-11-30 10:26:37.2900000', N'2024-11-30 17:26:37.2933333', N'2024-11-30 17:26:37.2933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'4', N'2024-11-30 10:35:29.5720000', N'2024-11-30 17:35:29.5566667', N'2024-11-30 17:35:29.5566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'4', N'2024-11-30 10:35:51.4020000', N'2024-11-30 17:35:51.4000000', N'2024-11-30 17:35:51.4000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'4', N'2024-11-30 10:41:41.7150000', N'2024-11-30 17:41:41.7133333', N'2024-11-30 17:41:41.7133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'4', N'2024-11-30 10:47:18.0630000', N'2024-11-30 17:47:18.0700000', N'2024-11-30 17:47:18.0700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'4', N'2024-12-01 09:51:44.8780000', N'2024-12-01 16:51:44.8933333', N'2024-12-01 16:51:44.8933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'4', N'2024-12-01 16:45:54.8840000', N'2024-12-01 23:45:54.8866667', N'2024-12-01 23:45:54.8866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'4', N'2024-12-02 10:49:58.6800000', N'2024-12-02 17:49:58.6833333', N'2024-12-02 17:49:58.6833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-27 08:13:50.8590000', N'2024-11-27 15:13:50.8600000', N'2024-11-27 15:13:50.8600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-27 08:32:37.3230000', N'2024-11-27 15:32:37.3233333', N'2024-11-27 15:32:37.3233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-27 08:33:58.7750000', N'2024-11-27 15:33:58.7733333', N'2024-11-27 15:33:58.7733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-28 03:39:08.0980000', N'2024-11-28 10:39:08.0966667', N'2024-11-28 10:39:08.0966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-28 03:55:53.4710000', N'2024-11-28 10:55:53.4700000', N'2024-11-28 10:55:53.4700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:04:10.3750000', N'2024-11-29 20:04:10.3766667', N'2024-11-29 20:04:10.3766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:08:43.6030000', N'2024-11-29 20:08:43.6100000', N'2024-11-29 20:08:43.6100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:11:57.5070000', N'2024-11-29 20:11:57.5100000', N'2024-11-29 20:11:57.5100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:13:06.9690000', N'2024-11-29 20:13:06.9766667', N'2024-11-29 20:13:06.9766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:05.2940000', N'2024-11-29 20:15:05.2933333', N'2024-11-29 20:15:05.2933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:05.4450000', N'2024-11-29 20:15:05.4466667', N'2024-11-29 20:15:05.4466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:05.5640000', N'2024-11-29 20:15:05.5633333', N'2024-11-29 20:15:05.5633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:05.6970000', N'2024-11-29 20:15:05.6966667', N'2024-11-29 20:15:05.6966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:05.8560000', N'2024-11-29 20:15:05.8566667', N'2024-11-29 20:15:05.8566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:05.9770000', N'2024-11-29 20:15:05.9766667', N'2024-11-29 20:15:05.9766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:06.1640000', N'2024-11-29 20:15:06.1633333', N'2024-11-29 20:15:06.1633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:06.2830000', N'2024-11-29 20:15:06.2833333', N'2024-11-29 20:15:06.2833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:06.4220000', N'2024-11-29 20:15:06.4233333', N'2024-11-29 20:15:06.4233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:06.5900000', N'2024-11-29 20:15:06.5900000', N'2024-11-29 20:15:06.5900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:06.7280000', N'2024-11-29 20:15:06.7266667', N'2024-11-29 20:15:06.7266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:06.8750000', N'2024-11-29 20:15:06.8766667', N'2024-11-29 20:15:06.8766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:07.0420000', N'2024-11-29 20:15:07.0433333', N'2024-11-29 20:15:07.0433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:07.1660000', N'2024-11-29 20:15:07.1666667', N'2024-11-29 20:15:07.1666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:07.2970000', N'2024-11-29 20:15:07.2966667', N'2024-11-29 20:15:07.2966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:07.4220000', N'2024-11-29 20:15:07.4200000', N'2024-11-29 20:15:07.4200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:07.5570000', N'2024-11-29 20:15:07.5566667', N'2024-11-29 20:15:07.5566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:07.6930000', N'2024-11-29 20:15:07.6933333', N'2024-11-29 20:15:07.6933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:07.8140000', N'2024-11-29 20:15:07.8133333', N'2024-11-29 20:15:07.8133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:07.9190000', N'2024-11-29 20:15:07.9200000', N'2024-11-29 20:15:07.9200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:08.0220000', N'2024-11-29 20:15:08.0200000', N'2024-11-29 20:15:08.0200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:08.1470000', N'2024-11-29 20:15:08.1466667', N'2024-11-29 20:15:08.1466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:08.2620000', N'2024-11-29 20:15:08.2633333', N'2024-11-29 20:15:08.2633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:08.3730000', N'2024-11-29 20:15:08.3733333', N'2024-11-29 20:15:08.3733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:08.5070000', N'2024-11-29 20:15:08.5100000', N'2024-11-29 20:15:08.5100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:08.6320000', N'2024-11-29 20:15:08.6333333', N'2024-11-29 20:15:08.6333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:08.7330000', N'2024-11-29 20:15:08.7333333', N'2024-11-29 20:15:08.7333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:08.8650000', N'2024-11-29 20:15:08.8666667', N'2024-11-29 20:15:08.8666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:08.9860000', N'2024-11-29 20:15:08.9866667', N'2024-11-29 20:15:08.9866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:09.1230000', N'2024-11-29 20:15:09.1233333', N'2024-11-29 20:15:09.1233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:09.2260000', N'2024-11-29 20:15:09.2266667', N'2024-11-29 20:15:09.2266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:09.3490000', N'2024-11-29 20:15:09.3500000', N'2024-11-29 20:15:09.3500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:09.4680000', N'2024-11-29 20:15:09.4700000', N'2024-11-29 20:15:09.4700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:09.5910000', N'2024-11-29 20:15:09.5966667', N'2024-11-29 20:15:09.5966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:09.6860000', N'2024-11-29 20:15:09.6866667', N'2024-11-29 20:15:09.6866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:09.7960000', N'2024-11-29 20:15:09.7966667', N'2024-11-29 20:15:09.7966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:09.8980000', N'2024-11-29 20:15:09.9000000', N'2024-11-29 20:15:09.9000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:10.0060000', N'2024-11-29 20:15:10.0066667', N'2024-11-29 20:15:10.0066667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:10.0910000', N'2024-11-29 20:15:10.0900000', N'2024-11-29 20:15:10.0900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:10.1840000', N'2024-11-29 20:15:10.1833333', N'2024-11-29 20:15:10.1833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:10.2860000', N'2024-11-29 20:15:10.2866667', N'2024-11-29 20:15:10.2866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:10.3770000', N'2024-11-29 20:15:10.3766667', N'2024-11-29 20:15:10.3766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:10.4620000', N'2024-11-29 20:15:10.4600000', N'2024-11-29 20:15:10.4600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:10.5510000', N'2024-11-29 20:15:10.5500000', N'2024-11-29 20:15:10.5500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:10.6390000', N'2024-11-29 20:15:10.6400000', N'2024-11-29 20:15:10.6400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:10.7300000', N'2024-11-29 20:15:10.7300000', N'2024-11-29 20:15:10.7300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:10.8410000', N'2024-11-29 20:15:10.8400000', N'2024-11-29 20:15:10.8400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:10.9440000', N'2024-11-29 20:15:10.9433333', N'2024-11-29 20:15:10.9433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:11.0370000', N'2024-11-29 20:15:11.0366667', N'2024-11-29 20:15:11.0366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:11.1380000', N'2024-11-29 20:15:11.1366667', N'2024-11-29 20:15:11.1366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:11.2310000', N'2024-11-29 20:15:11.2300000', N'2024-11-29 20:15:11.2300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:11.3530000', N'2024-11-29 20:15:11.3533333', N'2024-11-29 20:15:11.3533333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:11.4340000', N'2024-11-29 20:15:11.4366667', N'2024-11-29 20:15:11.4366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:11.5810000', N'2024-11-29 20:15:11.5800000', N'2024-11-29 20:15:11.5800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:11.6980000', N'2024-11-29 20:15:11.7000000', N'2024-11-29 20:15:11.7000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:11.8010000', N'2024-11-29 20:15:11.8066667', N'2024-11-29 20:15:11.8066667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:11.8990000', N'2024-11-29 20:15:11.9000000', N'2024-11-29 20:15:11.9000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:12.0140000', N'2024-11-29 20:15:12.0133333', N'2024-11-29 20:15:12.0133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:12.0950000', N'2024-11-29 20:15:12.0966667', N'2024-11-29 20:15:12.0966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:12.2060000', N'2024-11-29 20:15:12.2066667', N'2024-11-29 20:15:12.2066667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:12.3010000', N'2024-11-29 20:15:12.3000000', N'2024-11-29 20:15:12.3000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:12.3930000', N'2024-11-29 20:15:12.3933333', N'2024-11-29 20:15:12.3933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:12.4880000', N'2024-11-29 20:15:12.4866667', N'2024-11-29 20:15:12.4866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:12.6020000', N'2024-11-29 20:15:12.6000000', N'2024-11-29 20:15:12.6000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:12.6930000', N'2024-11-29 20:15:12.6933333', N'2024-11-29 20:15:12.6933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:12.8040000', N'2024-11-29 20:15:12.8033333', N'2024-11-29 20:15:12.8033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:12.9020000', N'2024-11-29 20:15:12.9000000', N'2024-11-29 20:15:12.9000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:12.9930000', N'2024-11-29 20:15:12.9933333', N'2024-11-29 20:15:12.9933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:13.0880000', N'2024-11-29 20:15:13.0866667', N'2024-11-29 20:15:13.0866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:13.2110000', N'2024-11-29 20:15:13.2100000', N'2024-11-29 20:15:13.2100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:13.3030000', N'2024-11-29 20:15:13.3033333', N'2024-11-29 20:15:13.3033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:13.3900000', N'2024-11-29 20:15:13.3900000', N'2024-11-29 20:15:13.3900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:13.4970000', N'2024-11-29 20:15:13.4966667', N'2024-11-29 20:15:13.4966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:13.5780000', N'2024-11-29 20:15:13.5766667', N'2024-11-29 20:15:13.5766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:13.6680000', N'2024-11-29 20:15:13.6666667', N'2024-11-29 20:15:13.6666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:13.7500000', N'2024-11-29 20:15:13.7500000', N'2024-11-29 20:15:13.7500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:13.8450000', N'2024-11-29 20:15:13.8466667', N'2024-11-29 20:15:13.8466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:13.9470000', N'2024-11-29 20:15:13.9466667', N'2024-11-29 20:15:13.9466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:14.0370000', N'2024-11-29 20:15:14.0366667', N'2024-11-29 20:15:14.0366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:14.1780000', N'2024-11-29 20:15:14.1800000', N'2024-11-29 20:15:14.1800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:14.2860000', N'2024-11-29 20:15:14.2866667', N'2024-11-29 20:15:14.2866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:14.3690000', N'2024-11-29 20:15:14.3700000', N'2024-11-29 20:15:14.3700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:14.4590000', N'2024-11-29 20:15:14.4600000', N'2024-11-29 20:15:14.4600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:14.5520000', N'2024-11-29 20:15:14.5500000', N'2024-11-29 20:15:14.5500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:14.6450000', N'2024-11-29 20:15:14.6433333', N'2024-11-29 20:15:14.6433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:14.7330000', N'2024-11-29 20:15:14.7333333', N'2024-11-29 20:15:14.7333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:14.8230000', N'2024-11-29 20:15:14.8233333', N'2024-11-29 20:15:14.8233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:14.9450000', N'2024-11-29 20:15:14.9433333', N'2024-11-29 20:15:14.9433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:15.0310000', N'2024-11-29 20:15:15.0300000', N'2024-11-29 20:15:15.0300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:15.1160000', N'2024-11-29 20:15:15.1166667', N'2024-11-29 20:15:15.1166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:15.2080000', N'2024-11-29 20:15:15.2100000', N'2024-11-29 20:15:15.2100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:15.3140000', N'2024-11-29 20:15:15.3133333', N'2024-11-29 20:15:15.3133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:15.4140000', N'2024-11-29 20:15:15.4133333', N'2024-11-29 20:15:15.4133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:15.4970000', N'2024-11-29 20:15:15.4966667', N'2024-11-29 20:15:15.4966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:15.5920000', N'2024-11-29 20:15:15.5900000', N'2024-11-29 20:15:15.5900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:15.6740000', N'2024-11-29 20:15:15.6733333', N'2024-11-29 20:15:15.6733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:15.7780000', N'2024-11-29 20:15:15.7766667', N'2024-11-29 20:15:15.7766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:15.8680000', N'2024-11-29 20:15:15.8700000', N'2024-11-29 20:15:15.8700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:15.9550000', N'2024-11-29 20:15:15.9533333', N'2024-11-29 20:15:15.9533333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:16.0340000', N'2024-11-29 20:15:16.0333333', N'2024-11-29 20:15:16.0333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:16.1740000', N'2024-11-29 20:15:16.1733333', N'2024-11-29 20:15:16.1733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:16.3080000', N'2024-11-29 20:15:16.3100000', N'2024-11-29 20:15:16.3100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:16.4000000', N'2024-11-29 20:15:16.4000000', N'2024-11-29 20:15:16.4000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:16.4950000', N'2024-11-29 20:15:16.4933333', N'2024-11-29 20:15:16.4933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:16.6110000', N'2024-11-29 20:15:16.6100000', N'2024-11-29 20:15:16.6100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:16.7640000', N'2024-11-29 20:15:16.7633333', N'2024-11-29 20:15:16.7633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:16.8660000', N'2024-11-29 20:15:16.8666667', N'2024-11-29 20:15:16.8666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:16.9510000', N'2024-11-29 20:15:16.9500000', N'2024-11-29 20:15:16.9500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:17.0690000', N'2024-11-29 20:15:17.0766667', N'2024-11-29 20:15:17.0766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:17.2450000', N'2024-11-29 20:15:17.2433333', N'2024-11-29 20:15:17.2433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:35.1960000', N'2024-11-29 20:15:35.2000000', N'2024-11-29 20:15:35.2000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:35.3260000', N'2024-11-29 20:15:35.3300000', N'2024-11-29 20:15:35.3300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:35.4680000', N'2024-11-29 20:15:35.4700000', N'2024-11-29 20:15:35.4700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:35.5740000', N'2024-11-29 20:15:35.5766667', N'2024-11-29 20:15:35.5766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:35.6940000', N'2024-11-29 20:15:35.6966667', N'2024-11-29 20:15:35.6966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:35.8150000', N'2024-11-29 20:15:35.8166667', N'2024-11-29 20:15:35.8166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:35.9280000', N'2024-11-29 20:15:35.9300000', N'2024-11-29 20:15:35.9300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:36.0300000', N'2024-11-29 20:15:36.0333333', N'2024-11-29 20:15:36.0333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:36.1360000', N'2024-11-29 20:15:36.1400000', N'2024-11-29 20:15:36.1400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:36.2530000', N'2024-11-29 20:15:36.2566667', N'2024-11-29 20:15:36.2566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:36.3590000', N'2024-11-29 20:15:36.3600000', N'2024-11-29 20:15:36.3600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:36.5530000', N'2024-11-29 20:15:36.5566667', N'2024-11-29 20:15:36.5566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:36.5750000', N'2024-11-29 20:15:36.5766667', N'2024-11-29 20:15:36.5766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:36.6710000', N'2024-11-29 20:15:36.6733333', N'2024-11-29 20:15:36.6733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:36.7820000', N'2024-11-29 20:15:36.7833333', N'2024-11-29 20:15:36.7833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:36.8870000', N'2024-11-29 20:15:36.8900000', N'2024-11-29 20:15:36.8900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:37.0090000', N'2024-11-29 20:15:37.0100000', N'2024-11-29 20:15:37.0100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:37.1060000', N'2024-11-29 20:15:37.1100000', N'2024-11-29 20:15:37.1100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:37.2030000', N'2024-11-29 20:15:37.2066667', N'2024-11-29 20:15:37.2066667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:37.2990000', N'2024-11-29 20:15:37.3000000', N'2024-11-29 20:15:37.3000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:37.3910000', N'2024-11-29 20:15:37.3933333', N'2024-11-29 20:15:37.3933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:37.4900000', N'2024-11-29 20:15:37.4933333', N'2024-11-29 20:15:37.4933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:37.5900000', N'2024-11-29 20:15:37.5933333', N'2024-11-29 20:15:37.5933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:37.6880000', N'2024-11-29 20:15:37.6900000', N'2024-11-29 20:15:37.6900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:37.7980000', N'2024-11-29 20:15:37.8000000', N'2024-11-29 20:15:37.8000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:37.8990000', N'2024-11-29 20:15:37.9033333', N'2024-11-29 20:15:37.9033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:38.0050000', N'2024-11-29 20:15:38.0100000', N'2024-11-29 20:15:38.0100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:38.0990000', N'2024-11-29 20:15:38.1033333', N'2024-11-29 20:15:38.1033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:38.2620000', N'2024-11-29 20:15:38.2633333', N'2024-11-29 20:15:38.2633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:38.3550000', N'2024-11-29 20:15:38.3566667', N'2024-11-29 20:15:38.3566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:38.3590000', N'2024-11-29 20:15:38.3600000', N'2024-11-29 20:15:38.3600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:38.4570000', N'2024-11-29 20:15:38.4600000', N'2024-11-29 20:15:38.4600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:38.5930000', N'2024-11-29 20:15:38.5933333', N'2024-11-29 20:15:38.5933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:38.6970000', N'2024-11-29 20:15:38.7000000', N'2024-11-29 20:15:38.7000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:38.8030000', N'2024-11-29 20:15:38.8033333', N'2024-11-29 20:15:38.8033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:38.9070000', N'2024-11-29 20:15:38.9100000', N'2024-11-29 20:15:38.9100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:39.0220000', N'2024-11-29 20:15:39.0233333', N'2024-11-29 20:15:39.0233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:39.1280000', N'2024-11-29 20:15:39.1300000', N'2024-11-29 20:15:39.1300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:39.2250000', N'2024-11-29 20:15:39.2266667', N'2024-11-29 20:15:39.2266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:39.3520000', N'2024-11-29 20:15:39.3533333', N'2024-11-29 20:15:39.3533333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:39.4510000', N'2024-11-29 20:15:39.4533333', N'2024-11-29 20:15:39.4533333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:39.5480000', N'2024-11-29 20:15:39.5500000', N'2024-11-29 20:15:39.5500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:39.6410000', N'2024-11-29 20:15:39.6433333', N'2024-11-29 20:15:39.6433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:39.7470000', N'2024-11-29 20:15:39.7500000', N'2024-11-29 20:15:39.7500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:39.8480000', N'2024-11-29 20:15:39.8500000', N'2024-11-29 20:15:39.8500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:39.9520000', N'2024-11-29 20:15:39.9533333', N'2024-11-29 20:15:39.9533333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:40.0550000', N'2024-11-29 20:15:40.0566667', N'2024-11-29 20:15:40.0566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:40.1510000', N'2024-11-29 20:15:40.1533333', N'2024-11-29 20:15:40.1533333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:40.2630000', N'2024-11-29 20:15:40.2633333', N'2024-11-29 20:15:40.2633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:40.3570000', N'2024-11-29 20:15:40.3600000', N'2024-11-29 20:15:40.3600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:40.4620000', N'2024-11-29 20:15:40.4633333', N'2024-11-29 20:15:40.4633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:40.5600000', N'2024-11-29 20:15:40.5600000', N'2024-11-29 20:15:40.5600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:40.6700000', N'2024-11-29 20:15:40.6733333', N'2024-11-29 20:15:40.6733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:40.7920000', N'2024-11-29 20:15:40.7933333', N'2024-11-29 20:15:40.7933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:40.9020000', N'2024-11-29 20:15:40.9033333', N'2024-11-29 20:15:40.9033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:41.0000000', N'2024-11-29 20:15:41.0033333', N'2024-11-29 20:15:41.0033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:41.1080000', N'2024-11-29 20:15:41.1100000', N'2024-11-29 20:15:41.1100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:41.2410000', N'2024-11-29 20:15:41.2433333', N'2024-11-29 20:15:41.2433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:41.3430000', N'2024-11-29 20:15:41.3466667', N'2024-11-29 20:15:41.3466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:41.4690000', N'2024-11-29 20:15:41.4700000', N'2024-11-29 20:15:41.4700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:41.5630000', N'2024-11-29 20:15:41.5666667', N'2024-11-29 20:15:41.5666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:41.6600000', N'2024-11-29 20:15:41.6600000', N'2024-11-29 20:15:41.6600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:41.8210000', N'2024-11-29 20:15:41.8233333', N'2024-11-29 20:15:41.8233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:41.8340000', N'2024-11-29 20:15:41.8366667', N'2024-11-29 20:15:41.8366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:41.9360000', N'2024-11-29 20:15:41.9366667', N'2024-11-29 20:15:41.9366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:42.0360000', N'2024-11-29 20:15:42.0366667', N'2024-11-29 20:15:42.0366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:42.1320000', N'2024-11-29 20:15:42.1333333', N'2024-11-29 20:15:42.1333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:42.2350000', N'2024-11-29 20:15:42.2366667', N'2024-11-29 20:15:42.2366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:42.3370000', N'2024-11-29 20:15:42.3400000', N'2024-11-29 20:15:42.3400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:42.4470000', N'2024-11-29 20:15:42.4500000', N'2024-11-29 20:15:42.4500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:42.5680000', N'2024-11-29 20:15:42.5700000', N'2024-11-29 20:15:42.5700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:42.6670000', N'2024-11-29 20:15:42.6700000', N'2024-11-29 20:15:42.6700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:42.7640000', N'2024-11-29 20:15:42.7666667', N'2024-11-29 20:15:42.7666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:42.8540000', N'2024-11-29 20:15:42.8566667', N'2024-11-29 20:15:42.8566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:42.9570000', N'2024-11-29 20:15:42.9600000', N'2024-11-29 20:15:42.9600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:43.0680000', N'2024-11-29 20:15:43.0700000', N'2024-11-29 20:15:43.0700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:43.1850000', N'2024-11-29 20:15:43.1866667', N'2024-11-29 20:15:43.1866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:43.3050000', N'2024-11-29 20:15:43.3066667', N'2024-11-29 20:15:43.3066667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:43.4150000', N'2024-11-29 20:15:43.4166667', N'2024-11-29 20:15:43.4166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:43.5120000', N'2024-11-29 20:15:43.5100000', N'2024-11-29 20:15:43.5100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:43.6440000', N'2024-11-29 20:15:43.6433333', N'2024-11-29 20:15:43.6433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:43.7530000', N'2024-11-29 20:15:43.7533333', N'2024-11-29 20:15:43.7533333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:43.8600000', N'2024-11-29 20:15:43.8600000', N'2024-11-29 20:15:43.8600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:43.9510000', N'2024-11-29 20:15:43.9500000', N'2024-11-29 20:15:43.9500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:44.0610000', N'2024-11-29 20:15:44.0600000', N'2024-11-29 20:15:44.0600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:44.1690000', N'2024-11-29 20:15:44.1700000', N'2024-11-29 20:15:44.1700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:44.2760000', N'2024-11-29 20:15:44.2733333', N'2024-11-29 20:15:44.2733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:44.3740000', N'2024-11-29 20:15:44.3733333', N'2024-11-29 20:15:44.3733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:44.5140000', N'2024-11-29 20:15:44.5133333', N'2024-11-29 20:15:44.5133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:44.6310000', N'2024-11-29 20:15:44.6300000', N'2024-11-29 20:15:44.6300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:44.7290000', N'2024-11-29 20:15:44.7300000', N'2024-11-29 20:15:44.7300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:44.8280000', N'2024-11-29 20:15:44.8300000', N'2024-11-29 20:15:44.8300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:44.9270000', N'2024-11-29 20:15:44.9300000', N'2024-11-29 20:15:44.9300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:45.0520000', N'2024-11-29 20:15:45.0533333', N'2024-11-29 20:15:45.0533333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:45.1470000', N'2024-11-29 20:15:45.1500000', N'2024-11-29 20:15:45.1500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:45.2610000', N'2024-11-29 20:15:45.2633333', N'2024-11-29 20:15:45.2633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:45.3640000', N'2024-11-29 20:15:45.3633333', N'2024-11-29 20:15:45.3633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:45.4660000', N'2024-11-29 20:15:45.4666667', N'2024-11-29 20:15:45.4666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:45.5660000', N'2024-11-29 20:15:45.5700000', N'2024-11-29 20:15:45.5700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:45.6750000', N'2024-11-29 20:15:45.6766667', N'2024-11-29 20:15:45.6766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:45.7760000', N'2024-11-29 20:15:45.7766667', N'2024-11-29 20:15:45.7766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:45.8770000', N'2024-11-29 20:15:45.8800000', N'2024-11-29 20:15:45.8800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:45.9760000', N'2024-11-29 20:15:45.9800000', N'2024-11-29 20:15:45.9800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:46.0700000', N'2024-11-29 20:15:46.0700000', N'2024-11-29 20:15:46.0700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:46.1600000', N'2024-11-29 20:15:46.1600000', N'2024-11-29 20:15:46.1600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:46.2620000', N'2024-11-29 20:15:46.2633333', N'2024-11-29 20:15:46.2633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:46.3610000', N'2024-11-29 20:15:46.3633333', N'2024-11-29 20:15:46.3633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:46.4610000', N'2024-11-29 20:15:46.4633333', N'2024-11-29 20:15:46.4633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:46.5640000', N'2024-11-29 20:15:46.5666667', N'2024-11-29 20:15:46.5666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:46.6810000', N'2024-11-29 20:15:46.6833333', N'2024-11-29 20:15:46.6833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:46.7830000', N'2024-11-29 20:15:46.7833333', N'2024-11-29 20:15:46.7833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:46.8870000', N'2024-11-29 20:15:46.8900000', N'2024-11-29 20:15:46.8900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:46.9860000', N'2024-11-29 20:15:46.9900000', N'2024-11-29 20:15:46.9900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:47.0990000', N'2024-11-29 20:15:47.1000000', N'2024-11-29 20:15:47.1000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:47.2090000', N'2024-11-29 20:15:47.2100000', N'2024-11-29 20:15:47.2100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:47.3100000', N'2024-11-29 20:15:47.3133333', N'2024-11-29 20:15:47.3133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:47.4260000', N'2024-11-29 20:15:47.4300000', N'2024-11-29 20:15:47.4300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:47.5190000', N'2024-11-29 20:15:47.5200000', N'2024-11-29 20:15:47.5200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:47.6170000', N'2024-11-29 20:15:47.6166667', N'2024-11-29 20:15:47.6166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:47.7190000', N'2024-11-29 20:15:47.7200000', N'2024-11-29 20:15:47.7200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:47.8170000', N'2024-11-29 20:15:47.8166667', N'2024-11-29 20:15:47.8166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:47.9310000', N'2024-11-29 20:15:47.9300000', N'2024-11-29 20:15:47.9300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:48.0270000', N'2024-11-29 20:15:48.0266667', N'2024-11-29 20:15:48.0266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:48.1160000', N'2024-11-29 20:15:48.1166667', N'2024-11-29 20:15:48.1166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:48.2230000', N'2024-11-29 20:15:48.2200000', N'2024-11-29 20:15:48.2200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:48.3320000', N'2024-11-29 20:15:48.3300000', N'2024-11-29 20:15:48.3300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:48.4310000', N'2024-11-29 20:15:48.4300000', N'2024-11-29 20:15:48.4300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:48.5400000', N'2024-11-29 20:15:48.5400000', N'2024-11-29 20:15:48.5400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:48.7410000', N'2024-11-29 20:15:48.7433333', N'2024-11-29 20:15:48.7433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:48.7580000', N'2024-11-29 20:15:48.7600000', N'2024-11-29 20:15:48.7600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:48.8540000', N'2024-11-29 20:15:48.8566667', N'2024-11-29 20:15:48.8566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:48.9510000', N'2024-11-29 20:15:48.9533333', N'2024-11-29 20:15:48.9533333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:49.0570000', N'2024-11-29 20:15:49.0600000', N'2024-11-29 20:15:49.0600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:49.1660000', N'2024-11-29 20:15:49.1700000', N'2024-11-29 20:15:49.1700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:49.2850000', N'2024-11-29 20:15:49.2866667', N'2024-11-29 20:15:49.2866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:49.3940000', N'2024-11-29 20:15:49.3966667', N'2024-11-29 20:15:49.3966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:49.5020000', N'2024-11-29 20:15:49.5033333', N'2024-11-29 20:15:49.5033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:49.6100000', N'2024-11-29 20:15:49.6100000', N'2024-11-29 20:15:49.6100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:49.7070000', N'2024-11-29 20:15:49.7100000', N'2024-11-29 20:15:49.7100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:49.8210000', N'2024-11-29 20:15:49.8233333', N'2024-11-29 20:15:49.8233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:49.9190000', N'2024-11-29 20:15:49.9200000', N'2024-11-29 20:15:49.9200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:50.0110000', N'2024-11-29 20:15:50.0133333', N'2024-11-29 20:15:50.0133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:50.1170000', N'2024-11-29 20:15:50.1200000', N'2024-11-29 20:15:50.1200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:50.3040000', N'2024-11-29 20:15:50.3066667', N'2024-11-29 20:15:50.3066667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:50.3190000', N'2024-11-29 20:15:50.3200000', N'2024-11-29 20:15:50.3200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:50.4370000', N'2024-11-29 20:15:50.4400000', N'2024-11-29 20:15:50.4400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:50.5360000', N'2024-11-29 20:15:50.5400000', N'2024-11-29 20:15:50.5400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:50.6530000', N'2024-11-29 20:15:50.6566667', N'2024-11-29 20:15:50.6566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:50.7780000', N'2024-11-29 20:15:50.7800000', N'2024-11-29 20:15:50.7800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:50.8650000', N'2024-11-29 20:15:50.8666667', N'2024-11-29 20:15:50.8666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:50.9560000', N'2024-11-29 20:15:50.9600000', N'2024-11-29 20:15:50.9600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:51.0620000', N'2024-11-29 20:15:51.0633333', N'2024-11-29 20:15:51.0633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:51.1720000', N'2024-11-29 20:15:51.1733333', N'2024-11-29 20:15:51.1733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:51.3960000', N'2024-11-29 20:15:51.4000000', N'2024-11-29 20:15:51.4000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:51.4120000', N'2024-11-29 20:15:51.4133333', N'2024-11-29 20:15:51.4133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:51.5110000', N'2024-11-29 20:15:51.5133333', N'2024-11-29 20:15:51.5133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:51.6010000', N'2024-11-29 20:15:51.6033333', N'2024-11-29 20:15:51.6033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:51.7040000', N'2024-11-29 20:15:51.7066667', N'2024-11-29 20:15:51.7066667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:51.9100000', N'2024-11-29 20:15:51.9133333', N'2024-11-29 20:15:51.9133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:51.9250000', N'2024-11-29 20:15:51.9266667', N'2024-11-29 20:15:51.9266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:52.0240000', N'2024-11-29 20:15:52.0266667', N'2024-11-29 20:15:52.0266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:52.1150000', N'2024-11-29 20:15:52.1166667', N'2024-11-29 20:15:52.1166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:52.2090000', N'2024-11-29 20:15:52.2100000', N'2024-11-29 20:15:52.2100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:52.3110000', N'2024-11-29 20:15:52.3133333', N'2024-11-29 20:15:52.3133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:52.4260000', N'2024-11-29 20:15:52.4300000', N'2024-11-29 20:15:52.4300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:52.5180000', N'2024-11-29 20:15:52.5200000', N'2024-11-29 20:15:52.5200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:52.6380000', N'2024-11-29 20:15:52.6400000', N'2024-11-29 20:15:52.6400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:52.7390000', N'2024-11-29 20:15:52.7400000', N'2024-11-29 20:15:52.7400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:52.8630000', N'2024-11-29 20:15:52.8666667', N'2024-11-29 20:15:52.8666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:52.9570000', N'2024-11-29 20:15:52.9600000', N'2024-11-29 20:15:52.9600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:53.0610000', N'2024-11-29 20:15:53.0633333', N'2024-11-29 20:15:53.0633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:53.1560000', N'2024-11-29 20:15:53.1600000', N'2024-11-29 20:15:53.1600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:53.2580000', N'2024-11-29 20:15:53.2600000', N'2024-11-29 20:15:53.2600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:53.3460000', N'2024-11-29 20:15:53.3500000', N'2024-11-29 20:15:53.3500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:53.4440000', N'2024-11-29 20:15:53.4466667', N'2024-11-29 20:15:53.4466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:53.6080000', N'2024-11-29 20:15:53.6100000', N'2024-11-29 20:15:53.6100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:53.7010000', N'2024-11-29 20:15:53.7066667', N'2024-11-29 20:15:53.7066667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:53.8130000', N'2024-11-29 20:15:53.8166667', N'2024-11-29 20:15:53.8166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:53.9220000', N'2024-11-29 20:15:53.9233333', N'2024-11-29 20:15:53.9233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:54.0120000', N'2024-11-29 20:15:54.0133333', N'2024-11-29 20:15:54.0133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:54.1280000', N'2024-11-29 20:15:54.1300000', N'2024-11-29 20:15:54.1300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:54.2300000', N'2024-11-29 20:15:54.2333333', N'2024-11-29 20:15:54.2333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:54.3360000', N'2024-11-29 20:15:54.3400000', N'2024-11-29 20:15:54.3400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:54.4290000', N'2024-11-29 20:15:54.4300000', N'2024-11-29 20:15:54.4300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:54.5330000', N'2024-11-29 20:15:54.5333333', N'2024-11-29 20:15:54.5333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:54.6360000', N'2024-11-29 20:15:54.6400000', N'2024-11-29 20:15:54.6400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:54.7340000', N'2024-11-29 20:15:54.7366667', N'2024-11-29 20:15:54.7366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:54.9090000', N'2024-11-29 20:15:54.9100000', N'2024-11-29 20:15:54.9100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:54.9260000', N'2024-11-29 20:15:54.9266667', N'2024-11-29 20:15:54.9266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:55.0190000', N'2024-11-29 20:15:55.0200000', N'2024-11-29 20:15:55.0200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:55.1310000', N'2024-11-29 20:15:55.1333333', N'2024-11-29 20:15:55.1333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:55.2440000', N'2024-11-29 20:15:55.2466667', N'2024-11-29 20:15:55.2466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:55.3570000', N'2024-11-29 20:15:55.3600000', N'2024-11-29 20:15:55.3600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:55.4510000', N'2024-11-29 20:15:55.4500000', N'2024-11-29 20:15:55.4500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:55.6130000', N'2024-11-29 20:15:55.6133333', N'2024-11-29 20:15:55.6133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:55.6280000', N'2024-11-29 20:15:55.6300000', N'2024-11-29 20:15:55.6300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:55.7150000', N'2024-11-29 20:15:55.7166667', N'2024-11-29 20:15:55.7166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:55.7990000', N'2024-11-29 20:15:55.8000000', N'2024-11-29 20:15:55.8000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:55.9100000', N'2024-11-29 20:15:55.9100000', N'2024-11-29 20:15:55.9100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:56.0030000', N'2024-11-29 20:15:56.0066667', N'2024-11-29 20:15:56.0066667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:56.1030000', N'2024-11-29 20:15:56.1066667', N'2024-11-29 20:15:56.1066667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:56.2010000', N'2024-11-29 20:15:56.2033333', N'2024-11-29 20:15:56.2033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:56.2990000', N'2024-11-29 20:15:56.3000000', N'2024-11-29 20:15:56.3000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:56.4000000', N'2024-11-29 20:15:56.4000000', N'2024-11-29 20:15:56.4000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:56.6060000', N'2024-11-29 20:15:56.6100000', N'2024-11-29 20:15:56.6100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:56.6220000', N'2024-11-29 20:15:56.6233333', N'2024-11-29 20:15:56.6233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:56.7210000', N'2024-11-29 20:15:56.7233333', N'2024-11-29 20:15:56.7233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:56.8140000', N'2024-11-29 20:15:56.8166667', N'2024-11-29 20:15:56.8166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:56.9210000', N'2024-11-29 20:15:56.9233333', N'2024-11-29 20:15:56.9233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:57.0320000', N'2024-11-29 20:15:57.0333333', N'2024-11-29 20:15:57.0333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:57.1460000', N'2024-11-29 20:15:57.1500000', N'2024-11-29 20:15:57.1500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:57.2780000', N'2024-11-29 20:15:57.2800000', N'2024-11-29 20:15:57.2800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:57.3890000', N'2024-11-29 20:15:57.3900000', N'2024-11-29 20:15:57.3900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:57.5650000', N'2024-11-29 20:15:57.5666667', N'2024-11-29 20:15:57.5666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:57.5850000', N'2024-11-29 20:15:57.5866667', N'2024-11-29 20:15:57.5866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:57.6870000', N'2024-11-29 20:15:57.6900000', N'2024-11-29 20:15:57.6900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:57.7840000', N'2024-11-29 20:15:57.7866667', N'2024-11-29 20:15:57.7866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:57.9540000', N'2024-11-29 20:15:57.9566667', N'2024-11-29 20:15:57.9566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:57.9700000', N'2024-11-29 20:15:57.9700000', N'2024-11-29 20:15:57.9700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:58.0600000', N'2024-11-29 20:15:58.0633333', N'2024-11-29 20:15:58.0633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:58.1580000', N'2024-11-29 20:15:58.1600000', N'2024-11-29 20:15:58.1600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:58.3160000', N'2024-11-29 20:15:58.3200000', N'2024-11-29 20:15:58.3200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:58.3280000', N'2024-11-29 20:15:58.3300000', N'2024-11-29 20:15:58.3300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:58.4390000', N'2024-11-29 20:15:58.4433333', N'2024-11-29 20:15:58.4433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:58.6680000', N'2024-11-29 20:15:58.6700000', N'2024-11-29 20:15:58.6700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:58.7010000', N'2024-11-29 20:15:58.7033333', N'2024-11-29 20:15:58.7033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:58.7920000', N'2024-11-29 20:15:58.7966667', N'2024-11-29 20:15:58.7966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:58.8870000', N'2024-11-29 20:15:58.8900000', N'2024-11-29 20:15:58.8900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:58.9930000', N'2024-11-29 20:15:58.9966667', N'2024-11-29 20:15:58.9966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:59.0800000', N'2024-11-29 20:15:59.0766667', N'2024-11-29 20:15:59.0766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:59.1680000', N'2024-11-29 20:15:59.1633333', N'2024-11-29 20:15:59.1633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:59.2570000', N'2024-11-29 20:15:59.2533333', N'2024-11-29 20:15:59.2533333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:59.3600000', N'2024-11-29 20:15:59.3566667', N'2024-11-29 20:15:59.3566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:59.4490000', N'2024-11-29 20:15:59.4466667', N'2024-11-29 20:15:59.4466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:59.5740000', N'2024-11-29 20:15:59.5700000', N'2024-11-29 20:15:59.5700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:59.6630000', N'2024-11-29 20:15:59.6600000', N'2024-11-29 20:15:59.6600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:59.7890000', N'2024-11-29 20:15:59.7866667', N'2024-11-29 20:15:59.7866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:15:59.8930000', N'2024-11-29 20:15:59.8900000', N'2024-11-29 20:15:59.8900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:00.0950000', N'2024-11-29 20:16:00.0933333', N'2024-11-29 20:16:00.0933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:00.1140000', N'2024-11-29 20:16:00.1133333', N'2024-11-29 20:16:00.1133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:00.2250000', N'2024-11-29 20:16:00.2233333', N'2024-11-29 20:16:00.2233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:00.3170000', N'2024-11-29 20:16:00.3166667', N'2024-11-29 20:16:00.3166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:00.4510000', N'2024-11-29 20:16:00.4500000', N'2024-11-29 20:16:00.4500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:00.5630000', N'2024-11-29 20:16:00.5600000', N'2024-11-29 20:16:00.5600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:00.7330000', N'2024-11-29 20:16:00.7300000', N'2024-11-29 20:16:00.7300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:00.7540000', N'2024-11-29 20:16:00.7500000', N'2024-11-29 20:16:00.7500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:00.8590000', N'2024-11-29 20:16:00.8566667', N'2024-11-29 20:16:00.8566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:00.9610000', N'2024-11-29 20:16:00.9600000', N'2024-11-29 20:16:00.9600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:01.0640000', N'2024-11-29 20:16:01.0633333', N'2024-11-29 20:16:01.0633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:01.1700000', N'2024-11-29 20:16:01.1733333', N'2024-11-29 20:16:01.1733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:01.2620000', N'2024-11-29 20:16:01.2633333', N'2024-11-29 20:16:01.2633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:01.3740000', N'2024-11-29 20:16:01.3766667', N'2024-11-29 20:16:01.3766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:01.5690000', N'2024-11-29 20:16:01.5700000', N'2024-11-29 20:16:01.5700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:01.6370000', N'2024-11-29 20:16:01.6400000', N'2024-11-29 20:16:01.6400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:01.7550000', N'2024-11-29 20:16:01.7566667', N'2024-11-29 20:16:01.7566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:01.8580000', N'2024-11-29 20:16:01.8600000', N'2024-11-29 20:16:01.8600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:01.9620000', N'2024-11-29 20:16:01.9633333', N'2024-11-29 20:16:01.9633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:02.1270000', N'2024-11-29 20:16:02.1300000', N'2024-11-29 20:16:02.1300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:02.1470000', N'2024-11-29 20:16:02.1500000', N'2024-11-29 20:16:02.1500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:02.2450000', N'2024-11-29 20:16:02.2466667', N'2024-11-29 20:16:02.2466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:02.3380000', N'2024-11-29 20:16:02.3400000', N'2024-11-29 20:16:02.3400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:02.4680000', N'2024-11-29 20:16:02.4700000', N'2024-11-29 20:16:02.4700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:02.6540000', N'2024-11-29 20:16:02.6566667', N'2024-11-29 20:16:02.6566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:02.6670000', N'2024-11-29 20:16:02.6700000', N'2024-11-29 20:16:02.6700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:02.7590000', N'2024-11-29 20:16:02.7600000', N'2024-11-29 20:16:02.7600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:02.8560000', N'2024-11-29 20:16:02.8600000', N'2024-11-29 20:16:02.8600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:02.9710000', N'2024-11-29 20:16:02.9733333', N'2024-11-29 20:16:02.9733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:03.0860000', N'2024-11-29 20:16:03.0900000', N'2024-11-29 20:16:03.0900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:03.2790000', N'2024-11-29 20:16:03.2800000', N'2024-11-29 20:16:03.2800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:03.2930000', N'2024-11-29 20:16:03.2933333', N'2024-11-29 20:16:03.2933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:03.4070000', N'2024-11-29 20:16:03.4066667', N'2024-11-29 20:16:03.4066667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:03.5900000', N'2024-11-29 20:16:03.5900000', N'2024-11-29 20:16:03.5900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:03.6100000', N'2024-11-29 20:16:03.6100000', N'2024-11-29 20:16:03.6100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:03.7140000', N'2024-11-29 20:16:03.7133333', N'2024-11-29 20:16:03.7133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:03.8180000', N'2024-11-29 20:16:03.8166667', N'2024-11-29 20:16:03.8166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:03.9240000', N'2024-11-29 20:16:03.9233333', N'2024-11-29 20:16:03.9233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:04.0430000', N'2024-11-29 20:16:04.0433333', N'2024-11-29 20:16:04.0433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:04.1410000', N'2024-11-29 20:16:04.1400000', N'2024-11-29 20:16:04.1400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:04.2750000', N'2024-11-29 20:16:04.2766667', N'2024-11-29 20:16:04.2766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:04.3620000', N'2024-11-29 20:16:04.3633333', N'2024-11-29 20:16:04.3633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:04.4580000', N'2024-11-29 20:16:04.4600000', N'2024-11-29 20:16:04.4600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:04.5750000', N'2024-11-29 20:16:04.5766667', N'2024-11-29 20:16:04.5766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:04.6760000', N'2024-11-29 20:16:04.6800000', N'2024-11-29 20:16:04.6800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:04.7730000', N'2024-11-29 20:16:04.7766667', N'2024-11-29 20:16:04.7766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:04.8630000', N'2024-11-29 20:16:04.8666667', N'2024-11-29 20:16:04.8666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:04.9590000', N'2024-11-29 20:16:04.9600000', N'2024-11-29 20:16:04.9600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:05.0710000', N'2024-11-29 20:16:05.0733333', N'2024-11-29 20:16:05.0733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:05.2490000', N'2024-11-29 20:16:05.2500000', N'2024-11-29 20:16:05.2500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:05.2710000', N'2024-11-29 20:16:05.2700000', N'2024-11-29 20:16:05.2700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:05.3560000', N'2024-11-29 20:16:05.3600000', N'2024-11-29 20:16:05.3600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:05.4720000', N'2024-11-29 20:16:05.4733333', N'2024-11-29 20:16:05.4733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:05.5840000', N'2024-11-29 20:16:05.5866667', N'2024-11-29 20:16:05.5866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:05.7140000', N'2024-11-29 20:16:05.7166667', N'2024-11-29 20:16:05.7166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:05.9030000', N'2024-11-29 20:16:05.9033333', N'2024-11-29 20:16:05.9033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:05.9220000', N'2024-11-29 20:16:05.9233333', N'2024-11-29 20:16:05.9233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:06.0220000', N'2024-11-29 20:16:06.0233333', N'2024-11-29 20:16:06.0233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:06.1300000', N'2024-11-29 20:16:06.1300000', N'2024-11-29 20:16:06.1300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:06.2220000', N'2024-11-29 20:16:06.2233333', N'2024-11-29 20:16:06.2233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:06.3270000', N'2024-11-29 20:16:06.3300000', N'2024-11-29 20:16:06.3300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:06.4420000', N'2024-11-29 20:16:06.4433333', N'2024-11-29 20:16:06.4433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:06.5500000', N'2024-11-29 20:16:06.5500000', N'2024-11-29 20:16:06.5500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:06.6580000', N'2024-11-29 20:16:06.6600000', N'2024-11-29 20:16:06.6600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:06.7580000', N'2024-11-29 20:16:06.7600000', N'2024-11-29 20:16:06.7600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:06.8670000', N'2024-11-29 20:16:06.8700000', N'2024-11-29 20:16:06.8700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:06.9650000', N'2024-11-29 20:16:06.9666667', N'2024-11-29 20:16:06.9666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:07.0650000', N'2024-11-29 20:16:07.0666667', N'2024-11-29 20:16:07.0666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:07.2280000', N'2024-11-29 20:16:07.2300000', N'2024-11-29 20:16:07.2300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:07.2410000', N'2024-11-29 20:16:07.2433333', N'2024-11-29 20:16:07.2433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:07.3400000', N'2024-11-29 20:16:07.3433333', N'2024-11-29 20:16:07.3433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:07.4500000', N'2024-11-29 20:16:07.4500000', N'2024-11-29 20:16:07.4500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:07.5540000', N'2024-11-29 20:16:07.5566667', N'2024-11-29 20:16:07.5566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:07.6480000', N'2024-11-29 20:16:07.6500000', N'2024-11-29 20:16:07.6500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:07.7360000', N'2024-11-29 20:16:07.7400000', N'2024-11-29 20:16:07.7400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:07.8950000', N'2024-11-29 20:16:07.8966667', N'2024-11-29 20:16:07.8966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:07.9130000', N'2024-11-29 20:16:07.9166667', N'2024-11-29 20:16:07.9166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:07.9920000', N'2024-11-29 20:16:07.9933333', N'2024-11-29 20:16:07.9933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:08.0810000', N'2024-11-29 20:16:08.0833333', N'2024-11-29 20:16:08.0833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:08.1760000', N'2024-11-29 20:16:08.1800000', N'2024-11-29 20:16:08.1800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:08.3480000', N'2024-11-29 20:16:08.3466667', N'2024-11-29 20:16:08.3466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:08.3700000', N'2024-11-29 20:16:08.3700000', N'2024-11-29 20:16:08.3700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:08.4550000', N'2024-11-29 20:16:08.4566667', N'2024-11-29 20:16:08.4566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:08.5820000', N'2024-11-29 20:16:08.5833333', N'2024-11-29 20:16:08.5833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:08.6930000', N'2024-11-29 20:16:08.6933333', N'2024-11-29 20:16:08.6933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:08.7900000', N'2024-11-29 20:16:08.7900000', N'2024-11-29 20:16:08.7900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:08.8870000', N'2024-11-29 20:16:08.8866667', N'2024-11-29 20:16:08.8866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:08.9840000', N'2024-11-29 20:16:08.9833333', N'2024-11-29 20:16:08.9833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:09.0840000', N'2024-11-29 20:16:09.0833333', N'2024-11-29 20:16:09.0833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:09.2460000', N'2024-11-29 20:16:09.2466667', N'2024-11-29 20:16:09.2466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:09.2650000', N'2024-11-29 20:16:09.2666667', N'2024-11-29 20:16:09.2666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:09.3690000', N'2024-11-29 20:16:09.3700000', N'2024-11-29 20:16:09.3700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:09.4630000', N'2024-11-29 20:16:09.4633333', N'2024-11-29 20:16:09.4633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:09.5980000', N'2024-11-29 20:16:09.5966667', N'2024-11-29 20:16:09.5966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:09.6120000', N'2024-11-29 20:16:09.6133333', N'2024-11-29 20:16:09.6133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:09.7080000', N'2024-11-29 20:16:09.7100000', N'2024-11-29 20:16:09.7100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:09.8030000', N'2024-11-29 20:16:09.8033333', N'2024-11-29 20:16:09.8033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:09.9590000', N'2024-11-29 20:16:09.9600000', N'2024-11-29 20:16:09.9600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:09.9740000', N'2024-11-29 20:16:09.9733333', N'2024-11-29 20:16:09.9733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:10.0660000', N'2024-11-29 20:16:10.0666667', N'2024-11-29 20:16:10.0666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:10.2060000', N'2024-11-29 20:16:10.2066667', N'2024-11-29 20:16:10.2066667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:10.2260000', N'2024-11-29 20:16:10.2266667', N'2024-11-29 20:16:10.2266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:10.3300000', N'2024-11-29 20:16:10.3300000', N'2024-11-29 20:16:10.3300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:10.4990000', N'2024-11-29 20:16:10.5000000', N'2024-11-29 20:16:10.5000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:10.5990000', N'2024-11-29 20:16:10.6000000', N'2024-11-29 20:16:10.6000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:10.7550000', N'2024-11-29 20:16:10.7566667', N'2024-11-29 20:16:10.7566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:10.7690000', N'2024-11-29 20:16:10.7700000', N'2024-11-29 20:16:10.7700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:10.8610000', N'2024-11-29 20:16:10.8633333', N'2024-11-29 20:16:10.8633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:11.0360000', N'2024-11-29 20:16:11.0400000', N'2024-11-29 20:16:11.0400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:11.0550000', N'2024-11-29 20:16:11.0566667', N'2024-11-29 20:16:11.0566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:11.1540000', N'2024-11-29 20:16:11.1566667', N'2024-11-29 20:16:11.1566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:11.3110000', N'2024-11-29 20:16:11.3133333', N'2024-11-29 20:16:11.3133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:11.3280000', N'2024-11-29 20:16:11.3300000', N'2024-11-29 20:16:11.3300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:11.4340000', N'2024-11-29 20:16:11.4366667', N'2024-11-29 20:16:11.4366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:11.5310000', N'2024-11-29 20:16:11.5333333', N'2024-11-29 20:16:11.5333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:11.6140000', N'2024-11-29 20:16:11.6166667', N'2024-11-29 20:16:11.6166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:11.7050000', N'2024-11-29 20:16:11.7066667', N'2024-11-29 20:16:11.7066667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:11.8730000', N'2024-11-29 20:16:11.8766667', N'2024-11-29 20:16:11.8766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:11.9250000', N'2024-11-29 20:16:11.9266667', N'2024-11-29 20:16:11.9266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:12.1030000', N'2024-11-29 20:16:12.1033333', N'2024-11-29 20:16:12.1033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:12.1150000', N'2024-11-29 20:16:12.1166667', N'2024-11-29 20:16:12.1166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:12.2640000', N'2024-11-29 20:16:12.2666667', N'2024-11-29 20:16:12.2666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:12.2810000', N'2024-11-29 20:16:12.2833333', N'2024-11-29 20:16:12.2833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:12.4200000', N'2024-11-29 20:16:12.4200000', N'2024-11-29 20:16:12.4200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:12.4360000', N'2024-11-29 20:16:12.4400000', N'2024-11-29 20:16:12.4400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:12.5110000', N'2024-11-29 20:16:12.5133333', N'2024-11-29 20:16:12.5133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:12.6090000', N'2024-11-29 20:16:12.6100000', N'2024-11-29 20:16:12.6100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:12.7070000', N'2024-11-29 20:16:12.7100000', N'2024-11-29 20:16:12.7100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:12.7940000', N'2024-11-29 20:16:12.7966667', N'2024-11-29 20:16:12.7966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:12.8820000', N'2024-11-29 20:16:12.8833333', N'2024-11-29 20:16:12.8833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:12.9720000', N'2024-11-29 20:16:12.9733333', N'2024-11-29 20:16:12.9733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:13.0720000', N'2024-11-29 20:16:13.0733333', N'2024-11-29 20:16:13.0733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:13.1600000', N'2024-11-29 20:16:13.1600000', N'2024-11-29 20:16:13.1600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:13.2500000', N'2024-11-29 20:16:13.2533333', N'2024-11-29 20:16:13.2533333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:13.3410000', N'2024-11-29 20:16:13.3433333', N'2024-11-29 20:16:13.3433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:13.4440000', N'2024-11-29 20:16:13.4466667', N'2024-11-29 20:16:13.4466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:13.5360000', N'2024-11-29 20:16:13.5333333', N'2024-11-29 20:16:13.5333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:13.6190000', N'2024-11-29 20:16:13.6166667', N'2024-11-29 20:16:13.6166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:13.7150000', N'2024-11-29 20:16:13.7133333', N'2024-11-29 20:16:13.7133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:13.8030000', N'2024-11-29 20:16:13.8000000', N'2024-11-29 20:16:13.8000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:13.9030000', N'2024-11-29 20:16:13.9033333', N'2024-11-29 20:16:13.9033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:14.0120000', N'2024-11-29 20:16:14.0100000', N'2024-11-29 20:16:14.0100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:14.1070000', N'2024-11-29 20:16:14.1066667', N'2024-11-29 20:16:14.1066667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:14.1960000', N'2024-11-29 20:16:14.1933333', N'2024-11-29 20:16:14.1933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:14.2870000', N'2024-11-29 20:16:14.2866667', N'2024-11-29 20:16:14.2866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:14.3710000', N'2024-11-29 20:16:14.3700000', N'2024-11-29 20:16:14.3700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:14.4710000', N'2024-11-29 20:16:14.4700000', N'2024-11-29 20:16:14.4700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:14.5410000', N'2024-11-29 20:16:14.5433333', N'2024-11-29 20:16:14.5433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:14.7080000', N'2024-11-29 20:16:14.7100000', N'2024-11-29 20:16:14.7100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:14.7250000', N'2024-11-29 20:16:14.7266667', N'2024-11-29 20:16:14.7266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:14.8850000', N'2024-11-29 20:16:14.8866667', N'2024-11-29 20:16:14.8866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:14.9010000', N'2024-11-29 20:16:14.9033333', N'2024-11-29 20:16:14.9033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:15.0080000', N'2024-11-29 20:16:15.0100000', N'2024-11-29 20:16:15.0100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:15.0970000', N'2024-11-29 20:16:15.1000000', N'2024-11-29 20:16:15.1000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:15.1730000', N'2024-11-29 20:16:15.1733333', N'2024-11-29 20:16:15.1733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:15.3340000', N'2024-11-29 20:16:15.3366667', N'2024-11-29 20:16:15.3366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:15.4230000', N'2024-11-29 20:16:15.4266667', N'2024-11-29 20:16:15.4266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:15.4360000', N'2024-11-29 20:16:15.4400000', N'2024-11-29 20:16:15.4400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:15.5480000', N'2024-11-29 20:16:15.5500000', N'2024-11-29 20:16:15.5500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:15.6440000', N'2024-11-29 20:16:15.6466667', N'2024-11-29 20:16:15.6466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:15.7340000', N'2024-11-29 20:16:15.7366667', N'2024-11-29 20:16:15.7366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:15.8190000', N'2024-11-29 20:16:15.8200000', N'2024-11-29 20:16:15.8200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:15.9180000', N'2024-11-29 20:16:15.9200000', N'2024-11-29 20:16:15.9200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:16.0070000', N'2024-11-29 20:16:16.0100000', N'2024-11-29 20:16:16.0100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:16.0890000', N'2024-11-29 20:16:16.0900000', N'2024-11-29 20:16:16.0900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:16.1740000', N'2024-11-29 20:16:16.1766667', N'2024-11-29 20:16:16.1766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:16.2670000', N'2024-11-29 20:16:16.2700000', N'2024-11-29 20:16:16.2700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:16.3660000', N'2024-11-29 20:16:16.3700000', N'2024-11-29 20:16:16.3700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:16.4390000', N'2024-11-29 20:16:16.4400000', N'2024-11-29 20:16:16.4400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:16.5390000', N'2024-11-29 20:16:16.5400000', N'2024-11-29 20:16:16.5400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:16.6120000', N'2024-11-29 20:16:16.6133333', N'2024-11-29 20:16:16.6133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:16.6930000', N'2024-11-29 20:16:16.6933333', N'2024-11-29 20:16:16.6933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:16.7730000', N'2024-11-29 20:16:16.7733333', N'2024-11-29 20:16:16.7733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:16.8690000', N'2024-11-29 20:16:16.8700000', N'2024-11-29 20:16:16.8700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:17.0580000', N'2024-11-29 20:16:17.0600000', N'2024-11-29 20:16:17.0600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:17.0740000', N'2024-11-29 20:16:17.0766667', N'2024-11-29 20:16:17.0766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:17.1710000', N'2024-11-29 20:16:17.1700000', N'2024-11-29 20:16:17.1700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:17.2650000', N'2024-11-29 20:16:17.2666667', N'2024-11-29 20:16:17.2666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:17.3780000', N'2024-11-29 20:16:17.3800000', N'2024-11-29 20:16:17.3800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:17.4570000', N'2024-11-29 20:16:17.4600000', N'2024-11-29 20:16:17.4600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:17.5470000', N'2024-11-29 20:16:17.5466667', N'2024-11-29 20:16:17.5466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:17.6190000', N'2024-11-29 20:16:17.6166667', N'2024-11-29 20:16:17.6166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:17.7180000', N'2024-11-29 20:16:17.7166667', N'2024-11-29 20:16:17.7166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:17.8260000', N'2024-11-29 20:16:17.8233333', N'2024-11-29 20:16:17.8233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:17.9140000', N'2024-11-29 20:16:17.9100000', N'2024-11-29 20:16:17.9100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:18.0590000', N'2024-11-29 20:16:18.0566667', N'2024-11-29 20:16:18.0566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:18.1060000', N'2024-11-29 20:16:18.1033333', N'2024-11-29 20:16:18.1033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:18.2660000', N'2024-11-29 20:16:18.2633333', N'2024-11-29 20:16:18.2633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:18.2800000', N'2024-11-29 20:16:18.2766667', N'2024-11-29 20:16:18.2766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:18.4120000', N'2024-11-29 20:16:18.4100000', N'2024-11-29 20:16:18.4100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:18.4250000', N'2024-11-29 20:16:18.4233333', N'2024-11-29 20:16:18.4233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:18.5060000', N'2024-11-29 20:16:18.5033333', N'2024-11-29 20:16:18.5033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:18.6660000', N'2024-11-29 20:16:18.6666667', N'2024-11-29 20:16:18.6666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:18.6810000', N'2024-11-29 20:16:18.6800000', N'2024-11-29 20:16:18.6800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:18.7590000', N'2024-11-29 20:16:18.7566667', N'2024-11-29 20:16:18.7566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:18.8370000', N'2024-11-29 20:16:18.8366667', N'2024-11-29 20:16:18.8366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:18.9350000', N'2024-11-29 20:16:18.9333333', N'2024-11-29 20:16:18.9333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:19.0160000', N'2024-11-29 20:16:19.0133333', N'2024-11-29 20:16:19.0133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:19.1060000', N'2024-11-29 20:16:19.1066667', N'2024-11-29 20:16:19.1066667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:19.1810000', N'2024-11-29 20:16:19.1800000', N'2024-11-29 20:16:19.1800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:19.2830000', N'2024-11-29 20:16:19.2833333', N'2024-11-29 20:16:19.2833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:19.3860000', N'2024-11-29 20:16:19.3833333', N'2024-11-29 20:16:19.3833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:19.5290000', N'2024-11-29 20:16:19.5300000', N'2024-11-29 20:16:19.5300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:19.5440000', N'2024-11-29 20:16:19.5433333', N'2024-11-29 20:16:19.5433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:19.6270000', N'2024-11-29 20:16:19.6266667', N'2024-11-29 20:16:19.6266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:19.7310000', N'2024-11-29 20:16:19.7300000', N'2024-11-29 20:16:19.7300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:19.8280000', N'2024-11-29 20:16:19.8266667', N'2024-11-29 20:16:19.8266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:20.0280000', N'2024-11-29 20:16:20.0266667', N'2024-11-29 20:16:20.0266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:20.0430000', N'2024-11-29 20:16:20.0400000', N'2024-11-29 20:16:20.0400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:20.1600000', N'2024-11-29 20:16:20.1566667', N'2024-11-29 20:16:20.1566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:20.2370000', N'2024-11-29 20:16:20.2366667', N'2024-11-29 20:16:20.2366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:20.3230000', N'2024-11-29 20:16:20.3200000', N'2024-11-29 20:16:20.3200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:20.4360000', N'2024-11-29 20:16:20.4333333', N'2024-11-29 20:16:20.4333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:20.5280000', N'2024-11-29 20:16:20.5266667', N'2024-11-29 20:16:20.5266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:20.6260000', N'2024-11-29 20:16:20.6233333', N'2024-11-29 20:16:20.6233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:20.7400000', N'2024-11-29 20:16:20.7366667', N'2024-11-29 20:16:20.7366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:20.9220000', N'2024-11-29 20:16:20.9200000', N'2024-11-29 20:16:20.9200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:20.9380000', N'2024-11-29 20:16:20.9366667', N'2024-11-29 20:16:20.9366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:21.0420000', N'2024-11-29 20:16:21.0400000', N'2024-11-29 20:16:21.0400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:21.1490000', N'2024-11-29 20:16:21.1466667', N'2024-11-29 20:16:21.1466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:21.3280000', N'2024-11-29 20:16:21.3266667', N'2024-11-29 20:16:21.3266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:21.3470000', N'2024-11-29 20:16:21.3433333', N'2024-11-29 20:16:21.3433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:21.4540000', N'2024-11-29 20:16:21.4500000', N'2024-11-29 20:16:21.4500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:21.5670000', N'2024-11-29 20:16:21.5633333', N'2024-11-29 20:16:21.5633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:21.6530000', N'2024-11-29 20:16:21.6500000', N'2024-11-29 20:16:21.6500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:21.7360000', N'2024-11-29 20:16:21.7333333', N'2024-11-29 20:16:21.7333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:21.8850000', N'2024-11-29 20:16:21.8833333', N'2024-11-29 20:16:21.8833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:21.9890000', N'2024-11-29 20:16:21.9866667', N'2024-11-29 20:16:21.9866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:22.0020000', N'2024-11-29 20:16:22.0000000', N'2024-11-29 20:16:22.0000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:22.0970000', N'2024-11-29 20:16:22.0966667', N'2024-11-29 20:16:22.0966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:22.1940000', N'2024-11-29 20:16:22.1933333', N'2024-11-29 20:16:22.1933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:22.2900000', N'2024-11-29 20:16:22.2866667', N'2024-11-29 20:16:22.2866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:22.3880000', N'2024-11-29 20:16:22.3866667', N'2024-11-29 20:16:22.3866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:22.5000000', N'2024-11-29 20:16:22.4966667', N'2024-11-29 20:16:22.4966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:22.6750000', N'2024-11-29 20:16:22.6733333', N'2024-11-29 20:16:22.6733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:22.6860000', N'2024-11-29 20:16:22.6833333', N'2024-11-29 20:16:22.6833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:22.7610000', N'2024-11-29 20:16:22.7600000', N'2024-11-29 20:16:22.7600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:22.8630000', N'2024-11-29 20:16:22.8600000', N'2024-11-29 20:16:22.8600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:22.9620000', N'2024-11-29 20:16:22.9600000', N'2024-11-29 20:16:22.9600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:23.1520000', N'2024-11-29 20:16:23.1500000', N'2024-11-29 20:16:23.1500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:23.1660000', N'2024-11-29 20:16:23.1633333', N'2024-11-29 20:16:23.1633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:23.2700000', N'2024-11-29 20:16:23.2666667', N'2024-11-29 20:16:23.2666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:23.3550000', N'2024-11-29 20:16:23.3533333', N'2024-11-29 20:16:23.3533333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:23.4310000', N'2024-11-29 20:16:23.4300000', N'2024-11-29 20:16:23.4300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:23.5130000', N'2024-11-29 20:16:23.5100000', N'2024-11-29 20:16:23.5100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:23.6100000', N'2024-11-29 20:16:23.6066667', N'2024-11-29 20:16:23.6066667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:23.7060000', N'2024-11-29 20:16:23.7033333', N'2024-11-29 20:16:23.7033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:23.7900000', N'2024-11-29 20:16:23.7933333', N'2024-11-29 20:16:23.7933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:23.8780000', N'2024-11-29 20:16:23.8800000', N'2024-11-29 20:16:23.8800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:23.9860000', N'2024-11-29 20:16:23.9866667', N'2024-11-29 20:16:23.9866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:24.1790000', N'2024-11-29 20:16:24.1800000', N'2024-11-29 20:16:24.1800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:24.1990000', N'2024-11-29 20:16:24.2000000', N'2024-11-29 20:16:24.2000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:24.2910000', N'2024-11-29 20:16:24.2933333', N'2024-11-29 20:16:24.2933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:24.3870000', N'2024-11-29 20:16:24.3900000', N'2024-11-29 20:16:24.3900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:24.4790000', N'2024-11-29 20:16:24.4800000', N'2024-11-29 20:16:24.4800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:24.5880000', N'2024-11-29 20:16:24.5900000', N'2024-11-29 20:16:24.5900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:24.7480000', N'2024-11-29 20:16:24.7500000', N'2024-11-29 20:16:24.7500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:24.7610000', N'2024-11-29 20:16:24.7633333', N'2024-11-29 20:16:24.7633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:24.8550000', N'2024-11-29 20:16:24.8566667', N'2024-11-29 20:16:24.8566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:24.9830000', N'2024-11-29 20:16:24.9866667', N'2024-11-29 20:16:24.9866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:25.0830000', N'2024-11-29 20:16:25.0833333', N'2024-11-29 20:16:25.0833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:25.1640000', N'2024-11-29 20:16:25.1666667', N'2024-11-29 20:16:25.1666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:25.2880000', N'2024-11-29 20:16:25.2900000', N'2024-11-29 20:16:25.2900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:25.3870000', N'2024-11-29 20:16:25.3866667', N'2024-11-29 20:16:25.3866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:25.4710000', N'2024-11-29 20:16:25.4700000', N'2024-11-29 20:16:25.4700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:25.6170000', N'2024-11-29 20:16:25.6166667', N'2024-11-29 20:16:25.6166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:25.7030000', N'2024-11-29 20:16:25.7033333', N'2024-11-29 20:16:25.7033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:25.7160000', N'2024-11-29 20:16:25.7166667', N'2024-11-29 20:16:25.7166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:25.7970000', N'2024-11-29 20:16:25.7966667', N'2024-11-29 20:16:25.7966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:25.9420000', N'2024-11-29 20:16:25.9400000', N'2024-11-29 20:16:25.9400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:25.9620000', N'2024-11-29 20:16:25.9600000', N'2024-11-29 20:16:25.9600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:26.0420000', N'2024-11-29 20:16:26.0400000', N'2024-11-29 20:16:26.0400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:26.1360000', N'2024-11-29 20:16:26.1333333', N'2024-11-29 20:16:26.1333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:26.2200000', N'2024-11-29 20:16:26.2200000', N'2024-11-29 20:16:26.2200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:26.3120000', N'2024-11-29 20:16:26.3100000', N'2024-11-29 20:16:26.3100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:16:26.4160000', N'2024-11-29 20:16:26.4133333', N'2024-11-29 20:16:26.4133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:17:24.7530000', N'2024-11-29 20:17:24.7600000', N'2024-11-29 20:17:24.7600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:17:39.8020000', N'2024-11-29 20:17:39.8033333', N'2024-11-29 20:17:39.8033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:20:25.4120000', N'2024-11-29 20:20:25.4166667', N'2024-11-29 20:20:25.4166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:21:16.5910000', N'2024-11-29 20:21:16.5966667', N'2024-11-29 20:21:16.5966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:23:03.8340000', N'2024-11-29 20:23:03.8366667', N'2024-11-29 20:23:03.8366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:24:08.5370000', N'2024-11-29 20:24:08.5400000', N'2024-11-29 20:24:08.5400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:27:26.6140000', N'2024-11-29 20:27:26.6200000', N'2024-11-29 20:27:26.6200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:40:58.4290000', N'2024-11-29 20:40:58.4400000', N'2024-11-29 20:40:58.4400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:41:53.6740000', N'2024-11-29 20:41:53.6766667', N'2024-11-29 20:41:53.6766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:44:49.6260000', N'2024-11-29 20:44:49.6333333', N'2024-11-29 20:44:49.6333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:46:15.4450000', N'2024-11-29 20:46:15.4500000', N'2024-11-29 20:46:15.4500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:50:15.2750000', N'2024-11-29 20:50:15.2900000', N'2024-11-29 20:50:15.2900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:50:23.4220000', N'2024-11-29 20:50:23.4366667', N'2024-11-29 20:50:23.4366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:52:45.8580000', N'2024-11-29 20:52:45.8600000', N'2024-11-29 20:52:45.8600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:53:15.2570000', N'2024-11-29 20:53:15.2566667', N'2024-11-29 20:53:15.2566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:53:16.4300000', N'2024-11-29 20:53:16.4300000', N'2024-11-29 20:53:16.4300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:53:57.1640000', N'2024-11-29 20:53:57.1700000', N'2024-11-29 20:53:57.1700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:54:56.3580000', N'2024-11-29 20:54:56.3600000', N'2024-11-29 20:54:56.3600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:56:15.5220000', N'2024-11-29 20:56:15.5333333', N'2024-11-29 20:56:15.5333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:56:55.3180000', N'2024-11-29 20:56:55.3233333', N'2024-11-29 20:56:55.3233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 13:58:12.6470000', N'2024-11-29 20:58:12.6500000', N'2024-11-29 20:58:12.6500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 14:29:20.4900000', N'2024-11-29 21:29:20.4900000', N'2024-11-29 21:29:20.4900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 14:29:30.4660000', N'2024-11-29 21:29:30.4666667', N'2024-11-29 21:29:30.4666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 15:32:38.7470000', N'2024-11-29 22:32:38.7500000', N'2024-11-29 22:32:38.7500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 15:38:20.2940000', N'2024-11-29 22:38:20.3000000', N'2024-11-29 22:38:20.3000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 15:39:09.5280000', N'2024-11-29 22:39:09.5266667', N'2024-11-29 22:39:09.5266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 15:39:29.8640000', N'2024-11-29 22:39:29.8700000', N'2024-11-29 22:39:29.8700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 15:40:32.6270000', N'2024-11-29 22:40:32.6300000', N'2024-11-29 22:40:32.6300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 15:44:36.9030000', N'2024-11-29 22:44:36.9100000', N'2024-11-29 22:44:36.9100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 15:46:34.3850000', N'2024-11-29 22:46:34.3800000', N'2024-11-29 22:46:34.3800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 16:35:45.7840000', N'2024-11-29 23:35:45.7833333', N'2024-11-29 23:35:45.7833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 16:43:27.4600000', N'2024-11-29 23:43:27.4633333', N'2024-11-29 23:43:27.4633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 16:45:20.9850000', N'2024-11-29 23:45:20.9900000', N'2024-11-29 23:45:20.9900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 16:46:26.7930000', N'2024-11-29 23:46:26.8033333', N'2024-11-29 23:46:26.8033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 16:48:52.7850000', N'2024-11-29 23:48:52.7866667', N'2024-11-29 23:48:52.7866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 16:49:44.4710000', N'2024-11-29 23:49:44.4700000', N'2024-11-29 23:49:44.4700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 16:51:59.4860000', N'2024-11-29 23:51:59.4866667', N'2024-11-29 23:51:59.4866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-29 16:54:01.6990000', N'2024-11-29 23:54:01.7033333', N'2024-11-29 23:54:01.7033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:10:55.7850000', N'2024-11-30 17:10:55.7900000', N'2024-11-30 17:10:55.7900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:11:57.8810000', N'2024-11-30 17:11:57.8766667', N'2024-11-30 17:11:57.8766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:12:39.3100000', N'2024-11-30 17:12:39.3133333', N'2024-11-30 17:12:39.3133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:12:57.0790000', N'2024-11-30 17:12:57.0833333', N'2024-11-30 17:12:57.0833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:13:51.8280000', N'2024-11-30 17:13:51.8300000', N'2024-11-30 17:13:51.8300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:15:17.3620000', N'2024-11-30 17:15:17.3633333', N'2024-11-30 17:15:17.3633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:15:32.9460000', N'2024-11-30 17:15:32.9466667', N'2024-11-30 17:15:32.9466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:18:10.1470000', N'2024-11-30 17:18:10.1500000', N'2024-11-30 17:18:10.1500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:18:27.3530000', N'2024-11-30 17:18:27.3566667', N'2024-11-30 17:18:27.3566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:19:28.1880000', N'2024-11-30 17:19:28.1866667', N'2024-11-30 17:19:28.1866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:19:40.9230000', N'2024-11-30 17:19:40.9266667', N'2024-11-30 17:19:40.9266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:24:46.6440000', N'2024-11-30 17:24:46.6600000', N'2024-11-30 17:24:46.6600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:26:21.3180000', N'2024-11-30 17:26:21.3200000', N'2024-11-30 17:26:21.3200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:27:04.7540000', N'2024-11-30 17:27:04.7566667', N'2024-11-30 17:27:04.7566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:33:10.3180000', N'2024-11-30 17:33:10.3133333', N'2024-11-30 17:33:10.3133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:33:14.0640000', N'2024-11-30 17:33:14.0666667', N'2024-11-30 17:33:14.0666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:33:19.5230000', N'2024-11-30 17:33:19.5200000', N'2024-11-30 17:33:19.5200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:45:58.6770000', N'2024-11-30 17:45:58.6800000', N'2024-11-30 17:45:58.6800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-11-30 10:47:21.0110000', N'2024-11-30 17:47:21.0166667', N'2024-11-30 17:47:21.0166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-12-01 09:51:45.7850000', N'2024-12-01 16:51:45.8000000', N'2024-12-01 16:51:45.8000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-12-02 10:50:15.0110000', N'2024-12-02 17:50:15.0100000', N'2024-12-02 17:50:15.0100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-12-02 10:54:45.9690000', N'2024-12-02 17:54:45.9666667', N'2024-12-02 17:54:45.9666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'5', N'2024-12-03 04:56:10.1890000', N'2024-12-03 11:56:10.1900000', N'2024-12-03 11:56:10.1900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'6', N'2024-11-29 13:53:09.7320000', N'2024-11-29 20:53:09.7333333', N'2024-11-29 20:53:09.7333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'6', N'2024-11-29 13:53:11.3140000', N'2024-11-29 20:53:11.3133333', N'2024-11-29 20:53:11.3133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'6', N'2024-11-29 14:33:23.3220000', N'2024-11-29 21:33:23.3233333', N'2024-11-29 21:33:23.3233333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'6', N'2024-11-29 14:34:48.2370000', N'2024-11-29 21:34:48.2400000', N'2024-11-29 21:34:48.2400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'6', N'2024-11-29 16:43:49.1250000', N'2024-11-29 23:43:49.1266667', N'2024-11-29 23:43:49.1266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'6', N'2024-11-30 10:16:16.0160000', N'2024-11-30 17:16:16.0166667', N'2024-11-30 17:16:16.0166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'6', N'2024-11-30 10:17:08.0850000', N'2024-11-30 17:17:08.0866667', N'2024-11-30 17:17:08.0866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'6', N'2024-11-30 10:17:55.0050000', N'2024-11-30 17:17:55.0033333', N'2024-11-30 17:17:55.0033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'6', N'2024-11-30 10:18:05.2600000', N'2024-11-30 17:18:05.2600000', N'2024-11-30 17:18:05.2600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'6', N'2024-11-30 10:33:21.3110000', N'2024-11-30 17:33:21.3200000', N'2024-11-30 17:33:21.3200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'6', N'2024-11-30 10:55:10.0210000', N'2024-11-30 17:55:10.0200000', N'2024-11-30 17:55:10.0200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'6', N'2024-12-01 09:51:46.6330000', N'2024-12-01 16:51:46.6466667', N'2024-12-01 16:51:46.6466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'6', N'2024-12-02 12:34:50.5490000', N'2024-12-02 19:34:50.5500000', N'2024-12-02 19:34:50.5500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'7', N'2024-11-27 08:06:05.7570000', N'2024-11-27 15:06:05.7633333', N'2024-11-27 15:06:05.7633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'7', N'2024-11-27 08:06:24.7600000', N'2024-11-27 15:06:24.7600000', N'2024-11-27 15:06:24.7600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'7', N'2024-11-30 10:18:00.0980000', N'2024-11-30 17:18:00.0966667', N'2024-11-30 17:18:00.0966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'7', N'2024-11-30 10:33:22.4000000', N'2024-11-30 17:33:22.4000000', N'2024-11-30 17:33:22.4000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'8', N'2024-11-30 10:18:01.2370000', N'2024-11-30 17:18:01.2400000', N'2024-11-30 17:18:01.2400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'8', N'2024-11-30 10:27:07.6530000', N'2024-11-30 17:27:07.6533333', N'2024-11-30 17:27:07.6533333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'8', N'2024-11-30 10:33:23.1270000', N'2024-11-30 17:33:23.1300000', N'2024-11-30 17:33:23.1300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'9', N'2024-11-30 10:33:23.6800000', N'2024-11-30 17:33:23.6800000', N'2024-11-30 17:33:23.6800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'9', N'2024-11-30 10:50:35.9020000', N'2024-11-30 17:50:35.9000000', N'2024-11-30 17:50:35.9000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-29 14:34:11.4720000', N'2024-11-29 21:34:11.4733333', N'2024-11-29 21:34:11.4733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-29 15:49:26.7070000', N'2024-11-29 22:49:26.7100000', N'2024-11-29 22:49:26.7100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:26:42.3970000', N'2024-11-30 17:26:42.4000000', N'2024-11-30 17:26:42.4000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:27:00.2950000', N'2024-11-30 17:27:00.2966667', N'2024-11-30 17:27:00.2966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:30:41.7010000', N'2024-11-30 17:30:41.7066667', N'2024-11-30 17:30:41.7066667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:31:20.5820000', N'2024-11-30 17:31:20.5833333', N'2024-11-30 17:31:20.5833333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:32:16.4370000', N'2024-11-30 17:32:16.4400000', N'2024-11-30 17:32:16.4400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:32:22.7500000', N'2024-11-30 17:32:22.7900000', N'2024-11-30 17:32:22.7900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:32:27.6010000', N'2024-11-30 17:32:27.6000000', N'2024-11-30 17:32:27.6000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:32:33.7260000', N'2024-11-30 17:32:33.7266667', N'2024-11-30 17:32:33.7266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:35:56.1570000', N'2024-11-30 17:35:56.1566667', N'2024-11-30 17:35:56.1566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:35:57.8970000', N'2024-11-30 17:35:57.8966667', N'2024-11-30 17:35:57.8966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:36:23.9800000', N'2024-11-30 17:36:23.9800000', N'2024-11-30 17:36:23.9800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:36:38.5810000', N'2024-11-30 17:36:38.5700000', N'2024-11-30 17:36:38.5700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:36:49.0170000', N'2024-11-30 17:36:49.0100000', N'2024-11-30 17:36:49.0100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:38:30.8670000', N'2024-11-30 17:38:30.8633333', N'2024-11-30 17:38:30.8633333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:38:44.5730000', N'2024-11-30 17:38:44.5700000', N'2024-11-30 17:38:44.5700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:39:57.8130000', N'2024-11-30 17:39:57.8133333', N'2024-11-30 17:39:57.8133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:40:09.1240000', N'2024-11-30 17:40:09.1166667', N'2024-11-30 17:40:09.1166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:40:37.5160000', N'2024-11-30 17:40:37.5166667', N'2024-11-30 17:40:37.5166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:40:55.6370000', N'2024-11-30 17:40:55.6333333', N'2024-11-30 17:40:55.6333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:41:13.6550000', N'2024-11-30 17:41:13.6466667', N'2024-11-30 17:41:13.6466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:47:43.9840000', N'2024-11-30 17:47:43.9933333', N'2024-11-30 17:47:43.9933333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:48:04.1380000', N'2024-11-30 17:48:04.1333333', N'2024-11-30 17:48:04.1333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:49:50.3480000', N'2024-11-30 17:49:50.3500000', N'2024-11-30 17:49:50.3500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'10', N'2024-11-30 10:49:53.0550000', N'2024-11-30 17:49:53.0566667', N'2024-11-30 17:49:53.0566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'11', N'2024-11-30 10:49:51.6400000', N'2024-11-30 17:49:51.6366667', N'2024-11-30 17:49:51.6366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'11', N'2024-11-30 10:49:54.7740000', N'2024-11-30 17:49:54.7733333', N'2024-11-30 17:49:54.7733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'12', N'2024-11-29 14:34:15.7540000', N'2024-11-29 21:34:15.7533333', N'2024-11-29 21:34:15.7533333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'13', N'2024-11-27 23:02:40.7100000', N'2024-11-27 23:02:40.7100000', N'2024-11-27 23:02:40.7100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'15', N'2024-11-25 09:37:53.2540000', N'2024-11-25 16:37:53.2700000', N'2024-11-25 16:37:53.2700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'15', N'2024-11-27 08:06:25.8940000', N'2024-11-27 15:06:25.9000000', N'2024-11-27 15:06:25.9000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'15', N'2024-11-27 08:07:10.5710000', N'2024-11-27 15:07:10.5700000', N'2024-11-27 15:07:10.5700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'15', N'2024-11-30 10:26:56.5690000', N'2024-11-30 17:26:56.5700000', N'2024-11-30 17:26:56.5700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'15', N'2024-11-30 10:31:19.2010000', N'2024-11-30 17:31:19.2000000', N'2024-11-30 17:31:19.2000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'16', N'2024-11-25 09:37:59.8390000', N'2024-11-25 16:37:59.8433333', N'2024-11-25 16:37:59.8433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'16', N'2024-11-25 11:13:30.5480000', N'2024-11-25 18:13:30.5500000', N'2024-11-25 18:13:30.5500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'18', N'2024-11-27 23:02:44.8400000', N'2024-11-27 23:02:44.8400000', N'2024-11-27 23:02:44.8400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'18', N'2024-11-28 04:02:21.4800000', N'2024-11-28 11:02:21.4800000', N'2024-11-28 11:02:21.4800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'27', N'2024-11-27 22:38:00.6466667', N'2024-11-27 22:38:00.6466667', N'2024-11-27 22:38:00.6466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'27', N'2024-11-28 03:39:02.9360000', N'2024-11-28 10:39:02.9466667', N'2024-11-28 10:39:02.9466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'27', N'2024-11-30 02:19:20.8380000', N'2024-11-30 09:19:20.8400000', N'2024-11-30 09:19:20.8400000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'27', N'2024-11-30 02:20:09.4900000', N'2024-11-30 09:20:09.4900000', N'2024-11-30 09:20:09.4900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'29', N'2024-11-28 12:24:51.7450000', N'2024-11-28 19:24:51.7466667', N'2024-11-28 19:24:51.7466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'29', N'2024-11-29 13:19:07.7210000', N'2024-11-29 20:19:07.7266667', N'2024-11-29 20:19:07.7266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'29', N'2024-11-29 13:45:42.6250000', N'2024-11-29 20:45:42.6300000', N'2024-11-29 20:45:42.6300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'29', N'2024-11-30 10:55:21.6470000', N'2024-11-30 17:55:21.6500000', N'2024-11-30 17:55:21.6500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'30', N'2024-11-29 15:05:58.7180000', N'2024-11-29 22:05:58.7166667', N'2024-11-29 22:05:58.7166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'30', N'2024-11-29 15:06:27.0020000', N'2024-11-29 22:06:27.0000000', N'2024-11-29 22:06:27.0000000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'30', N'2024-11-30 10:30:04.1740000', N'2024-11-30 17:30:04.1733333', N'2024-11-30 17:30:04.1733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'30', N'2024-11-30 10:30:22.3340000', N'2024-11-30 17:30:22.3333333', N'2024-11-30 17:30:22.3333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'33', N'2024-11-29 15:06:33.5470000', N'2024-11-29 22:06:33.5466667', N'2024-11-29 22:06:33.5466667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'33', N'2024-11-30 10:30:15.3490000', N'2024-11-30 17:30:15.3433333', N'2024-11-30 17:30:15.3433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'34', N'2024-11-29 15:06:43.1670000', N'2024-11-29 22:06:43.1666667', N'2024-11-29 22:06:43.1666667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'36', N'2024-11-28 12:32:09.9760000', N'2024-11-28 19:32:09.9766667', N'2024-11-28 19:32:09.9766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'36', N'2024-11-29 15:05:41.6160000', N'2024-11-29 22:05:41.6133333', N'2024-11-29 22:05:41.6133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'38', N'2024-11-28 13:48:02.6700000', N'2024-11-28 20:48:02.6700000', N'2024-11-28 20:48:02.6700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'41', N'2024-11-28 13:48:10.6860000', N'2024-11-28 20:48:10.6966667', N'2024-11-28 20:48:10.6966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'41', N'2024-11-28 13:48:59.6560000', N'2024-11-28 20:48:59.6566667', N'2024-11-28 20:48:59.6566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'41', N'2024-11-29 13:18:12.0100000', N'2024-11-29 20:18:12.0266667', N'2024-11-29 20:18:12.0266667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'41', N'2024-11-29 14:56:46.8860000', N'2024-11-29 21:56:46.8866667', N'2024-11-29 21:56:46.8866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'41', N'2024-12-01 19:14:44.9970000', N'2024-12-02 02:14:45.0066667', N'2024-12-02 02:14:45.0066667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'41', N'2024-12-01 19:16:23.2050000', N'2024-12-02 02:16:23.2100000', N'2024-12-02 02:16:23.2100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'41', N'2024-12-01 19:18:11.0840000', N'2024-12-02 02:18:11.0966667', N'2024-12-02 02:18:11.0966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'41', N'2024-12-01 19:18:36.8870000', N'2024-12-02 02:18:36.8900000', N'2024-12-02 02:18:36.8900000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'41', N'2024-12-01 19:20:39.9750000', N'2024-12-02 02:20:39.9766667', N'2024-12-02 02:20:39.9766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'41', N'2024-12-01 19:21:59.3340000', N'2024-12-02 02:21:59.3333333', N'2024-12-02 02:21:59.3333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'41', N'2024-12-01 19:23:33.7690000', N'2024-12-02 02:23:33.7700000', N'2024-12-02 02:23:33.7700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'41', N'2024-12-01 19:24:04.0070000', N'2024-12-02 02:24:04.0100000', N'2024-12-02 02:24:04.0100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'41', N'2024-12-01 19:25:13.0480000', N'2024-12-02 02:25:13.0500000', N'2024-12-02 02:25:13.0500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'41', N'2024-12-01 19:25:55.4770000', N'2024-12-02 02:25:55.4766667', N'2024-12-02 02:25:55.4766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'41', N'2024-12-01 19:26:58.6570000', N'2024-12-02 02:26:58.6600000', N'2024-12-02 02:26:58.6600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'41', N'2024-12-01 19:27:09.1420000', N'2024-12-02 02:27:09.1433333', N'2024-12-02 02:27:09.1433333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'43', N'2024-11-28 13:49:01.4820000', N'2024-11-28 20:49:01.4800000', N'2024-11-28 20:49:01.4800000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'43', N'2024-11-30 10:55:13.6460000', N'2024-11-30 17:55:13.6500000', N'2024-11-30 17:55:13.6500000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'45', N'2024-11-30 10:30:36.2040000', N'2024-11-30 17:30:36.2033333', N'2024-11-30 17:30:36.2033333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'46', N'2024-11-29 13:44:54.3070000', N'2024-11-29 20:44:54.3100000', N'2024-11-29 20:44:54.3100000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'1', N'47', N'2024-11-30 10:30:30.6160000', N'2024-11-30 17:30:30.6133333', N'2024-11-30 17:30:30.6133333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'2', N'1', N'2024-11-28 02:01:23.8270000', N'2024-11-28 09:01:23.8300000', N'2024-11-28 09:01:23.8300000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'2', N'1', N'2024-11-28 02:04:30.8580000', N'2024-11-28 09:04:30.8566667', N'2024-11-28 09:04:30.8566667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'2', N'1', N'2024-12-05 17:06:40.1190000', N'2024-12-06 00:06:40.1200000', N'2024-12-06 00:06:40.1200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'2', N'2', N'2024-12-05 16:42:40.2610000', N'2024-12-05 23:42:40.2700000', N'2024-12-05 23:42:40.2700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'2', N'2', N'2024-12-05 16:42:52.3330000', N'2024-12-05 23:42:52.3333333', N'2024-12-05 23:42:52.3333333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'2', N'3', N'2024-11-28 02:03:10.4540000', N'2024-11-28 09:03:10.4533333', N'2024-11-28 09:03:10.4533333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'2', N'5', N'2024-11-28 02:03:59.9180000', N'2024-11-28 09:03:59.9200000', N'2024-11-28 09:03:59.9200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'2', N'5', N'2024-11-28 02:04:17.9360000', N'2024-11-28 09:04:17.9366667', N'2024-11-28 09:04:17.9366667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'2', N'5', N'2024-11-28 02:04:20.6590000', N'2024-11-28 09:04:20.6600000', N'2024-11-28 09:04:20.6600000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'2', N'5', N'2024-11-28 02:04:22.5720000', N'2024-11-28 09:04:22.5733333', N'2024-11-28 09:04:22.5733333')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'2', N'5', N'2024-11-28 02:04:24.3690000', N'2024-11-28 09:04:24.3700000', N'2024-11-28 09:04:24.3700000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'2', N'6', N'2024-11-28 02:04:10.9750000', N'2024-11-28 09:04:10.9766667', N'2024-11-28 09:04:10.9766667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'2', N'6', N'2024-11-28 02:04:19.3870000', N'2024-11-28 09:04:19.3866667', N'2024-11-28 09:04:19.3866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'2', N'6', N'2024-11-28 02:04:21.5940000', N'2024-11-28 09:04:21.5966667', N'2024-11-28 09:04:21.5966667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'2', N'6', N'2024-11-28 02:04:23.5190000', N'2024-11-28 09:04:23.5200000', N'2024-11-28 09:04:23.5200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'2', N'6', N'2024-11-28 02:04:25.0160000', N'2024-11-28 09:04:25.0200000', N'2024-11-28 09:04:25.0200000')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'2', N'6', N'2024-12-05 16:42:53.9860000', N'2024-12-05 23:42:53.9866667', N'2024-12-05 23:42:53.9866667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'2', N'30', N'2024-11-29 14:04:31.9150000', N'2024-11-29 21:04:31.9166667', N'2024-11-29 21:04:31.9166667')
GO

INSERT INTO [dbo].[user_listen_history] ([user_id], [track_id], [time], [created_at], [updated_at]) VALUES (N'2', N'41', N'2024-12-05 17:06:46.8450000', N'2024-12-06 00:06:46.8600000', N'2024-12-06 00:06:46.8600000')
GO


-- ----------------------------
-- Table structure for users
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type IN ('U'))
	DROP TABLE [dbo].[users]
GO

CREATE TABLE [dbo].[users] (
  [user_id] int  IDENTITY(1,1) NOT NULL,
  [user_name] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [user_password] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [user_email] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL,
  [user_profile_pic] nvarchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS DEFAULT '/uploads/profile/default.jpg' NULL,
  [user_role] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [created_at] datetime2(7) DEFAULT getdate() NOT NULL,
  [updated_at] datetime2(7) DEFAULT getdate() NOT NULL
)
GO

ALTER TABLE [dbo].[users] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of users
-- ----------------------------
SET IDENTITY_INSERT [dbo].[users] ON
GO

INSERT INTO [dbo].[users] ([user_id], [user_name], [user_password], [user_email], [user_profile_pic], [user_role], [created_at], [updated_at]) VALUES (N'1', N'admin', N'$2b$10$6XXMvsXVa1tfwxCpsgMSiu6cFQzTY80gFMdoshxTdDkxWdOkOn/hy', N'admin123@gmail.com', N'/images/profile/default.png', N'user', N'2024-11-07 08:55:22.7800000', N'2024-11-07 08:55:22.7800000')
GO

INSERT INTO [dbo].[users] ([user_id], [user_name], [user_password], [user_email], [user_profile_pic], [user_role], [created_at], [updated_at]) VALUES (N'2', N'Hloc', N'$2b$10$R53xgHd5KuIhc4GjJU3Liu1rJ/10mBxSfmak67vSj5S/I6K.LEpCi', N'dhl26052004@gmail.com', N'/images/profile/default.png', N'user', N'2024-11-28 09:00:37.5933333', N'2024-11-28 09:00:37.5933333')
GO

SET IDENTITY_INSERT [dbo].[users] OFF
GO


-- ----------------------------
-- Auto increment value for albums
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[albums]', RESEED, 4)
GO


-- ----------------------------
-- Primary Key structure for table albums
-- ----------------------------
ALTER TABLE [dbo].[albums] ADD CONSTRAINT [PK__albums__B0E1DDB28274A163] PRIMARY KEY CLUSTERED ([album_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table artist_perform
-- ----------------------------
ALTER TABLE [dbo].[artist_perform] ADD CONSTRAINT [artist_perform_pkey] PRIMARY KEY CLUSTERED ([artist_id], [track_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for artists
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[artists]', RESEED, 15)
GO


-- ----------------------------
-- Indexes structure for table artists
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [artists_artist_name_unique]
ON [dbo].[artists] (
  [artist_name] ASC
)
WHERE ([artist_name] IS NOT NULL)
GO

CREATE UNIQUE NONCLUSTERED INDEX [artists_artist_pic_path_unique]
ON [dbo].[artists] (
  [artist_pic_path] ASC
)
WHERE ([artist_pic_path] IS NOT NULL)
GO


-- ----------------------------
-- Primary Key structure for table artists
-- ----------------------------
ALTER TABLE [dbo].[artists] ADD CONSTRAINT [PK__artists__6CD040016FDEB520] PRIMARY KEY CLUSTERED ([artist_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for genres
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[genres]', RESEED, 31)
GO


-- ----------------------------
-- Indexes structure for table genres
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [genres_genre_name_unique]
ON [dbo].[genres] (
  [genre_name] ASC
)
WHERE ([genre_name] IS NOT NULL)
GO


-- ----------------------------
-- Primary Key structure for table genres
-- ----------------------------
ALTER TABLE [dbo].[genres] ADD CONSTRAINT [PK__genres__18428D4229585022] PRIMARY KEY CLUSTERED ([genre_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for knex_migrations
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[knex_migrations]', RESEED, 73)
GO


-- ----------------------------
-- Primary Key structure for table knex_migrations
-- ----------------------------
ALTER TABLE [dbo].[knex_migrations] ADD CONSTRAINT [PK__knex_mig__3213E83F4E2703C8] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for knex_migrations_lock
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[knex_migrations_lock]', RESEED, 1)
GO


-- ----------------------------
-- Primary Key structure for table knex_migrations_lock
-- ----------------------------
ALTER TABLE [dbo].[knex_migrations_lock] ADD CONSTRAINT [PK__knex_mig__1D0A334835AB4D4A] PRIMARY KEY CLUSTERED ([index])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for playlists
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[playlists]', RESEED, 16)
GO


-- ----------------------------
-- Primary Key structure for table playlists
-- ----------------------------
ALTER TABLE [dbo].[playlists] ADD CONSTRAINT [PK__playlist__FB9C1410F9A296C3] PRIMARY KEY CLUSTERED ([playlist_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table track_genre
-- ----------------------------
ALTER TABLE [dbo].[track_genre] ADD CONSTRAINT [track_genre_pkey] PRIMARY KEY CLUSTERED ([track_id], [genre_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table track_playlist
-- ----------------------------
ALTER TABLE [dbo].[track_playlist] ADD CONSTRAINT [track_playlist_pkey] PRIMARY KEY CLUSTERED ([track_id], [playlist_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for tracks
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[tracks]', RESEED, 50)
GO


-- ----------------------------
-- Checks structure for table tracks
-- ----------------------------
ALTER TABLE [dbo].[tracks] ADD CONSTRAINT [CK__tracks__track_du__32AB8735] CHECK ([track_duration]>(0))
GO


-- ----------------------------
-- Primary Key structure for table tracks
-- ----------------------------
ALTER TABLE [dbo].[tracks] ADD CONSTRAINT [PK__tracks__24ECC82E5D61FA44] PRIMARY KEY CLUSTERED ([track_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Checks structure for table user_follow_user
-- ----------------------------
ALTER TABLE [dbo].[user_follow_user] ADD CONSTRAINT [CK__user_follow_user__339FAB6E] CHECK ([user_id]<>[follow_id])
GO


-- ----------------------------
-- Primary Key structure for table user_follow_user
-- ----------------------------
ALTER TABLE [dbo].[user_follow_user] ADD CONSTRAINT [user_follow_user_pkey] PRIMARY KEY CLUSTERED ([user_id], [follow_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table user_like_album
-- ----------------------------
ALTER TABLE [dbo].[user_like_album] ADD CONSTRAINT [user_like_album_pkey] PRIMARY KEY CLUSTERED ([user_id], [album_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table user_like_artist
-- ----------------------------
ALTER TABLE [dbo].[user_like_artist] ADD CONSTRAINT [user_like_artist_pkey] PRIMARY KEY CLUSTERED ([user_id], [artist_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table user_like_playlist
-- ----------------------------
ALTER TABLE [dbo].[user_like_playlist] ADD CONSTRAINT [user_like_playlist_pkey] PRIMARY KEY CLUSTERED ([user_id], [playlist_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table user_like_track
-- ----------------------------
ALTER TABLE [dbo].[user_like_track] ADD CONSTRAINT [user_like_track_pkey] PRIMARY KEY CLUSTERED ([user_id], [track_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table user_listen_history
-- ----------------------------
ALTER TABLE [dbo].[user_listen_history] ADD CONSTRAINT [user_listen_history_pkey] PRIMARY KEY CLUSTERED ([user_id], [track_id], [time])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for users
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[users]', RESEED, 2)
GO


-- ----------------------------
-- Indexes structure for table users
-- ----------------------------
CREATE UNIQUE NONCLUSTERED INDEX [users_user_email_unique]
ON [dbo].[users] (
  [user_email] ASC
)
WHERE ([user_email] IS NOT NULL)
GO


-- ----------------------------
-- Checks structure for table users
-- ----------------------------
ALTER TABLE [dbo].[users] ADD CONSTRAINT [CK__users__user_pass__3493CFA7] CHECK (len([user_password])>=(8))
GO


-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE [dbo].[users] ADD CONSTRAINT [PK__users__B9BE370F1C9C2A36] PRIMARY KEY CLUSTERED ([user_id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table albums
-- ----------------------------
ALTER TABLE [dbo].[albums] ADD CONSTRAINT [albums_artist_id_foreign] FOREIGN KEY ([artist_id]) REFERENCES [dbo].[artists] ([artist_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table artist_perform
-- ----------------------------
ALTER TABLE [dbo].[artist_perform] ADD CONSTRAINT [artist_perform_artist_id_foreign] FOREIGN KEY ([artist_id]) REFERENCES [dbo].[artists] ([artist_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[artist_perform] ADD CONSTRAINT [artist_perform_track_id_foreign] FOREIGN KEY ([track_id]) REFERENCES [dbo].[tracks] ([track_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table playlists
-- ----------------------------
ALTER TABLE [dbo].[playlists] ADD CONSTRAINT [playlists_owner_id_foreign] FOREIGN KEY ([owner_id]) REFERENCES [dbo].[users] ([user_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table track_genre
-- ----------------------------
ALTER TABLE [dbo].[track_genre] ADD CONSTRAINT [track_genre_genre_id_foreign] FOREIGN KEY ([genre_id]) REFERENCES [dbo].[genres] ([genre_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[track_genre] ADD CONSTRAINT [track_genre_track_id_foreign] FOREIGN KEY ([track_id]) REFERENCES [dbo].[tracks] ([track_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table track_playlist
-- ----------------------------
ALTER TABLE [dbo].[track_playlist] ADD CONSTRAINT [track_playlist_track_id_foreign] FOREIGN KEY ([track_id]) REFERENCES [dbo].[tracks] ([track_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[track_playlist] ADD CONSTRAINT [track_playlist_playlist_id_foreign] FOREIGN KEY ([playlist_id]) REFERENCES [dbo].[playlists] ([playlist_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table tracks
-- ----------------------------
ALTER TABLE [dbo].[tracks] ADD CONSTRAINT [tracks_uploader_id_foreign] FOREIGN KEY ([uploader_id]) REFERENCES [dbo].[users] ([user_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[tracks] ADD CONSTRAINT [tracks_album_id_foreign] FOREIGN KEY ([album_id]) REFERENCES [dbo].[albums] ([album_id]) ON DELETE CASCADE ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table user_follow_user
-- ----------------------------
ALTER TABLE [dbo].[user_follow_user] ADD CONSTRAINT [user_follow_user_follow_id_foreign] FOREIGN KEY ([follow_id]) REFERENCES [dbo].[users] ([user_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[user_follow_user] ADD CONSTRAINT [user_follow_user_user_id_foreign] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([user_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table user_like_album
-- ----------------------------
ALTER TABLE [dbo].[user_like_album] ADD CONSTRAINT [user_like_album_album_id_foreign] FOREIGN KEY ([album_id]) REFERENCES [dbo].[albums] ([album_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[user_like_album] ADD CONSTRAINT [user_like_album_user_id_foreign] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([user_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table user_like_artist
-- ----------------------------
ALTER TABLE [dbo].[user_like_artist] ADD CONSTRAINT [user_like_artist_artist_id_foreign] FOREIGN KEY ([artist_id]) REFERENCES [dbo].[artists] ([artist_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[user_like_artist] ADD CONSTRAINT [user_like_artist_user_id_foreign] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([user_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table user_like_playlist
-- ----------------------------
ALTER TABLE [dbo].[user_like_playlist] ADD CONSTRAINT [user_like_playlist_user_id_foreign] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([user_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[user_like_playlist] ADD CONSTRAINT [user_like_playlist_playlist_id_foreign] FOREIGN KEY ([playlist_id]) REFERENCES [dbo].[playlists] ([playlist_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table user_like_track
-- ----------------------------
ALTER TABLE [dbo].[user_like_track] ADD CONSTRAINT [user_like_track_user_id_foreign] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([user_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[user_like_track] ADD CONSTRAINT [user_like_track_track_id_foreign] FOREIGN KEY ([track_id]) REFERENCES [dbo].[tracks] ([track_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table user_listen_history
-- ----------------------------
ALTER TABLE [dbo].[user_listen_history] ADD CONSTRAINT [user_listen_history_user_id_foreign] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users] ([user_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[user_listen_history] ADD CONSTRAINT [user_listen_history_track_id_foreign] FOREIGN KEY ([track_id]) REFERENCES [dbo].[tracks] ([track_id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

