CREATE TABLE [dbo].[WorkingDays] (
    [Id]                   BIGINT         IDENTITY (1, 1) NOT NULL,
    [CountryId]            BIGINT         NOT NULL,
    [WorkingDay]           INT            NOT NULL,
    [WorkingHours]         NVARCHAR (250) NOT NULL,
    [PreviousWorkingDays]  NVARCHAR (200) NULL,
    [PreviousWorkingHours] NVARCHAR (250) NULL,
    [IsActive]             BIT            NULL,
    [CreatedDate]          DATETIME       NULL,
    [CreatedBy]            INT            NULL,
    [ModifiedDate]         DATETIME       NULL,
    [ModifiedBy]           INT            NULL,
    [WorkStartTime]        NVARCHAR (250) NOT NULL,
    [WorkEndTime]          NVARCHAR (250) NOT NULL,
    CONSTRAINT [PK_WorkingDays] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_WorkingDays_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id])
);

