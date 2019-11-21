CREATE TABLE [dbo].[PayoverReportFilter](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MasterReportId] [bigint] NOT NULL,
	[ProductTypeId] [bigint] NULL,
	[ProductSubTypeId] [bigint] NULL,
	[ProductId] [bigint] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[IsInceptDate] [bit] NOT NULL,
	[IsInvoiceDate] [bit] NOT NULL,
	[IsInvoicePaidDate] [bit] NOT NULL,
	[AdministratorId] [bigint] NULL,
	[ClaimId] [bigint] NULL,
	[OwnerId] [bigint] NULL,
	[UnderwriterId] [bigint] NULL,
	[CopiedFrom] [bigint] NULL,
	[IsEmailReport] [bit] NOT NULL,
	[Email] [nvarchar](100) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[IsIncludeMonthlyProduct] [bit] NOT NULL,
 CONSTRAINT [PK_PayoverReportFilter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PayoverReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_PayoverReportFilter_CompanyCompanyTypeMapping] FOREIGN KEY([AdministratorId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[PayoverReportFilter] CHECK CONSTRAINT [FK_PayoverReportFilter_CompanyCompanyTypeMapping]
GO
ALTER TABLE [dbo].[PayoverReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_PayoverReportFilter_CompanyCompanyTypeMapping1] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[PayoverReportFilter] CHECK CONSTRAINT [FK_PayoverReportFilter_CompanyCompanyTypeMapping1]
GO
ALTER TABLE [dbo].[PayoverReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_PayoverReportFilter_CompanyCompanyTypeMapping2] FOREIGN KEY([UnderwriterId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[PayoverReportFilter] CHECK CONSTRAINT [FK_PayoverReportFilter_CompanyCompanyTypeMapping2]
GO
ALTER TABLE [dbo].[PayoverReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_PayoverReportFilter_CompanyCompanyTypeMapping3] FOREIGN KEY([ClaimId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[PayoverReportFilter] CHECK CONSTRAINT [FK_PayoverReportFilter_CompanyCompanyTypeMapping3]
GO
ALTER TABLE [dbo].[PayoverReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_PayoverReportFilter_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[PayoverReportFilter] CHECK CONSTRAINT [FK_PayoverReportFilter_Country]
GO
ALTER TABLE [dbo].[PayoverReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_PayoverReportFilter_MasterReport] FOREIGN KEY([MasterReportId])
REFERENCES [dbo].[MasterReport] ([Id])
GO

ALTER TABLE [dbo].[PayoverReportFilter] CHECK CONSTRAINT [FK_PayoverReportFilter_MasterReport]
GO
ALTER TABLE [dbo].[PayoverReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_PayoverReportFilter_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO

ALTER TABLE [dbo].[PayoverReportFilter] CHECK CONSTRAINT [FK_PayoverReportFilter_Product]
GO
ALTER TABLE [dbo].[PayoverReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_PayoverReportFilter_ProductSubType] FOREIGN KEY([ProductSubTypeId])
REFERENCES [dbo].[ProductSubType] ([Id])
GO

ALTER TABLE [dbo].[PayoverReportFilter] CHECK CONSTRAINT [FK_PayoverReportFilter_ProductSubType]
GO
ALTER TABLE [dbo].[PayoverReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_PayoverReportFilter_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO

ALTER TABLE [dbo].[PayoverReportFilter] CHECK CONSTRAINT [FK_PayoverReportFilter_ProductType]
GO
ALTER TABLE [dbo].[PayoverReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_PayoverReportFilter_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[PayoverReportFilter] CHECK CONSTRAINT [FK_PayoverReportFilter_Users]
GO
ALTER TABLE [dbo].[PayoverReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_PayoverReportFilter_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[PayoverReportFilter] CHECK CONSTRAINT [FK_PayoverReportFilter_Users1]
GO
ALTER TABLE [dbo].[PayoverReportFilter] ADD  DEFAULT ((0)) FOR [IsInceptDate]
GO
ALTER TABLE [dbo].[PayoverReportFilter] ADD  DEFAULT ((0)) FOR [IsInvoiceDate]
GO
ALTER TABLE [dbo].[PayoverReportFilter] ADD  DEFAULT ((0)) FOR [IsInvoicePaidDate]
GO
ALTER TABLE [dbo].[PayoverReportFilter] ADD  DEFAULT ((0)) FOR [IsEmailReport]
GO
ALTER TABLE [dbo].[PayoverReportFilter] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PayoverReportFilter] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PayoverReportFilter] ADD  CONSTRAINT [DF_PayoverReportFilter_IsIncludeMonthlyProduct]  DEFAULT ((0)) FOR [IsIncludeMonthlyProduct]