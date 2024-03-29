﻿CREATE TABLE [dbo].[DOCReportFilter] (
    [Id]                          BIGINT          IDENTITY (1, 1) NOT NULL,
    [IncludeUninceptedDeals]      BIT             CONSTRAINT [DF_DOCReportFilter_IncludeUninceptedDeals] DEFAULT ((0)) NULL,
    [IncludeCashTransactions]     BIT             CONSTRAINT [DF_DOCReportFilter_IncludeCashTransactions] DEFAULT ((0)) NULL,
    [StartDate]                   DATE            NULL,
    [EndDate]                     DATE            NULL,
    [IsCreateDate]                BIT             NULL,
    [IsInceptDate]                BIT             NULL,
    [IsInvoiceDate]               BIT             NULL,
    [IsInvoicePaidDate]           BIT             NULL,
    [AdministratorId]             BIGINT          NULL,
    [ClaimId]                     BIGINT          NULL,
    [OwnerId]                     BIGINT          NULL,
    [UnderwriterId]               BIGINT          NULL,
    [IsIncludeTarget]             BIT             CONSTRAINT [DF_DOCReportFilter_IsIncludeTarget] DEFAULT ((0)) NULL,
    [IsIncludeRollover]           BIT             CONSTRAINT [DF_DOCReportFilter_IsIncludeRollover] DEFAULT ((0)) NULL,
    [IsEmailReport]               BIT             NULL,
    [Email]                       NVARCHAR (100)  NULL,
    [SummaryPageId]               BIGINT          NULL,
    [GraphPageId]                 BIGINT          NULL,
    [ReportFilePath]              NVARCHAR (200)  NULL,
    [CopiedFrom]                  BIGINT          NULL,
    [CountryId]                   BIGINT          NULL,
    [IsActive]                    BIT             CONSTRAINT [DF_DOCReportFilter_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]                 DATETIME        CONSTRAINT [DF_DOCReportFilter_CreatedDate] DEFAULT (getutcdate()) NULL,
    [ModifiedDate]                DATETIME        NULL,
    [CreatedBy]                   INT             NULL,
    [ModifiedBy]                  INT             NULL,
    [FileSize]                    DECIMAL (18, 2) NULL,
    [MasterReportId]              BIGINT          NULL,
    [IsReportServiceFlag]         INT             NULL,
    [IsSummaryReport]             BIT             DEFAULT ((0)) NULL,
    [IsUnAssignedBusinessManager] BIT             NULL,
    [IsUnAssignedSalesPerson]     BIT             NULL,
    CONSTRAINT [DOCReportFilter_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [DOCReportFilter_FK_CompanyCompanyTypeMappingAdministratorId] FOREIGN KEY ([AdministratorId]) REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id]),
    CONSTRAINT [DOCReportFilter_FK_CompanyCompanyTypeMappingClaimId] FOREIGN KEY ([ClaimId]) REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id]),
    CONSTRAINT [DOCReportFilter_FK_CompanyCompanyTypeMappingOwnerId] FOREIGN KEY ([OwnerId]) REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id]),
    CONSTRAINT [DOCReportFilter_FK_CompanyCompanyTypeMappingUnderwriterId] FOREIGN KEY ([UnderwriterId]) REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id]),
    CONSTRAINT [DOCReportFilter_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [DOCReportFilter_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [DOCReportFilter_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_DOCReportFilter_MasterReport] FOREIGN KEY ([MasterReportId]) REFERENCES [dbo].[MasterReport] ([Id])
);

