CREATE TABLE [dbo].[ProductType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductTypeName] [nvarchar](100) NOT NULL,
	[ProductTypeEnumName] [nvarchar](100) NULL,
	[IsInsuranceType] [bit] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ProductTypeAbbreviation] [nvarchar](100) NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [ProductType_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductType]  WITH NOCHECK ADD  CONSTRAINT [ProductType_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [ProductType_FK_Country]
GO
ALTER TABLE [dbo].[ProductType]  WITH NOCHECK ADD  CONSTRAINT [ProductType_FK_UsersCreatyedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [ProductType_FK_UsersCreatyedBy]
GO
ALTER TABLE [dbo].[ProductType]  WITH NOCHECK ADD  CONSTRAINT [ProductType_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductType] CHECK CONSTRAINT [ProductType_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ProductType] ADD  CONSTRAINT [ProductType_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductType] ADD  CONSTRAINT [ProductType_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table use to fill Product Type Dropdown of Create Product Page Under Administration >> Product >> Product Admin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductType'