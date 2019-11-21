CREATE TABLE [dbo].[IGFLicence] (
    [Id]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [Number]       BIGINT         NOT NULL,
    [Name]         NVARCHAR (100) NOT NULL,
    [DocName]      NVARCHAR (100) NULL,
    [StartDate]    DATETIME       NOT NULL,
    [EndDate]      DATETIME       NOT NULL,
    [IsTerminated] BIT            CONSTRAINT [IGFLicence_DF_Terminated] DEFAULT ((0)) NOT NULL,
    [CountryId]    BIGINT         NULL,
    [IsActive]     BIT            CONSTRAINT [IGFLicence_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]  DATETIME       CONSTRAINT [IGFLicence_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [CreatedBy]    INT            NOT NULL,
    [ModifiedBy]   INT            NULL,
    CONSTRAINT [IGFLicence_FK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [IGFLicence_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [IGFLicence_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [IGFLicence_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is used to store IGF Licence Admin page information under Admin >> Company Admin', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'IGFLicence';

