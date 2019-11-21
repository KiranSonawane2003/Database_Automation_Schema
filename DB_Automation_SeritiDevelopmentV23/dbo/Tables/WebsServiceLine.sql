CREATE TABLE [dbo].[WebsServiceLine](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyId] [bigint] NULL,
	[WebServiceTypeId] [bigint] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[IsActive] [bit] NULL,
	[CountryId] [bigint] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [WebsServiceLine_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WebsServiceLine]  WITH CHECK ADD  CONSTRAINT [FK_StaticValue_WebServiceType] FOREIGN KEY([WebServiceTypeId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[WebsServiceLine] CHECK CONSTRAINT [FK_StaticValue_WebServiceType]
GO
ALTER TABLE [dbo].[WebsServiceLine]  WITH CHECK ADD  CONSTRAINT [WebsServiceLine_FK_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[WebsServiceLine] CHECK CONSTRAINT [WebsServiceLine_FK_Company]
GO
ALTER TABLE [dbo].[WebsServiceLine]  WITH CHECK ADD  CONSTRAINT [WebsServiceLine_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[WebsServiceLine] CHECK CONSTRAINT [WebsServiceLine_FK_Country]
GO
ALTER TABLE [dbo].[WebsServiceLine]  WITH CHECK ADD  CONSTRAINT [WebsServiceLine_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[WebsServiceLine] CHECK CONSTRAINT [WebsServiceLine_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[WebsServiceLine]  WITH CHECK ADD  CONSTRAINT [WebsServiceLine_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[WebsServiceLine] CHECK CONSTRAINT [WebsServiceLine_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[WebsServiceLine] ADD  CONSTRAINT [DF__WebsServi__IsAct__35BACDCF]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[WebsServiceLine] ADD  CONSTRAINT [DF__WebsServi__Creat__36AEF208]  DEFAULT (getutcdate()) FOR [CreatedDate]