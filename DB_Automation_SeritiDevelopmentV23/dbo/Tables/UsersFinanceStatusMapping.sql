CREATE TABLE [dbo].[UsersFinanceStatusMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CountryId] [bigint] NOT NULL,
	[FinanceStatusId] [bigint] NOT NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_UsersFinanceStatusMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UsersFinanceStatusMapping]  WITH CHECK ADD  CONSTRAINT [FK_UsersFinanceStatusMapping_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[UsersFinanceStatusMapping] CHECK CONSTRAINT [FK_UsersFinanceStatusMapping_Country]
GO
ALTER TABLE [dbo].[UsersFinanceStatusMapping]  WITH CHECK ADD  CONSTRAINT [FK_UsersFinanceStatusMapping_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[UsersFinanceStatusMapping] CHECK CONSTRAINT [FK_UsersFinanceStatusMapping_Users]
GO
ALTER TABLE [dbo].[UsersFinanceStatusMapping]  WITH CHECK ADD  CONSTRAINT [FK_UsersFinanceStatusMapping_Users1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[UsersFinanceStatusMapping] CHECK CONSTRAINT [FK_UsersFinanceStatusMapping_Users1]
GO
ALTER TABLE [dbo].[UsersFinanceStatusMapping]  WITH CHECK ADD  CONSTRAINT [FK_UsersFinanceStatusMapping_Users2] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[UsersFinanceStatusMapping] CHECK CONSTRAINT [FK_UsersFinanceStatusMapping_Users2]