
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_RFP_RETAIN_PVT_ATTY_VOL](
	[lsc_retain_pvt_atty_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[retain_method_1] [int] NULL,
	[retain_method_2] [int] NULL,
	[retain_method_3] [int] NULL,
	[retain_method_4] [int] NULL,
	[retain_method_5] [int] NULL,
	[retain_method_6] [int] NULL,
	[retain_method_7] [int] NULL,
	[retain_method_8] [int] NULL,
	[retain_method8_name] [varchar](max) NULL,
 CONSTRAINT [PK_LCS_RFP_RETAIN_PVT_ATTY_VOL] PRIMARY KEY CLUSTERED 
(
	[lsc_retain_pvt_atty_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_RFP_RETAIN_PVT_ATTY_VOL'
           ,1
           ,0)