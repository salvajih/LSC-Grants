
CREATE TABLE [dbo].[s_SHAREPOINT_INTEGRATION](
	[id] [int] NOT NULL,
	[username] [varchar](100) NULL,
	[password] [varchar](30) NULL,
	[sharepoint_url] [varchar](150) NULL,
	[site_name] [varchar](100) NULL,
	[active] [bit] NULL CONSTRAINT [DF_s_SHAREPOINTINTEGRATION_active]  DEFAULT ((0)),
	[delete_document_permanently] [bit] NULL CONSTRAINT [DF_s_SHAREPOINTINTEGRATION_delete_document_permanently]  DEFAULT ((0)),
	[sys_admin_email] [varchar](150) NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_s_SHAREPOINTINTEGRATION] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF



INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description]) 
	VALUES('s_SHAREPOINT_INTEGRATION', 1, 0, NULL);


