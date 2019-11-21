﻿CREATE TABLE [dbo].[ProductOptionMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductOptionId] [bigint] NOT NULL,
	[CompanyCompanyTypeMapId] [bigint] NOT NULL,
	[CompanyProdOptName] [nvarchar](100) NULL,
	[CompanyProdOptCode] [nvarchar](100) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [ProductOptionMapping_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductOptionMapping]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionMapping_FK_CompanyCompanyTypeMapping] FOREIGN KEY([CompanyCompanyTypeMapId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionMapping] CHECK CONSTRAINT [ProductOptionMapping_FK_CompanyCompanyTypeMapping]
GO
ALTER TABLE [dbo].[ProductOptionMapping]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionMapping_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionMapping] CHECK CONSTRAINT [ProductOptionMapping_FK_Country]
GO
ALTER TABLE [dbo].[ProductOptionMapping]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionMapping_FK_ProductOption] FOREIGN KEY([ProductOptionId])
REFERENCES [dbo].[ProductOption] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionMapping] CHECK CONSTRAINT [ProductOptionMapping_FK_ProductOption]
GO
ALTER TABLE [dbo].[ProductOptionMapping]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionMapping_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionMapping] CHECK CONSTRAINT [ProductOptionMapping_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ProductOptionMapping]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionMapping_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionMapping] CHECK CONSTRAINT [ProductOptionMapping_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ProductOptionMapping] ADD  CONSTRAINT [ProductOptionMapping_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductOptionMapping] ADD  CONSTRAINT [ProductOptionMapping_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table map the product option in product admin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductOptionMapping'