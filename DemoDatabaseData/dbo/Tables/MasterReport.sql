CREATE TABLE [dbo].[MasterReport] (
    [Id]              BIGINT          IDENTITY (1, 1) NOT NULL,
    [ReportName]      NVARCHAR (50)   NULL,
    [ReportNameEnum]  NVARCHAR (50)   NULL,
    [IsEmailReport]   BIT             DEFAULT ((0)) NOT NULL,
    [Email]           NVARCHAR (100)  NULL,
    [ReportFilePath]  NVARCHAR (200)  NULL,
    [FileSize]        DECIMAL (18, 2) NULL,
    [CountryId]       BIGINT          NOT NULL,
    [IsActive]        BIT             DEFAULT ((1)) NOT NULL,
    [CreatedDate]     DATETIME        DEFAULT (getutcdate()) NULL,
    [ModifiedDate]    DATETIME        NULL,
    [CreatedBy]       INT             NULL,
    [ModifiedBy]      INT             NULL,
    [IsSavedCriteria] BIT             NULL,
    [Notes]           NVARCHAR (2000) NULL,
    CONSTRAINT [PK_MasterReport] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_MasterReport_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_MasterReport_Users] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_MasterReport_Users1] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

