CREATE TABLE [dbo].[TransactionReportFilterMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionReportFilterId] [bigint] NULL,
	[GroupId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[BusinessManagerId] [int] NULL,
	[SalesPersonId] [bigint] NULL,
	[FinanceCompanyId] [bigint] NULL,
	[CriteriaEnum] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_TransactionReportFilterMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_TransactionReportFilterMapping_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[TransactionReportFilterMapping] CHECK CONSTRAINT [FK_TransactionReportFilterMapping_Branch]
GO
ALTER TABLE [dbo].[TransactionReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_TransactionReportFilterMapping_CompanyCompanyTypeMapping] FOREIGN KEY([FinanceCompanyId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[TransactionReportFilterMapping] CHECK CONSTRAINT [FK_TransactionReportFilterMapping_CompanyCompanyTypeMapping]
GO
ALTER TABLE [dbo].[TransactionReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_TransactionReportFilterMapping_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[TransactionReportFilterMapping] CHECK CONSTRAINT [FK_TransactionReportFilterMapping_Group]
GO
ALTER TABLE [dbo].[TransactionReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_TransactionReportFilterMapping_SalesPerson] FOREIGN KEY([SalesPersonId])
REFERENCES [dbo].[SalesPerson] ([Id])
GO

ALTER TABLE [dbo].[TransactionReportFilterMapping] CHECK CONSTRAINT [FK_TransactionReportFilterMapping_SalesPerson]
GO
ALTER TABLE [dbo].[TransactionReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_TransactionReportFilterMapping_TransactionReportFilter] FOREIGN KEY([TransactionReportFilterId])
REFERENCES [dbo].[TransactionReportFilter] ([Id])
GO

ALTER TABLE [dbo].[TransactionReportFilterMapping] CHECK CONSTRAINT [FK_TransactionReportFilterMapping_TransactionReportFilter]
GO
ALTER TABLE [dbo].[TransactionReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_TransactionReportFilterMapping_Users_BusinessManager] FOREIGN KEY([BusinessManagerId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionReportFilterMapping] CHECK CONSTRAINT [FK_TransactionReportFilterMapping_Users_BusinessManager]
GO
ALTER TABLE [dbo].[TransactionReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_TransactionReportFilterMapping_Users_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionReportFilterMapping] CHECK CONSTRAINT [FK_TransactionReportFilterMapping_Users_CreatedBy]
GO
ALTER TABLE [dbo].[TransactionReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_TransactionReportFilterMapping_Users_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionReportFilterMapping] CHECK CONSTRAINT [FK_TransactionReportFilterMapping_Users_ModifiedBy]
GO
ALTER TABLE [dbo].[TransactionReportFilterMapping] ADD  DEFAULT ((0)) FOR [IsActive]