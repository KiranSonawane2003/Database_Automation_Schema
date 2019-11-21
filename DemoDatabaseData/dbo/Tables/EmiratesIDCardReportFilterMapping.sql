CREATE TABLE [dbo].[EmiratesIDCardReportFilterMapping] (
    [Id]                           BIGINT   IDENTITY (1, 1) NOT NULL,
    [EmiratesIDCardReportFilterId] BIGINT   NULL,
    [GroupId]                      BIGINT   NULL,
    [BranchId]                     BIGINT   NULL,
    [CriteriaEnum]                 INT      NULL,
    [IsActive]                     BIT      DEFAULT ((0)) NOT NULL,
    [CreatedDate]                  DATETIME NULL,
    [ModifiedDate]                 DATETIME NULL,
    [CreatedBy]                    INT      NULL,
    [ModifiedBy]                   INT      NULL,
    CONSTRAINT [PK_EmiratesIDCardReportFilterMapping] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_EmiratesIDCardReportFilterMapping_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [FK_EmiratesIDCardReportFilterMapping_EmiratesIDCardReportFilter] FOREIGN KEY ([EmiratesIDCardReportFilterId]) REFERENCES [dbo].[EmiratesIDCardReportFilter] ([Id]),
    CONSTRAINT [FK_EmiratesIDCardReportFilterMapping_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [FK_EmiratesIDCardReportFilterMapping_Users_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_EmiratesIDCardReportFilterMapping_Users_ModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

