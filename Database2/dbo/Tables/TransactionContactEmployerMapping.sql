CREATE TABLE [dbo].[TransactionContactEmployerMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ContactID] [bigint] NULL,
	[EmployerID] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_TransactionContactEmployerMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionContactEmployerMapping]  WITH CHECK ADD  CONSTRAINT [TransactionContactEmployerMapping_FK_ContactID] FOREIGN KEY([ContactID])
REFERENCES [dbo].[TransactionContact] ([Id])
GO

ALTER TABLE [dbo].[TransactionContactEmployerMapping] CHECK CONSTRAINT [TransactionContactEmployerMapping_FK_ContactID]
GO
ALTER TABLE [dbo].[TransactionContactEmployerMapping]  WITH CHECK ADD  CONSTRAINT [TransactionContactEmployerMapping_FK_EmployerID] FOREIGN KEY([EmployerID])
REFERENCES [dbo].[TransactionEmployerDetails] ([Id])
GO

ALTER TABLE [dbo].[TransactionContactEmployerMapping] CHECK CONSTRAINT [TransactionContactEmployerMapping_FK_EmployerID]
GO
ALTER TABLE [dbo].[TransactionContactEmployerMapping] ADD  DEFAULT ((1)) FOR [IsActive]