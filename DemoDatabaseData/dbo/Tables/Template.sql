CREATE TABLE [dbo].[Template] (
    [Id]                 BIGINT         IDENTITY (1, 1) NOT NULL,
    [TemplateName]       NVARCHAR (100) NOT NULL,
    [ReportHeading]      NVARCHAR (100) NULL,
    [CommentRequired]    INT            NULL,
    [StartDate]          DATE           CONSTRAINT [DF_Template_StartDate] DEFAULT (getdate()) NOT NULL,
    [EndDate]            DATE           CONSTRAINT [DF_Template_EndDate] DEFAULT (dateadd(year,(10),getdate())) NOT NULL,
    [TemplateType]       TINYINT        NULL,
    [CountryId]          BIGINT         NULL,
    [IsActive]           BIT            CONSTRAINT [Template_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]        DATETIME       CONSTRAINT [Template_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]       DATETIME       NULL,
    [CreatedBy]          INT            NOT NULL,
    [ModifiedBy]         INT            NULL,
    [TemplateCategoryId] BIGINT         NULL,
    [IsAnswerRequired]   BIT            NULL,
    CONSTRAINT [Template_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Template_TemplateCategory] FOREIGN KEY ([TemplateCategoryId]) REFERENCES [dbo].[TemplateCategory] ([Id]),
    CONSTRAINT [Template_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [Template_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Template_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This Table use to store created templet details under admin system >> Template Admin >> Create Template', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Template';

