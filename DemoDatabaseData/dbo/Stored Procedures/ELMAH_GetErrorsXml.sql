CREATE PROCEDURE [dbo].[ELMAH_GetErrorsXml]
(
    @Application NVARCHAR(60),
    @PageIndex INT = 0,
    @PageSize INT = 15,
    @TotalCount INT OUTPUT
)
AS 

SET NOCOUNT ON

DECLARE @Page TABLE
(
    Position INT IDENTITY(1, 1) NOT NULL,
    ErrorId UNIQUEIDENTIFIER NOT NULL,
    Application NVARCHAR(60) NOT NULL,
    Host NVARCHAR(30) NOT NULL,
    Type NVARCHAR(100) NOT NULL,
    Source NVARCHAR(60) NOT NULL,
    Message NVARCHAR(500) NOT NULL,
    [User] NVARCHAR(50) NOT NULL,
    StatusCode INT NOT NULL,
    TimeUtc DATETIME NOT NULL
)

INSERT
INTO
    @Page
    (
        ErrorId,
        Application,
        Host,
        Type,
        Source,
        Message,
        [User],
        StatusCode,
        TimeUtc
    )
SELECT
    ErrorId,
    Application,
    Host,
    Type,
    Source,
    Message,
    [User],
    StatusCode,
    TimeUtc
FROM
    ELMAH_Error
WHERE
    Application = @Application    
ORDER BY
    TimeUtc DESC,
    Sequence DESC

SELECT 
    @TotalCount = COUNT(*) 
FROM 
    @Page

DECLARE @FirstPosition INT
SET @FirstPosition = @PageIndex * @PageSize + 1

DECLARE @LastPosition INT
SET @LastPosition  = @FirstPosition + @PageSize - 1

SELECT 
    errorId, 
    application,
    host, 
    type,
    source,
    message,
    [user],
    statusCode, 
    CONVERT(VARCHAR(50), TimeUtc, 126) + 'Z' time
FROM 
    @Page error
WHERE
    Position >= @FirstPosition
AND
    Position <= @LastPosition
ORDER BY
    Position
FOR
    XML AUTO
