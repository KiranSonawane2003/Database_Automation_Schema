CREATE TABLE [dbo].[GroupProductNotes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[ProductNote] [nvarchar](300) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [GroupProductNotes_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroupProductNotes]  WITH NOCHECK ADD  CONSTRAINT [FK_GroupProductNotes_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[GroupProductNotes] CHECK CONSTRAINT [FK_GroupProductNotes_Country]
GO
ALTER TABLE [dbo].[GroupProductNotes]  WITH NOCHECK ADD  CONSTRAINT [GroupProductNotes_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[GroupProductNotes] CHECK CONSTRAINT [GroupProductNotes_FK_Group]
GO
ALTER TABLE [dbo].[GroupProductNotes]  WITH NOCHECK ADD  CONSTRAINT [GroupProductNotes_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupProductNotes] CHECK CONSTRAINT [GroupProductNotes_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[GroupProductNotes]  WITH NOCHECK ADD  CONSTRAINT [GroupProductNotes_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupProductNotes] CHECK CONSTRAINT [GroupProductNotes_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[GroupProductNotes] ADD  CONSTRAINT [GroupProductNotes_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[GroupProductNotes] ADD  CONSTRAINT [GroupProductNotes_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table stores the notes for the product assigned to group.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupProductNotes'