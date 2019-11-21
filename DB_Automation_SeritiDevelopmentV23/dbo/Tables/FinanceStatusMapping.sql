CREATE TABLE [dbo].[FinanceStatusMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyID] [bigint] NOT NULL,
	[Status] [nvarchar](200) NULL,
	[FinanceStatusID] [bigint] NOT NULL,
	[StatusNotes] [nvarchar](500) NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[chkDalasStatus] [bit] NULL,
 CONSTRAINT [PK_FinanceStatusMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FinanceStatusMapping]  WITH CHECK ADD  CONSTRAINT [FinanceStatusMapping_FK_CompanyID] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[FinanceStatusMapping] CHECK CONSTRAINT [FinanceStatusMapping_FK_CompanyID]
GO
ALTER TABLE [dbo].[FinanceStatusMapping]  WITH CHECK ADD  CONSTRAINT [FinanceStatusMapping_FK_StaticValueFinanceStatus] FOREIGN KEY([FinanceStatusID])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[FinanceStatusMapping] CHECK CONSTRAINT [FinanceStatusMapping_FK_StaticValueFinanceStatus]
GO
ALTER TABLE [dbo].[FinanceStatusMapping]  WITH CHECK ADD  CONSTRAINT [FK_FinanceStatusMapping_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[FinanceStatusMapping] CHECK CONSTRAINT [FK_FinanceStatusMapping_Users]
GO
ALTER TABLE [dbo].[FinanceStatusMapping]  WITH CHECK ADD  CONSTRAINT [FK_FinanceStatusMapping_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[FinanceStatusMapping] CHECK CONSTRAINT [FK_FinanceStatusMapping_Users1]
GO
ALTER TABLE [dbo].[FinanceStatusMapping] ADD  CONSTRAINT [DF__FinanceSt__IsAct__526B4FBF]  DEFAULT ((1)) FOR [IsActive]