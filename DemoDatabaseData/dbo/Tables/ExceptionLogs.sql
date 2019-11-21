CREATE TABLE [dbo].[ExceptionLogs] (
    [LogID]          UNIQUEIDENTIFIER NOT NULL,
    [LogType]        NVARCHAR (100)   NULL,
    [IpAddress]      NVARCHAR (200)   NULL,
    [Message]        NVARCHAR (MAX)   NULL,
    [StackTrace]     NVARCHAR (MAX)   NULL,
    [InnerException] NVARCHAR (MAX)   NULL,
    [ExceptionType]  NVARCHAR (MAX)   NULL,
    [ErrorFrom]      NVARCHAR (MAX)   NULL,
    [FilterID]       BIGINT           NULL,
    CONSTRAINT [PK_ExceptionLogs] PRIMARY KEY CLUSTERED ([LogID] ASC)
);

