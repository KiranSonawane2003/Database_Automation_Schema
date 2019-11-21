CREATE TABLE [dbo].[Holidays] (
    [Id]                BIGINT          IDENTITY (1, 1) NOT NULL,
    [CountryId]         BIGINT          NOT NULL,
    [HolidayName]       NVARCHAR (2000) NOT NULL,
    [StartDate]         DATETIME        NULL,
    [EndDate]           DATETIME        NULL,
    [PreviousStartDate] DATETIME        NULL,
    [PreviousEndDate]   DATETIME        NULL,
    [IsSingleDay]       BIT             NULL,
    [ThemeColor]        NVARCHAR (500)  NULL,
    [IsActive]          BIT             NULL,
    [CreatedDate]       DATETIME        NULL,
    [CreatedBy]         INT             NULL,
    [ModifiedDate]      DATETIME        NULL,
    [ModifiedBy]        INT             NULL,
    CONSTRAINT [PK_Holidays] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Holidays_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id])
);

