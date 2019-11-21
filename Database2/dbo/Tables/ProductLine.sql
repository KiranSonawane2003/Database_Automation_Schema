CREATE TABLE [dbo].[ProductLine](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[AdministratorId] [bigint] NULL,
	[ClaimsId] [bigint] NULL,
	[OwnerId] [bigint] NULL,
	[UnderwriterId] [bigint] NULL,
	[InvoiceCompanyId] [bigint] NULL,
	[WebServiceCode] [nvarchar](100) NULL,
	[ProductDisclosure] [nvarchar](200) NULL,
	[PayoverAmount] [decimal](18, 2) NULL,
	[PayoverPercentage] [decimal](18, 2) NULL,
	[AdminFee] [decimal](18, 2) NULL,
	[AdminPercentage] [decimal](18, 2) NULL,
	[BinderFee] [decimal](18, 2) NULL,
	[BinderPercentage] [decimal](18, 2) NULL,
	[CollectionFee] [decimal](18, 2) NULL,
	[CollectionPercentage] [decimal](18, 2) NULL,
	[CommissionAmount] [decimal](18, 2) NULL,
	[CommissionPercentage] [decimal](18, 2) NULL,
	[DealerDocumentationFee] [decimal](18, 2) NULL,
	[DealerDocumentationPercentage] [decimal](18, 2) NULL,
	[InspectionFee] [decimal](18, 2) NULL,
	[InspectionPercentage] [decimal](18, 2) NULL,
	[PolicyFee] [decimal](18, 2) NULL,
	[PolicyPercentage] [decimal](18, 2) NULL,
	[ValuationFee] [decimal](18, 2) NULL,
	[ValuationPercentage] [decimal](18, 2) NULL,
	[DisplayType] [int] NULL,
	[CoverAmountTemplateId] [bigint] NULL,
	[ManufacturerTemplateId] [bigint] NULL,
	[ProductTemplateId] [bigint] NULL,
	[SupplierRecoveryAmount] [decimal](18, 2) NULL,
	[BilltoCompanyId] [bigint] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [ProductLine_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductLine]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductLine_Template] FOREIGN KEY([ProductTemplateId])
REFERENCES [dbo].[Template] ([Id])
GO

ALTER TABLE [dbo].[ProductLine] CHECK CONSTRAINT [FK_ProductLine_Template]
GO
ALTER TABLE [dbo].[ProductLine]  WITH NOCHECK ADD  CONSTRAINT [ProductLine_FK_CompanyCompanyTypeMappingAdministrator] FOREIGN KEY([AdministratorId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[ProductLine] CHECK CONSTRAINT [ProductLine_FK_CompanyCompanyTypeMappingAdministrator]
GO
ALTER TABLE [dbo].[ProductLine]  WITH NOCHECK ADD  CONSTRAINT [ProductLine_FK_CompanyCompanyTypeMappingBilltoCompany] FOREIGN KEY([BilltoCompanyId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[ProductLine] CHECK CONSTRAINT [ProductLine_FK_CompanyCompanyTypeMappingBilltoCompany]
GO
ALTER TABLE [dbo].[ProductLine]  WITH NOCHECK ADD  CONSTRAINT [ProductLine_FK_CompanyCompanyTypeMappingClaims] FOREIGN KEY([ClaimsId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[ProductLine] CHECK CONSTRAINT [ProductLine_FK_CompanyCompanyTypeMappingClaims]
GO
ALTER TABLE [dbo].[ProductLine]  WITH NOCHECK ADD  CONSTRAINT [ProductLine_FK_CompanyCompanyTypeMappingInvoice] FOREIGN KEY([InvoiceCompanyId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[ProductLine] CHECK CONSTRAINT [ProductLine_FK_CompanyCompanyTypeMappingInvoice]
GO
ALTER TABLE [dbo].[ProductLine]  WITH NOCHECK ADD  CONSTRAINT [ProductLine_FK_CompanyCompanyTypeMappingOwner] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[ProductLine] CHECK CONSTRAINT [ProductLine_FK_CompanyCompanyTypeMappingOwner]
GO
ALTER TABLE [dbo].[ProductLine]  WITH NOCHECK ADD  CONSTRAINT [ProductLine_FK_CompanyCompanyTypeMappingUnderwriter] FOREIGN KEY([UnderwriterId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[ProductLine] CHECK CONSTRAINT [ProductLine_FK_CompanyCompanyTypeMappingUnderwriter]
GO
ALTER TABLE [dbo].[ProductLine]  WITH NOCHECK ADD  CONSTRAINT [ProductLine_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ProductLine] CHECK CONSTRAINT [ProductLine_FK_Country]
GO
ALTER TABLE [dbo].[ProductLine]  WITH NOCHECK ADD  CONSTRAINT [ProductLine_FK_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO

ALTER TABLE [dbo].[ProductLine] CHECK CONSTRAINT [ProductLine_FK_Product]
GO
ALTER TABLE [dbo].[ProductLine]  WITH NOCHECK ADD  CONSTRAINT [ProductLine_FK_TemplateCoverAmount] FOREIGN KEY([CoverAmountTemplateId])
REFERENCES [dbo].[Template] ([Id])
GO

ALTER TABLE [dbo].[ProductLine] CHECK CONSTRAINT [ProductLine_FK_TemplateCoverAmount]
GO
ALTER TABLE [dbo].[ProductLine]  WITH NOCHECK ADD  CONSTRAINT [ProductLine_FK_TemplateMfg] FOREIGN KEY([ManufacturerTemplateId])
REFERENCES [dbo].[Template] ([Id])
GO

ALTER TABLE [dbo].[ProductLine] CHECK CONSTRAINT [ProductLine_FK_TemplateMfg]
GO
ALTER TABLE [dbo].[ProductLine]  WITH NOCHECK ADD  CONSTRAINT [ProductLine_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductLine] CHECK CONSTRAINT [ProductLine_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ProductLine]  WITH NOCHECK ADD  CONSTRAINT [ProductLine_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductLine] CHECK CONSTRAINT [ProductLine_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ProductLine] ADD  CONSTRAINT [ProductLine_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductLine] ADD  CONSTRAINT [ProductLine_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table should be fill while creating product and also while creating new product line.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductLine'