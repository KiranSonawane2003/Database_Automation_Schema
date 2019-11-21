CREATE TABLE [dbo].[TransactionFinanceStatusMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryId] [bigint] NULL,
	[FinanceStatusId] [bigint] NULL,
	[FinanceStatusName] [nvarchar](200) NULL,
	[SortOrder] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_TransactionFinanceStatusMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]