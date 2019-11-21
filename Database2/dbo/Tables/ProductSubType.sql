CREATE TABLE [dbo].[ProductSubType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductTypeId] [bigint] NOT NULL,
	[ProductSubTypeName] [nvarchar](100) NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[ProductSubTypeAbbreviations] [nvarchar](100) NULL,
	[ProductSubTypeEnumName] [nvarchar](max) NULL,
 CONSTRAINT [ProductSubType_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductSubType]  WITH NOCHECK ADD  CONSTRAINT [ProductSubType_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ProductSubType] CHECK CONSTRAINT [ProductSubType_FK_Country]
GO
ALTER TABLE [dbo].[ProductSubType]  WITH NOCHECK ADD  CONSTRAINT [ProductSubType_FK_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO

ALTER TABLE [dbo].[ProductSubType] CHECK CONSTRAINT [ProductSubType_FK_ProductType]
GO
ALTER TABLE [dbo].[ProductSubType]  WITH NOCHECK ADD  CONSTRAINT [ProductSubType_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductSubType] CHECK CONSTRAINT [ProductSubType_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ProductSubType]  WITH NOCHECK ADD  CONSTRAINT [ProductSubType_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductSubType] CHECK CONSTRAINT [ProductSubType_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ProductSubType] ADD  CONSTRAINT [ProductSubType_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductSubType] ADD  CONSTRAINT [ProductSubType_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'foreign key from ProductType Table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductSubType', @level2type=N'COLUMN',@level2name=N'ProductTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table use to fill Product Subtype dropdown of Create Product Page under Administrator >> Product >> Product Admin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductSubType'