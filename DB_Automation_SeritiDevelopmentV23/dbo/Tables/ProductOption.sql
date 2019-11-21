CREATE TABLE [dbo].[ProductOption](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[SortKey] [int] NULL,
	[OptionCode] [nvarchar](50) NOT NULL,
	[OptionName] [nvarchar](100) NOT NULL,
	[ProductDisclosure] [nvarchar](200) NULL,
	[OptionType] [int] NULL,
	[IsVATIndicator] [bit] NOT NULL,
	[IsMedicalInfoRequired] [bit] NOT NULL,
	[ProductSubTypeId] [bigint] NULL,
	[TransactionFinCondition] [int] NULL,
	[ManufacturerTemplateId] [bigint] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[MinimumEntryAge] [int] NULL,
	[MaximumEntryAge] [int] NULL,
	[IsStampDuty] [bit] NULL,
	[IsNamfisa] [bit] NULL,
	[ProductOptionWordingPath] [nvarchar](200) NULL,
	[TransactionTypeId] [bigint] NULL,
 CONSTRAINT [ProductOption_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductOption]  WITH NOCHECK ADD  CONSTRAINT [ProductOption_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ProductOption] CHECK CONSTRAINT [ProductOption_FK_Country]
GO
ALTER TABLE [dbo].[ProductOption]  WITH NOCHECK ADD  CONSTRAINT [ProductOption_FK_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO

ALTER TABLE [dbo].[ProductOption] CHECK CONSTRAINT [ProductOption_FK_Product]
GO
ALTER TABLE [dbo].[ProductOption]  WITH NOCHECK ADD  CONSTRAINT [ProductOption_FK_ProductSubType] FOREIGN KEY([ProductSubTypeId])
REFERENCES [dbo].[ProductSubType] ([Id])
GO

ALTER TABLE [dbo].[ProductOption] CHECK CONSTRAINT [ProductOption_FK_ProductSubType]
GO
ALTER TABLE [dbo].[ProductOption]  WITH CHECK ADD  CONSTRAINT [ProductOption_FK_StaticValue] FOREIGN KEY([TransactionTypeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[ProductOption] CHECK CONSTRAINT [ProductOption_FK_StaticValue]
GO
ALTER TABLE [dbo].[ProductOption]  WITH NOCHECK ADD  CONSTRAINT [ProductOption_FK_Template] FOREIGN KEY([ManufacturerTemplateId])
REFERENCES [dbo].[Template] ([Id])
GO

ALTER TABLE [dbo].[ProductOption] CHECK CONSTRAINT [ProductOption_FK_Template]
GO
ALTER TABLE [dbo].[ProductOption]  WITH NOCHECK ADD  CONSTRAINT [ProductOption_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductOption] CHECK CONSTRAINT [ProductOption_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ProductOption]  WITH NOCHECK ADD  CONSTRAINT [ProductOption_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductOption] CHECK CONSTRAINT [ProductOption_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ProductOption] ADD  CONSTRAINT [ProductOption_DF_VATIndicator]  DEFAULT ((0)) FOR [IsVATIndicator]
GO
ALTER TABLE [dbo].[ProductOption] ADD  CONSTRAINT [ProductOption_DF_MedicalInfoRequired]  DEFAULT ((0)) FOR [IsMedicalInfoRequired]
GO
ALTER TABLE [dbo].[ProductOption] ADD  CONSTRAINT [ProductOption_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductOption] ADD  CONSTRAINT [ProductOption_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Table use to save Product Options.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductOption'