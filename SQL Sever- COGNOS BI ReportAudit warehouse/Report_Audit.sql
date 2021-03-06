USE [master]
GO
/****** Object:  Database [Report_Audit]    Script Date: 4/16/2016 4:56:59 PM ******/
CREATE DATABASE [Report_Audit]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Report_Audit', FILENAME = N'F:\MSSQL12.COGNOSDEV\MSSQL\DATA\Report_Audit.mdf' , SIZE = 135168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Report_Audit_log', FILENAME = N'F:\MSSQL12.COGNOSDEV\MSSQL\DATA\Report_Audit_log.ldf' , SIZE = 270592KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Report_Audit] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Report_Audit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Report_Audit] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Report_Audit] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Report_Audit] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Report_Audit] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Report_Audit] SET ARITHABORT OFF 
GO
ALTER DATABASE [Report_Audit] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Report_Audit] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Report_Audit] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Report_Audit] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Report_Audit] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Report_Audit] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Report_Audit] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Report_Audit] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Report_Audit] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Report_Audit] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Report_Audit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Report_Audit] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Report_Audit] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Report_Audit] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Report_Audit] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Report_Audit] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Report_Audit] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Report_Audit] SET RECOVERY FULL 
GO
ALTER DATABASE [Report_Audit] SET  MULTI_USER 
GO
ALTER DATABASE [Report_Audit] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Report_Audit] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Report_Audit] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Report_Audit] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Report_Audit] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Report_Audit', N'ON'
GO
USE [Report_Audit]
GO
/****** Object:  User [CAMPUS\W0281253]    Script Date: 4/16/2016 4:56:59 PM ******/
CREATE USER [CAMPUS\W0281253] FOR LOGIN [CAMPUS\W0281253] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [CAMPUS\W0281253]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 4/16/2016 4:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[Date] [date] NULL,
	[FullDate] [char](10) NULL,
	[DayOfMonth] [int] NULL,
	[DaySuffix] [varchar](4) NULL,
	[DayName] [varchar](9) NULL,
	[DayOfWeek] [int] NULL,
	[DayOfWeekInMonth] [int] NULL,
	[DayOfWeekInYear] [int] NULL,
	[DayOfQuarter] [int] NULL,
	[DayOfYear] [int] NULL,
	[WeekOfMonth] [int] NULL,
	[WeekOfQuarter] [int] NULL,
	[WeekOfYear] [int] NULL,
	[Month] [int] NULL,
	[MonthName] [varchar](9) NULL,
	[MonthOfQuarter] [int] NULL,
	[Quarter] [int] NULL,
	[QuarterName] [varchar](9) NULL,
	[Year] [int] NULL,
	[YearName] [char](7) NULL,
	[MonthYear] [varchar](10) NULL,
	[FirstDayOfMonth] [date] NULL,
	[LastDayOfMonth] [date] NULL,
	[FirstDayOfQuarter] [date] NULL,
	[LastDayOfQuarter] [date] NULL,
	[FirstDayOfYear] [date] NULL,
	[LastDayOfYear] [date] NULL,
	[IsHoliday] [bit] NULL,
	[IsWeekday] [bit] NULL,
	[Holiday] [varchar](50) NULL,
	[FiscalDayOfYear] [varchar](3) NULL,
	[FiscalWeekOfYear] [varchar](3) NULL,
	[FiscalMonth] [varchar](2) NULL,
	[FiscalQuarter] [varchar](1) NULL,
	[FiscalQuarterName] [varchar](9) NULL,
	[FiscalYear] [varchar](4) NULL,
	[FiscalYearName] [varchar](10) NULL,
	[FiscalMonthYear] [varchar](10) NULL,
	[FiscalFirstDayOfMonth] [date] NULL,
	[FiscalLastDayOfMonth] [date] NULL,
	[FiscalFirstDayOfQuarter] [date] NULL,
	[FiscalLastDayOfQuarter] [date] NULL,
	[FiscalFirstDayOfYear] [date] NULL,
	[FiscalLastDayOfYear] [date] NULL,
 CONSTRAINT [pk_DateKey] PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimPerson]    Script Date: 4/16/2016 4:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimPerson](
	[PersonKey] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [varchar](255) NOT NULL,
	[Username] [varchar](255) NULL,
 CONSTRAINT [pk_person] PRIMARY KEY CLUSTERED 
(
	[PersonKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimReport]    Script Date: 4/16/2016 4:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimReport](
	[ReportKey] [int] IDENTITY(1,1) NOT NULL,
	[ReportName] [varchar](200) NOT NULL,
	[ReportPath] [varchar](300) NOT NULL,
	[ReportSubject] [varchar](100) NOT NULL,
 CONSTRAINT [pk_report] PRIMARY KEY CLUSTERED 
(
	[ReportKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimTime]    Script Date: 4/16/2016 4:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimTime](
	[TimeKey] [int] NOT NULL,
	[Time] [varchar](11) NOT NULL,
	[Time24] [time](0) NOT NULL,
	[HourName] [varchar](5) NOT NULL,
	[MinuteName] [varchar](5) NOT NULL,
	[Hour24] [tinyint] NOT NULL,
	[MinuteNumber] [tinyint] NOT NULL,
	[AM/PM] [char](2) NOT NULL,
	[ElapsedMinutes] [int] NOT NULL,
 CONSTRAINT [PK_DimTime_TimeKey] PRIMARY KEY CLUSTERED 
(
	[TimeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FactReportRun]    Script Date: 4/16/2016 4:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FactReportRun](
	[PersonKey] [int] NOT NULL,
	[ReportKey] [int] NOT NULL,
	[DateKey] [int] NOT NULL,
	[TimeKey] [int] NOT NULL,
	[Result] [varchar](255) NOT NULL,
	[Report_Runtime] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FactReportRun_LookUpErrors]    Script Date: 4/16/2016 4:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FactReportRun_LookUpErrors](
	[UserID] [varchar](255) NULL,
	[ReportName] [varchar](200) NULL,
	[ReportSubject] [varchar](100) NULL,
	[ReportPath] [varchar](300) NULL,
	[ReportRanOnDate] [varchar](20) NULL,
	[ReportRanOnTime] [varchar](10) NULL,
	[Task] [varchar](255) NULL,
	[ReportRuntime] [int] NULL,
	[Result] [varchar](255) NULL,
	[Person_Lookup_Error] [varchar](50) NULL,
	[Report_Lookup_Error] [varchar](50) NULL,
	[Date_Lookup_Error] [varchar](50) NULL,
	[Time_Lookup_Error] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FactReportRun_MaxDateTime]    Script Date: 4/16/2016 4:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FactReportRun_MaxDateTime](
	[Full_Max_DateKey] [int] NOT NULL,
	[Full_Max_Date] [date] NOT NULL,
	[Full_Max_TimeKey] [int] NOT NULL,
	[Full_Max_Time] [time](0) NOT NULL,
	[Max_Time_Less5MinutesKey] [int] NOT NULL,
	[Max_Time_Less5Minutes] [time](0) NOT NULL,
	[Table_Name] [varchar](100) NULL DEFAULT ('FactReportRun')
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[FactReportRun]  WITH CHECK ADD  CONSTRAINT [fk_DimDate_DateKey] FOREIGN KEY([DateKey])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[FactReportRun] CHECK CONSTRAINT [fk_DimDate_DateKey]
GO
ALTER TABLE [dbo].[FactReportRun]  WITH CHECK ADD  CONSTRAINT [fk_DimPerson_PersonKey] FOREIGN KEY([PersonKey])
REFERENCES [dbo].[DimPerson] ([PersonKey])
GO
ALTER TABLE [dbo].[FactReportRun] CHECK CONSTRAINT [fk_DimPerson_PersonKey]
GO
ALTER TABLE [dbo].[FactReportRun]  WITH CHECK ADD  CONSTRAINT [fk_DimReport_ReportKey] FOREIGN KEY([ReportKey])
REFERENCES [dbo].[DimReport] ([ReportKey])
GO
ALTER TABLE [dbo].[FactReportRun] CHECK CONSTRAINT [fk_DimReport_ReportKey]
GO
ALTER TABLE [dbo].[FactReportRun]  WITH CHECK ADD  CONSTRAINT [fk_DimTime_TimeKey] FOREIGN KEY([TimeKey])
REFERENCES [dbo].[DimTime] ([TimeKey])
GO
ALTER TABLE [dbo].[FactReportRun] CHECK CONSTRAINT [fk_DimTime_TimeKey]
GO
/****** Object:  StoredProcedure [dbo].[PopulateDimTime]    Script Date: 4/16/2016 4:56:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PopulateDimTime]
AS
SET NOCOUNT ON
DECLARE @ElapsedSeconds int
     , @MaxElapsedSeconds int
     , @Date datetime
     , @AMPM char(2)
     , @hour24 tinyint
     , @hour tinyint
     , @minute tinyint
     , @second int

SET @ElapsedSeconds = 0
SET @MaxElapsedSeconds = 60 * 60 * 24

WHILE @ElapsedSeconds < @MaxElapsedSeconds
BEGIN
     SET @Date = DATEADD(second, @ElapsedSeconds, CONVERT(DATETIME, '20160101'))
     SET @AMPM = RIGHT(CONVERT(varchar, @Date, 109), 2)
     SET @Hour24 = LEFT(CONVERT(TIME, @Date), 2)
     SET @hour = @hour24
     SET @minute = DATEPART(minute, @Date)
     SET @second = DATEPART(second, @Date)

     INSERT INTO [dbo].DimTime([TimeKey]
          , [Time]
          , [Time24]
          , [HourName]
          , [MinuteName]
          , [Hour24]
          , [MinuteNumber]
          , [AM/PM]
          , [ElapsedMinutes] ) 
     SELECT ((@Hour24 * 10000) + (@minute * 100) + @second) AS [TimeKey]
          , RIGHT('0'+ CONVERT(varchar(2), @hour), 2) + ':' + RIGHT('0'+ CONVERT(varchar(2), @minute), 2) + ':' + RIGHT('0'+ CONVERT(varchar(2), @second), 2) + ' ' + @AMPM AS [Time]
          , cast( @Date as Time(0)) AS [Time24]
          , RIGHT('0' + CONVERT(varchar(2), @hour), 2) + ' ' AS [HourName]
          , RIGHT('0' + CONVERT(varchar(2), @minute), 2)+ ' ' AS [MinuteName]
          , @hour24 AS [Hour24]
          , @minute AS [MinuteNumber]
          , @AMPM AS [AMPM]
          , @ElapsedSeconds / 60 AS [ElapsedMinutes]
     SET @ElapsedSeconds = @ElapsedSeconds + 1
END

GO
USE [master]
GO
ALTER DATABASE [Report_Audit] SET  READ_WRITE 
GO
