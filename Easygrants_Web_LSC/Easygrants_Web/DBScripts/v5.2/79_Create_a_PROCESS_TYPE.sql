CREATE TABLE [dbo].[a_PROCESS_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NOT NULL,
	[description] [varchar](300) NOT NULL,
 CONSTRAINT [PK_a_PROCESS_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [a_PROCESS_TYPE]([id], [abbr], [description]) 
	VALUES(1, 'Pre-Assignment', 'Pre-Assignment');

INSERT INTO [a_PROCESS_TYPE]([id], [abbr], [description]) 
	VALUES(2, 'Post-Assignment', 'Post-Assignment');

INSERT INTO [a_PROCESS_TYPE]([id], [abbr], [description]) 
	VALUES(3, 'Pre-Submission', 'Pre-Submission');

INSERT INTO [a_PROCESS_TYPE]([id], [abbr], [description]) 
	VALUES(4, 'Post-Submission', 'Post-Submission');

INSERT INTO [a_PROCESS_TYPE]([id], [abbr], [description]) 
	VALUES(5, 'Post-Submission Workflow', 'Post-Submission Workflow');



INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description], [lookup_table_type_id]) 
	VALUES('a_PROCESS_TYPE', 6, 0, NULL, 1);