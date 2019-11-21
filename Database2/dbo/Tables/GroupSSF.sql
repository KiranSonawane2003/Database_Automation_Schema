CREATE TABLE [dbo].[GroupSSF](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NULL,
	[TransactionFee] [decimal](18, 2) NULL,
	[IsVatIndicator] [bit] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[CreateDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [GroupSSF_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroupSSF]  WITH CHECK ADD  CONSTRAINT [GroupSSF_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[GroupSSF] CHECK CONSTRAINT [GroupSSF_FK_Country]
GO
ALTER TABLE [dbo].[GroupSSF]  WITH CHECK ADD  CONSTRAINT [GroupSSF_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[GroupSSF] CHECK CONSTRAINT [GroupSSF_FK_Group]
GO
ALTER TABLE [dbo].[GroupSSF]  WITH CHECK ADD  CONSTRAINT [GroupSSF_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupSSF] CHECK CONSTRAINT [GroupSSF_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[GroupSSF]  WITH CHECK ADD  CONSTRAINT [GroupSSF_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupSSF] CHECK CONSTRAINT [GroupSSF_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[GroupSSF] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[GroupSSF] ADD  DEFAULT (getutcdate()) FOR [CreateDate]