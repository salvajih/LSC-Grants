USE [Easygrants]
GO
/****** Object:  Table [dbo].[LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS]    Script Date: 02/08/2008 09:52:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS](
	[id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NOT NULL,
	[affiliation_type_id] [int] NOT NULL,
	[role_id] [int] NULL,
	[name_prefix_id] [int] NULL,
	[name_first] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[name_last] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[name_middle] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name_suffix_id] [int] NULL,
	[email_address] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[title] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[relevant_experience] [varchar](300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status_id] [int] NULL,
	[appointing_organization] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[gender_id] [int] NULL,
	[ethnicity_id] [int] NULL,
	[address] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[city] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[state_province_id] [int] NULL,
	[zip_postal_code] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[phone] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[address_phone_type_id] [int] NULL,
	[board_member_type_id] [int] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

insert into [s_ID_GEN] values ('LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS', 1, 0, null)