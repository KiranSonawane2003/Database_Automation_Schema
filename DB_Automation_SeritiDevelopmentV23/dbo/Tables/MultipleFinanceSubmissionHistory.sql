CREATE TABLE [dbo].[MultipleFinanceSubmissionHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FinanceApplicationHistoryId] [bigint] NOT NULL,
	[TransactionDocumentId] [bigint] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_MultipleFinanceSubmissionHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MultipleFinanceSubmissionHistory]  WITH CHECK ADD  CONSTRAINT [FK_MultipleFinanceSubmissionHistory_FinanceApplicationHistory] FOREIGN KEY([FinanceApplicationHistoryId])
REFERENCES [dbo].[FinanceApplicationHistory] ([id])
GO

ALTER TABLE [dbo].[MultipleFinanceSubmissionHistory] CHECK CONSTRAINT [FK_MultipleFinanceSubmissionHistory_FinanceApplicationHistory]
GO
ALTER TABLE [dbo].[MultipleFinanceSubmissionHistory]  WITH CHECK ADD  CONSTRAINT [FK_MultipleFinanceSubmissionHistory_TransactionDocument] FOREIGN KEY([TransactionDocumentId])
REFERENCES [dbo].[TransactionDocument] ([Id])
GO

ALTER TABLE [dbo].[MultipleFinanceSubmissionHistory] CHECK CONSTRAINT [FK_MultipleFinanceSubmissionHistory_TransactionDocument]
GO
ALTER TABLE [dbo].[MultipleFinanceSubmissionHistory] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[MultipleFinanceSubmissionHistory] ADD  DEFAULT ((1)) FOR [IsActive]