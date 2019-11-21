CREATE TABLE [dbo].[DealTrackerReportFilterMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DealTrackerReportFilterId] [bigint] NOT NULL,
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
	[FinanceCompanyTakenUpId] [bigint] NULL,
	[IsFinanceCompanyTakenUpIdBlank] [bit] NOT NULL,
	[IsFinanceCompanyIdBlank] [bit] NOT NULL,
 CONSTRAINT [PK_DealTrackerReportFilterMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DealTrackerReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_DealTrackerReportFilterMapping_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[DealTrackerReportFilterMapping] CHECK CONSTRAINT [FK_DealTrackerReportFilterMapping_Branch]
GO
ALTER TABLE [dbo].[DealTrackerReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_DealTrackerReportFilterMapping_CompanyCompanyTypeMapping] FOREIGN KEY([FinanceCompanyId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[DealTrackerReportFilterMapping] CHECK CONSTRAINT [FK_DealTrackerReportFilterMapping_CompanyCompanyTypeMapping]
GO
ALTER TABLE [dbo].[DealTrackerReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_DealTrackerReportFilterMapping_CompanyCompanyTypeMapping1] FOREIGN KEY([FinanceCompanyTakenUpId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[DealTrackerReportFilterMapping] CHECK CONSTRAINT [FK_DealTrackerReportFilterMapping_CompanyCompanyTypeMapping1]
GO
ALTER TABLE [dbo].[DealTrackerReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_DealTrackerReportFilterMapping_DealTrackerReportFilter] FOREIGN KEY([DealTrackerReportFilterId])
REFERENCES [dbo].[DealTrackerReportFilter] ([Id])
GO

ALTER TABLE [dbo].[DealTrackerReportFilterMapping] CHECK CONSTRAINT [FK_DealTrackerReportFilterMapping_DealTrackerReportFilter]
GO
ALTER TABLE [dbo].[DealTrackerReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_DealTrackerReportFilterMapping_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[DealTrackerReportFilterMapping] CHECK CONSTRAINT [FK_DealTrackerReportFilterMapping_Group]
GO
ALTER TABLE [dbo].[DealTrackerReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_DealTrackerReportFilterMapping_SalesPerson] FOREIGN KEY([SalesPersonId])
REFERENCES [dbo].[SalesPerson] ([Id])
GO

ALTER TABLE [dbo].[DealTrackerReportFilterMapping] CHECK CONSTRAINT [FK_DealTrackerReportFilterMapping_SalesPerson]
GO
ALTER TABLE [dbo].[DealTrackerReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_DealTrackerReportFilterMapping_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[DealTrackerReportFilterMapping] CHECK CONSTRAINT [FK_DealTrackerReportFilterMapping_Users]
GO
ALTER TABLE [dbo].[DealTrackerReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_DealTrackerReportFilterMapping_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[DealTrackerReportFilterMapping] CHECK CONSTRAINT [FK_DealTrackerReportFilterMapping_Users1]
GO
ALTER TABLE [dbo].[DealTrackerReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_DealTrackerReportFilterMapping_Users2] FOREIGN KEY([BusinessManagerId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[DealTrackerReportFilterMapping] CHECK CONSTRAINT [FK_DealTrackerReportFilterMapping_Users2]
GO
ALTER TABLE [dbo].[DealTrackerReportFilterMapping] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DealTrackerReportFilterMapping] ADD  DEFAULT ((0)) FOR [IsFinanceCompanyTakenUpIdBlank]
GO
ALTER TABLE [dbo].[DealTrackerReportFilterMapping] ADD  DEFAULT ((0)) FOR [IsFinanceCompanyIdBlank]