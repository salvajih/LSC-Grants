
CREATE TABLE [dbo].[c_PAYEE_ORGANIZATION_LOCATION](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](300) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_c_PAYEE_ORGANIZATION_LOCATION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


INSERT INTO [c_PAYEE_ORGANIZATION_LOCATION]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(1, 'International', 'International', 1, NULL);

INSERT INTO [c_PAYEE_ORGANIZATION_LOCATION]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(2, 'U.S', 'U.S', 2, NULL);



INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description]) 
	VALUES('c_PAYEE_ORGANIZATION_LOCATION', 3, 1, NULL);