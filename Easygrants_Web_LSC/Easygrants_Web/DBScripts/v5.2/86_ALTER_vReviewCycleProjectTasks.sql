
GO
/****** Object:  View [dbo].[vReviewCycleProjectTasks]    Script Date: 12/23/2008 09:38:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vReviewCycleProjectTasks]
AS
SELECT     
wpt.id AS 'WfProjectTaskID', c.id AS 'CompetitionID', wpt.wf_project_id AS 'WfProjectID', wp.description as 'ProjectDesc', wpt.description as 'ProjectTaskDesc',
wpt.wf_task_id AS 'WfTaskID', wt.wf_task_type_id as 'TaskTypeID', wp.time_period_id AS 'TimePeriodID', rc.id AS 'ReviewCycleID'

FROM   dbo.a_WF_PROJECT_TASK AS wpt 
INNER JOIN dbo.a_WF_TASK AS wt ON wpt.wf_task_id = wt.id
INNER JOIN dbo.a_WF_PROJECT AS wp ON wpt.wf_project_id = wp.id 
INNER JOIN dbo.a_COMPETITION AS c ON wp.competition_id = c.id 
INNER JOIN dbo.REVIEW_CYCLE_COMPETITION AS rcc ON c.id = rcc.competition_id 
INNER JOIN dbo.a_REVIEW_CYCLE AS rc ON rcc.review_cycle_id = rc.id 
INNER JOIN dbo.REVIEW_CYCLE_TIMEPERIOD as RCT on RCT.review_cycle_id =rc.id  and  wp.time_period_id = rct.time_period_id


/*
This View is before creating a new table called REVIEW_CYCLE_TIMEPERIOD.
SELECT     
wpt.id AS 'WfProjectTaskID', c.id AS 'CompetitionID', wpt.wf_project_id AS 'WfProjectID', wp.description as 'ProjectDesc', wpt.description as 'ProjectTaskDesc',
wpt.wf_task_id AS 'WfTaskID', wt.wf_task_type_id as 'TaskTypeID', wp.time_period_id AS 'TimePeriodID', rc.id AS 'ReviewCycleID'

FROM	dbo.a_WF_PROJECT_TASK AS wpt 
INNER JOIN dbo.a_WF_TASK AS wt ON wpt.wf_task_id = wt.id 
INNER JOIN dbo.a_WF_PROJECT AS wp ON wpt.wf_project_id = wp.id 
INNER JOIN dbo.a_COMPETITION AS c ON wp.competition_id = c.id 
INNER JOIN dbo.REVIEW_CYCLE_COMPETITION AS rcc ON c.id = rcc.competition_id 
INNER JOIN dbo.a_REVIEW_CYCLE AS rc ON rcc.review_cycle_id = rc.id where wp.time_period_id = rc.time_period_id
*/