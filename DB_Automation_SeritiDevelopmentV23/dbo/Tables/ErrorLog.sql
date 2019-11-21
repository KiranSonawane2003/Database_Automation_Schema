CREATE TABLE [dbo].[ErrorLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ErrorHtml] [nvarchar](max) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [ErrorLog_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ErrorLog]  WITH NOCHECK ADD  CONSTRAINT [ErrorLog_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ErrorLog] CHECK CONSTRAINT [ErrorLog_FK_Country]
GO
ALTER TABLE [dbo].[ErrorLog]  WITH NOCHECK ADD  CONSTRAINT [ErrorLog_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ErrorLog] CHECK CONSTRAINT [ErrorLog_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ErrorLog]  WITH NOCHECK ADD  CONSTRAINT [ErrorLog_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ErrorLog] CHECK CONSTRAINT [ErrorLog_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  CONSTRAINT [ErrorLog_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[ErrorLog] ADD  CONSTRAINT [ErrorLog_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table for store error log in system.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ErrorLog'