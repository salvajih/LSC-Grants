
CREATE TABLE [dbo].[c_LOOKUP_TABLE_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](100) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_LOOKUP_TABLE_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


INSERT INTO [c_LOOKUP_TABLE_TYPE]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(1, NULL, 'No Lookup Type', 1, NULL);

INSERT INTO [c_LOOKUP_TABLE_TYPE]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(2, NULL, 'Standard', 2, NULL);

INSERT INTO [c_LOOKUP_TABLE_TYPE]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(3, NULL, 'Tiered', 3, NULL);


INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description], [lookup_table_type_id]) 
	VALUES('c_LOOKUP_TABLE_TYPE', 4, 0, NULL, NULL);



