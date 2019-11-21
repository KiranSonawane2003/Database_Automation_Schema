CREATE TABLE [dbo].[Localizations] (
    [pk]          INT             IDENTITY (1, 1) NOT NULL,
    [ResourceId]  NVARCHAR (1024) NOT NULL,
    [Value]       NVARCHAR (MAX)  CONSTRAINT [DF_Localizations_Text] DEFAULT ('') NULL,
    [LocaleId]    NVARCHAR (10)   CONSTRAINT [DF_Localizations_LocaleId] DEFAULT ('') NULL,
    [ResourceSet] NVARCHAR (512)  CONSTRAINT [DF_Localizations_PageId] DEFAULT ('') NULL,
    [Type]        NVARCHAR (512)  CONSTRAINT [DF_Localizations_Type] DEFAULT ('') NULL,
    [BinFile]     VARBINARY (MAX) NULL,
    [TextFile]    NVARCHAR (MAX)  NULL,
    [Filename]    NVARCHAR (128)  CONSTRAINT [DF_Localizations_Filename] DEFAULT ('') NULL,
    [Comment]     NVARCHAR (512)  NULL,
    [ValueType]   INT             CONSTRAINT [DF_Localizations_ValueType] DEFAULT ((0)) NOT NULL,
    [Updated]     DATETIME        CONSTRAINT [DF_Localizations_Updated] DEFAULT (getutcdate()) NULL,
    CONSTRAINT [PK_Localizations] PRIMARY KEY CLUSTERED ([pk] ASC)
);

