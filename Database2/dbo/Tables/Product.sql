CREATE TABLE [dbo].[Product](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductTypeId] [bigint] NOT NULL,
	[ProductSubTypeId] [bigint] NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[IsInsuranceProduct] [bit] NOT NULL,
	[AdministratorId] [bigint] NULL,
	[ClaimsId] [bigint] NULL,
	[OwnerId] [bigint] NULL,
	[UnderwriterId] [bigint] NULL,
	[PaymentType] [int] NOT NULL,
	[IsTyreInfoRequired] [bit] NOT NULL,
	[IsVehicleDamageInfoRequired] [bit] NOT NULL,
	[IsEnableProductNote] [bit] NOT NULL,
	[IsReferenceNoRequired] [bit] NOT NULL,
	[IsPayByCash] [bit] NOT NULL,
	[WebServiceCode] [nvarchar](100) NULL,
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
	[ManufacturerTemplateId] [bigint] NULL,
	[ProductTemplateId] [bigint] NULL,
	[SMSTemplateId] [bigint] NULL,
	[IsEditablePayover] [bit] NOT NULL,
	[IsAvailableInPackage] [bit] NOT NULL,
	[SupplierRecoveryAmount] [decimal](18, 2) NULL,
	[BilltoCompanyId] [bigint] NULL,
	[Wording] [nvarchar](150) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[ProductCopyId] [bigint] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[TransactionFormulaId] [bigint] NULL,
	[MinimumPrice] [decimal](18, 2) NULL,
 CONSTRAINT [Product_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [Product_FK_CompanyCompanyTypeBillToCompany] FOREIGN KEY([BilltoCompanyId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Product_FK_CompanyCompanyTypeBillToCompany]
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [Product_FK_CompanyCompanyTypeMappingAdministrator] FOREIGN KEY([AdministratorId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Product_FK_CompanyCompanyTypeMappingAdministrator]
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [Product_FK_CompanyCompanyTypeMappingClaims] FOREIGN KEY([ClaimsId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Product_FK_CompanyCompanyTypeMappingClaims]
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [Product_FK_CompanyCompanyTypeMappingOwner] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Product_FK_CompanyCompanyTypeMappingOwner]
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [Product_FK_CompanyCompanyTypeMappingUnderwriter] FOREIGN KEY([UnderwriterId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Product_FK_CompanyCompanyTypeMappingUnderwriter]
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [Product_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Product_FK_Country]
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [Product_FK_ProductSubType] FOREIGN KEY([ProductSubTypeId])
REFERENCES [dbo].[ProductSubType] ([Id])
GO

ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Product_FK_ProductSubType]
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [Product_FK_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO

ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Product_FK_ProductType]
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [Product_FK_TemplateManufacturer] FOREIGN KEY([ManufacturerTemplateId])
REFERENCES [dbo].[Template] ([Id])
GO

ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Product_FK_TemplateManufacturer]
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [Product_FK_TemplateProduct] FOREIGN KEY([ProductTemplateId])
REFERENCES [dbo].[Template] ([Id])
GO

ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Product_FK_TemplateProduct]
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [Product_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Product_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [Product_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [Product_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [Product_DF_IsInsuranceProduct]  DEFAULT ((0)) FOR [IsInsuranceProduct]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [Product_DF_TyreInfoRequired]  DEFAULT ((0)) FOR [IsTyreInfoRequired]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [Product_DF_VehicleDamageInfoRequired]  DEFAULT ((0)) FOR [IsVehicleDamageInfoRequired]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [Product_DF_EnableProductNote]  DEFAULT ((0)) FOR [IsEnableProductNote]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [Product_DF_ReferenceNoRequired]  DEFAULT ((0)) FOR [IsReferenceNoRequired]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [Product_DF_PayByCash]  DEFAULT ((0)) FOR [IsPayByCash]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [Product_DF_EditablePayover]  DEFAULT ((0)) FOR [IsEditablePayover]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [Product_DF_AvailableInPackage]  DEFAULT ((0)) FOR [IsAvailableInPackage]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [Product_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [Product_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store the Product of system.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product'