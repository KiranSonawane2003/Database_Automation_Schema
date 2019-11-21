CREATE TABLE [dbo].[TransactionNotes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NULL,
	[BodyConditionId] [bigint] NULL,
	[MechanicalConditionId] [bigint] NULL,
	[Trim] [nvarchar](50) NULL,
	[Warranty] [bigint] NULL,
	[Features] [nvarchar](1000) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[FuelTypeId] [bigint] NULL,
 CONSTRAINT [TransactionNotes_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TransactionNotes]  WITH CHECK ADD  CONSTRAINT [TransactionNotes_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[TransactionNotes] CHECK CONSTRAINT [TransactionNotes_FK_Country]
GO
ALTER TABLE [dbo].[TransactionNotes]  WITH CHECK ADD  CONSTRAINT [TransactionNotes_FK_StaticValueBodyCondition] FOREIGN KEY([BodyConditionId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionNotes] CHECK CONSTRAINT [TransactionNotes_FK_StaticValueBodyCondition]
GO
ALTER TABLE [dbo].[TransactionNotes]  WITH CHECK ADD  CONSTRAINT [TransactionNotes_FK_StaticValueFuelTypeId] FOREIGN KEY([FuelTypeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionNotes] CHECK CONSTRAINT [TransactionNotes_FK_StaticValueFuelTypeId]
GO
ALTER TABLE [dbo].[TransactionNotes]  WITH CHECK ADD  CONSTRAINT [TransactionNotes_FK_StaticValueMechanicalCondition] FOREIGN KEY([MechanicalConditionId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionNotes] CHECK CONSTRAINT [TransactionNotes_FK_StaticValueMechanicalCondition]
GO
ALTER TABLE [dbo].[TransactionNotes]  WITH CHECK ADD  CONSTRAINT [TransactionNotes_FK_StaticValueWarranty] FOREIGN KEY([Warranty])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[TransactionNotes] CHECK CONSTRAINT [TransactionNotes_FK_StaticValueWarranty]
GO
ALTER TABLE [dbo].[TransactionNotes]  WITH NOCHECK ADD  CONSTRAINT [TransactionNotes_FK_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[TransactionNotes] CHECK CONSTRAINT [TransactionNotes_FK_Transaction]
GO
ALTER TABLE [dbo].[TransactionNotes]  WITH CHECK ADD  CONSTRAINT [TransactionNotes_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionNotes] CHECK CONSTRAINT [TransactionNotes_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[TransactionNotes]  WITH CHECK ADD  CONSTRAINT [TransactionNotes_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[TransactionNotes] CHECK CONSTRAINT [TransactionNotes_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[TransactionNotes] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TransactionNotes] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]