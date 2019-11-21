CREATE TABLE [dbo].[Group](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupCode] [nvarchar](100) NOT NULL,
	[GroupName] [nvarchar](100) NULL,
	[GroupLogoName] [nvarchar](100) NULL,
	[FSPCompanyId] [bigint] NULL,
	[IsOverrideAdviceLicence] [bit] NOT NULL,
	[IsJuristicRepresentative] [bit] NOT NULL,
	[ComplaintsOfficerId] [bigint] NULL,
	[IsProfessionalIndemnity] [bit] NOT NULL,
	[IsFidelityGuarantee] [bit] NOT NULL,
	[VatNumber] [nvarchar](100) NULL,
	[DefaultPrimeAdjustment] [decimal](18, 2) NULL,
	[DefaultFinanceTerm] [int] NULL,
	[TransactionCharge] [int] NULL,
	[ServiceFee] [decimal](18, 2) NULL,
	[ConsultingFee] [decimal](18, 2) NULL,
	[ComplianceFee] [decimal](18, 2) NULL,
	[ServiceTypeId] [bigint] NULL,
	[IsSMSFunctionality] [bit] NOT NULL,
	[SLASignatureDate] [date] NULL,
	[PayoverJobId] [bigint] NULL,
	[AccountManagerId] [int] NULL,
	[MarketerId] [int] NULL,
	[ApprovalUserProductsId] [int] NULL,
	[ApprovalUserOtherId] [int] NULL,
	[IsEditableAccessoryPayover] [bit] NOT NULL,
	[FloorplanProviderId] [bigint] NULL,
	[Workflow] [bigint] NULL,
	[TSFDefaultPrice] [decimal](18, 2) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[HFADocumentDescription] [nvarchar](max) NULL,
	[IsEnableEmiratesIDCard] [bit] NULL,
 CONSTRAINT [Group_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Group]  WITH NOCHECK ADD  CONSTRAINT [Group_FK_CompanyCompanyTypeMapId] FOREIGN KEY([FloorplanProviderId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [Group_FK_CompanyCompanyTypeMapId]
GO
ALTER TABLE [dbo].[Group]  WITH NOCHECK ADD  CONSTRAINT [Group_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [Group_FK_Country]
GO
ALTER TABLE [dbo].[Group]  WITH NOCHECK ADD  CONSTRAINT [Group_FK_FSPCompany] FOREIGN KEY([FSPCompanyId])
REFERENCES [dbo].[FSPCompany] ([Id])
GO

ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [Group_FK_FSPCompany]
GO
ALTER TABLE [dbo].[Group]  WITH NOCHECK ADD  CONSTRAINT [Group_FK_FSPPerson] FOREIGN KEY([ComplaintsOfficerId])
REFERENCES [dbo].[FSPPerson] ([Id])
GO

ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [Group_FK_FSPPerson]
GO
ALTER TABLE [dbo].[Group]  WITH NOCHECK ADD  CONSTRAINT [Group_FK_PayoverJob] FOREIGN KEY([PayoverJobId])
REFERENCES [dbo].[PayoverJob] ([Id])
GO

ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [Group_FK_PayoverJob]
GO
ALTER TABLE [dbo].[Group]  WITH NOCHECK ADD  CONSTRAINT [Group_FK_ServiceType] FOREIGN KEY([ServiceTypeId])
REFERENCES [dbo].[ServiceType] ([Id])
GO

ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [Group_FK_ServiceType]
GO
ALTER TABLE [dbo].[Group]  WITH NOCHECK ADD  CONSTRAINT [Group_FK_UsersAccountManager] FOREIGN KEY([AccountManagerId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [Group_FK_UsersAccountManager]
GO
ALTER TABLE [dbo].[Group]  WITH NOCHECK ADD  CONSTRAINT [Group_FK_UsersApprovalUserOther] FOREIGN KEY([ApprovalUserOtherId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [Group_FK_UsersApprovalUserOther]
GO
ALTER TABLE [dbo].[Group]  WITH NOCHECK ADD  CONSTRAINT [Group_FK_UsersApprovalUserProduct] FOREIGN KEY([ApprovalUserProductsId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [Group_FK_UsersApprovalUserProduct]
GO
ALTER TABLE [dbo].[Group]  WITH NOCHECK ADD  CONSTRAINT [Group_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [Group_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[Group]  WITH NOCHECK ADD  CONSTRAINT [Group_FK_UsersMarketer] FOREIGN KEY([MarketerId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [Group_FK_UsersMarketer]
GO
ALTER TABLE [dbo].[Group]  WITH NOCHECK ADD  CONSTRAINT [Group_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [Group_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[Group] ADD  CONSTRAINT [DF_Group_IsOverrideAdviceLicence]  DEFAULT ((0)) FOR [IsOverrideAdviceLicence]
GO
ALTER TABLE [dbo].[Group] ADD  CONSTRAINT [DF_Group_IsJuristicRepresentative]  DEFAULT ((0)) FOR [IsJuristicRepresentative]
GO
ALTER TABLE [dbo].[Group] ADD  CONSTRAINT [DF_Group_IsProfessionalIndemnity]  DEFAULT ((0)) FOR [IsProfessionalIndemnity]
GO
ALTER TABLE [dbo].[Group] ADD  CONSTRAINT [DF_Group_IsFidelityGuarantee]  DEFAULT ((0)) FOR [IsFidelityGuarantee]
GO
ALTER TABLE [dbo].[Group] ADD  CONSTRAINT [Group_DF_\SMSFunctionality]  DEFAULT ((0)) FOR [IsSMSFunctionality]
GO
ALTER TABLE [dbo].[Group] ADD  CONSTRAINT [DF_Group_IsEditableAccessoryPayover]  DEFAULT ((0)) FOR [IsEditableAccessoryPayover]
GO
ALTER TABLE [dbo].[Group] ADD  CONSTRAINT [Group_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Group] ADD  CONSTRAINT [Group_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Service Type Id is used to fill dropdown of ServiceType on Creategroup page under Administration >> Group. Is foreign key from table ServiceType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Group', @level2type=N'COLUMN',@level2name=N'ServiceTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Service Type Id is used to fill dropdown of Payover Job Name on Creategroup page under Administration >> Group, Is Foreign key from table PayoverJob' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Group', @level2type=N'COLUMN',@level2name=N'PayoverJobId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table stores the group information. having relationship with FSPCompany, FSPPerson, PayoverJob and ServiceType tables.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Group'