USE [Easygrants]
GO
/****** Object:  Table [dbo].[LSC_a_BUDGET_CATEGORY_TYPE]    Script Date: 01/17/2008 13:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_a_BUDGET_CATEGORY_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_a_BUDGET_CATEGORY_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

GO

INSERT LSC_a_BUDGET_CATEGORY_TYPE (id, abbr, description, sort_order)
	VALUES(1, 'Projected Expenses', 'Projected Expenses', 1)

GO

INSERT LSC_a_BUDGET_CATEGORY_TYPE (id, abbr, description, sort_order)
	VALUES(2, 'Projected Revenues', 'Projected Revenues', 2)

GO

INSERT LSC_a_BUDGET_CATEGORY_TYPE (id, abbr, description, sort_order)
	VALUES(3, 'Current Expenses', 'Current Expenses', 3)

GO

INSERT LSC_a_BUDGET_CATEGORY_TYPE (id, abbr, description, sort_order)
	VALUES(4, 'Current Revenues', 'Current Revenues', 4)

GO

INSERT s_ID_GEN (table_name, next_id, is_code_table)
	VALUES ('LSC_a_BUDGET_CATEGORY_TYPE', 5, 'True')

