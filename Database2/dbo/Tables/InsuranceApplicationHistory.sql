CREATE TABLE [dbo].[InsuranceApplicationHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[InsuranceApplicationId] [bigint] NULL,
	[ProductTypeId] [bigint] NULL,
	[ProductSubTypeId] [bigint] NULL,
	[LeadSentDate] [datetime] NULL,
	[InsuranceApplicationReportPath] [nvarchar](2000) NULL,
	[StartDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[GeneralNote] [nvarchar](max) NULL,
	[ContactNote] [nvarchar](max) NULL,
	[CompanyCompanyTypeId] [bigint] NULL,
	[LeadEmailAddress] [nvarchar](max) NULL,
 CONSTRAINT [InsuranceApplicationHistory_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[InsuranceApplicationHistory]  WITH CHECK ADD  CONSTRAINT [InsuranceApplicationHistory_FK_CompanyCompanyTypeMappingCompanyId] FOREIGN KEY([CompanyCompanyTypeId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[InsuranceApplicationHistory] CHECK CONSTRAINT [InsuranceApplicationHistory_FK_CompanyCompanyTypeMappingCompanyId]
GO
ALTER TABLE [dbo].[InsuranceApplicationHistory]  WITH CHECK ADD  CONSTRAINT [InsuranceApplicationHistory_FK_ProductSubType] FOREIGN KEY([ProductSubTypeId])
REFERENCES [dbo].[ProductSubType] ([Id])
GO

ALTER TABLE [dbo].[InsuranceApplicationHistory] CHECK CONSTRAINT [InsuranceApplicationHistory_FK_ProductSubType]
GO
ALTER TABLE [dbo].[InsuranceApplicationHistory]  WITH CHECK ADD  CONSTRAINT [InsuranceApplicationHistory_FK_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO

ALTER TABLE [dbo].[InsuranceApplicationHistory] CHECK CONSTRAINT [InsuranceApplicationHistory_FK_ProductType]
GO
ALTER TABLE [dbo].[InsuranceApplicationHistory]  WITH CHECK ADD  CONSTRAINT [InsuranceApplicationHistory_FK_TransactionInsuranceApplication] FOREIGN KEY([InsuranceApplicationId])
REFERENCES [dbo].[TransactionInsuranceApplication] ([Id])
GO

ALTER TABLE [dbo].[InsuranceApplicationHistory] CHECK CONSTRAINT [InsuranceApplicationHistory_FK_TransactionInsuranceApplication]
GO
ALTER TABLE [dbo].[InsuranceApplicationHistory] ADD  CONSTRAINT [DF_InsuranceApplicationHistory_LeadSentDate]  DEFAULT (getutcdate()) FOR [LeadSentDate]