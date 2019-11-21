CREATE TABLE [dbo].[DealTrackerReportAnalytics] (
    [Id]                   BIGINT   IDENTITY (1, 1) NOT NULL,
    [TransactionId]        BIGINT   NULL,
    [CompanyCompanyTypeId] BIGINT   NULL,
    [FinanceStatusId]      BIGINT   NULL,
    [AnalyticsTypeId]      SMALLINT NULL,
    [IsActive]             BIT      CONSTRAINT [DF_DealTrackerReportAnalytics_IsActive] DEFAULT ((1)) NULL,
    [CreatedDate]          DATETIME NULL,
    [ModifiedDate]         DATETIME NULL,
    [CreatedBy]            INT      NULL,
    [ModifiedBy]           INT      NULL,
    CONSTRAINT [DealTrackerReportAnalytics_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [DealTrackerReportAnalytics_FK_CompanyCompanyTypeMapping] FOREIGN KEY ([CompanyCompanyTypeId]) REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id]),
    CONSTRAINT [DealTrackerReportAnalytics_FK_StaticValue] FOREIGN KEY ([FinanceStatusId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [DealTrackerReportAnalytics_FK_Transaction] FOREIGN KEY ([TransactionId]) REFERENCES [dbo].[Transaction] ([Id]),
    CONSTRAINT [DealTrackerReportAnalytics_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [DealTrackerReportAnalytics_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

