CREATE TABLE [dbo].[LSC_c_WF_TASK_ASSIGNMENT_AFFILIATION_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_WF_TASK_ASSIGNMENT_AFFILIATION_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [LSC_c_WF_TASK_ASSIGNMENT_AFFILIATION_TYPE]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(1, 'OTHER', 'Other Contacts', NULL, NULL);

INSERT INTO [LSC_c_WF_TASK_ASSIGNMENT_AFFILIATION_TYPE]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(2, 'KEYSTAFF', 'Board Member', NULL, NULL);

INSERT INTO [LSC_c_WF_TASK_ASSIGNMENT_AFFILIATION_TYPE]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(3, 'BOARDMEM', 'Board Member', NULL, NULL);

insert into [s_ID_GEN] values ('LSC_c_WF_TASK_ASSIGNMENT_AFFILIATION_TYPE', 4, 1, null)
