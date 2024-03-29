﻿CREATE TABLE [dbo].[CompanyInformation] (
    [Id]                          BIGINT         IDENTITY (1, 1) NOT NULL,
    [CompanyId]                   BIGINT         NULL,
    [StartDate]                   DATE           NULL,
    [EndDate]                     DATE           NULL,
    [CompanyCode]                 NVARCHAR (100) NOT NULL,
    [CompanyName]                 NVARCHAR (MAX) NOT NULL,
    [CompanyLogo]                 NVARCHAR (200) NULL,
    [FinanceCompanyName]          NVARCHAR (MAX) NULL,
    [InvoiceGenerator]            INT            NULL,
    [QuoteValidityDays]           INT            NULL,
    [WorkingDays]                 INT            NULL,
    [IsRecurringDebitDay]         BIT            CONSTRAINT [DF__CompanyIn__IsRec__2E19AC07] DEFAULT ((0)) NOT NULL,
    [IsEditableFirstDebitAmount]  BIT            CONSTRAINT [DF__CompanyIn__IsEdi__2F0DD040] DEFAULT ((0)) NOT NULL,
    [ParentCompanyId]             BIGINT         NULL,
    [LegalName]                   NVARCHAR (200) NULL,
    [RequirementTemplateId]       BIGINT         NULL,
    [LeadEmail]                   NVARCHAR (MAX) NULL,
    [AutomatedLeadEmail]          NVARCHAR (MAX) NULL,
    [IsVATVendor]                 BIT            CONSTRAINT [DF__CompanyIn__IsVAT__3001F479] DEFAULT ((0)) NOT NULL,
    [VATNumber]                   NVARCHAR (100) NULL,
    [CompanyRegNo]                NVARCHAR (100) NULL,
    [FSPCompanyId]                BIGINT         NULL,
    [NCRRegistrationNumber]       NVARCHAR (100) NULL,
    [IsJuristicRepresentative]    BIT            CONSTRAINT [DF__CompanyIn__IsJur__30F618B2] DEFAULT ((0)) NOT NULL,
    [NCRRegNo]                    NVARCHAR (100) NULL,
    [SLASignDate]                 DATE           NULL,
    [CompanyEmail]                NVARCHAR (MAX) NULL,
    [RemittanceEmail]             NVARCHAR (MAX) NULL,
    [AltRemittanceEmail]          NVARCHAR (MAX) NULL,
    [Phone]                       NVARCHAR (100) NULL,
    [Fax]                         NVARCHAR (100) NULL,
    [PhyAddCountryId]             BIGINT         NULL,
    [PostAddCountryId]            BIGINT         NULL,
    [CountryId]                   BIGINT         NULL,
    [IsActive]                    BIT            CONSTRAINT [DF__CompanyIn__IsAct__31EA3CEB] DEFAULT ((1)) NOT NULL,
    [CreatedDate]                 DATETIME       CONSTRAINT [DF__CompanyIn__Creat__32DE6124] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]                DATETIME       NULL,
    [CreatedBy]                   INT            NOT NULL,
    [ModifiedBy]                  INT            NULL,
    [BrochureDocumentName]        NVARCHAR (200) NULL,
    [BrochureDocumentPath]        NVARCHAR (500) NULL,
    [PhyAddBuildingName]          NVARCHAR (200) NULL,
    [PhyAddStreetName]            NVARCHAR (200) NULL,
    [PhyAddFloorNo]               INT            NULL,
    [PhyAddNearestLandmark]       NVARCHAR (200) NULL,
    [PhyAddYearsAtCurrentAddress] INT            NULL,
    [PhyAddEmirate]               BIGINT         NULL,
    [PostAddPOBoxNo]              NVARCHAR (200) NULL,
    [PostAddEmirate]              BIGINT         NULL,
    [PhyAdd1]                     NVARCHAR (200) NULL,
    [PhyAdd2]                     NVARCHAR (200) NULL,
    [PhyAdd3]                     NVARCHAR (200) NULL,
    [PostAdd1]                    NVARCHAR (200) NULL,
    [PostAdd2]                    NVARCHAR (200) NULL,
    [PostAdd3]                    NVARCHAR (200) NULL,
    [CompanyPassword]             NVARCHAR (500) NULL,
    CONSTRAINT [CompanyInformation_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CompanyInformation_FK_CompanyInformation] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [CompanyInformation_FK_CompanyInformationParentCompany] FOREIGN KEY ([ParentCompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [CompanyInformation_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [CompanyInformation_FK_FSPCompany] FOREIGN KEY ([FSPCompanyId]) REFERENCES [dbo].[FSPCompany] ([Id]),
    CONSTRAINT [CompanyInformation_FK_Template] FOREIGN KEY ([RequirementTemplateId]) REFERENCES [dbo].[Template] ([Id]),
    CONSTRAINT [CompanyInformation_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [CompanyInformation_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_CompanyInformation_Country] FOREIGN KEY ([PhyAddCountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_CompanyInformation_Country1] FOREIGN KEY ([PostAddCountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FK_CompanyInformation_StaticValue] FOREIGN KEY ([PhyAddEmirate]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [FK_CompanyInformation_StaticValue1] FOREIGN KEY ([PostAddEmirate]) REFERENCES [dbo].[StaticValue] ([Id])
);

