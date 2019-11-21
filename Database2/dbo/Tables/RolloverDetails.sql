CREATE TABLE [dbo].[RolloverDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[BranchCode] [nvarchar](50) NULL,
	[BusinessManagerId] [int] NULL,
	[TransactionTypeId] [bigint] NULL,
	[VehicleConditionId] [bigint] NULL,
	[ProductTypeId] [bigint] NULL,
	[ProductSubTypeId] [bigint] NULL,
	[FinanceCompanyId] [bigint] NULL,
	[AmountExclVat] [decimal](18, 2) NULL,
	[VatAmount] [decimal](18, 2) NULL,
	[AmountInclVat] [decimal](18, 2) NULL,
	[Note] [nvarchar](4000) NULL,
	[ReceiptDate] [date] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [RolloverDetails_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RolloverDetails]  WITH CHECK ADD  CONSTRAINT [RolloverDetails_FK_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[RolloverDetails] CHECK CONSTRAINT [RolloverDetails_FK_Branch]
GO
ALTER TABLE [dbo].[RolloverDetails]  WITH CHECK ADD  CONSTRAINT [RolloverDetails_FK_CompanyCompanyTypeMapping] FOREIGN KEY([FinanceCompanyId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[RolloverDetails] CHECK CONSTRAINT [RolloverDetails_FK_CompanyCompanyTypeMapping]
GO
ALTER TABLE [dbo].[RolloverDetails]  WITH CHECK ADD  CONSTRAINT [RolloverDetails_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[RolloverDetails] CHECK CONSTRAINT [RolloverDetails_FK_Group]
GO
ALTER TABLE [dbo].[RolloverDetails]  WITH CHECK ADD  CONSTRAINT [RolloverDetails_FK_ProductSubType] FOREIGN KEY([ProductSubTypeId])
REFERENCES [dbo].[ProductSubType] ([Id])
GO

ALTER TABLE [dbo].[RolloverDetails] CHECK CONSTRAINT [RolloverDetails_FK_ProductSubType]
GO
ALTER TABLE [dbo].[RolloverDetails]  WITH CHECK ADD  CONSTRAINT [RolloverDetails_FK_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO

ALTER TABLE [dbo].[RolloverDetails] CHECK CONSTRAINT [RolloverDetails_FK_ProductType]
GO
ALTER TABLE [dbo].[RolloverDetails]  WITH CHECK ADD  CONSTRAINT [RolloverDetails_FK_StaticValueTransactionTypeId] FOREIGN KEY([TransactionTypeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[RolloverDetails] CHECK CONSTRAINT [RolloverDetails_FK_StaticValueTransactionTypeId]
GO
ALTER TABLE [dbo].[RolloverDetails]  WITH CHECK ADD  CONSTRAINT [RolloverDetails_FK_StaticValueVehicleConditionId] FOREIGN KEY([VehicleConditionId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[RolloverDetails] CHECK CONSTRAINT [RolloverDetails_FK_StaticValueVehicleConditionId]
GO
ALTER TABLE [dbo].[RolloverDetails]  WITH CHECK ADD  CONSTRAINT [RolloverDetails_FK_UsersBusinessManagerId] FOREIGN KEY([BusinessManagerId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[RolloverDetails] CHECK CONSTRAINT [RolloverDetails_FK_UsersBusinessManagerId]
GO
ALTER TABLE [dbo].[RolloverDetails]  WITH CHECK ADD  CONSTRAINT [RolloverDetails_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[RolloverDetails] CHECK CONSTRAINT [RolloverDetails_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[RolloverDetails]  WITH CHECK ADD  CONSTRAINT [RolloverDetails_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[RolloverDetails] CHECK CONSTRAINT [RolloverDetails_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[RolloverDetails] ADD  CONSTRAINT [DF_RolloverDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[RolloverDetails] ADD  CONSTRAINT [DF_RolloverDetails_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]