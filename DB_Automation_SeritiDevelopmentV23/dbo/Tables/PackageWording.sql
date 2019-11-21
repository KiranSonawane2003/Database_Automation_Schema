CREATE TABLE [dbo].[PackageWording](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PackageId] [bigint] NOT NULL,
	[WordingFileName] [nvarchar](100) NULL,
	[EffectiveImmediately] [bit] NOT NULL,
	[OverrideProductWording] [bit] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PackageWording_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PackageWording]  WITH NOCHECK ADD  CONSTRAINT [PackageWording_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[PackageWording] CHECK CONSTRAINT [PackageWording_FK_Country]
GO
ALTER TABLE [dbo].[PackageWording]  WITH NOCHECK ADD  CONSTRAINT [PackageWording_FK_Packages] FOREIGN KEY([PackageId])
REFERENCES [dbo].[Package] ([Id])
GO

ALTER TABLE [dbo].[PackageWording] CHECK CONSTRAINT [PackageWording_FK_Packages]
GO
ALTER TABLE [dbo].[PackageWording]  WITH NOCHECK ADD  CONSTRAINT [PackageWording_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[PackageWording] CHECK CONSTRAINT [PackageWording_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[PackageWording]  WITH NOCHECK ADD  CONSTRAINT [PackageWording_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[PackageWording] CHECK CONSTRAINT [PackageWording_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[PackageWording] ADD  CONSTRAINT [PackageWording_DF_EffectiveImmediately]  DEFAULT ((0)) FOR [EffectiveImmediately]
GO
ALTER TABLE [dbo].[PackageWording] ADD  CONSTRAINT [PackageWording_DF_OverrideProductWording]  DEFAULT ((0)) FOR [OverrideProductWording]
GO
ALTER TABLE [dbo].[PackageWording] ADD  CONSTRAINT [PackageWording_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PackageWording] ADD  CONSTRAINT [PackageWording_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table stores package wording document' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PackageWording'