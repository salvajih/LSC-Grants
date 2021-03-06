
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_RFP_CASE_HANDLING](
	[lsc_casehandling_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[casehandling_1] [bit] NULL,
	[casehandling_2] [bit] NULL,
	[casehandling_3] [bit] NULL,
	[casehandling_4] [bit] NULL,
	[casehandling_5] [bit] NULL,
	[casehandling_6] [bit] NULL,
 CONSTRAINT [PK_LSC_RFP_CASE_HANDLING] PRIMARY KEY CLUSTERED 
(
	[lsc_casehandling_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_RFP_CASE_HANDLING'
           ,1
           ,0)