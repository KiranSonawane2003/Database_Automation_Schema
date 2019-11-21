CREATE TABLE [dbo].[PackageGroup] (
    [Id]           BIGINT   IDENTITY (1, 1) NOT NULL,
    [PackageId]    BIGINT   NOT NULL,
    [GroupId]      BIGINT   NOT NULL,
    [SortKey]      INT      NULL,
    [StartDate]    DATE     NOT NULL,
    [EndDate]      DATE     NOT NULL,
    [CountryId]    BIGINT   NULL,
    [IsActive]     BIT      CONSTRAINT [PackagesGroup_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]  DATETIME CONSTRAINT [PackagesGroup_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate] DATETIME NULL,
    [CreatedBy]    INT      NOT NULL,
    [ModifiedBy]   INT      NULL,
    CONSTRAINT [PackagesGroup_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [PackagesGroup_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [PackagesGroup_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [PackagesGroup_FK_Packages] FOREIGN KEY ([PackageId]) REFERENCES [dbo].[Package] ([Id]),
    CONSTRAINT [PackagesGroup_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [PackagesGroup_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This Table is for store Packages for Group. (Packages-Group Mapping)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageGroup';

