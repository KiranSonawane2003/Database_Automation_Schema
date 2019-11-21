CREATE TABLE [dbo].[DOCReportFilterMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DOCReportFilterId] [bigint] NULL,
	[GroupId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[BusinessManagerId] [int] NULL,
	[SalesPersonId] [bigint] NULL,
	[FinanceCompanyId] [bigint] NULL,
	[TransactionTypeId] [bigint] NULL,
	[VehicleConditionId] [bigint] NULL,
	[CriteriaEnum] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[SummaryPages] [bigint] NULL,
	[IsSummaryReport] [bit] NULL,
 CONSTRAINT [DOCReportFilterMapping_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DOCReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [DOCReportFilterMapping_FK_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[DOCReportFilterMapping] CHECK CONSTRAINT [DOCReportFilterMapping_FK_Branch]
GO
ALTER TABLE [dbo].[DOCReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [DOCReportFilterMapping_FK_CompanyCompanyTypeMapping] FOREIGN KEY([FinanceCompanyId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[DOCReportFilterMapping] CHECK CONSTRAINT [DOCReportFilterMapping_FK_CompanyCompanyTypeMapping]
GO
ALTER TABLE [dbo].[DOCReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [DOCReportFilterMapping_FK_DOCReportFilter] FOREIGN KEY([DOCReportFilterId])
REFERENCES [dbo].[DOCReportFilter] ([Id])
GO

ALTER TABLE [dbo].[DOCReportFilterMapping] CHECK CONSTRAINT [DOCReportFilterMapping_FK_DOCReportFilter]
GO
ALTER TABLE [dbo].[DOCReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [DOCReportFilterMapping_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[DOCReportFilterMapping] CHECK CONSTRAINT [DOCReportFilterMapping_FK_Group]
GO
ALTER TABLE [dbo].[DOCReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [DOCReportFilterMapping_FK_SalesPerson] FOREIGN KEY([SalesPersonId])
REFERENCES [dbo].[SalesPerson] ([Id])
GO

ALTER TABLE [dbo].[DOCReportFilterMapping] CHECK CONSTRAINT [DOCReportFilterMapping_FK_SalesPerson]
GO
ALTER TABLE [dbo].[DOCReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [DOCReportFilterMapping_FK_StaticValue] FOREIGN KEY([SummaryPages])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[DOCReportFilterMapping] CHECK CONSTRAINT [DOCReportFilterMapping_FK_StaticValue]
GO
ALTER TABLE [dbo].[DOCReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [DOCReportFilterMapping_FK_StaticValueTransactionTypeId] FOREIGN KEY([TransactionTypeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[DOCReportFilterMapping] CHECK CONSTRAINT [DOCReportFilterMapping_FK_StaticValueTransactionTypeId]
GO
ALTER TABLE [dbo].[DOCReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [DOCReportFilterMapping_FK_StaticValueVehicleConditionId] FOREIGN KEY([VehicleConditionId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[DOCReportFilterMapping] CHECK CONSTRAINT [DOCReportFilterMapping_FK_StaticValueVehicleConditionId]
GO
ALTER TABLE [dbo].[DOCReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [DOCReportFilterMapping_FK_UsersBusinessManagerId] FOREIGN KEY([BusinessManagerId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[DOCReportFilterMapping] CHECK CONSTRAINT [DOCReportFilterMapping_FK_UsersBusinessManagerId]
GO
ALTER TABLE [dbo].[DOCReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [DOCReportFilterMapping_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[DOCReportFilterMapping] CHECK CONSTRAINT [DOCReportFilterMapping_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[DOCReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [DOCReportFilterMapping_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[DOCReportFilterMapping] CHECK CONSTRAINT [DOCReportFilterMapping_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[DOCReportFilterMapping] ADD  CONSTRAINT [DF__DOCReport__IsAct__694C5312]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DOCReportFilterMapping] ADD  CONSTRAINT [DF__DOCReport__IsSum__71E3FB18]  DEFAULT ((0)) FOR [IsSummaryReport]