CREATE TABLE [dbo].[PayoverReportFilterMapping] (
    [Id]                    BIGINT   IDENTITY (1, 1) NOT NULL,
    [PayoverReportFilterId] BIGINT   NOT NULL,
    [GroupId]               BIGINT   NULL,
    [BranchId]              BIGINT   NULL,
    [CriteriaEnum]          INT      NULL,
    [IsActive]              BIT      DEFAULT ((0)) NOT NULL,
    [CreatedDate]           DATETIME NULL,
    [ModifiedDate]          DATETIME NULL,
    [CreatedBy]             INT      NULL,
    [ModifiedBy]            INT      NULL,
    CONSTRAINT [PK_PayoverReportFilterMapping] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PayoverReportFilterMapping_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [FK_PayoverReportFilterMapping_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [FK_PayoverReportFilterMapping_PayoverReportFilter] FOREIGN KEY ([PayoverReportFilterId]) REFERENCES [dbo].[PayoverReportFilter] ([Id]),
    CONSTRAINT [FK_PayoverReportFilterMapping_Users] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_PayoverReportFilterMapping_Users1] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

