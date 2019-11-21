CREATE TABLE [dbo].[GroupWording] (
    [Id]                   BIGINT         IDENTITY (1, 1) NOT NULL,
    [GroupId]              BIGINT         NOT NULL,
    [WordingCatId]         BIGINT         NOT NULL,
    [WordingFileName]      NVARCHAR (100) NULL,
    [WordingFilePath]      NVARCHAR (200) NOT NULL,
    [EffectiveImmediately] BIT            CONSTRAINT [GroupWording_DF_EffectiveImmediately] DEFAULT ((0)) NOT NULL,
    [StartDate]            DATE           NOT NULL,
    [EndDate]              DATE           NOT NULL,
    [CountryId]            BIGINT         NULL,
    [IsActive]             BIT            CONSTRAINT [GroupWording_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]          DATETIME       CONSTRAINT [GroupWording_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]         DATETIME       NULL,
    [CreatedBy]            INT            NOT NULL,
    [ModifiedBy]           INT            NULL,
    CONSTRAINT [GroupWording_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [GroupWording_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [GroupWording_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [GroupWording_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [GroupWording_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [GroupWording_FK_WordingCategory] FOREIGN KEY ([WordingCatId]) REFERENCES [dbo].[WordingCategory] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table stores wording document', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'GroupWording';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table Wording Category', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'GroupWording', @level2type = N'COLUMN', @level2name = N'WordingCatId';

