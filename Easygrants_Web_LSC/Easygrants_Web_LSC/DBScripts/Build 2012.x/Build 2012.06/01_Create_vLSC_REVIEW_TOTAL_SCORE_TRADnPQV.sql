USE [Easygrants]
GO
/****** Object:  View [dbo].[vLSC_REVIEW_TOTAL_SCORE_TRADnPQV]    Script Date: 05/08/2012 16:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW [dbo].[vLSC_REVIEW_TOTAL_SCORE_TRADnPQV]
AS


SELECT wfta.wf_task_assignment_id,
    CASE WHEN wfta.wf_task_id = 5 THEN s1.total_score WHEN wfta.wf_task_id = 68 THEN s2.total_score END total_score
FROM wf_task_assignment wfta 
      left JOIN vREVIEW_TOTAL_SCORE s1 ON wfta.wf_task_assignment_id = s1.review_wfta_id
      left JOIN vLSC_PPQV_REVIEW_TOTAL_SCORE s2 ON wfta.wf_task_assignment_id = s2.wf_task_assignment_id
WHERE wfta.wf_task_id in (5, 68)
