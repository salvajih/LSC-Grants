--Add logic to return legacy_grant_id only for TIG grants
--Use LSC_GRANTEE_PROJECT_TIG.purpose to show purpose for TIG grants
----(column name of grant_title retained so as not to require change to data definition file)
--Mantis 2229

ALTER VIEW [dbo].[vLSC_GRANTS_EASYLIST]

AS

SELECT gp.grantee_project_id,
	CASE WHEN c.program_id = 2 THEN gp.legacy_grant_id ELSE NULL END legacy_grant_id,
	gp.grant_status_id,
	gs.abbr grant_status,
	o.organization_id,
	o.legacy_organization_id recipient_id,
	o.organization_name,
	p.name_last primary_contact_last,
	p.name_first primary_contact_first,
	p.name_last + ', ' + p.name_first primary_contact_last_first,
	wfp.time_period_id,
	tp.sort_order grant_year,
	c.id competition_id,
	c.abbr service_area,
	pgm.id program_id,
	pgm.description funding_source,
	gpt.purpose grant_title,
	sp.abbr StateAbbr,
	sp.id StateID,
	sp.description [Description]
	FROM GRANTEE_PROJECT gp
		JOIN c_GRANT_STATUS gs ON gp.grant_status_id = gs.id
		JOIN ORGANIZATION o ON gp.primary_organization_id = o.organization_id
		LEFT JOIN PERSON p ON gp.primary_person_id = p.person_id
		JOIN a_WF_PROJECT wfp ON gp.wf_project_id = wfp.id
		JOIN c_TIME_PERIOD tp ON wfp.time_period_id = tp.id
		JOIN a_COMPETITION c ON wfp.competition_id = c.id
		JOIN a_PROGRAM pgm ON c.program_id = pgm.id
		LEFT JOIN ADDRESS a ON o.organization_id=a.entity_id
								AND a.entity_type_id = 2
								AND a.is_primary = 1
		LEFT JOIN c_state_prov sp ON a.state_province_id =  sp.ID
		LEFT JOIN LSC_GRANTEE_PROJECT_TIG gpt ON gp.grantee_project_id = gpt.grantee_project_id
