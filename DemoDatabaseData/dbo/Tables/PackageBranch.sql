CREATE TABLE [dbo].[PackageBranch] (
    [Id]           BIGINT   NOT NULL,
    [PackageId]    BIGINT   NOT NULL,
    [GroupId]      BIGINT   NOT NULL,
    [BranchId]     BIGINT   NOT NULL,
    [SortKey]      INT      NULL,
    [StartDate]    DATE     NOT NULL,
    [EndDate]      DATE     NOT NULL,
    [CountryId]    BIGINT   NULL,
    [IsActive]     BIT      CONSTRAINT [PackageBranch_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]  DATETIME CONSTRAINT [PackageBranch_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate] DATETIME NULL,
    [CreatedBy]    INT      NOT NULL,
    [ModifiedBy]   INT      NULL,
    CONSTRAINT [PackageBranch_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [PackageBranch_FK_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [PackageBranch_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [PackageBranch_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [PackageBranch_FK_Packages] FOREIGN KEY ([PackageId]) REFERENCES [dbo].[Package] ([Id]),
    CONSTRAINT [PackageBranch_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [PackageBranch_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is for Package Branch Mapping.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageBranch';

