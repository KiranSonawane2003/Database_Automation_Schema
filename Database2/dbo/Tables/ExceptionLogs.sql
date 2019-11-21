CREATE TABLE [dbo].[ExceptionLogs](
	[LogID] [uniqueidentifier] NOT NULL,
	[LogType] [nvarchar](100) NULL,
	[IpAddress] [nvarchar](200) NULL,
	[Message] [nvarchar](max) NULL,
	[StackTrace] [nvarchar](max) NULL,
	[InnerException] [nvarchar](max) NULL,
	[ExceptionType] [nvarchar](max) NULL,
	[ErrorFrom] [nvarchar](max) NULL,
	[FilterID] [bigint] NULL,
 CONSTRAINT [PK_ExceptionLogs] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]