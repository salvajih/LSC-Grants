
CREATE TABLE [dbo].[REVIEW_CYCLE_TIMEPERIOD](
	[review_cycle_timeperiod_id] [int] NOT NULL,
	[review_cycle_id] [int] NULL,
	[time_period_id] [int] NULL,
 CONSTRAINT [PK_REVIEW_CYCLE_TIMEPERIOD] PRIMARY KEY CLUSTERED 
(
	[review_cycle_timeperiod_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]



INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description], [lookup_table_type_id]) 
	VALUES('REVIEW_CYCLE_TIMEPERIOD', 1, 0, NULL, 2);