CREATE TABLE [dbo].[TransactionStatusTest](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryId] [bigint] NOT NULL,
	[FinanceStatusId] [bigint] NOT NULL,
	[FinanceStatusName] [nvarchar](200) NULL,
	[SortOrder] [int] NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY]