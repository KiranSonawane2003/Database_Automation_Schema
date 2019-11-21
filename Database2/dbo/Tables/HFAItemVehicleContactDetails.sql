CREATE TABLE [dbo].[HFAItemVehicleContactDetails](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[HFAId] [bigint] NULL,
	[Title] [bigint] NULL,
	[LastName] [nvarchar](100) NULL,
	[FirstName] [nvarchar](100) NULL,
	[MobileNumber] [nvarchar](100) NULL,
	[CountryId] [bigint] NULL,
	[RelationshipId] [bigint] NULL,
	[IsRegularDriver] [bit] NULL,
	[GenderId] [bigint] NULL,
	[Initials] [nvarchar](20) NULL,
	[HomePhoneCode] [nvarchar](20) NULL,
	[HomePhoneNumber] [nvarchar](50) NULL,
	[WorkPhoneCode] [nvarchar](20) NULL,
	[WorkPhoneNumber] [nvarchar](50) NULL,
	[IsSecondInsured] [bit] NULL,
	[EmailAddress] [nvarchar](100) NULL,
	[IDNumber] [nvarchar](200) NULL,
 CONSTRAINT [PK_HFAItemVehicleContactDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HFAItemVehicleContactDetails]  WITH CHECK ADD  CONSTRAINT [FK_HFAItemVehicleContactDetails_HFAItemVehicleDetails] FOREIGN KEY([HFAId])
REFERENCES [dbo].[HFAItemVehicleDetails] ([Id])
GO

ALTER TABLE [dbo].[HFAItemVehicleContactDetails] CHECK CONSTRAINT [FK_HFAItemVehicleContactDetails_HFAItemVehicleDetails]
GO
ALTER TABLE [dbo].[HFAItemVehicleContactDetails] ADD  DEFAULT ((0)) FOR [IsRegularDriver]
GO
ALTER TABLE [dbo].[HFAItemVehicleContactDetails] ADD  DEFAULT ((0)) FOR [IsSecondInsured]