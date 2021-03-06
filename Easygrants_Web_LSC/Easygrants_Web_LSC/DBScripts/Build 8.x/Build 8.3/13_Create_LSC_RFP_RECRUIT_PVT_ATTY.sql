
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_RFP_RECRUIT_PVT_ATTY](
	[lsc_recruit_pvt_atty_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[recruit_method_1] [int] NULL,
	[recruit_method_2] [int] NULL,
	[recruit_method_3] [int] NULL,
	[recruit_method_4] [int] NULL,
	[recruit_method_5] [int] NULL,
	[recruit_method_6] [int] NULL,
	[recruit_method_7] [int] NULL,
	[recruit_method_8] [int] NULL,
	[recruit_method_9] [int] NULL,
	[recruit_method_10] [int] NULL,
	[recruit_method_11] [int] NULL,
	[recruit_method_12] [int] NULL,
	[recruit_method_13] [int] NULL,
	[recruit_method_14] [int] NULL,
	[recruit_method_15] [int] NULL,
	[recruit_method_16] [int] NULL,
	[recruit_method16_name] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_RFP_RECRUIT_PVT_ATTY] PRIMARY KEY CLUSTERED 
(
	[lsc_recruit_pvt_atty_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF



INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_RFP_RECRUIT_PVT_ATTY'
           ,1
           ,0)