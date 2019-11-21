CREATE TABLE [dbo].[IGFLicence](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Number] [bigint] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DocName] [nvarchar](100) NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsTerminated] [bit] NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [IGFLicence_FK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IGFLicence]  WITH NOCHECK ADD  CONSTRAINT [IGFLicence_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[IGFLicence] CHECK CONSTRAINT [IGFLicence_FK_Country]
GO
ALTER TABLE [dbo].[IGFLicence]  WITH NOCHECK ADD  CONSTRAINT [IGFLicence_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[IGFLicence] CHECK CONSTRAINT [IGFLicence_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[IGFLicence]  WITH NOCHECK ADD  CONSTRAINT [IGFLicence_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[IGFLicence] CHECK CONSTRAINT [IGFLicence_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[IGFLicence] ADD  CONSTRAINT [IGFLicence_DF_Terminated]  DEFAULT ((0)) FOR [IsTerminated]
GO
ALTER TABLE [dbo].[IGFLicence] ADD  CONSTRAINT [IGFLicence_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[IGFLicence] ADD  CONSTRAINT [IGFLicence_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table is used to store IGF Licence Admin page information under Admin >> Company Admin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'IGFLicence'