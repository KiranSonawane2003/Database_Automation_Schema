﻿CREATE TABLE [dbo].[Package] (
    [Id]                    BIGINT          IDENTITY (1, 1) NOT NULL,
    [GroupId]               BIGINT          NULL,
    [BranchId]              BIGINT          NULL,
    [PackageName]           NVARCHAR (100)  NOT NULL,
    [MinRequiredProduct]    INT             NOT NULL,
    [MaxRequiredProdcut]    INT             NOT NULL,
    [RecDiscountAmount]     DECIMAL (18, 2) NULL,
    [RecDiscountPercentage] DECIMAL (18, 2) NULL,
    [IsEnforceDiscount]     BIT             CONSTRAINT [Packages_DF_EnforceDiscount] DEFAULT ((0)) NOT NULL,
    [MinimumDiscount]       DECIMAL (18, 2) NULL,
    [MaximumDiscount]       DECIMAL (18, 2) NULL,
    [StartDate]             DATE            NOT NULL,
    [EndDate]               DATE            NOT NULL,
    [CountryId]             BIGINT          NULL,
    [IsActive]              BIT             CONSTRAINT [Packages_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]           DATETIME        CONSTRAINT [Packages_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]          DATETIME        NULL,
    [CreatedBy]             INT             NOT NULL,
    [ModifiedBy]            INT             NULL,
    CONSTRAINT [Packages_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [Packages_FK_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [Packages_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [Packages_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [Packages_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Packages_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);
