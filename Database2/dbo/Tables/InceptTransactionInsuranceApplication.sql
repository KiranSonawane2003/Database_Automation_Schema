CREATE TABLE [dbo].[InceptTransactionInsuranceApplication](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NOT NULL,
	[InsuranceCompanyId] [bigint] NULL,
	[InsuranceCompanyValue] [nvarchar](max) NULL,
	[ContactNote] [nvarchar](500) NULL,
	[GeneralNote] [nvarchar](500) NULL,
	[TotalInsuranceAmount] [decimal](18, 2) NULL,
	[CountryId] [bigint] NULL,
	[CountryValue] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedByValue] [nvarchar](50) NULL,
	[Modifiedby] [int] NULL,
	[ModifiedByValue] [nvarchar](50) NULL,
	[InceptTransactionId] [bigint] NOT NULL,
	[ProductTypeId] [bigint] NULL,
	[ProductTypeValue] [nvarchar](100) NULL,
	[ProductSubTypeId] [bigint] NULL,
	[ProductSubTypeValue] [nvarchar](100) NULL,
	[IsLeadSent] [bit] NULL,
	[LeadSentDate] [datetime] NULL,
 CONSTRAINT [InceptTransactionInsuranceApplication_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[InceptTransactionInsuranceApplication]  WITH NOCHECK ADD  CONSTRAINT [FK_InceptTransactionInsuranceApplication_InceptTransaction] FOREIGN KEY([InceptTransactionId])
REFERENCES [dbo].[InceptTransaction] ([Id])
GO

ALTER TABLE [dbo].[InceptTransactionInsuranceApplication] CHECK CONSTRAINT [FK_InceptTransactionInsuranceApplication_InceptTransaction]
GO
ALTER TABLE [dbo].[InceptTransactionInsuranceApplication] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[InceptTransactionInsuranceApplication] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]