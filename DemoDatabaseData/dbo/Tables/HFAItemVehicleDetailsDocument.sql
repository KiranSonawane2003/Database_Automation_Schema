CREATE TABLE [dbo].[HFAItemVehicleDetailsDocument] (
    [Id]                  BIGINT         IDENTITY (1, 1) NOT NULL,
    [HFAItemVehicleId]    BIGINT         NULL,
    [DocumentCategoryId]  BIGINT         NULL,
    [DocumentDescription] NVARCHAR (500) NULL,
    [DocumentPath]        NVARCHAR (300) NULL,
    [DocumentName]        NVARCHAR (200) NULL,
    [TypeEnum]            INT            NULL,
    [DocumentSize]        NVARCHAR (50)  NULL,
    [IsActive]            BIT            CONSTRAINT [DF_HFAItemVehicleDetailsDocument_IsActive] DEFAULT ((1)) NOT NULL,
    [CountryId]           BIGINT         NULL,
    [CreatedBy]           INT            NULL,
    [CreatedDate]         DATETIME       NULL,
    [ModifiedBy]          INT            NULL,
    [ModifiedDate]        DATETIME       NULL,
    CONSTRAINT [PK_HFAItemVehicleDetailsDocument] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_HFAItemVehicleDetailsDocument_DocumentCategory] FOREIGN KEY ([DocumentCategoryId]) REFERENCES [dbo].[DocumentCategory] ([Id]),
    CONSTRAINT [FK_HFAItemVehicleDetailsDocument_HFAItemVehicleDetails] FOREIGN KEY ([HFAItemVehicleId]) REFERENCES [dbo].[HFAItemVehicleDetails] ([Id]),
    CONSTRAINT [FK_HFAItemVehicleDetailsDocument_HFAItemVehicleDetailsDocument] FOREIGN KEY ([Id]) REFERENCES [dbo].[HFAItemVehicleDetailsDocument] ([Id])
);

