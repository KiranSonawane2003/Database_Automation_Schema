CREATE TABLE [dbo].[SuitcaseSalesPersonMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[BranchId] [bigint] NOT NULL,
	[SalesPersonName] [nvarchar](100) NOT NULL,
	[EmailAddress] [nvarchar](200) NULL,
	[DeactivationDate] [date] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[CountryId] [bigint] NULL,
	[TransactionAccess] [bit] NULL,
	[SalesPersonId] [bigint] NOT NULL,
	[BranchName] [nvarchar](255) NULL,
 CONSTRAINT [pk_id_suitcasesalesperson] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SuitcaseSalesPersonMapping]  WITH CHECK ADD  CONSTRAINT [FK_SuitcaseSalesPersonMapping_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[SuitcaseSalesPersonMapping] CHECK CONSTRAINT [FK_SuitcaseSalesPersonMapping_Branch]
GO
ALTER TABLE [dbo].[SuitcaseSalesPersonMapping]  WITH CHECK ADD  CONSTRAINT [FK_SuitcaseSalesPersonMapping_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[SuitcaseSalesPersonMapping] CHECK CONSTRAINT [FK_SuitcaseSalesPersonMapping_Country]
GO
ALTER TABLE [dbo].[SuitcaseSalesPersonMapping]  WITH CHECK ADD  CONSTRAINT [FK_SuitcaseSalesPersonMapping_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[SuitcaseSalesPersonMapping] CHECK CONSTRAINT [FK_SuitcaseSalesPersonMapping_CreatedBy]
GO
ALTER TABLE [dbo].[SuitcaseSalesPersonMapping]  WITH CHECK ADD  CONSTRAINT [FK_SuitcaseSalesPersonMapping_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[SuitcaseSalesPersonMapping] CHECK CONSTRAINT [FK_SuitcaseSalesPersonMapping_Group]
GO
ALTER TABLE [dbo].[SuitcaseSalesPersonMapping]  WITH CHECK ADD  CONSTRAINT [FK_SuitcaseSalesPersonMapping_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[SuitcaseSalesPersonMapping] CHECK CONSTRAINT [FK_SuitcaseSalesPersonMapping_ModifiedBy]
GO
ALTER TABLE [dbo].[SuitcaseSalesPersonMapping]  WITH CHECK ADD  CONSTRAINT [FK_SuitcaseSalesPersonMapping_SalesPerson] FOREIGN KEY([SalesPersonId])
REFERENCES [dbo].[SalesPerson] ([Id])
GO

ALTER TABLE [dbo].[SuitcaseSalesPersonMapping] CHECK CONSTRAINT [FK_SuitcaseSalesPersonMapping_SalesPerson]
GO
ALTER TABLE [dbo].[SuitcaseSalesPersonMapping] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SuitcaseSalesPersonMapping] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SuitcaseSalesPersonMapping] ADD  DEFAULT ((0)) FOR [TransactionAccess]