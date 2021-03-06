CREATE TABLE [dbo].[PERSON_REVIEWER_CONFIDENTIALITY](
	[person_reviewer_confidentiality_id] [int] NOT NULL,
	[person_id] [int] NOT NULL,
	[review_cycle_stage_id] [int] NOT NULL,
	[review_cycle_id] [int] NOT NULL,
	[is_confidentiality_accepted] [bit] NULL,
 CONSTRAINT [PK_PERSON_REVIEWER_CONFIDENTIALITY] PRIMARY KEY CLUSTERED 
(
	[person_reviewer_confidentiality_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description]) 
	VALUES('PERSON_REVIEWER_CONFIDENTIALITY', 1, 0, NULL);