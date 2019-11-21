CREATE TABLE [dbo].[SalesPerson](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[SalesPersonName] [nvarchar](100) NOT NULL,
	[IdTypeId] [bigint] NOT NULL,
	[IdNumber] [nvarchar](100) NULL,
	[EmployeeNumber] [nvarchar](50) NULL,
	[CountryId] [bigint] NULL,
	[DeactivationDate] [date] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[EmailAddress] [nvarchar](200) NULL,
 CONSTRAINT [SalesPerson_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SalesPerson]  WITH NOCHECK ADD  CONSTRAINT [SalesPerson_FK_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[SalesPerson] CHECK CONSTRAINT [SalesPerson_FK_Branch]
GO
ALTER TABLE [dbo].[SalesPerson]  WITH NOCHECK ADD  CONSTRAINT [SalesPerson_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[SalesPerson] CHECK CONSTRAINT [SalesPerson_FK_Country]
GO
ALTER TABLE [dbo].[SalesPerson]  WITH NOCHECK ADD  CONSTRAINT [SalesPerson_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[SalesPerson] CHECK CONSTRAINT [SalesPerson_FK_Group]
GO
ALTER TABLE [dbo].[SalesPerson]  WITH NOCHECK ADD  CONSTRAINT [SalesPerson_FK_IdType] FOREIGN KEY([IdTypeId])
REFERENCES [dbo].[IdType] ([Id])
GO

ALTER TABLE [dbo].[SalesPerson] CHECK CONSTRAINT [SalesPerson_FK_IdType]
GO
ALTER TABLE [dbo].[SalesPerson]  WITH NOCHECK ADD  CONSTRAINT [SalesPerson_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[SalesPerson] CHECK CONSTRAINT [SalesPerson_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[SalesPerson]  WITH NOCHECK ADD  CONSTRAINT [SalesPerson_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[SalesPerson] CHECK CONSTRAINT [SalesPerson_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[SalesPerson] ADD  CONSTRAINT [SalesPerson_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SalesPerson] ADD  CONSTRAINT [SalesPerson_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table Group' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesPerson', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table Branch' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesPerson', @level2type=N'COLUMN',@level2name=N'BranchId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table IdType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesPerson', @level2type=N'COLUMN',@level2name=N'IdTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table use to store salesperson detail under admin Salesperson Admin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SalesPerson'