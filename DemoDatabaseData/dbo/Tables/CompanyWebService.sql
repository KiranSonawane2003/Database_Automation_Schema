CREATE TABLE [dbo].[CompanyWebService] (
    [Id]                      BIGINT         NOT NULL,
    [CompanyCompanyTypeMapId] BIGINT         NOT NULL,
    [WebServiceCode]          NVARCHAR (200) NOT NULL,
    [WebServiceType]          NVARCHAR (200) NULL,
    [WebServiceAction]        NVARCHAR (200) NULL,
    [WebServiceURL]           NVARCHAR (200) NOT NULL,
    [WebServiceUserName]      NVARCHAR (100) NULL,
    [WebServicePassword]      NVARCHAR (200) NULL,
    [EmailTo]                 NVARCHAR (100) COLLATE Latin1_General_CI_AS NULL,
    [EmailFrom]               NVARCHAR (100) COLLATE Latin1_General_CI_AS NULL,
    [Version]                 NVARCHAR (50)  NULL,
    [CountryId]               BIGINT         NULL,
    [IsActive]                BIT            CONSTRAINT [CompanyWebService_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]             DATETIME       CONSTRAINT [CompanyWebService_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]            DATETIME       NULL,
    [CreatedBy]               INT            NOT NULL,
    [ModifiedBy]              INT            NULL,
    CONSTRAINT [CompanyWebService_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CompanyWebService_FK_CompanyCompanyTypeMapping] FOREIGN KEY ([CompanyCompanyTypeMapId]) REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id]),
    CONSTRAINT [CompanyWebService_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [CompanyWebService_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [CompanyWebService_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This Table use to store WebService details from webservice page under Admin >> Companies >> Edit Company', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'CompanyWebService';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign Key form table Company', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'CompanyWebService', @level2type = N'COLUMN', @level2name = N'CreatedDate';

