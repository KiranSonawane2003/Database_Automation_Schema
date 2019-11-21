CREATE TABLE [dbo].[DealTrackerReportFilter](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[MasterReportId] [bigint] NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[IsInceptDate] [bit] NOT NULL,
	[IsCreateDate] [bit] NOT NULL,
	[IsUnIncept] [bit] NOT NULL,
	[CopiedFrom] [bigint] NULL,
	[IsEmailReport] [bit] NOT NULL,
	[Email] [nvarchar](100) NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_DealTrackerReportFilter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DealTrackerReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_DealTrackerReportFilter_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[DealTrackerReportFilter] CHECK CONSTRAINT [FK_DealTrackerReportFilter_Country]
GO
ALTER TABLE [dbo].[DealTrackerReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_DealTrackerReportFilter_MasterReport] FOREIGN KEY([MasterReportId])
REFERENCES [dbo].[MasterReport] ([Id])
GO

ALTER TABLE [dbo].[DealTrackerReportFilter] CHECK CONSTRAINT [FK_DealTrackerReportFilter_MasterReport]
GO
ALTER TABLE [dbo].[DealTrackerReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_DealTrackerReportFilter_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[DealTrackerReportFilter] CHECK CONSTRAINT [FK_DealTrackerReportFilter_Users]
GO
ALTER TABLE [dbo].[DealTrackerReportFilter]  WITH CHECK ADD  CONSTRAINT [FK_DealTrackerReportFilter_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[DealTrackerReportFilter] CHECK CONSTRAINT [FK_DealTrackerReportFilter_Users1]
GO
ALTER TABLE [dbo].[DealTrackerReportFilter] ADD  DEFAULT ((0)) FOR [IsInceptDate]
GO
ALTER TABLE [dbo].[DealTrackerReportFilter] ADD  DEFAULT ((0)) FOR [IsCreateDate]
GO
ALTER TABLE [dbo].[DealTrackerReportFilter] ADD  DEFAULT ((0)) FOR [IsUnIncept]
GO
ALTER TABLE [dbo].[DealTrackerReportFilter] ADD  DEFAULT ((0)) FOR [IsEmailReport]
GO
ALTER TABLE [dbo].[DealTrackerReportFilter] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[DealTrackerReportFilter] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]