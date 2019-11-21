CREATE TABLE [dbo].[GroupSSF] (
    [Id]             BIGINT          IDENTITY (1, 1) NOT NULL,
    [GroupId]        BIGINT          NULL,
    [TransactionFee] DECIMAL (18, 2) NULL,
    [IsVatIndicator] BIT             NULL,
    [StartDate]      DATE            NULL,
    [EndDate]        DATE            NULL,
    [CountryId]      BIGINT          NULL,
    [IsActive]       BIT             DEFAULT ((1)) NOT NULL,
    [CreatedBy]      INT             NULL,
    [ModifiedBy]     INT             NULL,
    [CreateDate]     DATETIME        DEFAULT (getutcdate()) NULL,
    [ModifiedDate]   DATETIME        NULL,
    CONSTRAINT [GroupSSF_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [GroupSSF_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [GroupSSF_FK_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id]),
    CONSTRAINT [GroupSSF_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [GroupSSF_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

