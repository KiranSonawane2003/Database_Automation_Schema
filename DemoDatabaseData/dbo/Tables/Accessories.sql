CREATE TABLE [dbo].[Accessories] (
    [Id]                    BIGINT          IDENTITY (1, 1) NOT NULL,
    [AccessoryName]         NVARCHAR (MAX)  NOT NULL,
    [Code]                  NVARCHAR (MAX)  NOT NULL,
    [IsGeneric]             BIT             CONSTRAINT [Accessories_IsGeneric] DEFAULT ((1)) NOT NULL,
    [GroupId]               BIGINT          NULL,
    [BranchId]              BIGINT          NULL,
    [CostPrice]             DECIMAL (18, 2) NULL,
    [SellingPrice]          DECIMAL (18, 2) NULL,
    [Description]           NVARCHAR (200)  NULL,
    [TemplateId]            BIGINT          NULL,
    [CountryId]             BIGINT          NULL,
    [IsActive]              BIT             CONSTRAINT [Accessories_DF_IsActive] DEFAULT ((0)) NOT NULL,
    [IsEditable]            BIT             NULL,
    [CreatedDate]           DATETIME        CONSTRAINT [Accessories_DF_CreatedDate] DEFAULT (getutcdate()) NOT NULL,
    [ModifiedDate]          DATETIME        NULL,
    [CreatedBy]             INT             NOT NULL,
    [ModifiedBy]            INT             NULL,
    [IsNewVehicleAccessory] BIT             NULL,
    CONSTRAINT [Accessories_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [Accessories_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [Accessories_FK_Template] FOREIGN KEY ([TemplateId]) REFERENCES [dbo].[Template] ([Id]),
    CONSTRAINT [Accessories_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [Accessories_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_Accessories_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [FK_Accessories_Group] FOREIGN KEY ([GroupId]) REFERENCES [dbo].[Group] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'• This table is for store accessories deails. 
• We need to Verify details for Accessories.
• We are going to add accessories admin under Administration >>Product', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Accessories';

