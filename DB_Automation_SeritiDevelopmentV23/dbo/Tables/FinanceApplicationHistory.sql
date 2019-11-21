CREATE TABLE [dbo].[FinanceApplicationHistory](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionID] [bigint] NOT NULL,
	[FinanceApplicationID] [bigint] NOT NULL,
	[CompanyCompanyTypeID] [bigint] NOT NULL,
	[AppType] [nvarchar](50) NULL,
	[RequestURL] [nvarchar](max) NULL,
	[Action] [nvarchar](max) NULL,
	[LeadNumber] [bigint] NULL,
	[LeadStatus] [bigint] NULL,
	[Response] [nvarchar](max) NULL,
	[ServiceMessage] [nvarchar](max) NULL,
	[RequestFilePath] [nvarchar](max) NULL,
	[ResponseFilePath] [nvarchar](max) NULL,
	[RequestTimeStamp] [datetime] NULL,
	[ResponseTimeStamp] [datetime] NULL,
	[DocumentName] [nvarchar](max) NULL,
	[ResponseStatusIds] [nvarchar](max) NULL,
	[LoanAmount] [nvarchar](10) NULL,
	[LoanTerm] [nvarchar](10) NULL,
	[LoanDeposit] [nvarchar](50) NULL,
	[LoanInterest] [nvarchar](10) NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_FinanceApplicationHistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[FinanceApplicationHistory]  WITH CHECK ADD  CONSTRAINT [FK_FinanceApplicationHistory_CompanyCompanyTypeID] FOREIGN KEY([CompanyCompanyTypeID])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[FinanceApplicationHistory] CHECK CONSTRAINT [FK_FinanceApplicationHistory_CompanyCompanyTypeID]
GO
ALTER TABLE [dbo].[FinanceApplicationHistory]  WITH CHECK ADD  CONSTRAINT [FK_FinanceApplicationHistory_FinanceApplicationID] FOREIGN KEY([FinanceApplicationID])
REFERENCES [dbo].[TransactionFinanceApplication] ([Id])
GO

ALTER TABLE [dbo].[FinanceApplicationHistory] CHECK CONSTRAINT [FK_FinanceApplicationHistory_FinanceApplicationID]
GO
ALTER TABLE [dbo].[FinanceApplicationHistory]  WITH CHECK ADD  CONSTRAINT [FK_FinanceApplicationHistory_TransactionID] FOREIGN KEY([TransactionID])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[FinanceApplicationHistory] CHECK CONSTRAINT [FK_FinanceApplicationHistory_TransactionID]
GO
ALTER TABLE [dbo].[FinanceApplicationHistory] ADD  CONSTRAINT [DF__FinanceAp__isAct__573004DC]  DEFAULT ((1)) FOR [isActive]