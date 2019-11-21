CREATE TABLE [dbo].[BranchCompanyReference](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[CompanyCompanyTYpeMapId] [bigint] NOT NULL,
	[ReferenceTypeId] [bigint] NOT NULL,
	[ReferenceNo] [nvarchar](100) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [BranchReference_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BranchCompanyReference]  WITH NOCHECK ADD  CONSTRAINT [BranchComapnyReference_FK_CompanyCompanyTypeMapping] FOREIGN KEY([CompanyCompanyTYpeMapId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[BranchCompanyReference] CHECK CONSTRAINT [BranchComapnyReference_FK_CompanyCompanyTypeMapping]
GO
ALTER TABLE [dbo].[BranchCompanyReference]  WITH NOCHECK ADD  CONSTRAINT [BranchComapnyReference_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[BranchCompanyReference] CHECK CONSTRAINT [BranchComapnyReference_FK_Country]
GO
ALTER TABLE [dbo].[BranchCompanyReference]  WITH NOCHECK ADD  CONSTRAINT [BranchComapnyReference_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[BranchCompanyReference] CHECK CONSTRAINT [BranchComapnyReference_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[BranchCompanyReference]  WITH NOCHECK ADD  CONSTRAINT [BranchComapnyReference_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[BranchCompanyReference] CHECK CONSTRAINT [BranchComapnyReference_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[BranchCompanyReference]  WITH NOCHECK ADD  CONSTRAINT [BranchReference_FK_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[BranchCompanyReference] CHECK CONSTRAINT [BranchReference_FK_Branch]
GO
ALTER TABLE [dbo].[BranchCompanyReference]  WITH NOCHECK ADD  CONSTRAINT [BranchReference_FK_ReferenceType] FOREIGN KEY([ReferenceTypeId])
REFERENCES [dbo].[ReferenceType] ([Id])
GO

ALTER TABLE [dbo].[BranchCompanyReference] CHECK CONSTRAINT [BranchReference_FK_ReferenceType]
GO
ALTER TABLE [dbo].[BranchCompanyReference] ADD  CONSTRAINT [BranchReference_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[BranchCompanyReference] ADD  CONSTRAINT [BranchReference_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table Branch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BranchCompanyReference', @level2type=N'COLUMN',@level2name=N'BranchId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table ReferenceType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BranchCompanyReference', @level2type=N'COLUMN',@level2name=N'ReferenceTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table stores the information from branch refernce page under Admin >> Branch Admin >> Edit Branch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BranchCompanyReference'