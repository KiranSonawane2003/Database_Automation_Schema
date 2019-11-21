CREATE TABLE [dbo].[DalasStatusHistory] (
    [Id]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [LeadNumber]     BIGINT         NULL,
    [EzFlowStatusTo] NVARCHAR (MAX) NULL,
    [DalasStatusTo]  NVARCHAR (MAX) NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    CONSTRAINT [PK_DalasStatusHistory] PRIMARY KEY CLUSTERED ([Id] ASC)
);

