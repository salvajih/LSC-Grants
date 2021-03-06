
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_RFP_LEGALWORK_MNGT](
	[lsc_rfp_lwm_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[method1] [int] NULL,
	[method2] [int] NULL,
	[method3] [int] NULL,
	[method4] [int] NULL,
	[method5] [int] NULL,
	[method6] [int] NULL,
	[method7] [int] NULL,
	[method8] [int] NULL,
	[method9] [int] NULL,
	[method1_timeperiod] [varchar](max) NULL,
	[method2_timeperiod] [varchar](max) NULL,
	[method3_timeperiod] [varchar](max) NULL,
	[method4_timeperiod] [varchar](max) NULL,
	[method5_timeperiod] [varchar](max) NULL,
	[method6_timeperiod] [varchar](max) NULL,
	[method7_timeperiod] [varchar](max) NULL,
	[method8_timeperiod] [varchar](max) NULL,
	[method9_timeperiod] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_RFP_LEGALWORK_MNGT] PRIMARY KEY CLUSTERED
(
	[lsc_rfp_lwm_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_RFP_LEGALWORK_MNGT'
           ,1
           ,0)