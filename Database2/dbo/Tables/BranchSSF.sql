CREATE TABLE [dbo].[BranchSSF](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NULL,
	[BranchId] [bigint] NULL,
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
 CONSTRAINT [BranchSSF_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BranchSSF]  WITH CHECK ADD  CONSTRAINT [BranchSSF_FK_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[BranchSSF] CHECK CONSTRAINT [BranchSSF_FK_Branch]
GO
ALTER TABLE [dbo].[BranchSSF]  WITH CHECK ADD  CONSTRAINT [BranchSSF_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[BranchSSF] CHECK CONSTRAINT [BranchSSF_FK_Country]
GO
ALTER TABLE [dbo].[BranchSSF]  WITH CHECK ADD  CONSTRAINT [BranchSSF_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[BranchSSF] CHECK CONSTRAINT [BranchSSF_FK_Group]
GO
ALTER TABLE [dbo].[BranchSSF]  WITH CHECK ADD  CONSTRAINT [BranchSSF_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[BranchSSF] CHECK CONSTRAINT [BranchSSF_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[BranchSSF]  WITH CHECK ADD  CONSTRAINT [BranchSSF_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[BranchSSF] CHECK CONSTRAINT [BranchSSF_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[BranchSSF] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[BranchSSF] ADD  DEFAULT (getutcdate()) FOR [CreateDate]