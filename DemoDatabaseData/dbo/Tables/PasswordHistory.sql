CREATE TABLE [dbo].[PasswordHistory] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [PasswordHash] NVARCHAR (MAX) NULL,
    [CreatedDate]  DATETIME       NULL,
    [UserID]       NVARCHAR (200) NULL,
    CONSTRAINT [PK_PreviousPasswords] PRIMARY KEY CLUSTERED ([Id] ASC)
);

