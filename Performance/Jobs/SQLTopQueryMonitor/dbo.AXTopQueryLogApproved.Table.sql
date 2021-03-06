IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AXTopQueryLogApproved_ApprovedText]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AXTopQueryLogApproved] DROP CONSTRAINT [DF_AXTopQueryLogApproved_ApprovedText]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AXTopQueryLogApproved_IsApprovedQuery]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AXTopQueryLogApproved] DROP CONSTRAINT [DF_AXTopQueryLogApproved_IsApprovedQuery]
END
GO
/****** Object:  Table [dbo].[AXTopQueryLogApproved]    Script Date: 5/23/2021 7:09:06 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AXTopQueryLogApproved]') AND type in (N'U'))
DROP TABLE [dbo].[AXTopQueryLogApproved]
GO
/****** Object:  Table [dbo].[AXTopQueryLogApproved]    Script Date: 5/23/2021 7:09:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AXTopQueryLogApproved](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LogDateTime] [datetime] NOT NULL,
	[DataBase] [nvarchar](128) NOT NULL,
	[TEXT] [nvarchar](max) NOT NULL,
	[query_hash] [binary](8) NOT NULL,
	[query_plan_hash] [binary](8) NOT NULL,
	[IsApprovedQuery] [int] NOT NULL,
	[ApprovedText] [nvarchar](128) NOT NULL,
	[ApprovedDate] [datetime] NULL,
 CONSTRAINT [PK_AXTopQueryLogApproved] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AXTopQueryLogApproved] ADD  CONSTRAINT [DF_AXTopQueryLogApproved_IsApprovedQuery]  DEFAULT ((0)) FOR [IsApprovedQuery]
GO
ALTER TABLE [dbo].[AXTopQueryLogApproved] ADD  CONSTRAINT [DF_AXTopQueryLogApproved_ApprovedText]  DEFAULT ('') FOR [ApprovedText]
GO
