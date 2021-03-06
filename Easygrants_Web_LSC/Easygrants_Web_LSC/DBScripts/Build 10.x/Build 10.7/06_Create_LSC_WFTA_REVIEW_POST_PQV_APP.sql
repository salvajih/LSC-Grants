
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_WFTA_REVIEW_POST_PQV_APP](
	[lsc_wfta_review_post_pqv_app_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[pa1_response] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[pa2_response] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[pa3_response] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[pa4_response] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[significant_accomplishments] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[systems_procedures] [varchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_LSC_WFTA_REVIEW_POST_PQV_APP] PRIMARY KEY CLUSTERED 
(
	[lsc_wfta_review_post_pqv_app_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO


INSERT s_ID_GEN
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	VALUES('LSC_WFTA_REVIEW_POST_PQV_APP',
		1,
		0,
		1)

GO

SET ANSI_PADDING OFF

