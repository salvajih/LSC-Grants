/****** Object:  Table [dbo].[LSC_TIG_LOI]    Script Date: 01/11/2010 13:59:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_TIG_LOI](
	[lsc_tig_loi_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[requested_amount] [int] NULL,
	[project_description] [varchar](max) NULL,
	[benefits] [varchar](max) NULL,
	[costs] [varchar](max) NULL,
	[partners] [varchar](max) NULL,
	[innovation] [varchar](max) NULL,
	[prev_web] [varchar](max) NULL,
	[non_web] [varchar](max) NULL,
	[add_info] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_TIG_LOI] PRIMARY KEY CLUSTERED 
(
	[lsc_tig_loi_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_TIG_LOI'
           ,1
           ,0)