CREATE TABLE [dbo].[UserDeletedRolesMapping] (
    [UserId] NVARCHAR (128) NOT NULL,
    [RoleId] NVARCHAR (128) NOT NULL,
    CONSTRAINT [PK_UserDeletedRolesMapping] PRIMARY KEY CLUSTERED ([UserId] ASC, [RoleId] ASC)
);

