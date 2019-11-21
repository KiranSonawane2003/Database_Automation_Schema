CREATE TABLE [dbo].[CompanyStaticValueMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StaticValueId] [bigint] NOT NULL,
	[CompanyId] [bigint] NOT NULL,
	[StaticValueCode] [nvarchar](100) NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_CompanyStaticValueMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyStaticValueMapping]  WITH CHECK ADD  CONSTRAINT [FK_CompanyStaticValueMapping_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO

ALTER TABLE [dbo].[CompanyStaticValueMapping] CHECK CONSTRAINT [FK_CompanyStaticValueMapping_Company]
GO
ALTER TABLE [dbo].[CompanyStaticValueMapping]  WITH CHECK ADD  CONSTRAINT [FK_CompanyStaticValueMapping_StaticValue] FOREIGN KEY([StaticValueId])
REFERENCES [dbo].[StaticValue] ([Id])
GO

ALTER TABLE [dbo].[CompanyStaticValueMapping] CHECK CONSTRAINT [FK_CompanyStaticValueMapping_StaticValue]
GO
ALTER TABLE [dbo].[CompanyStaticValueMapping]  WITH CHECK ADD  CONSTRAINT [FK_CompanyStaticValueMapping_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyStaticValueMapping] CHECK CONSTRAINT [FK_CompanyStaticValueMapping_Users]
GO
ALTER TABLE [dbo].[CompanyStaticValueMapping]  WITH CHECK ADD  CONSTRAINT [FK_CompanyStaticValueMapping_Users1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[CompanyStaticValueMapping] CHECK CONSTRAINT [FK_CompanyStaticValueMapping_Users1]