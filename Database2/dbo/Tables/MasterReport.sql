CREATE TABLE [dbo].[MasterReport](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ReportName] [nvarchar](50) NULL,
	[ReportNameEnum] [nvarchar](50) NULL,
	[IsEmailReport] [bit] NOT NULL,
	[Email] [nvarchar](100) NULL,
	[ReportFilePath] [nvarchar](200) NULL,
	[FileSize] [decimal](18, 2) NULL,
	[CountryId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[IsSavedCriteria] [bit] NULL,
	[Notes] [nvarchar](2000) NULL,
 CONSTRAINT [PK_MasterReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MasterReport]  WITH CHECK ADD  CONSTRAINT [FK_MasterReport_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[MasterReport] CHECK CONSTRAINT [FK_MasterReport_Country]
GO
ALTER TABLE [dbo].[MasterReport]  WITH CHECK ADD  CONSTRAINT [FK_MasterReport_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[MasterReport] CHECK CONSTRAINT [FK_MasterReport_Users]
GO
ALTER TABLE [dbo].[MasterReport]  WITH CHECK ADD  CONSTRAINT [FK_MasterReport_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[MasterReport] CHECK CONSTRAINT [FK_MasterReport_Users1]
GO
ALTER TABLE [dbo].[MasterReport] ADD  DEFAULT ((0)) FOR [IsEmailReport]
GO
ALTER TABLE [dbo].[MasterReport] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MasterReport] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]