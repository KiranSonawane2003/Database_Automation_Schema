CREATE TABLE [dbo].[InsuranceLeadReportFilter](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[IsCreateDate] [bit] NULL,
	[IsEmailReport] [bit] NULL,
	[Email] [nvarchar](100) NULL,
	[ReportFilePath] [nvarchar](200) NULL,
	[CopiedFrom] [bigint] NULL,
	[CountryId] [bigint] NULL,
	[ReportFormat] [tinyint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[FileSize] [decimal](18, 2) NULL,
	[MasterReportId] [bigint] NULL,
 CONSTRAINT [PK_InsuranceLeadReportFilter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InsuranceLeadReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceLeadReportFilter_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[InsuranceLeadReportFilter] CHECK CONSTRAINT [FK_InsuranceLeadReportFilter_Country]
GO
ALTER TABLE [dbo].[InsuranceLeadReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceLeadReportFilter_MasterReport] FOREIGN KEY([MasterReportId])
REFERENCES [dbo].[MasterReport] ([Id])
GO

ALTER TABLE [dbo].[InsuranceLeadReportFilter] CHECK CONSTRAINT [FK_InsuranceLeadReportFilter_MasterReport]
GO
ALTER TABLE [dbo].[InsuranceLeadReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceLeadReportFilter_Users_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[InsuranceLeadReportFilter] CHECK CONSTRAINT [FK_InsuranceLeadReportFilter_Users_CreatedBy]
GO
ALTER TABLE [dbo].[InsuranceLeadReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceLeadReportFilter_Users_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[InsuranceLeadReportFilter] CHECK CONSTRAINT [FK_InsuranceLeadReportFilter_Users_ModifiedBy]
GO
ALTER TABLE [dbo].[InsuranceLeadReportFilter] ADD  DEFAULT ((0)) FOR [IsEmailReport]
GO
ALTER TABLE [dbo].[InsuranceLeadReportFilter] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[InsuranceLeadReportFilter] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]