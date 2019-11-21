CREATE TABLE [dbo].[Company](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyCode] [nvarchar](100) NOT NULL,
	[CompanyName] [nvarchar](max) NOT NULL,
	[CompanyLogo] [nvarchar](200) NULL,
	[FinanceCompanyName] [nvarchar](max) NULL,
	[InvoiceGenerator] [int] NULL,
	[QuoteValidityDays] [int] NULL,
	[WorkingDays] [int] NULL,
	[IsRecurringDebitDay] [bit] NOT NULL,
	[IsEditableFirstDebitAmount] [bit] NOT NULL,
	[ParentCompanyId] [bigint] NULL,
	[LegalName] [nvarchar](200) NULL,
	[RequirementTemplateId] [bigint] NULL,
	[LeadEmail] [nvarchar](max) NULL,
	[AutomatedLeadEmail] [nvarchar](max) NULL,
	[IsVATVendor] [bit] NOT NULL,
	[VATNumber] [nvarchar](100) NULL,
	[CompanyRegNo] [nvarchar](100) NULL,
	[FSPCompanyId] [bigint] NULL,
	[NCRRegistrationNumber] [nvarchar](100) NULL,
	[IsJuristicRepresentative] [bit] NOT NULL,
	[NCRRegNo] [nvarchar](100) NULL,
	[SLASignDate] [date] NULL,
	[CompanyEmail] [nvarchar](max) NULL,
	[RemittanceEmail] [nvarchar](max) NULL,
	[AltRemittanceEmail] [nvarchar](max) NULL,
	[Phone] [nvarchar](100) NULL,
	[Fax] [nvarchar](100) NULL,
	[PhyAddCountryId] [bigint] NULL,
	[PostAddCountryId] [bigint] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[BrochureDocumentName] [nvarchar](200) NULL,
	[BrochureDocumentPath] [nvarchar](500) NULL,
	[PhyAddBuildingName] [nvarchar](200) NULL,
	[PhyAddStreetName] [nvarchar](200) NULL,
	[PhyAddFloorNo] [int] NULL,
	[PhyAddNearestLandmark] [nvarchar](200) NULL,
	[PhyAddYearsAtCurrentAddress] [int] NULL,
	[PhyAddEmirate] [bigint] NULL,
	[PostAddPOBoxNo] [nvarchar](200) NULL,
	[PostAddEmirate] [bigint] NULL,
	[PhyAdd1] [nvarchar](200) NULL,
	[PhyAdd2] [nvarchar](200) NULL,
	[PhyAdd3] [nvarchar](200) NULL,
	[PostAdd1] [nvarchar](200) NULL,
	[PostAdd2] [nvarchar](200) NULL,
	[PostAdd3] [nvarchar](200) NULL,
	[CompanyPassword] [nvarchar](500) NULL,
	[SendFinanceApplicationEmail] [bit] NULL,
	[AttachFinanceDocumentEmail] [bit] NULL,
	[ShowFinAppHistory] [bit] NULL,
	[IsDocumentProtected] [bit] NULL,
	[DocumentPassword] [nvarchar](max) NULL,
	[IsEBankIntegration] [bit] NULL,
 CONSTRAINT [Company_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Company]  WITH NOCHECK ADD  CONSTRAINT [Company_FK_CompanyParentCompany] FOREIGN KEY([ParentCompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [Company_FK_CompanyParentCompany]
GO
ALTER TABLE [dbo].[Company]  WITH NOCHECK ADD  CONSTRAINT [Company_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [Company_FK_Country]
GO
ALTER TABLE [dbo].[Company]  WITH NOCHECK ADD  CONSTRAINT [Company_FK_FSPCompany] FOREIGN KEY([FSPCompanyId])
REFERENCES [dbo].[FSPCompany] ([Id])
GO

ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [Company_FK_FSPCompany]
GO
ALTER TABLE [dbo].[Company]  WITH NOCHECK ADD  CONSTRAINT [Company_FK_Template] FOREIGN KEY([RequirementTemplateId])
REFERENCES [dbo].[Template] ([Id])
GO

ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [Company_FK_Template]
GO
ALTER TABLE [dbo].[Company]  WITH NOCHECK ADD  CONSTRAINT [Company_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [Company_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[Company]  WITH NOCHECK ADD  CONSTRAINT [Company_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [Company_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Country] FOREIGN KEY([PhyAddCountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Country]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Country1] FOREIGN KEY([PostAddCountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Country1]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_StaticValue] FOREIGN KEY([PhyAddEmirate])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_StaticValue]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_StaticValue1] FOREIGN KEY([PostAddEmirate])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_StaticValue1]
GO
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [Company_DF_RecurringDebitDay]  DEFAULT ((0)) FOR [IsRecurringDebitDay]
GO
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [Company_DF_EditableFirstDebitAmount]  DEFAULT ((0)) FOR [IsEditableFirstDebitAmount]
GO
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [Company_DF_VATVendor]  DEFAULT ((0)) FOR [IsVATVendor]
GO
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [Company_DF_JuristicRepresentativ]  DEFAULT ((0)) FOR [IsJuristicRepresentative]
GO
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [Company_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [Company_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key from table FSPCompany. Will fill the FSP Company Dropdown of Create Company under Administration >> Company Admin>> Create company.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'FSPCompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key from table Country. Will fill the Physical Address Country Dropdown of Create Company under Administration >> Company Admin>> Create company.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'PhyAddCountryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key from table Country. Will fill the Postal Address Country Dropdown of Create Company under Administration >> Company Admin>> Create company.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company', @level2type=N'COLUMN',@level2name=N'PostAddCountryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table stores the information of Company. Will fill by create company page.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Company'