CREATE TABLE [dbo].[DealTrackerReportFilter] (
    [Id]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [MasterReportId] BIGINT         NOT NULL,
    [StartDate]      DATE           NULL,
    [EndDate]        DATE           NULL,
    [IsInceptDate]   BIT            DEFAULT ((0)) NOT NULL,
    [IsCreateDate]   BIT            DEFAULT ((0)) NOT NULL,
    [IsUnIncept]     BIT            DEFAULT ((0)) NOT NULL,
    [CopiedFrom]     BIGINT         NULL,
    [IsEmailReport]  BIT            DEFAULT ((0)) NOT NULL,
    [Email]          NVARCHAR (100) NULL,
    [CountryId]      BIGINT         NULL,
    [IsActive]       BIT            DEFAULT ((1)) NOT NULL,
    [CreatedDate]    DATETIME       DEFAULT (getutcdate()) NULL,
    [ModifiedDate]   DATETIME       NULL,
    [CreatedBy]      INT            NULL,
    [ModifiedBy]     INT            NULL,
    CONSTRAINT [PK_DealTrackerReportFilter] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_DealTrackerReportFilter_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_DealTrackerReportFilter_MasterReport] FOREIGN KEY ([MasterReportId]) REFERENCES [dbo].[MasterReport] ([Id]),
    CONSTRAINT [FK_DealTrackerReportFilter_Users] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_DealTrackerReportFilter_Users1] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

