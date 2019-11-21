CREATE TABLE [dbo].[GroupWording](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[WordingCatId] [bigint] NOT NULL,
	[WordingFileName] [nvarchar](100) NULL,
	[WordingFilePath] [nvarchar](200) NOT NULL,
	[EffectiveImmediately] [bit] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [GroupWording_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroupWording]  WITH NOCHECK ADD  CONSTRAINT [GroupWording_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[GroupWording] CHECK CONSTRAINT [GroupWording_FK_Country]
GO
ALTER TABLE [dbo].[GroupWording]  WITH NOCHECK ADD  CONSTRAINT [GroupWording_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[GroupWording] CHECK CONSTRAINT [GroupWording_FK_Group]
GO
ALTER TABLE [dbo].[GroupWording]  WITH NOCHECK ADD  CONSTRAINT [GroupWording_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupWording] CHECK CONSTRAINT [GroupWording_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[GroupWording]  WITH NOCHECK ADD  CONSTRAINT [GroupWording_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupWording] CHECK CONSTRAINT [GroupWording_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[GroupWording]  WITH NOCHECK ADD  CONSTRAINT [GroupWording_FK_WordingCategory] FOREIGN KEY([WordingCatId])
REFERENCES [dbo].[WordingCategory] ([Id])
GO

ALTER TABLE [dbo].[GroupWording] CHECK CONSTRAINT [GroupWording_FK_WordingCategory]
GO
ALTER TABLE [dbo].[GroupWording] ADD  CONSTRAINT [GroupWording_DF_EffectiveImmediately]  DEFAULT ((0)) FOR [EffectiveImmediately]
GO
ALTER TABLE [dbo].[GroupWording] ADD  CONSTRAINT [GroupWording_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[GroupWording] ADD  CONSTRAINT [GroupWording_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table Wording Category' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupWording', @level2type=N'COLUMN',@level2name=N'WordingCatId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table stores wording document' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupWording'