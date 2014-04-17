USE [exchange_market]
GO

/****** Object:  Table [dbo].[order]    Script Date: 04/17/2014 16:18:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[order]') AND type in (N'U'))
DROP TABLE [dbo].[order]
GO

CREATE TABLE [dbo].[order](
	[orderid] [int] IDENTITY(1,1) NOT NULL,
	[sellerid] [int] NOT NULL,
	[buyerid] [int] NULL,
	[sellgoods] [nchar](10) NULL,
	[exchangegoods] [nchar](10) NULL,
	[status] [int] NOT NULL,
	[lastactiontime] [datetime] NOT NULL
) ON [PRIMARY]

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[user]') AND type in (N'U'))
DROP TABLE [dbo].[user]
GO

CREATE TABLE [dbo].[user](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[position] [nchar](10) NULL,
	[account] [nchar](10) NULL,
	[name] [nchar](10) NULL,
	[emailaddress] [int] NOT NULL,
	[mobile] [nchar](10) NULL,
	[secondphone] [nchar](10) NULL
) ON [PRIMARY]

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[goods]') AND type in (N'U'))
DROP TABLE [dbo].[goods]
GO

CREATE TABLE [dbo].[goods](
	[goodsid] [int] IDENTITY(1,1) NOT NULL,
	[goodsname] [nchar](10) NOT NULL,
	[price] [int] NULL,
	[description] [nchar](10) NULL
) ON [PRIMARY]

GO


