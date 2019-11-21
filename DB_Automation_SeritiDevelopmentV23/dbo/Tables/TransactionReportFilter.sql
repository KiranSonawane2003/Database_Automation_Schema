CREATE TABLE [dbo].[TransactionReportFilter](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IncludeUninceptedDeals] [bit] NULL,
	[IncludeInceptedDeals] [bit] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[IsCreateDate] [bit] NULL,
	[IsInceptDate] [bit] NULL,
	[IsInvoiceDate] [bit] NULL,
	[IsInvoicePaidDate] [bit] NULL,
	[IsEmailReport] [bit] NULL,
	[Email] [nvarchar](100) NULL,
	[ReportFilePath] [nvarchar](200) NULL,
	[CopiedFrom] [bigint] NULL,
	[CountryId] [bigint] NULL,
	[ReportFormat] [tinyint] NULL,
	[IsShareDetailsWithinCompany] [int] NULL,
	[IsShareDetailsAmongPartner] [int] NULL,
	[IsReceiveMarketingInfo] [int] NULL,
	[IsDisclosureofPersonalInfo] [int] NULL,
	[IsDebitOrderInformationAndAuthorization] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[FileSize] [decimal](18, 2) NULL,
	[MasterReportId] [bigint] NULL,
	[IsRetail] [bit] NOT NULL,
	[IncludeBankingDetails] [bit] NULL,
	[ReportColumnFilePath] [nvarchar](max) NULL,
 CONSTRAINT [PK_TransactionReportFilter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_TransactionReportFilter_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionReportFilter] CHECK CONSTRAINT [FK_TransactionReportFilter_Country]
GO
ALTER TABLE [dbo].[TransactionReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_TransactionReportFilter_MasterReport] FOREIGN KEY([MasterReportId])
REFERENCES [dbo].[MasterReport] ([Id])
GO

ALTER TABLE [dbo].[TransactionReportFilter] CHECK CONSTRAINT [FK_TransactionReportFilter_MasterReport]
GO
ALTER TABLE [dbo].[TransactionReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_TransactionReportFilter_Users_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionReportFilter] CHECK CONSTRAINT [FK_TransactionReportFilter_Users_CreatedBy]
GO
ALTER TABLE [dbo].[TransactionReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_TransactionReportFilter_Users_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionReportFilter] CHECK CONSTRAINT [FK_TransactionReportFilter_Users_ModifiedBy]
GO
ALTER TABLE [dbo].[TransactionReportFilter] ADD  DEFAULT ((0)) FOR [IncludeUninceptedDeals]
GO
ALTER TABLE [dbo].[TransactionReportFilter] ADD  DEFAULT ((0)) FOR [IncludeInceptedDeals]
GO
ALTER TABLE [dbo].[TransactionReportFilter] ADD  CONSTRAINT [DF_TransactionReportFilter_IsCreateDate]  DEFAULT ((0)) FOR [IsCreateDate]
GO
ALTER TABLE [dbo].[TransactionReportFilter] ADD  CONSTRAINT [DF_TransactionReportFilter_IsInceptDate]  DEFAULT ((0)) FOR [IsInceptDate]
GO
ALTER TABLE [dbo].[TransactionReportFilter] ADD  CONSTRAINT [DF_TransactionReportFilter_IsInvoiceDate]  DEFAULT ((0)) FOR [IsInvoiceDate]
GO
ALTER TABLE [dbo].[TransactionReportFilter] ADD  CONSTRAINT [DF_TransactionReportFilter_IsInvoicePaidDate]  DEFAULT ((0)) FOR [IsInvoicePaidDate]
GO
ALTER TABLE [dbo].[TransactionReportFilter] ADD  CONSTRAINT [DF_TransactionReportFilter_IsEmailReport]  DEFAULT ((0)) FOR [IsEmailReport]
GO
ALTER TABLE [dbo].[TransactionReportFilter] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TransactionReportFilter] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[TransactionReportFilter] ADD  DEFAULT ((0)) FOR [IncludeBankingDetails]