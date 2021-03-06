USE [master]
GO
/****** Object:  Database [GarageDb]    Script Date: 3/13/2020 12:09:18 PM ******/
CREATE DATABASE [GarageDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GarageDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\GarageDb.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GarageDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\GarageDb_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GarageDb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GarageDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GarageDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GarageDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GarageDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GarageDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GarageDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [GarageDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GarageDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GarageDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GarageDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GarageDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GarageDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GarageDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GarageDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GarageDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GarageDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GarageDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GarageDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GarageDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GarageDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GarageDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GarageDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GarageDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GarageDb] SET RECOVERY FULL 
GO
ALTER DATABASE [GarageDb] SET  MULTI_USER 
GO
ALTER DATABASE [GarageDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GarageDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GarageDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GarageDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [GarageDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GarageDb', N'ON'
GO
USE [GarageDb]
GO
/****** Object:  Table [dbo].[tbl_Admin]    Script Date: 3/13/2020 12:09:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[Contact] [varchar](250) NULL,
	[Address] [varchar](250) NULL,
	[AddedBy] [varchar](50) NULL,
	[DateAdded] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
	[DateUpdated] [datetime] NULL,
	[CityID] [int] NULL,
	[CountryID] [int] NULL,
 CONSTRAINT [PK_tbl_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_City]    Script Date: 3/13/2020 12:09:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_City](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CountryID] [int] NULL,
 CONSTRAINT [PK_tbl_City] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Country]    Script Date: 3/13/2020 12:09:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Country](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Country] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Admin] ON 

INSERT [dbo].[tbl_Admin] ([AdminID], [Name], [Contact], [Address], [AddedBy], [DateAdded], [UpdatedBy], [DateUpdated], [CityID], [CountryID]) VALUES (3, N'Shahadat', N'01303104401', N'Sukrabad', N'9', CAST(N'2020-03-11 11:06:39.287' AS DateTime), N'9', CAST(N'2020-03-12 17:15:20.697' AS DateTime), 1, 1)
INSERT [dbo].[tbl_Admin] ([AdminID], [Name], [Contact], [Address], [AddedBy], [DateAdded], [UpdatedBy], [DateUpdated], [CityID], [CountryID]) VALUES (5, N'Rocky', N'01722358099', N'Mohakhali', N'9', CAST(N'2020-03-11 16:18:24.443' AS DateTime), N'9', CAST(N'2020-03-12 17:42:08.990' AS DateTime), 12, 3)
INSERT [dbo].[tbl_Admin] ([AdminID], [Name], [Contact], [Address], [AddedBy], [DateAdded], [UpdatedBy], [DateUpdated], [CityID], [CountryID]) VALUES (23, N'Arif', N'01852356894', N'Saydabad', N'9', CAST(N'2020-03-12 16:17:40.920' AS DateTime), N'9', CAST(N'2020-03-13 10:22:04.343' AS DateTime), 1, 1)
INSERT [dbo].[tbl_Admin] ([AdminID], [Name], [Contact], [Address], [AddedBy], [DateAdded], [UpdatedBy], [DateUpdated], [CityID], [CountryID]) VALUES (24, N'Mr. A ', N'01245758595', N'Rock City', N'9', CAST(N'2020-03-12 16:51:30.093' AS DateTime), N'9', CAST(N'2020-03-13 10:23:15.157' AS DateTime), 7, 2)
SET IDENTITY_INSERT [dbo].[tbl_Admin] OFF
SET IDENTITY_INSERT [dbo].[tbl_City] ON 

INSERT [dbo].[tbl_City] ([ID], [Name], [CountryID]) VALUES (1, N'Dhaka', 1)
INSERT [dbo].[tbl_City] ([ID], [Name], [CountryID]) VALUES (2, N'Bogura', 1)
INSERT [dbo].[tbl_City] ([ID], [Name], [CountryID]) VALUES (3, N'Rangpur', 1)
INSERT [dbo].[tbl_City] ([ID], [Name], [CountryID]) VALUES (4, N'Pabna', 1)
INSERT [dbo].[tbl_City] ([ID], [Name], [CountryID]) VALUES (7, N'Mumbai', 2)
INSERT [dbo].[tbl_City] ([ID], [Name], [CountryID]) VALUES (8, N'Delhi', 2)
INSERT [dbo].[tbl_City] ([ID], [Name], [CountryID]) VALUES (9, N'Bangalore', 2)
INSERT [dbo].[tbl_City] ([ID], [Name], [CountryID]) VALUES (10, N'Hyderabad', 2)
INSERT [dbo].[tbl_City] ([ID], [Name], [CountryID]) VALUES (11, N'New York', 3)
INSERT [dbo].[tbl_City] ([ID], [Name], [CountryID]) VALUES (12, N'Los Angeles', 3)
INSERT [dbo].[tbl_City] ([ID], [Name], [CountryID]) VALUES (13, N'Chicago', 3)
INSERT [dbo].[tbl_City] ([ID], [Name], [CountryID]) VALUES (14, N'Houston', 3)
SET IDENTITY_INSERT [dbo].[tbl_City] OFF
SET IDENTITY_INSERT [dbo].[tbl_Country] ON 

INSERT [dbo].[tbl_Country] ([ID], [Name]) VALUES (1, N'Bangladesh')
INSERT [dbo].[tbl_Country] ([ID], [Name]) VALUES (2, N'India')
INSERT [dbo].[tbl_Country] ([ID], [Name]) VALUES (3, N'USA')
SET IDENTITY_INSERT [dbo].[tbl_Country] OFF
ALTER TABLE [dbo].[tbl_Admin]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Admin_tbl_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[tbl_City] ([ID])
GO
ALTER TABLE [dbo].[tbl_Admin] CHECK CONSTRAINT [FK_tbl_Admin_tbl_City]
GO
ALTER TABLE [dbo].[tbl_Admin]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Admin_tbl_Country1] FOREIGN KEY([CountryID])
REFERENCES [dbo].[tbl_Country] ([ID])
GO
ALTER TABLE [dbo].[tbl_Admin] CHECK CONSTRAINT [FK_tbl_Admin_tbl_Country1]
GO
ALTER TABLE [dbo].[tbl_City]  WITH CHECK ADD  CONSTRAINT [FK_tbl_City_tbl_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[tbl_Country] ([ID])
GO
ALTER TABLE [dbo].[tbl_City] CHECK CONSTRAINT [FK_tbl_City_tbl_Country]
GO
/****** Object:  StoredProcedure [dbo].[CREATE_SP]    Script Date: 3/13/2020 12:09:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC CREATE_SP 'Inv_FabricRollMaster','RollMasterID'
Create PROCEDURE [dbo].[CREATE_SP]
--DECLARE @TableName VARCHAR(50)='Product',@PrimaryColumnName VARCHAR(150)='ProductID'
@TableName VARCHAR(200)='',
@PrimaryColumnName VARCHAR(150)=''

AS

CREATE TABLE #tablColumn(ID INT IDENTITY, ColName VARCHAR(50),ColType VARCHAR(50),ColLen VARCHAR(50))

INSERT INTO #tablColumn
SELECT COLUMN_NAME,DATA_TYPE,
CASE WHEN UPPER(DATA_TYPE) IN('NUMERIC','DECIMAL') THEN CAST(NUMERIC_PRECISION AS VARCHAR(50))+','+ CAST(NUMERIC_SCALE AS VARCHAR(50))
ELSE CAST(CHARACTER_MAXIMUM_LENGTH AS VARCHAR(50)) END CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = @TableName

SET NOCOUNT ON

DECLARE @NewLineChar AS CHAR(2) = CHAR(13) + CHAR(10)
DECLARE @ID INT = 1, @COUNT INT,@ColName VARCHAR(50)='',@ColType VARCHAR(50)='',@ColLen VARCHAR(50) = 0,
@DeclareSection VARCHAR(MAX)='',
@SaveSection VARCHAR(MAX)='',
@UpdateSection VARCHAR(MAX)='',
@LoadAllSection VARCHAR(MAX)='',
@LoadSelectedSection VARCHAR(MAX)='',
@DeleteSelectedSection VARCHAR(MAX)='',
@ColumnNames VARCHAR(MAX),
@SaveColumnNames VARCHAR(MAX),
@UpdateColumnNames VARCHAR(MAX),
@VariableNames VARCHAR(MAX),
@SaveVariableNames  VARCHAR(MAX)

SELECT @ColumnNames = COALESCE(@ColumnNames + ', ', '') + ColName,@VariableNames = COALESCE(@VariableNames + ', ', '') +'@'+ColName
FROM #tablColumn
WHERE ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')

SELECT @SaveColumnNames = COALESCE(@SaveColumnNames + ',', '') + ColName,@SaveVariableNames = COALESCE(@SaveVariableNames + ', ', '') +'@'+ColName
FROM #tablColumn
WHERE ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
AND ColName <> @PrimaryColumnName

SET @COUNT = (SELECT COUNT(*) FROM #tablColumn)
SET @DeclareSection += 'CREATE PROCEDURE SP_SET_'+UPPER(@TableName)+@NewLineChar+'@QryOption AS INT = -1,'+@NewLineChar
SET @SaveSection = 'IF @QryOption = @SAVE_DATA'+@NewLineChar+
'BEGIN'+@NewLineChar+
' INSERT INTO '+@TableName+'('+@SaveColumnNames+',AddedBy,DateAdded) VALUES('+@SaveVariableNames+',@AddedBy,GETDATE())'+@NewLineChar+
'END'+@NewLineChar

SELECT @UpdateColumnNames = COALESCE(@UpdateColumnNames + ', ', '') + ColName+' = @'+ColName
FROM #tablColumn
WHERE ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated') AND ColName <> @PrimaryColumnName

SET @UpdateSection = 'ELSE IF @QryOption = @UPDATE_DATA'+@NewLineChar+
'BEGIN'+@NewLineChar+
' UPDATE '+@TableName + ' SET '+ @UpdateColumnNames+', UpdatedBy=@AddedBy, DateUpdated = GETDATE()'+@NewLineChar+
' WHERE '+@PrimaryColumnName +' = @'+@PrimaryColumnName+@NewLineChar+
'END'+@NewLineChar

SET @LoadAllSection = 'ELSE IF @QryOption = @LOAD_ALL_DATA'+@NewLineChar+
'BEGIN'+@NewLineChar+
' SELECT '+@ColumnNames+@NewLineChar+
' FROM '+@TableName+@NewLineChar+
'END'+@NewLineChar

SET @LoadSelectedSection = 'ELSE IF @QryOption = @LOAD_SELECTED_DATA'+@NewLineChar+
'BEGIN'+@NewLineChar+
' SELECT '+@ColumnNames+@NewLineChar+
' FROM '+@TableName+@NewLineChar+
' WHERE '+@PrimaryColumnName +' = @'+@PrimaryColumnName+@NewLineChar+
'END'+@NewLineChar

SET @DeleteSelectedSection = 'ELSE IF @QryOption = @DELETE_DATA'+@NewLineChar+
'BEGIN'+@NewLineChar+
' DELETE FROM '+@TableName+@NewLineChar+
' WHERE '+@PrimaryColumnName +' = @'+@PrimaryColumnName+@NewLineChar+
'END'+@NewLineChar

WHILE @ID <= @COUNT
BEGIN
SELECT @ColName = ColName,@ColType = ColType,@ColLen = ColLen FROM #tablColumn WHERE ID = @ID

IF UPPER(@ColType) = 'INT' AND @ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
BEGIN
SET @DeclareSection += '@'+@ColName +' INT = -1,'+@NewLineChar
END
ELSE IF UPPER(@ColType) = 'VARCHAR' AND @ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
BEGIN
SET @DeclareSection += '@'+@ColName +' VARCHAR('+@ColLen+') = '''','+@NewLineChar
END
ELSE IF UPPER(@ColType) = 'BIT' AND @ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
BEGIN
SET @DeclareSection += '@'+@ColName +' BIT = 0,'+@NewLineChar
END
ELSE IF UPPER(@ColType) = 'DECIMAL' AND @ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
BEGIN
SET @DeclareSection += '@'+@ColName +' DECIMAL('+@ColLen+') = 0.00,'+@NewLineChar
END
ELSE IF UPPER(@ColType) = 'NUMERIC' AND @ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
BEGIN
SET @DeclareSection += '@'+@ColName +' NUMERIC('+@ColLen+') = 0.00,'+@NewLineChar
END
ELSE IF UPPER(@ColType) = 'NVARCHAR' AND @ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
BEGIN
SET @DeclareSection += '@'+@ColName +' NVARCHAR('+@ColLen+') = '''','+@NewLineChar
END
ELSE IF UPPER(@ColType) ='DATE' AND @ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
BEGIN
SET @DeclareSection += '@'+@ColName +' DATE = ''1/1/1900'','+@NewLineChar
END
ELSE IF UPPER(@ColType) = 'DATETIME' AND @ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
BEGIN
SET @DeclareSection += '@'+@ColName +' DATETIME = ''1/1/1900'','+@NewLineChar
END
ELSE IF UPPER(@ColType) = 'BIGINT' AND @ColName NOT IN ('AddedBy','DateAdded','UpdatedBy','DateUpdated')
BEGIN
SET @DeclareSection += '@'+@ColName +' BIGINT = -1,'+@NewLineChar
END

SET @ID += 1
END

SET @DeclareSection += '@AddedBy VARCHAR(50) = '''''+@NewLineChar

SET @DeclareSection +='AS'+@NewLineChar+@NewLineChar+'DECLARE @SAVE_DATA INT = -1,
@UPDATE_DATA INT = -1,
@LOAD_ALL_DATA INT = -1,
@LOAD_SELECTED_DATA INT = -1,
@DELETE_DATA INT = -1

SET @SAVE_DATA = 1
SET @UPDATE_DATA=2
SET @LOAD_ALL_DATA=3
SET @LOAD_SELECTED_DATA=4
SET @DELETE_DATA=5'+@NewLineChar+@NewLineChar

PRINT @DeclareSection
PRINT @SaveSection
PRINT @UpdateSection
PRINT @LoadAllSection
PRINT @LoadSelectedSection
PRINT @DeleteSelectedSection

DROP TABLE #tablColumn
GO
/****** Object:  StoredProcedure [dbo].[SP_SET_TBL_ADMIN]    Script Date: 3/13/2020 12:09:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SET_TBL_ADMIN]
@QryOption AS INT = -1,
@AdminID INT = -1,
@Name VARCHAR(250) = '',
@Contact VARCHAR(250) = '',
@Address VARCHAR(250) = '',
@AddedBy VARCHAR(50) = '',
@CountryID INT = -1,
@CityID INT =-1
AS

DECLARE @SAVE_DATA INT = -1,
@UPDATE_DATA INT = -1,
@LOAD_ALL_DATA INT = -1,
@LOAD_SELECTED_DATA INT = -1,
@DELETE_DATA INT = -1,
@LoadDDLMasterData INT = -1,
@LoadDDLCityData INT = -1

SET @SAVE_DATA = 1
SET @UPDATE_DATA=2
SET @LOAD_ALL_DATA=3
SET @LOAD_SELECTED_DATA=4
SET @DELETE_DATA=5
SET @LoadDDLMasterData=6
SET @LoadDDLCityData=7

IF @QryOption = @SAVE_DATA
BEGIN
 INSERT INTO tbl_Admin(Name,Contact,Address, CityID, CountryID, AddedBy, DateAdded) 
 VALUES(@Name, @Contact, @Address, @CityID, @CountryID,@AddedBy, GETDATE())
END
ELSE IF @QryOption = @UPDATE_DATA
BEGIN
 UPDATE tbl_Admin SET Name = @Name, Contact = @Contact, Address = @Address, CountryID=@CountryID, CityID=@CityID, UpdatedBy=@AddedBy, DateUpdated = GETDATE()
 WHERE AdminID = @AdminID
END
ELSE IF @QryOption = @LOAD_ALL_DATA
BEGIN
 SELECT AdminID, a.Name, Contact, Address, a.CountryID, CityID, ISNULL(c.Name, '') CountryName, ISNULL(s.Name, '') CityName
	 FROM tbl_Admin a
	 LEFT JOIN tbl_Country c ON c.ID = a.CountryID
	 LEFT JOIN tbl_City s ON s.ID = a.CityID
END
ELSE IF @QryOption = @LOAD_SELECTED_DATA
BEGIN
 SELECT AdminID, Name, Contact, Address, CountryID, CityID
 FROM tbl_Admin
 WHERE AdminID = @AdminID
END
ELSE IF @QryOption = @DELETE_DATA
BEGIN
 DELETE FROM tbl_Admin
 WHERE AdminID = @AdminID
END
ELSE IF @QryOption = @LoadDDLMasterData
BEGIN
	 select ID Code, Name Value
	from tbl_Country
END
ELSE IF @QryOption = @LoadDDLCityData
BEGIN
	 select ID Code, Name Value 
	 from tbl_City
	 where CountryID = @CountryID
	
END
GO
USE [master]
GO
ALTER DATABASE [GarageDb] SET  READ_WRITE 
GO
