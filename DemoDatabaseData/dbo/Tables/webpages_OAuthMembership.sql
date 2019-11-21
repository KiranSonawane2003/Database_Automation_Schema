CREATE TABLE [dbo].[webpages_OAuthMembership] (
    [Provider]       NVARCHAR (30)  NOT NULL,
    [ProviderUserId] NVARCHAR (100) NOT NULL,
    [UserId]         INT            NOT NULL,
    CONSTRAINT [PK__webpages__F53FC0EDB326AF99] PRIMARY KEY CLUSTERED ([Provider] ASC, [ProviderUserId] ASC)
);

