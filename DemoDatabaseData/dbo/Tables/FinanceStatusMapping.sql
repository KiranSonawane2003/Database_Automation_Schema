CREATE TABLE [dbo].[FinanceStatusMapping] (
    [Id]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [CompanyID]       BIGINT         NOT NULL,
    [Status]          NVARCHAR (200) NULL,
    [FinanceStatusID] BIGINT         NOT NULL,
    [StatusNotes]     NVARCHAR (500) NULL,
    [CreatedBy]       INT            NULL,
    [ModifiedBy]      INT            NULL,
    [CreatedDate]     DATETIME       NULL,
    [ModifiedDate]    DATETIME       NULL,
    [IsActive]        BIT            CONSTRAINT [DF__FinanceSt__IsAct__526B4FBF] DEFAULT ((1)) NOT NULL,
    [chkDalasStatus]  BIT            NULL,
    CONSTRAINT [PK_FinanceStatusMapping] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FinanceStatusMapping_FK_CompanyID] FOREIGN KEY ([CompanyID]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [FinanceStatusMapping_FK_StaticValueFinanceStatus] FOREIGN KEY ([FinanceStatusID]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_FinanceStatusMapping_Users] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_FinanceStatusMapping_Users1] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

