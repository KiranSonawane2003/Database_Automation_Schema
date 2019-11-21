CREATE TABLE [dbo].[TransactionAPIDetailsReportFilter](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MasterReportId] [bigint] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[IsEmailReport] [bit] NULL,
	[Email] [nvarchar](100) NULL,
	[ReportFilePath] [nvarchar](200) NULL,
	[FileSize] [decimal](18, 2) NULL,
	[ReportFormat] [int] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_TransactionAPIDetailsReportFilter_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionAPIDetailsReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_TransactionAPIDetailsReportFilter_Country1] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionAPIDetailsReportFilter] CHECK CONSTRAINT [FK_TransactionAPIDetailsReportFilter_Country1]
GO
ALTER TABLE [dbo].[TransactionAPIDetailsReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_TransactionAPIDetailsReportFilter_MasterReport1] FOREIGN KEY([MasterReportId])
REFERENCES [dbo].[MasterReport] ([Id])
GO

ALTER TABLE [dbo].[TransactionAPIDetailsReportFilter] CHECK CONSTRAINT [FK_TransactionAPIDetailsReportFilter_MasterReport1]
GO
ALTER TABLE [dbo].[TransactionAPIDetailsReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_TransactionAPIDetailsReportFilter_Users2] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionAPIDetailsReportFilter] CHECK CONSTRAINT [FK_TransactionAPIDetailsReportFilter_Users2]
GO
ALTER TABLE [dbo].[TransactionAPIDetailsReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_TransactionAPIDetailsReportFilter_Users3] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionAPIDetailsReportFilter] CHECK CONSTRAINT [FK_TransactionAPIDetailsReportFilter_Users3]
GO
ALTER TABLE [dbo].[TransactionAPIDetailsReportFilter] ADD  CONSTRAINT [DF_TransactionAPIDetailsReportFilter_IsEmailReport_1]  DEFAULT ((0)) FOR [IsEmailReport]
GO
ALTER TABLE [dbo].[TransactionAPIDetailsReportFilter] ADD  CONSTRAINT [DF_TransactionAPIDetailsReportFilter_IsActive_1]  DEFAULT ((1)) FOR [IsActive]