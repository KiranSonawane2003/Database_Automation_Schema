CREATE TABLE [dbo].[TransactionInsuranceApplication](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NOT NULL,
	[InsuranceCompanyId] [bigint] NOT NULL,
	[ContactNote] [nvarchar](500) NULL,
	[GeneralNote] [nvarchar](500) NULL,
	[TotalInsuranceAmount] [decimal](18, 2) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[Modifiedby] [int] NULL,
	[ProductTypeId] [bigint] NULL,
	[ProductSubTypeId] [bigint] NULL,
	[IsLeadSent] [bit] NULL,
	[LeadSentDate] [datetime] NULL,
	[PeriodOfInsuranceFrom] [date] NULL,
	[PeriodOfInsuranceTo] [date] NULL,
 CONSTRAINT [TransactionInsuranceApplication_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionInsuranceApplication]  WITH NOCHECK ADD  CONSTRAINT [TransactionInsuranceApplication_FK_CompanyCompanyTypeMapping] FOREIGN KEY([InsuranceCompanyId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[TransactionInsuranceApplication] CHECK CONSTRAINT [TransactionInsuranceApplication_FK_CompanyCompanyTypeMapping]
GO
ALTER TABLE [dbo].[TransactionInsuranceApplication]  WITH NOCHECK ADD  CONSTRAINT [TransactionInsuranceApplication_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionInsuranceApplication] CHECK CONSTRAINT [TransactionInsuranceApplication_FK_Country]
GO
ALTER TABLE [dbo].[TransactionInsuranceApplication]  WITH CHECK ADD  CONSTRAINT [TransactionInsuranceApplication_FK_ProductSubType] FOREIGN KEY([ProductSubTypeId])
REFERENCES [dbo].[ProductSubType] ([Id])
GO

ALTER TABLE [dbo].[TransactionInsuranceApplication] CHECK CONSTRAINT [TransactionInsuranceApplication_FK_ProductSubType]
GO
ALTER TABLE [dbo].[TransactionInsuranceApplication]  WITH CHECK ADD  CONSTRAINT [TransactionInsuranceApplication_FK_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO

ALTER TABLE [dbo].[TransactionInsuranceApplication] CHECK CONSTRAINT [TransactionInsuranceApplication_FK_ProductType]
GO
ALTER TABLE [dbo].[TransactionInsuranceApplication]  WITH NOCHECK ADD  CONSTRAINT [TransactionInsuranceApplication_FK_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[TransactionInsuranceApplication] CHECK CONSTRAINT [TransactionInsuranceApplication_FK_Transaction]
GO
ALTER TABLE [dbo].[TransactionInsuranceApplication]  WITH NOCHECK ADD  CONSTRAINT [TransactionInsuranceApplication_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionInsuranceApplication] CHECK CONSTRAINT [TransactionInsuranceApplication_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[TransactionInsuranceApplication]  WITH NOCHECK ADD  CONSTRAINT [TransactionInsuranceApplication_FK_UsersModifiedBy] FOREIGN KEY([Modifiedby])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionInsuranceApplication] CHECK CONSTRAINT [TransactionInsuranceApplication_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[TransactionInsuranceApplication] ADD  CONSTRAINT [DF_TransactionInsuranceApplication_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TransactionInsuranceApplication] ADD  CONSTRAINT [DF_TransactionInsuranceApplication_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table stores the insurance applicationDetails.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionInsuranceApplication'