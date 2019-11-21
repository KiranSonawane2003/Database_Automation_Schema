CREATE TABLE [dbo].[Audit](
	[AuditId] [uniqueidentifier] NOT NULL,
	[UserId] [int] NOT NULL,
	[EventDateUTC] [datetime] NOT NULL,
	[EventType] [char](1) NOT NULL,
	[TableName] [nvarchar](100) NOT NULL,
	[RecordId] [nvarchar](100) NOT NULL,
	[ColumnName] [nvarchar](100) NOT NULL,
	[OriginalValue] [nvarchar](max) NULL,
	[NewValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AuditLog] PRIMARY KEY NONCLUSTERED 
(
	[AuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]