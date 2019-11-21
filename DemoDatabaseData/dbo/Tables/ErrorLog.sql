CREATE TABLE [dbo].[ErrorLog] (
    [Id]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [ErrorHtml]    NVARCHAR (MAX) NULL,
    [CountryId]    BIGINT         NULL,
    [IsActive]     BIGINT         CONSTRAINT [ErrorLog_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]  DATETIME       CONSTRAINT [ErrorLog_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate] DATETIME       NULL,
    [CreatedBy]    INT            NOT NULL,
    [ModifiedBy]   INT            NULL,
    CONSTRAINT [ErrorLog_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [ErrorLog_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [ErrorLog_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [ErrorLog_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table for store error log in system.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ErrorLog';

