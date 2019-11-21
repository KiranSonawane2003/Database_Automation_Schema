CREATE TABLE [dbo].[HFAItemVehicleDetailsDocument](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[HFAItemVehicleId] [bigint] NULL,
	[DocumentCategoryId] [bigint] NULL,
	[DocumentDescription] [nvarchar](500) NULL,
	[DocumentPath] [nvarchar](300) NULL,
	[DocumentName] [nvarchar](200) NULL,
	[TypeEnum] [int] NULL,
	[DocumentSize] [nvarchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CountryId] [bigint] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_HFAItemVehicleDetailsDocument] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HFAItemVehicleDetailsDocument]  WITH CHECK ADD  CONSTRAINT [FK_HFAItemVehicleDetailsDocument_DocumentCategory] FOREIGN KEY([DocumentCategoryId])
REFERENCES [dbo].[DocumentCategory] ([Id])
GO

ALTER TABLE [dbo].[HFAItemVehicleDetailsDocument] CHECK CONSTRAINT [FK_HFAItemVehicleDetailsDocument_DocumentCategory]
GO
ALTER TABLE [dbo].[HFAItemVehicleDetailsDocument]  WITH CHECK ADD  CONSTRAINT [FK_HFAItemVehicleDetailsDocument_HFAItemVehicleDetails] FOREIGN KEY([HFAItemVehicleId])
REFERENCES [dbo].[HFAItemVehicleDetails] ([Id])
GO

ALTER TABLE [dbo].[HFAItemVehicleDetailsDocument] CHECK CONSTRAINT [FK_HFAItemVehicleDetailsDocument_HFAItemVehicleDetails]
GO
ALTER TABLE [dbo].[HFAItemVehicleDetailsDocument]  WITH CHECK ADD  CONSTRAINT [FK_HFAItemVehicleDetailsDocument_HFAItemVehicleDetailsDocument] FOREIGN KEY([Id])
REFERENCES [dbo].[HFAItemVehicleDetailsDocument] ([Id])
GO

ALTER TABLE [dbo].[HFAItemVehicleDetailsDocument] CHECK CONSTRAINT [FK_HFAItemVehicleDetailsDocument_HFAItemVehicleDetailsDocument]
GO
ALTER TABLE [dbo].[HFAItemVehicleDetailsDocument] ADD  CONSTRAINT [DF_HFAItemVehicleDetailsDocument_IsActive]  DEFAULT ((1)) FOR [IsActive]