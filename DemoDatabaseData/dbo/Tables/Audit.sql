CREATE TABLE [dbo].[Audit] (
    [AuditId]       UNIQUEIDENTIFIER NOT NULL,
    [UserId]        INT              NOT NULL,
    [EventDateUTC]  DATETIME         NOT NULL,
    [EventType]     CHAR (1)         NOT NULL,
    [TableName]     NVARCHAR (100)   NOT NULL,
    [RecordId]      NVARCHAR (100)   NOT NULL,
    [ColumnName]    NVARCHAR (100)   NOT NULL,
    [OriginalValue] NVARCHAR (MAX)   NULL,
    [NewValue]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_AuditLog] PRIMARY KEY NONCLUSTERED ([AuditId] ASC)
);

