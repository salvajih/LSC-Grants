SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LSC_c_SUBGRANT_CONTRACT_TYPE](
	[id] [int] NOT NULL,
	[abbr] [nvarchar](20) NULL,
	[Description] [nvarchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LCS_c_SUBGRANT_CONTRACT_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]



insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_c_SUBGRANT_CONTRACT_TYPE',
		1,
		0,
		1)


