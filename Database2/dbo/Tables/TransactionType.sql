﻿CREATE TABLE [dbo].[TransactionType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionTypeName] [nvarchar](100) NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [TransactionType_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionType]  WITH NOCHECK ADD  CONSTRAINT [TransactionType_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionType] CHECK CONSTRAINT [TransactionType_FK_Country]
GO
ALTER TABLE [dbo].[TransactionType]  WITH NOCHECK ADD  CONSTRAINT [TransactionType_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionType] CHECK CONSTRAINT [TransactionType_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[TransactionType]  WITH NOCHECK ADD  CONSTRAINT [TransactionType_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionType] CHECK CONSTRAINT [TransactionType_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[TransactionType] ADD  CONSTRAINT [TransactionType_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TransactionType] ADD  CONSTRAINT [TransactionType_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This is master for Transaction Type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TransactionType'