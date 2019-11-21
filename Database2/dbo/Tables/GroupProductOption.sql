CREATE TABLE [dbo].[GroupProductOption](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[OptionId] [bigint] NOT NULL,
	[DefaultPrice] [decimal](18, 2) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [GroupProductOption_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroupProductOption]  WITH NOCHECK ADD  CONSTRAINT [GroupProductOption_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[GroupProductOption] CHECK CONSTRAINT [GroupProductOption_FK_Country]
GO
ALTER TABLE [dbo].[GroupProductOption]  WITH NOCHECK ADD  CONSTRAINT [GroupProductOption_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[GroupProductOption] CHECK CONSTRAINT [GroupProductOption_FK_Group]
GO
ALTER TABLE [dbo].[GroupProductOption]  WITH NOCHECK ADD  CONSTRAINT [GroupProductOption_FK_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO

ALTER TABLE [dbo].[GroupProductOption] CHECK CONSTRAINT [GroupProductOption_FK_Product]
GO
ALTER TABLE [dbo].[GroupProductOption]  WITH NOCHECK ADD  CONSTRAINT [GroupProductOption_FK_ProductOption] FOREIGN KEY([OptionId])
REFERENCES [dbo].[ProductOption] ([Id])
GO

ALTER TABLE [dbo].[GroupProductOption] CHECK CONSTRAINT [GroupProductOption_FK_ProductOption]
GO
ALTER TABLE [dbo].[GroupProductOption]  WITH NOCHECK ADD  CONSTRAINT [GroupProductOption_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupProductOption] CHECK CONSTRAINT [GroupProductOption_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[GroupProductOption]  WITH NOCHECK ADD  CONSTRAINT [GroupProductOption_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupProductOption] CHECK CONSTRAINT [GroupProductOption_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[GroupProductOption] ADD  CONSTRAINT [GroupProductOption_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[GroupProductOption] ADD  CONSTRAINT [GroupProductOption_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table stores the product option assigned to group.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupProductOption'