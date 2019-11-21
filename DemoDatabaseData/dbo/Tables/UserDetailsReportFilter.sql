CREATE TABLE [dbo].[UserDetailsReportFilter] (
    [Id]             BIGINT          IDENTITY (1, 1) NOT NULL,
    [MasterReportId] BIGINT          NULL,
    [IsEmailReport]  BIT             CONSTRAINT [DF_UserDetailsReportFilter_IsEmailReport_1] DEFAULT ((0)) NULL,
    [Email]          NVARCHAR (100)  NULL,
    [ReportFilePath] NVARCHAR (200)  NULL,
    [FileSize]       DECIMAL (18, 2) NULL,
    [ReportFormat]   INT             NULL,
    [IsActive]       BIT             CONSTRAINT [DF_UserDetailsReportFilter_IsActive_1] DEFAULT ((1)) NULL,
    [CreatedDate]    DATETIME        NULL,
    [ModifiedDate]   DATETIME        NULL,
    [CreatedBy]      INT             NULL,
    [ModifiedBy]     INT             NULL,
    CONSTRAINT [PK_UserDetailsReportFilter_1] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UserDetailsReportFilter_MasterReport1] FOREIGN KEY ([MasterReportId]) REFERENCES [dbo].[MasterReport] ([Id]),
    CONSTRAINT [FK_UserDetailsReportFilter_Users2] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_UserDetailsReportFilter_Users3] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

