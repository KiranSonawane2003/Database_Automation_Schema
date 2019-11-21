CREATE TABLE [dbo].[VehicleGroupBranchMapping] (
    [Id]           BIGINT   IDENTITY (1, 1) NOT NULL,
    [VehicleId]    BIGINT   NOT NULL,
    [GroupId]      BIGINT   NULL,
    [BranchId]     BIGINT   NULL,
    [CountryId]    BIGINT   NULL,
    [IsActive]     BIT      NOT NULL,
    [CreatedDate]  DATETIME NULL,
    [ModifiedDate] DATETIME NULL,
    [CreatedBy]    INT      NULL,
    [ModifiedBy]   INT      NULL,
    CONSTRAINT [VehicleGroupBranchMapping_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [VehicleGroupBranchMapping_FK_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [VehicleGroupBranchMapping_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [VehicleGroupBranchMapping_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [VehicleGroupBranchMapping_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [VehicleGroupBranchMapping_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [VehicleGroupBranchMapping_FK_Vehicle] FOREIGN KEY ([VehicleId]) REFERENCES [dbo].[Vehicle] ([Id])
);

