CREATE TABLE [dbo].[GroupBranchDocCategoryMapping] (
    [Id]                 BIGINT   IDENTITY (1, 1) NOT NULL,
    [GroupId]            BIGINT   NULL,
    [BranchId]           BIGINT   NULL,
    [DocumentCategoryId] BIGINT   NULL,
    [IsActive]           BIT      CONSTRAINT [DF_GroupBranchDocCategoryMapping_IsActive] DEFAULT ((1)) NULL,
    [CreatedBy]          INT      NULL,
    [CreatedDate]        DATETIME NULL,
    [ModifiedBy]         INT      NULL,
    [ModifiedDate]       DATETIME NULL,
    CONSTRAINT [GroupBranchDocCategoryMapping_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [GroupBranchDocCategoryMapping_FK_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [GroupBranchDocCategoryMapping_FK_DocumentCategory] FOREIGN KEY ([DocumentCategoryId]) REFERENCES [dbo].[DocumentCategory] ([Id]),
    CONSTRAINT [GroupBranchDocCategoryMapping_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [GroupBranchDocCategoryMapping_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [GroupBranchDocCategoryMapping_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

