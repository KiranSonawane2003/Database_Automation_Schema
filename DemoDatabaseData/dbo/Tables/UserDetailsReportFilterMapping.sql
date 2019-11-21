CREATE TABLE [dbo].[UserDetailsReportFilterMapping] (
    [Id]                        BIGINT   IDENTITY (1, 1) NOT NULL,
    [UserDetailsReportFilterId] BIGINT   NOT NULL,
    [GroupId]                   BIGINT   NULL,
    [BranchId]                  BIGINT   NULL,
    [CountryId]                 BIGINT   NULL,
    [CriteriaEnum]              INT      NULL,
    [IsActive]                  BIT      CONSTRAINT [DF_UserDetailsReportFilterMapping_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]               DATETIME NULL,
    [ModifiedDate]              DATETIME NULL,
    [CreatedBy]                 INT      NULL,
    [ModifiedBy]                INT      NULL,
    CONSTRAINT [UserDetailsReportFilterMapping_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [UserDetailsReportFilterMapping_FK_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [UserDetailsReportFilterMapping_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [UserDetailsReportFilterMapping_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [UserDetailsReportFilterMapping_FK_UserDetailsReportFilter] FOREIGN KEY ([UserDetailsReportFilterId]) REFERENCES [dbo].[UserDetailsReportFilter] ([Id]),
    CONSTRAINT [UserDetailsReportFilterMapping_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [UserDetailsReportFilterMapping_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

