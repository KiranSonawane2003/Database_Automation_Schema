CREATE TABLE [dbo].[ApplicationAPILog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TransactionId] [bigint] NULL,
	[CompanyCompanyTypeId] [bigint] NULL,
	[ApplicationType] [int] NULL,
	[CompanyName] [nvarchar](1000) NULL,
	[RequestURL] [nvarchar](4000) NULL,
	[RequestContent] [nvarchar](4000) NULL,
	[RequestTimestamp] [datetime] NULL,
	[ResponseContent] [nvarchar](4000) NULL,
	[ResponseTimestamp] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [ApplicationAPILog_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApplicationAPILog]  WITH CHECK ADD  CONSTRAINT [ApplicationAPILog_FK_CompanyCompanyTypeMapping] FOREIGN KEY([CompanyCompanyTypeId])
REFERENCES [dbo].[CompanyCompanyTypeMapping] ([Id])
GO

ALTER TABLE [dbo].[ApplicationAPILog] CHECK CONSTRAINT [ApplicationAPILog_FK_CompanyCompanyTypeMapping]
GO
ALTER TABLE [dbo].[ApplicationAPILog]  WITH CHECK ADD  CONSTRAINT [ApplicationAPILog_FK_Transaction] FOREIGN KEY([TransactionId])
REFERENCES [dbo].[Transaction] ([Id])
GO

ALTER TABLE [dbo].[ApplicationAPILog] CHECK CONSTRAINT [ApplicationAPILog_FK_Transaction]
GO
ALTER TABLE [dbo].[ApplicationAPILog]  WITH CHECK ADD  CONSTRAINT [ApplicationAPILog_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ApplicationAPILog] CHECK CONSTRAINT [ApplicationAPILog_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ApplicationAPILog]  WITH CHECK ADD  CONSTRAINT [ApplicationAPILog_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ApplicationAPILog] CHECK CONSTRAINT [ApplicationAPILog_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ApplicationAPILog] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]