CREATE TABLE [dbo].[PayoverReportFilterMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PayoverReportFilterId] [bigint] NOT NULL,
	[GroupId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[CriteriaEnum] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_PayoverReportFilterMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PayoverReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_PayoverReportFilterMapping_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[PayoverReportFilterMapping] CHECK CONSTRAINT [FK_PayoverReportFilterMapping_Branch]
GO
ALTER TABLE [dbo].[PayoverReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_PayoverReportFilterMapping_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[PayoverReportFilterMapping] CHECK CONSTRAINT [FK_PayoverReportFilterMapping_Group]
GO
ALTER TABLE [dbo].[PayoverReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_PayoverReportFilterMapping_PayoverReportFilter] FOREIGN KEY([PayoverReportFilterId])
REFERENCES [dbo].[PayoverReportFilter] ([Id])
GO

ALTER TABLE [dbo].[PayoverReportFilterMapping] CHECK CONSTRAINT [FK_PayoverReportFilterMapping_PayoverReportFilter]
GO
ALTER TABLE [dbo].[PayoverReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_PayoverReportFilterMapping_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[PayoverReportFilterMapping] CHECK CONSTRAINT [FK_PayoverReportFilterMapping_Users]
GO
ALTER TABLE [dbo].[PayoverReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_PayoverReportFilterMapping_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[PayoverReportFilterMapping] CHECK CONSTRAINT [FK_PayoverReportFilterMapping_Users1]
GO
ALTER TABLE [dbo].[PayoverReportFilterMapping] ADD  DEFAULT ((0)) FOR [IsActive]