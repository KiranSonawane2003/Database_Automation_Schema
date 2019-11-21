CREATE TABLE [dbo].[UserGroupBranchMapping] (
    [Id]            BIGINT   IDENTITY (1, 1) NOT NULL,
    [UserId]        INT      NOT NULL,
    [GroupId]       BIGINT   NULL,
    [BranchId]      BIGINT   NULL,
    [IsActive]      BIT      CONSTRAINT [DF_UserGroupBranchMap_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]   DATETIME NULL,
    [ModifiedDate]  DATETIME NULL,
    [CreatedBy]     INT      NULL,
    [ModifiedBy]    INT      NULL,
    [CountryId]     BIGINT   NULL,
    [CompanyTypeId] BIGINT   NULL,
    [CompanyId]     BIGINT   NULL,
    [AccessType]    INT      NULL,
    CONSTRAINT [UserGroupBranchMap_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_UserGroupBranchMapping_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [UserGroupBranchMapping_FK_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [UserGroupBranchMapping_FK_CompanyType] FOREIGN KEY ([CompanyTypeId]) REFERENCES [dbo].[CompanyType] ([Id]),
    CONSTRAINT [UserGroupBranchMapping_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [UserGroupBranchMapping_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [UserGroupBranchMapping_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [UserGroupBranchMapping_FK_UsersUserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Users] ([Id])
);

