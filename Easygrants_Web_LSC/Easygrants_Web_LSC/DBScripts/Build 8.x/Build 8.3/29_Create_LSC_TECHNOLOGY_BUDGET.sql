SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_TECHNOLOGY_BUDGET](
	[lsc_technology_budget_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[program_IT_staffing_costs] [int] NULL,
	[external_IT_staffing_costs] [int] NULL,
	[space_cost] [int] NULL,
	[travel] [int] NULL,
	[equipment_purchase] [int] NULL,
	[equipment_rental] [int] NULL,
	[telecom_bandwidth_charges] [int] NULL,
	[communications_other] [int] NULL,
	[software] [int] NULL,
	[supplies] [int] NULL,
	[contracts] [int] NULL,
	[training_IT_staff] [int] NULL,
	[training_IT_otherstaff] [int] NULL,
	[other] [int] NULL,
 CONSTRAINT [PK_LSC_TECHNOLOGY_BUDGET] PRIMARY KEY CLUSTERED 
(
	[lsc_technology_budget_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_TECHNOLOGY_BUDGET'
           ,1
           ,0)