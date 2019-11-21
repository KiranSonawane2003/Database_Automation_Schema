CREATE TABLE [dbo].[ApiLogEntry](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Application] [nvarchar](100) NULL,
	[User] [nvarchar](100) NULL,
	[Machine] [nvarchar](100) NULL,
	[RequestIpAddress] [nvarchar](100) NULL,
	[RequestContentType] [nvarchar](100) NULL,
	[RequestContentBody] [nvarchar](max) NULL,
	[RequestUri] [nvarchar](100) NULL,
	[RequestMethod] [nvarchar](100) NULL,
	[RequestRouteTemplate] [nvarchar](100) NULL,
	[RequestRouteData] [nvarchar](max) NULL,
	[RequestHeaders] [nvarchar](max) NULL,
	[RequestTimestamp] [datetime] NULL,
	[ResponseContentType] [nvarchar](100) NULL,
	[ResponseContentBody] [nvarchar](max) NULL,
	[ResponseStatusCode] [int] NULL,
	[ResponseHeaders] [nvarchar](max) NULL,
	[ResponseTimestamp] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[APIEnumType] [int] NULL,
 CONSTRAINT [ApiLogEntry_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApiLogEntry]  WITH NOCHECK ADD  CONSTRAINT [ApiLogEntry_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ApiLogEntry] CHECK CONSTRAINT [ApiLogEntry_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[ApiLogEntry]  WITH NOCHECK ADD  CONSTRAINT [ApiLogEntry_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ApiLogEntry] CHECK CONSTRAINT [ApiLogEntry_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[ApiLogEntry] ADD  CONSTRAINT [DF__ApiLogEnt__APIEn__2C316395]  DEFAULT ((1)) FOR [APIEnumType]