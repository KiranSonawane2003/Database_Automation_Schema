CREATE TABLE [dbo].[SMTPDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[EmailAddress] [nvarchar](100) NULL,
	[EmailPassword] [nvarchar](max) NULL,
	[SMTPHost] [nvarchar](100) NULL,
	[SMTPPort] [int] NULL,
	[SMTPDetailsType] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [SMTPDetails_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[SMTPDetails]  WITH CHECK ADD  CONSTRAINT [SMTPDetails_FK_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[SMTPDetails] CHECK CONSTRAINT [SMTPDetails_FK_Branch]
GO
ALTER TABLE [dbo].[SMTPDetails]  WITH CHECK ADD  CONSTRAINT [SMTPDetails_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[SMTPDetails] CHECK CONSTRAINT [SMTPDetails_FK_Group]
GO
ALTER TABLE [dbo].[SMTPDetails]  WITH CHECK ADD  CONSTRAINT [SMTPDetails_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[SMTPDetails] CHECK CONSTRAINT [SMTPDetails_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[SMTPDetails]  WITH CHECK ADD  CONSTRAINT [SMTPDetails_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[SMTPDetails] CHECK CONSTRAINT [SMTPDetails_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[SMTPDetails] ADD  CONSTRAINT [DF_SMTPDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SMTPDetails] ADD  CONSTRAINT [DF_SMTPDetails_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]