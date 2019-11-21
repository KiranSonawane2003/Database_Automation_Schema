CREATE TABLE [dbo].[FSPCompany] (
    [Id]                             BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]                           NVARCHAR (100) NOT NULL,
    [Description]                    NVARCHAR (200) NULL,
    [Number]                         NVARCHAR (100) NOT NULL,
    [ComplienceOfficerId]            BIGINT         NOT NULL,
    [ComplaintsOfficerId]            BIGINT         NOT NULL,
    [PhyAddCountryId]                BIGINT         NULL,
    [PhyAddAddressLine1]             NVARCHAR (200) COLLATE Latin1_General_CI_AS NULL,
    [PhyAddAddressLine2]             NVARCHAR (200) COLLATE Latin1_General_CI_AS NULL,
    [PhyAddSuburbId]                 BIGINT         NULL,
    [PhyAddProvinceId]               BIGINT         NULL,
    [PostAddCountryId]               BIGINT         NULL,
    [PostAddAddressLine1]            NVARCHAR (200) COLLATE Latin1_General_CI_AS NULL,
    [PostAddAddressLine2]            NVARCHAR (200) COLLATE Latin1_General_CI_AS NULL,
    [PostAddSuburbId]                BIGINT         NULL,
    [PostAddProvinceId]              BIGINT         NULL,
    [Phone]                          NVARCHAR (100) COLLATE Latin1_General_CI_AS NULL,
    [Fax]                            NVARCHAR (100) NULL,
    [Email]                          NVARCHAR (100) COLLATE Latin1_General_CI_AS NULL,
    [FSPApprovalPersonId]            BIGINT         NULL,
    [IsAdviceLicence]                BIT            CONSTRAINT [FSPCompany_DF_AdviceLicence] DEFAULT ((0)) NOT NULL,
    [IsIntermediaryServices]         BIT            CONSTRAINT [FSPCompany_DF_IntermediaryServices] DEFAULT ((0)) NOT NULL,
    [IsShortTermInsurancePersonal]   BIT            CONSTRAINT [FSPCompany_DF_ShortTermInsurancePersonal] DEFAULT ((0)) NOT NULL,
    [IsShortTermInsuranceCommercial] BIT            CONSTRAINT [FSPCompany_DF_ShortTermInsuranceCommercial] DEFAULT ((0)) NOT NULL,
    [IsLongTermInsCatA]              BIT            CONSTRAINT [FSPCompany_LongTermInsCatA] DEFAULT ((0)) NOT NULL,
    [IsLongTermInsSubCatB1]          BIT            CONSTRAINT [FSPCompany_DF_LongTermInsSubCatB1] DEFAULT ((0)) NOT NULL,
    [IsLongTermInsSubCatB2]          BIT            CONSTRAINT [FSPCompany_DF_LongTermInsSubCatB2] DEFAULT ((0)) NOT NULL,
    [IsLongTermInsCatC]              BIT            CONSTRAINT [FSPCompany_DF_LongTermInsCatC] DEFAULT ((0)) NOT NULL,
    [ReviewDate]                     DATE           NULL,
    [StartDate]                      DATE           NOT NULL,
    [EndDate]                        DATE           NOT NULL,
    [IsTerminated]                   BIT            CONSTRAINT [FSPCompany_DF_Terminated] DEFAULT ((0)) NOT NULL,
    [CountryId]                      BIGINT         NULL,
    [IsActive]                       BIT            CONSTRAINT [FSPCompany_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]                    DATETIME       CONSTRAINT [FSPCompany_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]                   DATETIME       NULL,
    [CreatedBy]                      INT            NOT NULL,
    [ModifiedBy]                     INT            NULL,
    CONSTRAINT [FSPCompany_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FSPCompany_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FSPCompany_FK_CountryPhyAdd] FOREIGN KEY ([PhyAddCountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FSPCompany_FK_CountryPostAdd] FOREIGN KEY ([PostAddCountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [FSPCompany_FK_FSPCompany] FOREIGN KEY ([PostAddProvinceId]) REFERENCES [dbo].[Province] ([Id]),
    CONSTRAINT [FSPCompany_FK_FSPCompanyPostAdd] FOREIGN KEY ([PostAddProvinceId]) REFERENCES [dbo].[Province] ([Id]),
    CONSTRAINT [FSPCompany_FK_FSPPersonApproval] FOREIGN KEY ([FSPApprovalPersonId]) REFERENCES [dbo].[FSPPerson] ([Id]),
    CONSTRAINT [FSPCompany_FK_FSPPersonComplaintsOfficer] FOREIGN KEY ([ComplaintsOfficerId]) REFERENCES [dbo].[FSPPerson] ([Id]),
    CONSTRAINT [FSPCompany_FK_FSPPersonComplienceOfficer] FOREIGN KEY ([ComplienceOfficerId]) REFERENCES [dbo].[FSPPerson] ([Id]),
    CONSTRAINT [FSPCompany_FK_ProvincePhyAdd] FOREIGN KEY ([PhyAddProvinceId]) REFERENCES [dbo].[Province] ([Id]),
    CONSTRAINT [FSPCompany_FK_ProvincePostAdd] FOREIGN KEY ([PostAddProvinceId]) REFERENCES [dbo].[Province] ([Id]),
    CONSTRAINT [FSPCompany_FK_SuburbPhyAdd] FOREIGN KEY ([PhyAddSuburbId]) REFERENCES [dbo].[Suburb] ([Id]),
    CONSTRAINT [FSPCompany_FK_SuburbPostAdd] FOREIGN KEY ([PostAddSuburbId]) REFERENCES [dbo].[Suburb] ([Id]),
    CONSTRAINT [FSPCompany_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FSPCompany_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table store the FSP Company information. ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'FSPCompany';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Complience Officer Dropdown fill by FSPPerson table. It is Foreign Key from table FSPPerson.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'FSPCompany', @level2type = N'COLUMN', @level2name = N'ComplienceOfficerId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Complaints Officer Dropdown fill by FSPPerson table. It is Foreign Key from table FSPPerson.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'FSPCompany', @level2type = N'COLUMN', @level2name = N'ComplaintsOfficerId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Physical address Country Dropdown fill by Country table. It is Foreign Key from table Country.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'FSPCompany', @level2type = N'COLUMN', @level2name = N'PhyAddCountryId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Select Suburb of physical address by Suburb table. It is Foreign Key from table Suburb.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'FSPCompany', @level2type = N'COLUMN', @level2name = N'PhyAddSuburbId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Postal address Country Dropdown fill by Country table. It is Foreign Key from table Country.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'FSPCompany', @level2type = N'COLUMN', @level2name = N'PostAddCountryId';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Select Suburb of Postal address by Suburb table. It is Foreign Key from table Suburb.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'FSPCompany', @level2type = N'COLUMN', @level2name = N'PostAddSuburbId';

