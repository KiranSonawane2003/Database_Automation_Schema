CREATE TABLE [dbo].[ReferenceType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ReferenceTypeName] [nvarchar](100) NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [ReferenceType_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReferenceType]  WITH NOCHECK ADD  CONSTRAINT [ReferenceType_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ReferenceType] CHECK CONSTRAINT [ReferenceType_FK_Country]
GO
ALTER TABLE [dbo].[ReferenceType]  WITH NOCHECK ADD  CONSTRAINT [ReferenceType_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ReferenceType] CHECK CONSTRAINT [ReferenceType_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ReferenceType]  WITH NOCHECK ADD  CONSTRAINT [ReferenceType_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ReferenceType] CHECK CONSTRAINT [ReferenceType_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ReferenceType] ADD  CONSTRAINT [ReferenceType_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ReferenceType] ADD  CONSTRAINT [ReferenceType_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table is master for ReferenceType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ReferenceType'