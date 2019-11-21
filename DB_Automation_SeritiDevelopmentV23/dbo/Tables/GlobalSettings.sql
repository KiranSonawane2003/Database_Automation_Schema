CREATE TABLE [dbo].[GlobalSettings](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ContactEmailAddress] [nvarchar](200) NULL,
	[ContactEmailPassword] [nvarchar](max) NULL,
	[VatPercentage] [decimal](18, 2) NULL,
	[SalesTax] [decimal](18, 2) NULL,
	[Currency] [nvarchar](50) NULL,
	[CurrencySymbol] [nvarchar](50) NULL,
	[MakaniNumber] [nvarchar](100) NULL,
	[BankLendingRate] [decimal](18, 2) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[SMTPHost] [nvarchar](100) NULL,
	[SMTPPort] [nvarchar](100) NULL,
	[FromEmail] [nvarchar](100) NULL,
	[APINotificationEmail] [nvarchar](4000) NULL,
	[Namfisa] [decimal](18, 2) NULL,
	[StampDuty] [decimal](18, 2) NULL,
	[PrimeInterestRate] [decimal](18, 2) NULL,
 CONSTRAINT [GlobalSettings_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[GlobalSettings]  WITH NOCHECK ADD  CONSTRAINT [GlobalSettings_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[GlobalSettings] CHECK CONSTRAINT [GlobalSettings_FK_Country]
GO
ALTER TABLE [dbo].[GlobalSettings]  WITH NOCHECK ADD  CONSTRAINT [GlobalSettings_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GlobalSettings] CHECK CONSTRAINT [GlobalSettings_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[GlobalSettings]  WITH NOCHECK ADD  CONSTRAINT [GlobalSettings_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GlobalSettings] CHECK CONSTRAINT [GlobalSettings_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[GlobalSettings] ADD  CONSTRAINT [DF_GlobalSettings_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[GlobalSettings] ADD  CONSTRAINT [DF_GlobalSettings_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]