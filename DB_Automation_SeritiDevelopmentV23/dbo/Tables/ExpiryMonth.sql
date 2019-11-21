CREATE TABLE [dbo].[ExpiryMonth](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Month] [int] NULL,
	[CountryId] [bigint] NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_ExpiryMonth] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ExpiryMonth]  WITH NOCHECK ADD  CONSTRAINT [FK_ExpiryMonth_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[ExpiryMonth] CHECK CONSTRAINT [FK_ExpiryMonth_Country]