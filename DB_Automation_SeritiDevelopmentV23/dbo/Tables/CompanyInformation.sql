CREATE TABLE [dbo].[CompanyInformation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyId] [bigint] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
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
 CONSTRAINT [CompanyInformation_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyInformation]  WITH CHECK ADD  CONSTRAINT [CompanyInformation_FK_CompanyInformation] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[CompanyInformation] CHECK CONSTRAINT [CompanyInformation_FK_CompanyInformation]
GO
ALTER TABLE [dbo].[CompanyInformation]  WITH CHECK ADD  CONSTRAINT [CompanyInformation_FK_CompanyInformationParentCompany] FOREIGN KEY([ParentCompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[CompanyInformation] CHECK CONSTRAINT [CompanyInformation_FK_CompanyInformationParentCompany]
GO
ALTER TABLE [dbo].[CompanyInformation]  WITH CHECK ADD  CONSTRAINT [CompanyInformation_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[CompanyInformation] CHECK CONSTRAINT [CompanyInformation_FK_Country]
GO
ALTER TABLE [dbo].[CompanyInformation]  WITH CHECK ADD  CONSTRAINT [CompanyInformation_FK_FSPCompany] FOREIGN KEY([FSPCompanyId])
REFERENCES [dbo].[FSPCompany] ([Id])
GO

ALTER TABLE [dbo].[CompanyInformation] CHECK CONSTRAINT [CompanyInformation_FK_FSPCompany]
GO
ALTER TABLE [dbo].[CompanyInformation]  WITH CHECK ADD  CONSTRAINT [CompanyInformation_FK_Template] FOREIGN KEY([RequirementTemplateId])
REFERENCES [dbo].[Template] ([Id])
GO

ALTER TABLE [dbo].[CompanyInformation] CHECK CONSTRAINT [CompanyInformation_FK_Template]
GO
ALTER TABLE [dbo].[CompanyInformation]  WITH CHECK ADD  CONSTRAINT [CompanyInformation_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyInformation] CHECK CONSTRAINT [CompanyInformation_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[CompanyInformation]  WITH CHECK ADD  CONSTRAINT [CompanyInformation_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyInformation] CHECK CONSTRAINT [CompanyInformation_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[CompanyInformation]  WITH CHECK ADD  CONSTRAINT [FK_CompanyInformation_Country] FOREIGN KEY([PhyAddCountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[CompanyInformation] CHECK CONSTRAINT [FK_CompanyInformation_Country]
GO
ALTER TABLE [dbo].[CompanyInformation]  WITH CHECK ADD  CONSTRAINT [FK_CompanyInformation_Country1] FOREIGN KEY([PostAddCountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[CompanyInformation] CHECK CONSTRAINT [FK_CompanyInformation_Country1]
GO
ALTER TABLE [dbo].[CompanyInformation]  WITH CHECK ADD  CONSTRAINT [FK_CompanyInformation_StaticValue] FOREIGN KEY([PhyAddEmirate])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[CompanyInformation] CHECK CONSTRAINT [FK_CompanyInformation_StaticValue]
GO
ALTER TABLE [dbo].[CompanyInformation]  WITH CHECK ADD  CONSTRAINT [FK_CompanyInformation_StaticValue1] FOREIGN KEY([PostAddEmirate])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[CompanyInformation] CHECK CONSTRAINT [FK_CompanyInformation_StaticValue1]
GO
ALTER TABLE [dbo].[CompanyInformation] ADD  CONSTRAINT [DF__CompanyIn__IsRec__2E19AC07]  DEFAULT ((0)) FOR [IsRecurringDebitDay]
GO
ALTER TABLE [dbo].[CompanyInformation] ADD  CONSTRAINT [DF__CompanyIn__IsEdi__2F0DD040]  DEFAULT ((0)) FOR [IsEditableFirstDebitAmount]
GO
ALTER TABLE [dbo].[CompanyInformation] ADD  CONSTRAINT [DF__CompanyIn__IsVAT__3001F479]  DEFAULT ((0)) FOR [IsVATVendor]
GO
ALTER TABLE [dbo].[CompanyInformation] ADD  CONSTRAINT [DF__CompanyIn__IsJur__30F618B2]  DEFAULT ((0)) FOR [IsJuristicRepresentative]
GO
ALTER TABLE [dbo].[CompanyInformation] ADD  CONSTRAINT [DF__CompanyIn__IsAct__31EA3CEB]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CompanyInformation] ADD  CONSTRAINT [DF__CompanyIn__Creat__32DE6124]  DEFAULT (getutcdate()) FOR [CreatedDate]