CREATE TABLE [dbo].[ProductOption] (
    [Id]                       BIGINT         IDENTITY (1, 1) NOT NULL,
    [ProductId]                BIGINT         NOT NULL,
    [SortKey]                  INT            NULL,
    [OptionCode]               NVARCHAR (50)  NOT NULL,
    [OptionName]               NVARCHAR (100) NOT NULL,
    [ProductDisclosure]        NVARCHAR (200) NULL,
    [OptionType]               INT            NULL,
    [IsVATIndicator]           BIT            CONSTRAINT [ProductOption_DF_VATIndicator] DEFAULT ((0)) NOT NULL,
    [IsMedicalInfoRequired]    BIT            CONSTRAINT [ProductOption_DF_MedicalInfoRequired] DEFAULT ((0)) NOT NULL,
    [ProductSubTypeId]         BIGINT         NULL,
    [TransactionFinCondition]  INT            NULL,
    [ManufacturerTemplateId]   BIGINT         NULL,
    [StartDate]                DATE           NOT NULL,
    [EndDate]                  DATE           NOT NULL,
    [CountryId]                BIGINT         NULL,
    [IsActive]                 BIT            CONSTRAINT [ProductOption_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]              DATETIME       CONSTRAINT [ProductOption_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]             DATETIME       NULL,
    [CreatedBy]                INT            NOT NULL,
    [ModifiedBy]               INT            NULL,
    [MinimumEntryAge]          INT            NULL,
    [MaximumEntryAge]          INT            NULL,
    [IsStampDuty]              BIT            NULL,
    [IsNamfisa]                BIT            NULL,
    [ProductOptionWordingPath] NVARCHAR (200) NULL,
    [TransactionTypeId]        BIGINT         NULL,
    CONSTRAINT [ProductOption_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [ProductOption_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [ProductOption_FK_Product] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Product] ([Id]),
    CONSTRAINT [ProductOption_FK_ProductSubType] FOREIGN KEY ([ProductSubTypeId]) REFERENCES [dbo].[ProductSubType] ([Id]),
    CONSTRAINT [ProductOption_FK_StaticValue] FOREIGN KEY ([TransactionTypeId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [ProductOption_FK_Template] FOREIGN KEY ([ManufacturerTemplateId]) REFERENCES [dbo].[Template] ([Id]),
    CONSTRAINT [ProductOption_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [ProductOption_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Table use to save Product Options.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'ProductOption';

