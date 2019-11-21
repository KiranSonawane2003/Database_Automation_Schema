CREATE TABLE [dbo].[PackageWording] (
    [Id]                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [PackageId]              BIGINT         NOT NULL,
    [WordingFileName]        NVARCHAR (100) NULL,
    [EffectiveImmediately]   BIT            CONSTRAINT [PackageWording_DF_EffectiveImmediately] DEFAULT ((0)) NOT NULL,
    [OverrideProductWording] BIT            CONSTRAINT [PackageWording_DF_OverrideProductWording] DEFAULT ((0)) NOT NULL,
    [StartDate]              DATE           NOT NULL,
    [EndDate]                DATE           NOT NULL,
    [CountryId]              BIGINT         NULL,
    [IsActive]               BIT            CONSTRAINT [PackageWording_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]            DATETIME       CONSTRAINT [PackageWording_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]           DATETIME       NOT NULL,
    [CreatedBy]              INT            NULL,
    [ModifiedBy]             INT            NULL,
    CONSTRAINT [PackageWording_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [PackageWording_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [PackageWording_FK_Packages] FOREIGN KEY ([PackageId]) REFERENCES [dbo].[Package] ([Id]),
    CONSTRAINT [PackageWording_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [PackageWording_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores package wording document', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PackageWording';

