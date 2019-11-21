CREATE TABLE [dbo].[TransactionBank](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BankName] [nvarchar](500) NOT NULL,
	[Abbreviation] [nvarchar](50) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_TransactionBank] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionBank]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionBank_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionBank] CHECK CONSTRAINT [FK_TransactionBank_Country]
GO
ALTER TABLE [dbo].[TransactionBank]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionBank_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionBank] CHECK CONSTRAINT [FK_TransactionBank_Users]
GO
ALTER TABLE [dbo].[TransactionBank]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionBank_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionBank] CHECK CONSTRAINT [FK_TransactionBank_Users1]
GO
ALTER TABLE [dbo].[TransactionBank] ADD  CONSTRAINT [DF_TransactionBank_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TransactionBank] ADD  CONSTRAINT [DF_TransactionBank_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]