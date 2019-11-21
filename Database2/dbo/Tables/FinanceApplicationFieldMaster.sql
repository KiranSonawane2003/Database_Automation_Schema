CREATE TABLE [dbo].[FinanceApplicationFieldMaster](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryId] [bigint] NOT NULL,
	[Section] [nvarchar](50) NOT NULL,
	[FieldName] [nvarchar](50) NOT NULL,
	[UIFieldName] [nvarchar](500) NOT NULL,
	[MaxLength] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_FinanceApplicationFieldMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[FinanceApplicationFieldMaster]  WITH CHECK ADD  CONSTRAINT [FK_FinanceApplicationFieldMaster_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[FinanceApplicationFieldMaster] CHECK CONSTRAINT [FK_FinanceApplicationFieldMaster_Country]