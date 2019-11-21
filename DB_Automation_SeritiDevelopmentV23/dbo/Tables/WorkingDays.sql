CREATE TABLE [dbo].[WorkingDays](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryId] [bigint] NOT NULL,
	[WorkingDay] [int] NOT NULL,
	[WorkingHours] [nvarchar](250) NOT NULL,
	[PreviousWorkingDays] [nvarchar](200) NULL,
	[PreviousWorkingHours] [nvarchar](250) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[WorkStartTime] [nvarchar](250) NOT NULL,
	[WorkEndTime] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_WorkingDays] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WorkingDays]  WITH CHECK ADD  CONSTRAINT [FK_WorkingDays_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[WorkingDays] CHECK CONSTRAINT [FK_WorkingDays_Country]