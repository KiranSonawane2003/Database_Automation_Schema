CREATE TABLE [dbo].[Accessories](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccessoryName] [nvarchar](max) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[IsGeneric] [bit] NOT NULL,
	[GroupId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[CostPrice] [decimal](18, 2) NULL,
	[SellingPrice] [decimal](18, 2) NULL,
	[Description] [nvarchar](200) NULL,
	[TemplateId] [bigint] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[IsEditable] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[IsNewVehicleAccessory] [bit] NULL,
 CONSTRAINT [Accessories_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accessories]  WITH NOCHECK ADD  CONSTRAINT [Accessories_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [Accessories_FK_Country]
GO
ALTER TABLE [dbo].[Accessories]  WITH NOCHECK ADD  CONSTRAINT [Accessories_FK_Template] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[Template] ([Id])
GO

ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [Accessories_FK_Template]
GO
ALTER TABLE [dbo].[Accessories]  WITH NOCHECK ADD  CONSTRAINT [Accessories_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [Accessories_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[Accessories]  WITH NOCHECK ADD  CONSTRAINT [Accessories_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [Accessories_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[Accessories]  WITH NOCHECK ADD  CONSTRAINT [FK_Accessories_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [FK_Accessories_Branch]
GO
ALTER TABLE [dbo].[Accessories]  WITH NOCHECK ADD  CONSTRAINT [FK_Accessories_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [FK_Accessories_Group]
GO
ALTER TABLE [dbo].[Accessories] ADD  CONSTRAINT [Accessories_IsGeneric]  DEFAULT ((1)) FOR [IsGeneric]
GO
ALTER TABLE [dbo].[Accessories] ADD  CONSTRAINT [Accessories_DF_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Accessories] ADD  CONSTRAINT [Accessories_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'• This table is for store accessories deails. 
• We need to Verify details for Accessories.
• We are going to add accessories admin under Administration >>Product' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accessories'