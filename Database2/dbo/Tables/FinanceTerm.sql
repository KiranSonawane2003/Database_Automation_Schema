CREATE TABLE [dbo].[FinanceTerm](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FinanceTermName] [bigint] NOT NULL,
	[CountryId] [bigint] NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [FinanceTerm_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FinanceTerm]  WITH NOCHECK ADD  CONSTRAINT [FinanceTerm_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[FinanceTerm] CHECK CONSTRAINT [FinanceTerm_FK_Country]