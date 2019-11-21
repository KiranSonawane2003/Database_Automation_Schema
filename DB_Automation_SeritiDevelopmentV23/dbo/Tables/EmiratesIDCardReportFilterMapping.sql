CREATE TABLE [dbo].[EmiratesIDCardReportFilterMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmiratesIDCardReportFilterId] [bigint] NULL,
	[GroupId] [bigint] NULL,
	[BranchId] [bigint] NULL,
	[CriteriaEnum] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
 CONSTRAINT [PK_EmiratesIDCardReportFilterMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmiratesIDCardReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_EmiratesIDCardReportFilterMapping_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([Id])
GO

ALTER TABLE [dbo].[EmiratesIDCardReportFilterMapping] CHECK CONSTRAINT [FK_EmiratesIDCardReportFilterMapping_Branch]
GO
ALTER TABLE [dbo].[EmiratesIDCardReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_EmiratesIDCardReportFilterMapping_EmiratesIDCardReportFilter] FOREIGN KEY([EmiratesIDCardReportFilterId])
REFERENCES [dbo].[EmiratesIDCardReportFilter] ([Id])
GO

ALTER TABLE [dbo].[EmiratesIDCardReportFilterMapping] CHECK CONSTRAINT [FK_EmiratesIDCardReportFilterMapping_EmiratesIDCardReportFilter]
GO
ALTER TABLE [dbo].[EmiratesIDCardReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_EmiratesIDCardReportFilterMapping_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[EmiratesIDCardReportFilterMapping] CHECK CONSTRAINT [FK_EmiratesIDCardReportFilterMapping_Group]
GO
ALTER TABLE [dbo].[EmiratesIDCardReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_EmiratesIDCardReportFilterMapping_Users_CreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmiratesIDCardReportFilterMapping] CHECK CONSTRAINT [FK_EmiratesIDCardReportFilterMapping_Users_CreatedBy]
GO
ALTER TABLE [dbo].[EmiratesIDCardReportFilterMapping]  WITH CHECK ADD  CONSTRAINT [FK_EmiratesIDCardReportFilterMapping_Users_ModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[EmiratesIDCardReportFilterMapping] CHECK CONSTRAINT [FK_EmiratesIDCardReportFilterMapping_Users_ModifiedBy]
GO
ALTER TABLE [dbo].[EmiratesIDCardReportFilterMapping] ADD  DEFAULT ((0)) FOR [IsActive]