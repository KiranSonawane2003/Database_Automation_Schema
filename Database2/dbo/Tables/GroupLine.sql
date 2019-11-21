CREATE TABLE [dbo].[GroupLine](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NOT NULL,
	[DefaultFSPCompanyId] [bigint] NULL,
	[IsJuristicRepresentative] [bit] NOT NULL,
	[IsOverrideAdviceLicence] [bit] NOT NULL,
	[ComplaintsOfficerId] [bigint] NULL,
	[IsProfessionalIndemnity] [bit] NOT NULL,
	[IsFidelityGuarantee] [bit] NOT NULL,
	[VATNumber] [nvarchar](50) NULL,
	[CompanyRegNumber] [nvarchar](50) NULL,
	[RegisteredName] [nvarchar](100) NULL,
	[AccountManagerId] [int] NULL,
	[MarketerId] [int] NULL,
	[ApprovalUserProductsId] [int] NULL,
	[ApprovalUserOtherId] [int] NULL,
	[FinancialManagerId] [int] NULL,
	[IsEditableAccessoryPayover] [bit] NOT NULL,
	[FloorplanProviderId] [bigint] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[CountryId] [bigint] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedBy] [int] NULL,
	[IsVehicle] [bit] NULL,
	[IsFleet] [bit] NULL,
	[IsAfterMarket] [bit] NULL,
	[IsUnsecured] [bit] NULL,
	[TransactionTypeID] [bigint] NULL,
 CONSTRAINT [GroupLine_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GroupLine]  WITH CHECK ADD  CONSTRAINT [FK_GroupLine_TransactionTypeID] FOREIGN KEY([TransactionTypeID])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[GroupLine] CHECK CONSTRAINT [FK_GroupLine_TransactionTypeID]
GO
ALTER TABLE [dbo].[GroupLine]  WITH NOCHECK ADD  CONSTRAINT [GroupLine_FK_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO

ALTER TABLE [dbo].[GroupLine] CHECK CONSTRAINT [GroupLine_FK_Country]
GO
ALTER TABLE [dbo].[GroupLine]  WITH NOCHECK ADD  CONSTRAINT [GroupLine_FK_FSPCompany] FOREIGN KEY([DefaultFSPCompanyId])
REFERENCES [dbo].[FSPCompany] ([Id])
GO

ALTER TABLE [dbo].[GroupLine] CHECK CONSTRAINT [GroupLine_FK_FSPCompany]
GO
ALTER TABLE [dbo].[GroupLine]  WITH NOCHECK ADD  CONSTRAINT [GroupLine_FK_FSPPerson] FOREIGN KEY([ComplaintsOfficerId])
REFERENCES [dbo].[FSPPerson] ([Id])
GO

ALTER TABLE [dbo].[GroupLine] CHECK CONSTRAINT [GroupLine_FK_FSPPerson]
GO
ALTER TABLE [dbo].[GroupLine]  WITH NOCHECK ADD  CONSTRAINT [GroupLine_FK_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO

ALTER TABLE [dbo].[GroupLine] CHECK CONSTRAINT [GroupLine_FK_Group]
GO
ALTER TABLE [dbo].[GroupLine]  WITH NOCHECK ADD  CONSTRAINT [GroupLine_FK_UsersAccountManager] FOREIGN KEY([AccountManagerId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupLine] CHECK CONSTRAINT [GroupLine_FK_UsersAccountManager]
GO
ALTER TABLE [dbo].[GroupLine]  WITH NOCHECK ADD  CONSTRAINT [GroupLine_FK_UsersApprovalUserOther] FOREIGN KEY([ApprovalUserOtherId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupLine] CHECK CONSTRAINT [GroupLine_FK_UsersApprovalUserOther]
GO
ALTER TABLE [dbo].[GroupLine]  WITH NOCHECK ADD  CONSTRAINT [GroupLine_FK_UsersApprovalUserProduct] FOREIGN KEY([ApprovalUserProductsId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupLine] CHECK CONSTRAINT [GroupLine_FK_UsersApprovalUserProduct]
GO
ALTER TABLE [dbo].[GroupLine]  WITH NOCHECK ADD  CONSTRAINT [GroupLine_FK_UsersCreatedBy] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupLine] CHECK CONSTRAINT [GroupLine_FK_UsersCreatedBy]
GO
ALTER TABLE [dbo].[GroupLine]  WITH NOCHECK ADD  CONSTRAINT [GroupLine_FK_UsersFinancialManager] FOREIGN KEY([FinancialManagerId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupLine] CHECK CONSTRAINT [GroupLine_FK_UsersFinancialManager]
GO
ALTER TABLE [dbo].[GroupLine]  WITH NOCHECK ADD  CONSTRAINT [GroupLine_FK_UsersMarketer] FOREIGN KEY([MarketerId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupLine] CHECK CONSTRAINT [GroupLine_FK_UsersMarketer]
GO
ALTER TABLE [dbo].[GroupLine]  WITH NOCHECK ADD  CONSTRAINT [GroupLine_FK_UsersModifiedBy] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GroupLine] CHECK CONSTRAINT [GroupLine_FK_UsersModifiedBy]
GO
ALTER TABLE [dbo].[GroupLine] ADD  CONSTRAINT [GroupLine_DF_JuristicRepresentative]  DEFAULT ((0)) FOR [IsJuristicRepresentative]
GO
ALTER TABLE [dbo].[GroupLine] ADD  CONSTRAINT [GroupLine_DF_OverrideAdviceLicence]  DEFAULT ((0)) FOR [IsOverrideAdviceLicence]
GO
ALTER TABLE [dbo].[GroupLine] ADD  CONSTRAINT [GroupLine_DF_ProfessionalIndemnity]  DEFAULT ((0)) FOR [IsProfessionalIndemnity]
GO
ALTER TABLE [dbo].[GroupLine] ADD  CONSTRAINT [GroupLine_DF_FidelityGuarantee]  DEFAULT ((0)) FOR [IsFidelityGuarantee]
GO
ALTER TABLE [dbo].[GroupLine] ADD  CONSTRAINT [GroupLine_DF_EditableAccessoryPayover]  DEFAULT ((0)) FOR [IsEditableAccessoryPayover]
GO
ALTER TABLE [dbo].[GroupLine] ADD  CONSTRAINT [GroupLine_DF_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[GroupLine] ADD  CONSTRAINT [GroupLine_DF_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table Group' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupLine', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table FSPCompany' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupLine', @level2type=N'COLUMN',@level2name=N'DefaultFSPCompanyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign Key form table FSPPerson' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupLine', @level2type=N'COLUMN',@level2name=N'ComplaintsOfficerId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table is use to store info from group line pag under Admin >> Group admin >> Edit Group' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GroupLine'