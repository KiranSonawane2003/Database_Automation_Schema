CREATE TABLE [dbo].[CompanyFinanceApplicationFieldValidations](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyId] [bigint] NOT NULL,
	[FinanceApplicationFieldId] [bigint] NOT NULL,
	[IsRequired] [bit] NULL,
	[MaxLength] [nvarchar](max) NULL,
	[ErrorMessage] [nvarchar](100) NULL,
	[RegularExpression] [nvarchar](100) NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_CompanyFinanceApplicationFieldMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyFinanceApplicationFieldValidations]  WITH CHECK ADD  CONSTRAINT [FK_CompanyFinanceApplicationFieldMapping_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[CompanyFinanceApplicationFieldValidations] CHECK CONSTRAINT [FK_CompanyFinanceApplicationFieldMapping_Company]
GO
ALTER TABLE [dbo].[CompanyFinanceApplicationFieldValidations]  WITH CHECK ADD  CONSTRAINT [FK_CompanyFinanceApplicationFieldMapping_FinanceApplicationFieldMaster] FOREIGN KEY([FinanceApplicationFieldId])
REFERENCES [dbo].[FinanceApplicationFieldMaster] ([Id])
GO

ALTER TABLE [dbo].[CompanyFinanceApplicationFieldValidations] CHECK CONSTRAINT [FK_CompanyFinanceApplicationFieldMapping_FinanceApplicationFieldMaster]
GO
ALTER TABLE [dbo].[CompanyFinanceApplicationFieldValidations]  WITH CHECK ADD  CONSTRAINT [FK_CompanyFinanceApplicationFieldValidations_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyFinanceApplicationFieldValidations] CHECK CONSTRAINT [FK_CompanyFinanceApplicationFieldValidations_Users]
GO
ALTER TABLE [dbo].[CompanyFinanceApplicationFieldValidations]  WITH CHECK ADD  CONSTRAINT [FK_CompanyFinanceApplicationFieldValidations_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyFinanceApplicationFieldValidations] CHECK CONSTRAINT [FK_CompanyFinanceApplicationFieldValidations_Users1]