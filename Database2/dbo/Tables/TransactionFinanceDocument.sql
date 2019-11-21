CREATE TABLE [dbo].[TransactionFinanceDocument](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionFinanceApplicationId] [bigint] NULL,
	[TransactionDocumentId] [bigint] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_TransactionFinanceDocument] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionFinanceDocument]  WITH CHECK ADD  CONSTRAINT [FK_TransactionFinanceDocument_TransactionDocument] FOREIGN KEY([TransactionDocumentId])
REFERENCES [dbo].[TransactionDocument] ([Id])
GO

ALTER TABLE [dbo].[TransactionFinanceDocument] CHECK CONSTRAINT [FK_TransactionFinanceDocument_TransactionDocument]