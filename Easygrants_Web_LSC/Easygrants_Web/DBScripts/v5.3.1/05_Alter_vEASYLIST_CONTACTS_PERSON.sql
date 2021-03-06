/*
Developer		: 	Sumanth Kollipara
Date			:	03/30/2009
Modification		:	Added top 1 for sub queries to get only one row result
*/

ALTER VIEW [dbo].[vEASYLIST_CONTACTS_PERSON]
AS
SELECT DISTINCT c.person_id, c.name_last, c.name_first,
                          (SELECT  TOP 1   (SELECT     organization_name
                                                    FROM         organization a
                                                    WHERE     a.organization_id = b.organization_id) AS organization_name
                            FROM          person_organization_affiliation b
                            WHERE      is_primary = 1 AND b.person_id = c.person_id) AS organization_name,
                          (SELECT  TOP 1   (SELECT     organization_name
                                                    FROM         organization a
                                                    WHERE     a.organization_id = b.organization_id) AS organization_name
                            FROM          person_organization_affiliation b
                            WHERE      is_primary = 1 AND b.person_id = c.person_id) AS common_organization_name, dbo.WF_TASK_ASSIGNMENT.wf_task_status_id
FROM         dbo.PERSON c LEFT OUTER JOIN
                      dbo.WF_TASK_ASSIGNMENT ON c.person_id = dbo.WF_TASK_ASSIGNMENT.person_id

GO
