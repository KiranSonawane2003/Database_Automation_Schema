CREATE TABLE [dbo].[VehicleBodyType] (
    [Id]                   BIGINT         IDENTITY (1, 1) NOT NULL,
    [BodyStyle]            NVARCHAR (100) NULL,
    [CountryId]            BIGINT         NULL,
    [BodyTypeAbbreviation] NVARCHAR (100) NULL,
    [IsActive]             BIT            CONSTRAINT [VehicleBodyType_DF_IsActive] DEFAULT ((1)) NOT NULL,
    [CreatedDate]          DATETIME       CONSTRAINT [VehicleBodyType_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]         DATETIME       NULL,
    [CreatedBy]            INT            NOT NULL,
    [ModifiedBy]           INT            NULL,
    CONSTRAINT [VehicleBodyType_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [VehicleBodyType_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [VehicleBodyType_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [VehicleBodyType_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is master for vehicle body type', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'VehicleBodyType';

