CREATE TABLE [dbo].[BranchCalculator] (
    [Id]                         BIGINT         IDENTITY (1, 1) NOT NULL,
    [BranchId]                   BIGINT         NULL,
    [IsCalculatorActive]         BIT            NULL,
    [PurchasePriceMin]           NVARCHAR (MAX) NULL,
    [PurchasePriceMax]           NVARCHAR (MAX) NULL,
    [PurchasePriceMaxLength]     NVARCHAR (MAX) NULL,
    [DepositMin]                 NVARCHAR (MAX) NULL,
    [DepositMax]                 NVARCHAR (MAX) NULL,
    [DepositMaxLength]           NVARCHAR (MAX) NULL,
    [InterestRateMin]            NVARCHAR (MAX) NULL,
    [InterestRateMax]            NVARCHAR (MAX) NULL,
    [InterestRateMaxLength]      NVARCHAR (MAX) NULL,
    [BalloonPercentageMin]       NVARCHAR (MAX) NULL,
    [BalloonPercentageMax]       NVARCHAR (MAX) NULL,
    [BalloonPercentageMaxLength] NVARCHAR (MAX) NULL,
    [BalloonAmtMin]              NVARCHAR (MAX) NULL,
    [BalloonAmtMax]              NVARCHAR (MAX) NULL,
    [BalloonAmtMaxLength]        NVARCHAR (MAX) NULL,
    [AdditionalFeeAmount]        NVARCHAR (MAX) NULL,
    [AdditionalFeePercentage]    NVARCHAR (MAX) NULL,
    [DisplayMessage]             NVARCHAR (MAX) NULL,
    [CountryId]                  BIGINT         NULL,
    [IsActive]                   BIT            CONSTRAINT [BranchCalculator_DF_IsActive] DEFAULT ((1)) NULL,
    [CreatedDate]                DATETIME       CONSTRAINT [BranchCalculator_DF_CreatedDate] DEFAULT (getutcdate()) NULL,
    [ModifiedDate]               DATETIME       NULL,
    [CreatedBy]                  INT            NULL,
    [ModifiedBy]                 INT            NULL,
    [IsBalloonPercentage]        BIT            DEFAULT ((0)) NULL,
    [IsBalloonAmt]               BIT            DEFAULT ((0)) NULL,
    [PaymentType]                INT            NULL,
    CONSTRAINT [BranchCalculator_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [BranchCalculator_FK_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([Id]),
    CONSTRAINT [BranchCalculator_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [BranchCalculator_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [BranchCalculator_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table associated calculator settingd with branch.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'BranchCalculator';

