CREATE TABLE [dbo].[ROTTemplateLineOption] (
    [Id]             BIGINT          IDENTITY (1, 1) NOT NULL,
    [TemplateLineId] BIGINT          NOT NULL,
    [ControlTypeId]  BIGINT          NOT NULL,
    [CountryId]      BIGINT          NOT NULL,
    [OptionValue]    NVARCHAR (1000) NULL,
    [SortKey]        INT             NULL,
    [IsActive]       BIT             NULL,
    [CreatedDate]    DATETIME        NULL,
    [ModifiedDate]   DATETIME        NULL,
    [CreatedBy]      INT             NULL,
    [ModifiedBy]     INT             NULL,
    CONSTRAINT [PK_ROTTemplateLineOption] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ROTTemplateLineOption_ControlType] FOREIGN KEY ([ControlTypeId]) REFERENCES [dbo].[ROTControlType] ([Id]),
    CONSTRAINT [FK_ROTTemplateLineOption_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_ROTTemplateLineOption_CreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_ROTTemplateLineOption_ModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_ROTTemplateLineOption_TemplateLine] FOREIGN KEY ([TemplateLineId]) REFERENCES [dbo].[ROTTemplateLine] ([Id])
);

