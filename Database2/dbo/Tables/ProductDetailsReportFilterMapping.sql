CREATE TABLE [dbo].[ProductDetailsReportFilterMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductDetailsReportFilterId] [bigint] NOT NULL,
	[GroupId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[ProductId] [bigint] NULL,
	[AdministratorId] [bigint] NULL,
	[ClaimId] [bigint] NULL,
	[OwnerId] [bigint] NULL,
	[UnderwriterId] [bigint] NULL,
	[CriteriaEnum] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [ProductDetailsReportFilterMapping_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [ProductDetailsReportFilterMapping_FK_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[ProductDetailsReportFilterMapping] CHECK CONSTRAINT [ProductDetailsReportFilterMapping_FK_Branch]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [ProductDetailsReportFilterMapping_FK_CompanyCompanyTypeMappingAdministratorId] FOREIGN KEY([AdministratorId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[ProductDetailsReportFilterMapping] CHECK CONSTRAINT [ProductDetailsReportFilterMapping_FK_CompanyCompanyTypeMappingAdministratorId]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [ProductDetailsReportFilterMapping_FK_CompanyCompanyTypeMappingClaimId] FOREIGN KEY([ClaimId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[ProductDetailsReportFilterMapping] CHECK CONSTRAINT [ProductDetailsReportFilterMapping_FK_CompanyCompanyTypeMappingClaimId]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [ProductDetailsReportFilterMapping_FK_CompanyCompanyTypeMappingOwnerId] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[ProductDetailsReportFilterMapping] CHECK CONSTRAINT [ProductDetailsReportFilterMapping_FK_CompanyCompanyTypeMappingOwnerId]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [ProductDetailsReportFilterMapping_FK_CompanyCompanyTypeMappingUnderwriterId] FOREIGN KEY([UnderwriterId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[ProductDetailsReportFilterMapping] CHECK CONSTRAINT [ProductDetailsReportFilterMapping_FK_CompanyCompanyTypeMappingUnderwriterId]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [ProductDetailsReportFilterMapping_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[ProductDetailsReportFilterMapping] CHECK CONSTRAINT [ProductDetailsReportFilterMapping_FK_Group]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [ProductDetailsReportFilterMapping_FK_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO

ALTER TABLE [dbo].[ProductDetailsReportFilterMapping] CHECK CONSTRAINT [ProductDetailsReportFilterMapping_FK_Product]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [ProductDetailsReportFilterMapping_FK_ProductDetailsReportFilter] FOREIGN KEY([ProductDetailsReportFilterId])
REFERENCES [dbo].[ProductDetailsReportFilter] ([Id])
GO

ALTER TABLE [dbo].[ProductDetailsReportFilterMapping] CHECK CONSTRAINT [ProductDetailsReportFilterMapping_FK_ProductDetailsReportFilter]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [ProductDetailsReportFilterMapping_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductDetailsReportFilterMapping] CHECK CONSTRAINT [ProductDetailsReportFilterMapping_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [ProductDetailsReportFilterMapping_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductDetailsReportFilterMapping] CHECK CONSTRAINT [ProductDetailsReportFilterMapping_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilterMapping] ADD  CONSTRAINT [DF_ProductDetailsReportMapping_IsActive]  DEFAULT ((1)) FOR [IsActive]