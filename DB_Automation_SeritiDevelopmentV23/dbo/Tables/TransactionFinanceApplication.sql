CREATE TABLE [dbo].[TransactionFinanceApplication](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NOT NULL,
	[ClientId] [bigint] NULL,
	[CompanyId] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[Response] [nvarchar](4000) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NULL,
	[CompanyCompanyTypeId] [bigint] NULL,
	[FinanceStatusId] [bigint] NULL,
	[FinanceStatusNotes] [nvarchar](4000) NULL,
	[LeadNumber] [bigint] NULL,
	[FinanceAccountNumber] [nvarchar](100) NULL,
	[LOIIssueDate] [datetime] NULL,
	[LOIExpiryDate] [datetime] NULL,
	[LocalPurchaseNumber] [nvarchar](200) NULL,
	[LOPIssueDate] [datetime] NULL,
	[LOPExpiryDate] [datetime] NULL,
	[BankersName] [nvarchar](500) NULL,
	[BankersOfficeTelephoneCode] [nvarchar](10) NULL,
	[BankersOfficeTelephoneNumber] [nvarchar](100) NULL,
	[BankersMobileNumber] [nvarchar](100) NULL,
	[BankersEmailAddress] [nvarchar](100) NULL,
	[BankDealReferenceNumber] [nvarchar](100) NULL,
	[IsUpdateStatustoTransaction] [bit] NULL,
	[IsBankerUpdate] [bit] NULL,
	[BankerNotes] [nvarchar](4000) NULL,
 CONSTRAINT [TransactionFinanceApplication_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionFinanceApplication]  WITH CHECK ADD  CONSTRAINT [FK_TransactionFinanceApplication_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionFinanceApplication] CHECK CONSTRAINT [FK_TransactionFinanceApplication_Country]
GO
ALTER TABLE [dbo].[TransactionFinanceApplication]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionFinanceApplication_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[TransactionFinanceApplication] CHECK CONSTRAINT [FK_TransactionFinanceApplication_Transaction]
GO
ALTER TABLE [dbo].[TransactionFinanceApplication]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionFinanceApplication_TransactionClient] FOREIGN KEY([ClientId])
REFERENCES [dbo].[TransactionClient] ([Id])
GO

ALTER TABLE [dbo].[TransactionFinanceApplication] CHECK CONSTRAINT [FK_TransactionFinanceApplication_TransactionClient]
GO
ALTER TABLE [dbo].[TransactionFinanceApplication]  WITH CHECK ADD  CONSTRAINT [TransactionFinanceApplication_FK_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[TransactionFinanceApplication] CHECK CONSTRAINT [TransactionFinanceApplication_FK_Company]
GO
ALTER TABLE [dbo].[TransactionFinanceApplication]  WITH CHECK ADD  CONSTRAINT [TransactionFinanceApplication_FK_CompanyCompanyTypeMapping] FOREIGN KEY([CompanyCompanyTypeId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[TransactionFinanceApplication] CHECK CONSTRAINT [TransactionFinanceApplication_FK_CompanyCompanyTypeMapping]
GO
ALTER TABLE [dbo].[TransactionFinanceApplication]  WITH CHECK ADD  CONSTRAINT [TransactionFinanceApplication_FK_StaticValueFinanceStatus] FOREIGN KEY([FinanceStatusId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionFinanceApplication] CHECK CONSTRAINT [TransactionFinanceApplication_FK_StaticValueFinanceStatus]
GO
ALTER TABLE [dbo].[TransactionFinanceApplication]  WITH CHECK ADD  CONSTRAINT [TransactionFinanceApplication_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionFinanceApplication] CHECK CONSTRAINT [TransactionFinanceApplication_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[TransactionFinanceApplication]  WITH CHECK ADD  CONSTRAINT [TransactionFinanceApplication_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionFinanceApplication] CHECK CONSTRAINT [TransactionFinanceApplication_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[TransactionFinanceApplication] ADD  CONSTRAINT [DF_TransactionFinanceApplication_CreatedDate_1]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TransactionFinanceApplication] ADD  CONSTRAINT [DF__Transacti__IsAct__078F4C62]  DEFAULT ((1)) FOR [IsActive]