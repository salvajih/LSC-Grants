ALTER VIEW [dbo].[vEXTERNAL_REVIEW_APPLICATIONS_LIST_WITHOUT_COMMENTS]
AS
SELECT   distinct  wftar.wf_task_assignment_id AS RevWftaID, wftar.wf_task_id AS RevWfTaskID, 
					wftar.wf_task_status_id AS RevWfTaskStatusID, 
                    wftar.person_id AS ReviewerID, wftar.grantee_project_id AS GranteeProjectID, 
					wftaa.wf_task_assignment_id AS AppWftaID, 
                    pa.name_last + ', ' + pa.name_first + ISNULL(' ' + pa.name_middle, '') AS ApplicantName, 
					ApplicantNameWithSuffix =
					Case when pa.suffix_id is Null then  pa.name_last + ', ' + pa.name_first + ISNULL(' ' + pa.name_middle, '')
					else  pa.name_last + ', ' + pa.name_first + ISNULL(' ' + pa.name_middle, '') + ', ' + c_SUFFIX.suffix
					end,
					wftar.review_rating AS ReviewRating, wftar.review_cycle_stage_id, review_cycle_id, 
					dbo.a_WF_PROJECT_TASK.id AS WfProjectTaskID, 
					gprs.rank as AppRank, gprs.average_rating as AvgRating, 
					PrimaryContactRole = CASE gppc.is_Primary WHEN 1 THEN 'Primary' ELSE 'Secondary' END
FROM         dbo.WF_TASK_ASSIGNMENT AS wftar 
					INNER JOIN dbo.GRANTEE_PROJECT AS gp ON wftar.grantee_project_id = gp.grantee_project_id 
					INNER JOIN dbo.PERSON AS pa ON gp.primary_person_id = pa.person_id 
					INNER JOIN dbo.WF_TASK_ASSIGNMENT AS wftaa ON gp.grantee_project_id = wftaa.grantee_project_id 
						AND gp.primary_person_id = wftaa.person_id 
					LEFT OUTER JOIN c_SUFFIX on pa.suffix_id = c_SUFFIX.suffix_id
					INNER JOIN dbo.GRANTEE_PROJECT_PRIMARY_CONTACT as gppc on gp.grantee_project_id = gppc.grantee_project_id
						AND gp.primary_person_id = gppc.person_id 
					INNER JOIN dbo.a_WF_PROJECT_TASK ON wftaa.wf_task_id = dbo.a_WF_PROJECT_TASK.wf_task_id 
						AND gp.wf_project_id = dbo.a_WF_PROJECT_TASK.wf_project_id 
					INNER JOIN dbo.GRANTEE_PROJECT_REVIEW_STAGE AS gprs ON gp.grantee_project_id = gprs.grantee_project_id 
							and wftar.review_cycle_stage_id = gprs.review_cycle_stage_id  and app_wf_task_assignment_id = wftaa.wf_task_assignment_id
					INNER JOIN REVIEW_CYCLE_STAGE AS rcs on wftar.review_cycle_stage_id = rcs.review_cycle_stage_id
					LEFT OUTER JOIN dbo.WF_TASK_ASSIGNMENT_REVIEW wftarev ON wftar.wf_task_assignment_id = wftarev.wf_task_assignment_id
WHERE     (wftaa.wf_task_role_id = 1) AND (wftar.wf_task_role_id = 7)

