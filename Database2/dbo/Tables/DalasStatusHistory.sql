CREATE TABLE [dbo].[DalasStatusHistory](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[LeadNumber] [bigint] NULL,
	[EzFlowStatusTo] [nvarchar](max) NULL,
	[DalasStatusTo] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DalasStatusHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]