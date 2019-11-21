CREATE TABLE [dbo].[PayoverJob](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PayoverJobName] [nvarchar](100) NOT NULL,
	[Seed] [int] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PayoverJob_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PayoverJob]  WITH NOCHECK ADD  CONSTRAINT [PayoverJob_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[PayoverJob] CHECK CONSTRAINT [PayoverJob_FK_Country]
GO
ALTER TABLE [dbo].[PayoverJob]  WITH NOCHECK ADD  CONSTRAINT [PayoverJob_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[PayoverJob] CHECK CONSTRAINT [PayoverJob_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[PayoverJob]  WITH NOCHECK ADD  CONSTRAINT [PayoverJob_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[PayoverJob] CHECK CONSTRAINT [PayoverJob_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[PayoverJob] ADD  CONSTRAINT [PayoverJob_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PayoverJob] ADD  CONSTRAINT [PayoverJob_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Payover Job name will be filled by ths table on page Crerate Group under Administaration >> Group >> CreateGroup' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PayoverJob'