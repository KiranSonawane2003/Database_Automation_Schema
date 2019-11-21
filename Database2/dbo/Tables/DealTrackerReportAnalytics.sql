CREATE TABLE [dbo].[DealTrackerReportAnalytics](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NULL,
	[CompanyCompanyTypeId] [bigint] NULL,
	[FinanceStatusId] [bigint] NULL,
	[AnalyticsTypeId] [smallint] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [DealTrackerReportAnalytics_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DealTrackerReportAnalytics]  WITH CHECK ADD  CONSTRAINT [DealTrackerReportAnalytics_FK_CompanyCompanyTypeMapping] FOREIGN KEY([CompanyCompanyTypeId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[DealTrackerReportAnalytics] CHECK CONSTRAINT [DealTrackerReportAnalytics_FK_CompanyCompanyTypeMapping]
GO
ALTER TABLE [dbo].[DealTrackerReportAnalytics]  WITH CHECK ADD  CONSTRAINT [DealTrackerReportAnalytics_FK_StaticValue] FOREIGN KEY([FinanceStatusId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[DealTrackerReportAnalytics] CHECK CONSTRAINT [DealTrackerReportAnalytics_FK_StaticValue]
GO
ALTER TABLE [dbo].[DealTrackerReportAnalytics]  WITH CHECK ADD  CONSTRAINT [DealTrackerReportAnalytics_FK_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[DealTrackerReportAnalytics] CHECK CONSTRAINT [DealTrackerReportAnalytics_FK_Transaction]
GO
ALTER TABLE [dbo].[DealTrackerReportAnalytics]  WITH CHECK ADD  CONSTRAINT [DealTrackerReportAnalytics_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[DealTrackerReportAnalytics] CHECK CONSTRAINT [DealTrackerReportAnalytics_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[DealTrackerReportAnalytics]  WITH CHECK ADD  CONSTRAINT [DealTrackerReportAnalytics_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[DealTrackerReportAnalytics] CHECK CONSTRAINT [DealTrackerReportAnalytics_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[DealTrackerReportAnalytics] ADD  CONSTRAINT [DF_DealTrackerReportAnalytics_IsActive]  DEFAULT ((1)) FOR [IsActive]