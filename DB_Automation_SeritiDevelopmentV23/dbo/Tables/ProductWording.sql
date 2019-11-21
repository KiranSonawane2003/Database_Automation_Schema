CREATE TABLE [dbo].[ProductWording](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[WordingFileName] [nvarchar](100) NULL,
	[WordingFilePath] [nvarchar](200) NOT NULL,
	[IsEffectiveImmediately] [bit] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [ProductWording_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductWording]  WITH NOCHECK ADD  CONSTRAINT [ProductWording_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ProductWording] CHECK CONSTRAINT [ProductWording_FK_Country]
GO
ALTER TABLE [dbo].[ProductWording]  WITH NOCHECK ADD  CONSTRAINT [ProductWording_FK_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO

ALTER TABLE [dbo].[ProductWording] CHECK CONSTRAINT [ProductWording_FK_Product]
GO
ALTER TABLE [dbo].[ProductWording]  WITH NOCHECK ADD  CONSTRAINT [ProductWording_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductWording] CHECK CONSTRAINT [ProductWording_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ProductWording]  WITH NOCHECK ADD  CONSTRAINT [ProductWording_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductWording] CHECK CONSTRAINT [ProductWording_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ProductWording] ADD  CONSTRAINT [ProductWording_DF_EffectiveImmediately]  DEFAULT ((0)) FOR [IsEffectiveImmediately]
GO
ALTER TABLE [dbo].[ProductWording] ADD  CONSTRAINT [ProductWording_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductWording] ADD  CONSTRAINT [ProductWording_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table store details of product wording document under Product Admin >> Edit Product.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductWording'