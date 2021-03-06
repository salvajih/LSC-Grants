CREATE VIEW [dbo].[vEXTERNAL_REVIEW_ALL_APPLICATIONS]
AS

SELECT DISTINCT 
               wftar.wf_task_id AS RevWfTaskID, wftar.grantee_project_id AS GranteeProjectID, wftaa.wf_task_assignment_id AS AppWftaID, 
               pa.name_last + ', ' + pa.name_first + ISNULL(' ' + pa.name_middle, '') AS ApplicantName, wftar.review_cycle_stage_id As ReviewCycleStageID
FROM  WF_TASK_ASSIGNMENT AS wftar INNER JOIN
               GRANTEE_PROJECT AS gp ON wftar.grantee_project_id = gp.grantee_project_id INNER JOIN
               PERSON AS pa ON gp.primary_person_id = pa.person_id INNER JOIN
               WF_TASK_ASSIGNMENT AS wftaa ON gp.grantee_project_id = wftaa.grantee_project_id AND gp.primary_person_id = wftaa.person_id
WHERE (wftaa.wf_task_role_id = 1) AND (wftar.wf_task_role_id = 7)