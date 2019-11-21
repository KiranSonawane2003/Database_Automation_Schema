CREATE TABLE [dbo].[DOCReportFilter](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IncludeUninceptedDeals] [bit] NULL,
	[IncludeCashTransactions] [bit] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[IsCreateDate] [bit] NULL,
	[IsInceptDate] [bit] NULL,
	[IsInvoiceDate] [bit] NULL,
	[IsInvoicePaidDate] [bit] NULL,
	[AdministratorId] [bigint] NULL,
	[ClaimId] [bigint] NULL,
	[OwnerId] [bigint] NULL,
	[UnderwriterId] [bigint] NULL,
	[IsIncludeTarget] [bit] NULL,
	[IsIncludeRollover] [bit] NULL,
	[IsEmailReport] [bit] NULL,
	[Email] [nvarchar](100) NULL,
	[SummaryPageId] [bigint] NULL,
	[GraphPageId] [bigint] NULL,
	[ReportFilePath] [nvarchar](200) NULL,
	[CopiedFrom] [bigint] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[FileSize] [decimal](18, 2) NULL,
	[MasterReportId] [bigint] NULL,
	[IsReportServiceFlag] [int] NULL,
	[IsSummaryReport] [bit] NULL,
	[IsUnAssignedBusinessManager] [bit] NULL,
	[IsUnAssignedSalesPerson] [bit] NULL,
 CONSTRAINT [DOCReportFilter_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DOCReportFilter]  WITH CHECK ADD  CONSTRAINT [DOCReportFilter_FK_CompanyCompanyTypeMappingAdministratorId] FOREIGN KEY([AdministratorId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[DOCReportFilter] CHECK CONSTRAINT [DOCReportFilter_FK_CompanyCompanyTypeMappingAdministratorId]
GO
ALTER TABLE [dbo].[DOCReportFilter]  WITH CHECK ADD  CONSTRAINT [DOCReportFilter_FK_CompanyCompanyTypeMappingClaimId] FOREIGN KEY([ClaimId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[DOCReportFilter] CHECK CONSTRAINT [DOCReportFilter_FK_CompanyCompanyTypeMappingClaimId]
GO
ALTER TABLE [dbo].[DOCReportFilter]  WITH CHECK ADD  CONSTRAINT [DOCReportFilter_FK_CompanyCompanyTypeMappingOwnerId] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[DOCReportFilter] CHECK CONSTRAINT [DOCReportFilter_FK_CompanyCompanyTypeMappingOwnerId]
GO
ALTER TABLE [dbo].[DOCReportFilter]  WITH CHECK ADD  CONSTRAINT [DOCReportFilter_FK_CompanyCompanyTypeMappingUnderwriterId] FOREIGN KEY([UnderwriterId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[DOCReportFilter] CHECK CONSTRAINT [DOCReportFilter_FK_CompanyCompanyTypeMappingUnderwriterId]
GO
ALTER TABLE [dbo].[DOCReportFilter]  WITH CHECK ADD  CONSTRAINT [DOCReportFilter_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[DOCReportFilter] CHECK CONSTRAINT [DOCReportFilter_FK_Country]
GO
ALTER TABLE [dbo].[DOCReportFilter]  WITH CHECK ADD  CONSTRAINT [DOCReportFilter_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[DOCReportFilter] CHECK CONSTRAINT [DOCReportFilter_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[DOCReportFilter]  WITH CHECK ADD  CONSTRAINT [DOCReportFilter_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[DOCReportFilter] CHECK CONSTRAINT [DOCReportFilter_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[DOCReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_DOCReportFilter_MasterReport] FOREIGN KEY([MasterReportId])
REFERENCES [dbo].[MasterReport] ([Id])
GO

ALTER TABLE [dbo].[DOCReportFilter] CHECK CONSTRAINT [FK_DOCReportFilter_MasterReport]
GO
ALTER TABLE [dbo].[DOCReportFilter] ADD  CONSTRAINT [DF_DOCReportFilter_IncludeUninceptedDeals]  DEFAULT ((0)) FOR [IncludeUninceptedDeals]
GO
ALTER TABLE [dbo].[DOCReportFilter] ADD  CONSTRAINT [DF_DOCReportFilter_IncludeCashTransactions]  DEFAULT ((0)) FOR [IncludeCashTransactions]
GO
ALTER TABLE [dbo].[DOCReportFilter] ADD  CONSTRAINT [DF_DOCReportFilter_IsIncludeTarget]  DEFAULT ((0)) FOR [IsIncludeTarget]
GO
ALTER TABLE [dbo].[DOCReportFilter] ADD  CONSTRAINT [DF_DOCReportFilter_IsIncludeRollover]  DEFAULT ((0)) FOR [IsIncludeRollover]
GO
ALTER TABLE [dbo].[DOCReportFilter] ADD  CONSTRAINT [DF_DOCReportFilter_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DOCReportFilter] ADD  CONSTRAINT [DF_DOCReportFilter_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[DOCReportFilter] ADD  DEFAULT ((0)) FOR [IsSummaryReport]