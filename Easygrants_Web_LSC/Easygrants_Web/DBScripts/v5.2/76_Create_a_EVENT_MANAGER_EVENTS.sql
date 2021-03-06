CREATE TABLE [dbo].[a_EVENT_MANAGER_EVENTS](
	[id] [int] NOT NULL,
	[event_name] [varchar](200) NOT NULL,
	[event_type_id] [int] NOT NULL,
	[short_description] [varchar](1000) NOT NULL,
	[long_description] [varchar](1000) NOT NULL,
	[is_active] [bit] NOT NULL CONSTRAINT [DF_a_EVENT_MANAGER_EVENTS_is_active]  DEFAULT ((1)),
	[process_name] [varchar](200) NOT NULL,
	[process_type_id] [int] NOT NULL,
	[sort_order] [int] NOT NULL,
 CONSTRAINT [PK_a_EVENT_MANAGER_EVENTS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [a_EVENT_MANAGER_EVENTS]([id], [event_name], [event_type_id], [short_description], [long_description], [is_active], [process_name], [process_type_id], [sort_order]) 
	VALUES(1, 'Pre Assignment Event', 1, 'Pre Assignment Event short', 'Pre Assignment Event long', 1, 'spEventTestGP', 1, 1);


INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description], [lookup_table_type_id]) 
	VALUES('a_EVENT_MANAGER_EVENTS', 2, 0, NULL, 1);