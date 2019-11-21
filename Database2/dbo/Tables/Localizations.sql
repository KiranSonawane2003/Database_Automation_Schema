CREATE TABLE [dbo].[Localizations](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[ResourceId] [nvarchar](1024) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[LocaleId] [nvarchar](10) NULL,
	[ResourceSet] [nvarchar](512) NULL,
	[Type] [nvarchar](512) NULL,
	[BinFile] [varbinary](max) NULL,
	[TextFile] [nvarchar](max) NULL,
	[Filename] [nvarchar](128) NULL,
	[Comment] [nvarchar](512) NULL,
	[ValueType] [int] NOT NULL,
	[Updated] [datetime] NULL,
 CONSTRAINT [PK_Localizations] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Localizations] ADD  CONSTRAINT [DF_Localizations_Text]  DEFAULT ('') FOR [Value]
GO
ALTER TABLE [dbo].[Localizations] ADD  CONSTRAINT [DF_Localizations_LocaleId]  DEFAULT ('') FOR [LocaleId]
GO
ALTER TABLE [dbo].[Localizations] ADD  CONSTRAINT [DF_Localizations_PageId]  DEFAULT ('') FOR [ResourceSet]
GO
ALTER TABLE [dbo].[Localizations] ADD  CONSTRAINT [DF_Localizations_Type]  DEFAULT ('') FOR [Type]
GO
ALTER TABLE [dbo].[Localizations] ADD  CONSTRAINT [DF_Localizations_Filename]  DEFAULT ('') FOR [Filename]
GO
ALTER TABLE [dbo].[Localizations] ADD  CONSTRAINT [DF_Localizations_ValueType]  DEFAULT ((0)) FOR [ValueType]
GO
ALTER TABLE [dbo].[Localizations] ADD  CONSTRAINT [DF_Localizations_Updated]  DEFAULT (getutcdate()) FOR [Updated]