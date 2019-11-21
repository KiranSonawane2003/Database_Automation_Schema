CREATE TABLE [dbo].[TransactionAPIDetailsReportFilter] (
    [Id]             BIGINT          IDENTITY (1, 1) NOT NULL,
    [MasterReportId] BIGINT          NULL,
    [StartDate]      DATE            NULL,
    [EndDate]        DATE            NULL,
    [IsEmailReport]  BIT             CONSTRAINT [DF_TransactionAPIDetailsReportFilter_IsEmailReport_1] DEFAULT ((0)) NULL,
    [Email]          NVARCHAR (100)  NULL,
    [ReportFilePath] NVARCHAR (200)  NULL,
    [FileSize]       DECIMAL (18, 2) NULL,
    [ReportFormat]   INT             NULL,
    [CountryId]      BIGINT          NULL,
    [IsActive]       BIT             CONSTRAINT [DF_TransactionAPIDetailsReportFilter_IsActive_1] DEFAULT ((1)) NULL,
    [CreatedDate]    DATETIME        NULL,
    [ModifiedDate]   DATETIME        NULL,
    [CreatedBy]      INT             NULL,
    [ModifiedBy]     INT             NULL,
    CONSTRAINT [PK_TransactionAPIDetailsReportFilter_1] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_TransactionAPIDetailsReportFilter_Country1] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_TransactionAPIDetailsReportFilter_MasterReport1] FOREIGN KEY ([MasterReportId]) REFERENCES [dbo].[MasterReport] ([Id]),
    CONSTRAINT [FK_TransactionAPIDetailsReportFilter_Users2] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_TransactionAPIDetailsReportFilter_Users3] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

