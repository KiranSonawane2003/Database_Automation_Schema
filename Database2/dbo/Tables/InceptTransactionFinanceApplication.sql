CREATE TABLE [dbo].[InceptTransactionFinanceApplication](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NOT NULL,
	[ClientId] [bigint] NULL,
	[CompanyId] [bigint] NULL,
	[CompanyValue] [nvarchar](max) NULL,
	[Response] [nvarchar](4000) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[CreatedByValue] [nvarchar](50) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedByValue] [nvarchar](50) NULL,
	[InceptTransactionId] [bigint] NOT NULL,
	[CountryId] [bigint] NULL,
	[CountryValue] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CompanyCompanyTypeId] [bigint] NULL,
	[FinanceStatusId] [bigint] NULL,
	[FinanceStatusValue] [nvarchar](50) NULL,
	[FinanceStatusNotes] [nvarchar](4000) NULL,
	[LeadNumber] [bigint] NULL,
	[FinanceAccountNumber] [nvarchar](100) NULL,
	[LOIIssueDate] [datetime] NULL,
	[LOIExpiryDate] [datetime] NULL,
	[LocalPurchaseNumber] [nvarchar](200) NULL,
	[LOPIssueDate] [datetime] NULL,
	[LOPExpiryDate] [datetime] NULL,
 CONSTRAINT [PK_InceptTransactionFinanceApplication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[InceptTransactionFinanceApplication]  WITH NOCHECK ADD  CONSTRAINT [FK_InceptTransactionFinanceApplication_InceptTransaction] FOREIGN KEY([InceptTransactionId])
REFERENCES [dbo].[InceptTransaction] ([Id])
GO

ALTER TABLE [dbo].[InceptTransactionFinanceApplication] CHECK CONSTRAINT [FK_InceptTransactionFinanceApplication_InceptTransaction]
GO
ALTER TABLE [dbo].[InceptTransactionFinanceApplication] ADD  CONSTRAINT [DF__InceptTra__IsAct__02CA9745]  DEFAULT ((1)) FOR [IsActive]