CREATE TABLE [dbo].[ProductOptionWording](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductOptionId] [bigint] NOT NULL,
	[ProdOptWordingFileName] [nvarchar](100) NULL,
	[ProdOptWordingFilePath] [nvarchar](100) NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [ProductOptionWording_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductOptionWording]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionWording_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionWording] CHECK CONSTRAINT [ProductOptionWording_FK_Country]
GO
ALTER TABLE [dbo].[ProductOptionWording]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionWording_FK_ProductOption] FOREIGN KEY([ProductOptionId])
REFERENCES [dbo].[ProductOption] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionWording] CHECK CONSTRAINT [ProductOptionWording_FK_ProductOption]
GO
ALTER TABLE [dbo].[ProductOptionWording]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionWording_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionWording] CHECK CONSTRAINT [ProductOptionWording_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ProductOptionWording]  WITH NOCHECK ADD  CONSTRAINT [ProductOptionWording_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductOptionWording] CHECK CONSTRAINT [ProductOptionWording_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ProductOptionWording] ADD  CONSTRAINT [ProductOptionWording_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductOptionWording] ADD  CONSTRAINT [ProductOptionWording_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store option wording insode product option.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductOptionWording'