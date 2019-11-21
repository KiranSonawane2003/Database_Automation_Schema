CREATE TABLE [dbo].[Package](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[PackageName] [nvarchar](100) NOT NULL,
	[MinRequiredProduct] [int] NOT NULL,
	[MaxRequiredProdcut] [int] NOT NULL,
	[RecDiscountAmount] [decimal](18, 2) NULL,
	[RecDiscountPercentage] [decimal](18, 2) NULL,
	[IsEnforceDiscount] [bit] NOT NULL,
	[MinimumDiscount] [decimal](18, 2) NULL,
	[MaximumDiscount] [decimal](18, 2) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [Packages_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Package]  WITH NOCHECK ADD  CONSTRAINT [Packages_FK_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [Packages_FK_Branch]
GO
ALTER TABLE [dbo].[Package]  WITH NOCHECK ADD  CONSTRAINT [Packages_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [Packages_FK_Country]
GO
ALTER TABLE [dbo].[Package]  WITH NOCHECK ADD  CONSTRAINT [Packages_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [Packages_FK_Group]
GO
ALTER TABLE [dbo].[Package]  WITH NOCHECK ADD  CONSTRAINT [Packages_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [Packages_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[Package]  WITH NOCHECK ADD  CONSTRAINT [Packages_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [Packages_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[Package] ADD  CONSTRAINT [Packages_DF_EnforceDiscount]  DEFAULT ((0)) FOR [IsEnforceDiscount]
GO
ALTER TABLE [dbo].[Package] ADD  CONSTRAINT [Packages_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Package] ADD  CONSTRAINT [Packages_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]