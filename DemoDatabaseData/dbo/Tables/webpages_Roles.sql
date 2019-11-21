CREATE TABLE [dbo].[webpages_Roles] (
    [RoleId]   INT            IDENTITY (1, 1) NOT NULL,
    [RoleName] NVARCHAR (256) NOT NULL,
    PRIMARY KEY CLUSTERED ([RoleId] ASC),
    CONSTRAINT [UQ__webpages__8A2B61606950082F] UNIQUE NONCLUSTERED ([RoleName] ASC)
);

