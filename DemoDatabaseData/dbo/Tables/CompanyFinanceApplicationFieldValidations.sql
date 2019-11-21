CREATE TABLE [dbo].[CompanyFinanceApplicationFieldValidations] (
    [Id]                        BIGINT         IDENTITY (1, 1) NOT NULL,
    [CompanyId]                 BIGINT         NOT NULL,
    [FinanceApplicationFieldId] BIGINT         NOT NULL,
    [IsRequired]                BIT            NULL,
    [MaxLength]                 NVARCHAR (MAX) NULL,
    [ErrorMessage]              NVARCHAR (100) NULL,
    [RegularExpression]         NVARCHAR (100) NULL,
    [CreatedBy]                 INT            NULL,
    [ModifiedBy]                INT            NULL,
    [CreatedDate]               DATETIME       NULL,
    [ModifiedDate]              DATETIME       NULL,
    [IsActive]                  BIT            NULL,
    CONSTRAINT [PK_CompanyFinanceApplicationFieldMapping] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CompanyFinanceApplicationFieldMapping_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [FK_CompanyFinanceApplicationFieldMapping_FinanceApplicationFieldMaster] FOREIGN KEY ([FinanceApplicationFieldId]) REFERENCES [dbo].[FinanceApplicationFieldMaster] ([Id]),
    CONSTRAINT [FK_CompanyFinanceApplicationFieldValidations_Users] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_CompanyFinanceApplicationFieldValidations_Users1] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

