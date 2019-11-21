CREATE TABLE [dbo].[CompanyMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyCompanyTypeMapId] [bigint] NOT NULL,
	[ReceivingCompanyId] [bigint] NOT NULL,
	[MappedCompanyName] [nvarchar](100) NULL,
	[MappedCompanyCode] [nvarchar](100) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [CompanyMapping_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyMapping]  WITH NOCHECK ADD  CONSTRAINT [CompanyMapping_FK_CompanyCompanyTypeMapping] FOREIGN KEY([CompanyCompanyTypeMapId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[CompanyMapping] CHECK CONSTRAINT [CompanyMapping_FK_CompanyCompanyTypeMapping]
GO
ALTER TABLE [dbo].[CompanyMapping]  WITH NOCHECK ADD  CONSTRAINT [CompanyMapping_FK_CompanyCompanyTypeMappingReceiving] FOREIGN KEY([ReceivingCompanyId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[CompanyMapping] CHECK CONSTRAINT [CompanyMapping_FK_CompanyCompanyTypeMappingReceiving]
GO
ALTER TABLE [dbo].[CompanyMapping]  WITH NOCHECK ADD  CONSTRAINT [CompanyMapping_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[CompanyMapping] CHECK CONSTRAINT [CompanyMapping_FK_Country]
GO
ALTER TABLE [dbo].[CompanyMapping]  WITH NOCHECK ADD  CONSTRAINT [CompanyMapping_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyMapping] CHECK CONSTRAINT [CompanyMapping_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[CompanyMapping]  WITH NOCHECK ADD  CONSTRAINT [CompanyMapping_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyMapping] CHECK CONSTRAINT [CompanyMapping_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[CompanyMapping] ADD  CONSTRAINT [CompanyCompanyMapping_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CompanyMapping] ADD  CONSTRAINT [CompanyCompanyMapping_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table Company' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CompanyMapping', @level2type=N'COLUMN',@level2name=N'ReceivingCompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This Table stores the information from Company Mapping page unde Admin >> Branch Admin >> Edit Branch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CompanyMapping'