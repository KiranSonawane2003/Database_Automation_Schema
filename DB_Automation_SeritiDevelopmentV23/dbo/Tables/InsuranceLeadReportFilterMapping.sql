CREATE TABLE [dbo].[InsuranceLeadReportFilterMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[InsuranceLeadReportFilterId] [bigint] NULL,
	[GroupId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[BusinessManagerId] [int] NULL,
	[SalesPersonId] [bigint] NULL,
	[CompanyTypeId] [bigint] NULL,
	[CompanyId] [bigint] NULL,
	[CriteriaEnum] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[TransactionTypeId] [bigint] NULL,
 CONSTRAINT [PK_InsuranceLeadReportFilterMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceLeadReportFilterMapping_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping] CHECK CONSTRAINT [FK_InsuranceLeadReportFilterMapping_Branch]
GO
ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceLeadReportFilterMapping_CompanyCompanyTypeMapping] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping] CHECK CONSTRAINT [FK_InsuranceLeadReportFilterMapping_CompanyCompanyTypeMapping]
GO
ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceLeadReportFilterMapping_CompanyType] FOREIGN KEY([CompanyTypeId])
REFERENCES [dbo].[CompanyType] ([Id])
GO

ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping] CHECK CONSTRAINT [FK_InsuranceLeadReportFilterMapping_CompanyType]
GO
ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceLeadReportFilterMapping_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping] CHECK CONSTRAINT [FK_InsuranceLeadReportFilterMapping_Group]
GO
ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceLeadReportFilterMapping_InsuranceLeadReportFilter] FOREIGN KEY([InsuranceLeadReportFilterId])
REFERENCES [dbo].[InsuranceLeadReportFilter] ([Id])
GO

ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping] CHECK CONSTRAINT [FK_InsuranceLeadReportFilterMapping_InsuranceLeadReportFilter]
GO
ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceLeadReportFilterMapping_SalesPerson] FOREIGN KEY([SalesPersonId])
REFERENCES [dbo].[SalesPerson] ([Id])
GO

ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping] CHECK CONSTRAINT [FK_InsuranceLeadReportFilterMapping_SalesPerson]
GO
ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceLeadReportFilterMapping_StaticValue] FOREIGN KEY([TransactionTypeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping] CHECK CONSTRAINT [FK_InsuranceLeadReportFilterMapping_StaticValue]
GO
ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceLeadReportFilterMapping_Users_BusinessManager] FOREIGN KEY([BusinessManagerId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping] CHECK CONSTRAINT [FK_InsuranceLeadReportFilterMapping_Users_BusinessManager]
GO
ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceLeadReportFilterMapping_Users_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping] CHECK CONSTRAINT [FK_InsuranceLeadReportFilterMapping_Users_CreatedBy]
GO
ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_InsuranceLeadReportFilterMapping_Users_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping] CHECK CONSTRAINT [FK_InsuranceLeadReportFilterMapping_Users_ModifiedBy]
GO
ALTER TABLE [dbo].[InsuranceLeadReportFilterMapping] ADD  CONSTRAINT [DF__Insurance__IsAct__299E4456]  DEFAULT ((0)) FOR [IsActive]