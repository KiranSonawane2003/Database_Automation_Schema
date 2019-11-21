CREATE TABLE [dbo].[HFAItemVehicleContactDetails] (
    [ID]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [HFAId]           BIGINT         NULL,
    [Title]           BIGINT         NULL,
    [LastName]        NVARCHAR (100) COLLATE Latin1_General_CI_AS NULL,
    [FirstName]       NVARCHAR (100) COLLATE Latin1_General_CI_AS NULL,
    [MobileNumber]    NVARCHAR (100) NULL,
    [CountryId]       BIGINT         NULL,
    [RelationshipId]  BIGINT         NULL,
    [IsRegularDriver] BIT            DEFAULT ((0)) NULL,
    [GenderId]        BIGINT         NULL,
    [Initials]        NVARCHAR (20)  NULL,
    [HomePhoneCode]   NVARCHAR (20)  COLLATE Latin1_General_CI_AS NULL,
    [HomePhoneNumber] NVARCHAR (50)  COLLATE Latin1_General_CI_AS NULL,
    [WorkPhoneCode]   NVARCHAR (20)  COLLATE Latin1_General_CI_AS NULL,
    [WorkPhoneNumber] NVARCHAR (50)  COLLATE Latin1_General_CI_AS NULL,
    [IsSecondInsured] BIT            DEFAULT ((0)) NULL,
    [EmailAddress]    NVARCHAR (100) COLLATE Latin1_General_CI_AS NULL,
    [IDNumber]        NVARCHAR (200) COLLATE Latin1_General_CI_AS NULL,
    CONSTRAINT [PK_HFAItemVehicleContactDetails] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_HFAItemVehicleContactDetails_HFAItemVehicleDetails] FOREIGN KEY ([HFAId]) REFERENCES [dbo].[HFAItemVehicleDetails] ([Id])
);

