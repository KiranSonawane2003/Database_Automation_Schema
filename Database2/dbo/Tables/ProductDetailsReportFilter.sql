CREATE TABLE [dbo].[ProductDetailsReportFilter](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MasterReportId] [bigint] NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[IsEmailReport] [bit] NOT NULL,
	[ProductTypeId] [bigint] NULL,
	[ProductSubTypeId] [bigint] NULL,
	[Email] [nvarchar](100) NULL,
	[CopiedFrom] [bigint] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [ProductDetailsReportFilter_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilter]  WITH CHECK ADD  CONSTRAINT [ProductDetailsReportFilter_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ProductDetailsReportFilter] CHECK CONSTRAINT [ProductDetailsReportFilter_FK_Country]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilter]  WITH CHECK ADD  CONSTRAINT [ProductDetailsReportFilter_FK_MasterReport] FOREIGN KEY([MasterReportId])
REFERENCES [dbo].[MasterReport] ([Id])
GO

ALTER TABLE [dbo].[ProductDetailsReportFilter] CHECK CONSTRAINT [ProductDetailsReportFilter_FK_MasterReport]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilter]  WITH CHECK ADD  CONSTRAINT [ProductDetailsReportFilter_FK_ProductSubType] FOREIGN KEY([ProductSubTypeId])
REFERENCES [dbo].[ProductSubType] ([Id])
GO

ALTER TABLE [dbo].[ProductDetailsReportFilter] CHECK CONSTRAINT [ProductDetailsReportFilter_FK_ProductSubType]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilter]  WITH CHECK ADD  CONSTRAINT [ProductDetailsReportFilter_FK_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([Id])
GO

ALTER TABLE [dbo].[ProductDetailsReportFilter] CHECK CONSTRAINT [ProductDetailsReportFilter_FK_ProductType]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilter]  WITH CHECK ADD  CONSTRAINT [ProductDetailsReportFilter_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductDetailsReportFilter] CHECK CONSTRAINT [ProductDetailsReportFilter_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilter]  WITH CHECK ADD  CONSTRAINT [ProductDetailsReportFilter_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ProductDetailsReportFilter] CHECK CONSTRAINT [ProductDetailsReportFilter_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilter] ADD  CONSTRAINT [DF_ProductDetailsReportFilter_IsEmailReport]  DEFAULT ((0)) FOR [IsEmailReport]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilter] ADD  CONSTRAINT [DF_ProductDetailsReportFilter_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ProductDetailsReportFilter] ADD  CONSTRAINT [DF_ProductDetailsReportFilter_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]