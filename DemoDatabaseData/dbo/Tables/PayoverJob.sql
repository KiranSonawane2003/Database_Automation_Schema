CREATE TABLE [dbo].[PayoverJob] (
    [Id]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [PayoverJobName] NVARCHAR (100) NOT NULL,
    [Seed]           INT            NULL,
    [CountryId]      BIGINT         NULL,
    [IsActive]       BIT            CONSTRAINT [PayoverJob_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]    DATETIME       CONSTRAINT [PayoverJob_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]   DATETIME       NULL,
    [CreatedBy]      INT            NOT NULL,
    [ModifiedBy]     INT            NULL,
    CONSTRAINT [PayoverJob_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [PayoverJob_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [PayoverJob_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [PayoverJob_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Payover Job name will be filled by ths table on page Crerate Group under Administaration >> Group >> CreateGroup', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'PayoverJob';

