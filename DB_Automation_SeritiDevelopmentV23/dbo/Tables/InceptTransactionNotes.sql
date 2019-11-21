CREATE TABLE [dbo].[InceptTransactionNotes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NULL,
	[BodyConditionId] [bigint] NULL,
	[BodyConditionIdValue] [nvarchar](50) NULL,
	[MechanicalConditionId] [bigint] NULL,
	[MechanicalConditionIdValue] [nvarchar](50) NULL,
	[Trim] [nvarchar](50) NULL,
	[Warranty] [bigint] NULL,
	[WarrantyValue] [nvarchar](50) NULL,
	[FuelTypeId] [bigint] NULL,
	[FuelTypeIdValue] [nvarchar](50) NULL,
	[Features] [nvarchar](1000) NULL,
	[CountryId] [bigint] NULL,
	[CountryIdValue] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[CreatedByValue] [nvarchar](50) NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedByValue] [nvarchar](50) NULL,
	[InceptTransactionId] [bigint] NULL,
 CONSTRAINT [InceptTransactionNotes_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InceptTransactionNotes]  WITH NOCHECK ADD  CONSTRAINT [InceptTransactionNotes_FK_InceptTransaction] FOREIGN KEY([InceptTransactionId])
REFERENCES [dbo].[InceptTransaction] ([Id])
GO

ALTER TABLE [dbo].[InceptTransactionNotes] CHECK CONSTRAINT [InceptTransactionNotes_FK_InceptTransaction]
GO
ALTER TABLE [dbo].[InceptTransactionNotes] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[InceptTransactionNotes] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]