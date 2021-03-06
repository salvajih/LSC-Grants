INSERT INTO [dbo].[LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
SELECT 13, review_cycle_stage_id, 16 
    FROM REVIEW_CYCLE_STAGE
     WHERE name = 'Review 2011 Competitive Applications - OPP Director'

INSERT INTO [dbo].[LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
SELECT 14, review_cycle_stage_id, 16 
    FROM REVIEW_CYCLE_STAGE
     WHERE name = 'Review 2011 Renewals of 2010 Grants - OPP Director'

INSERT INTO [dbo].[LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
SELECT 15, review_cycle_stage_id, 16 
    FROM REVIEW_CYCLE_STAGE
     WHERE name = 'Review 2011 Renewals of 2009 Grants - OPP Director'

INSERT INTO [dbo].[LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
SELECT 16, review_cycle_stage_id, 16 
    FROM REVIEW_CYCLE_STAGE
     WHERE name = 'Review 2011 Competitive Applications - Executive'


INSERT INTO [dbo].[LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
SELECT 17, review_cycle_stage_id, 16 
    FROM REVIEW_CYCLE_STAGE
     WHERE name = 'Review 2011 Renewals of 2010 Grants - Executive'


INSERT INTO [dbo].[LSC_REVIEW_CYCLE_STAGE]
           ([lsc_review_cycle_stage_id]
           ,[review_cycle_stage_id]
           ,[time_period_id])
SELECT 18, review_cycle_stage_id, 16 
    FROM REVIEW_CYCLE_STAGE
     WHERE name = 'Review 2011 Renewals of 2009 Grants -  Executive'



update s_id_gen
	set next_id = 19
	where table_name = 'LSC_REVIEW_CYCLE_STAGE'
