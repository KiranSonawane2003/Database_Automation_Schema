CREATE TABLE [dbo].[VehicleType] (
    [Id]                  BIGINT         IDENTITY (1, 1) NOT NULL,
    [VehicleTypeName]     NVARCHAR (100) NOT NULL,
    [CountryId]           BIGINT         NULL,
    [IsActive]            BIT            CONSTRAINT [VehicleType_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [VehicleAbbreviation] NVARCHAR (100) NULL,
    [CreatedDate]         DATETIME       CONSTRAINT [VehicleType_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]        DATETIME       NULL,
    [CreatedBy]           INT            NOT NULL,
    [ModifiedBy]          INT            NULL,
    CONSTRAINT [VehicleType_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [VehicleType_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [VehicleType_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [VehicleType_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is master for Vehicle Type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'VehicleType';

