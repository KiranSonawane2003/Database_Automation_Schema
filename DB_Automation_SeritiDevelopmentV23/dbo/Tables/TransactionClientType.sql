CREATE TABLE [dbo].[TransactionClientType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ClientTypeName] [nvarchar](200) NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_TransactionClientType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionClientType]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionClientType_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionClientType] CHECK CONSTRAINT [FK_TransactionClientType_Country]
GO
ALTER TABLE [dbo].[TransactionClientType]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionClientType_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionClientType] CHECK CONSTRAINT [FK_TransactionClientType_Users]
GO
ALTER TABLE [dbo].[TransactionClientType]  WITH NOCHECK ADD  CONSTRAINT [FK_TransactionClientType_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionClientType] CHECK CONSTRAINT [FK_TransactionClientType_Users1]
GO
ALTER TABLE [dbo].[TransactionClientType] ADD  CONSTRAINT [DF_TransactionClientType_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TransactionClientType] ADD  CONSTRAINT [DF_TransactionClientType_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]