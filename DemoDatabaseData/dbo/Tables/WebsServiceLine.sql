CREATE TABLE [dbo].[WebsServiceLine] (
    [Id]               BIGINT   IDENTITY (1, 1) NOT NULL,
    [CompanyId]        BIGINT   NULL,
    [WebServiceTypeId] BIGINT   NULL,
    [StartDate]        DATE     NULL,
    [EndDate]          DATE     NULL,
    [IsActive]         BIT      CONSTRAINT [DF__WebsServi__IsAct__35BACDCF] DEFAULT ((1)) NULL,
    [CountryId]        BIGINT   NULL,
    [CreatedBy]        INT      NULL,
    [ModifiedBy]       INT      NULL,
    [CreatedDate]      DATETIME CONSTRAINT [DF__WebsServi__Creat__36AEF208] DEFAULT (getutcdate()) NULL,
    [ModifiedDate]     DATETIME NULL,
    CONSTRAINT [WebsServiceLine_PK] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_StaticValue_WebServiceType] FOREIGN KEY ([WebServiceTypeId]) REFERENCES [dbo].[StaticValue] ([Id]),
    CONSTRAINT [WebsServiceLine_FK_Company] FOREIGN KEY ([CompanyId]) REFERENCES [dbo].[Company] ([Id]),
    CONSTRAINT [WebsServiceLine_FK_Country] FOREIGN KEY ([CountryId]) REFERENCES [dbo].[Country] ([Id]),
    CONSTRAINT [WebsServiceLine_FK_UsersCreatedBy] FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [WebsServiceLine_FK_UsersModifiedBy] FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[Users] ([Id])
);

