CREATE TABLE [dbo].[EmiratesIDCardReportFilter] (
    [Id]                   BIGINT          IDENTITY (1, 1) NOT NULL,
    [StartDate]            DATE            NULL,
    [EndDate]              DATE            NULL,
    [IsEmailReport]        BIT             CONSTRAINT [DF_EmiratesIDCardReportFilter_IsEmailReport] DEFAULT ((0)) NULL,
    [Email]                NVARCHAR (100)  NULL,
    [ReportFilePath]       NVARCHAR (200)  NULL,
    [CountryId]            BIGINT          NULL,
    [ReportFormat]         TINYINT         NULL,
    [IsActive]             BIT             DEFAULT ((1)) NOT NULL,
    [CreatedDate]          DATETIME        DEFAULT (getutcdate()) NULL,
    [ModifiedDate]         DATETIME        NULL,
    [CreatedBy]            INT             NULL,
    [ModifiedBy]           INT             NULL,
    [FileSize]             DECIMAL (18, 2) NULL,
    [MasterReportId]       BIGINT          NULL,
    [ReportColumnFilePath] NVARCHAR (MAX)  NULL,
    CONSTRAINT [PK_EmiratesIDCardReportFilter] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EmiratesIDCardReportFilter_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_EmiratesIDCardReportFilter_MasterReport] FOREIGN KEY ([MasterReportId]) REFERENCES [dbo].[MasterReport] ([Id]),
    CONSTRAINT [FK_EmiratesIDCardReportFilter_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_EmiratesIDCardReportFilter_Users_ModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

