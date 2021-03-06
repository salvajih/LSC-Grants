
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_RFP_ATTY_INVOLVEMENT](
	[lsc_atty_involvement_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[pvt_atty_involvement_1] [int] NULL,
	[pvt_atty_involvement_2] [int] NULL,
	[pvt_atty_involvement_3] [int] NULL,
	[pvt_atty_involvement_4] [int] NULL,
	[pvt_atty_involvement_5] [int] NULL,
	[pvt_atty_involvement_6] [int] NULL,
	[pvt_atty_involvement_7] [int] NULL,
 CONSTRAINT [PK_LSC_PVT_ATTY_INVOLVEMENT] PRIMARY KEY CLUSTERED 
(
	[lsc_atty_involvement_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_RFP_ATTY_INVOLVEMENT'
           ,1
           ,0)