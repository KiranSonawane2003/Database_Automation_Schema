CREATE TABLE [dbo].[Holidays](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryId] [bigint] NOT NULL,
	[HolidayName] [nvarchar](2000) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[PreviousStartDate] [datetime] NULL,
	[PreviousEndDate] [datetime] NULL,
	[IsSingleDay] [bit] NULL,
	[ThemeColor] [nvarchar](500) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_Holidays] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Holidays]  WITH CHECK ADD  CONSTRAINT [FK_Holidays_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[Holidays] CHECK CONSTRAINT [FK_Holidays_Country]