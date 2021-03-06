/*
   Wednesday, March 05, 20085:14:07 PM
   User: sa
   Server: LSC-EGDEV
   Database: Easygrants_Migration
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_LSC_SOFTWARE_QUESTION
	(
	lsc_software_question_id int NOT NULL,
	grantee_project_id int NULL,
	wf_task_assignment_id int NULL,
	case_management_single_db bit NULL,
	dedicated_timekeeping_sw bit NULL,
	timekeeping_sw_name varchar(50) NULL,
	dedicated_server_count int NULL,
	remote_access_sw bit NULL,
	vpn bit NULL,
	backup_protocol_network varchar(250) NULL,
	backup_protocol_pc varchar(250) NULL,
	backup_storage_location varchar(250) NULL,
	backup_last_restore varchar(250) NULL,
	backup_access varchar(250) NULL,
	web_software_product_id int NULL,
	web_software_product_other varchar(100) NULL,
	web_db_software_product_id int NULL,
	web_db_software_product_other varchar(100) NULL,
	swws_url varchar(100) NULL,
	swws_coord_name_first varchar(100) NULL,
	swws_coord_name_last varchar(100) NULL,
	swws_coord_phone varchar(50) NULL,
	swws_coord_email varchar(100) NULL,
	hotdocs_use bit NULL,
	hotdocs_use_description varchar(200) NULL,
	swws_financial_contribution bit NULL,
	swws_financial_contribution_amount float(53) NULL,
	swws_content_contribution bit NULL,
	swws_content_description varchar(200) NULL,
	swws_program_priorities varchar(200) NULL,
	swws_content_update_protocols varchar(200) NULL,
	swws_content_languages varchar(200) NULL,
	swws_stakeholder_mtgs bit NULL,
	swws_outreach bit NULL,
	swws_outreach_description varchar(200) NULL,
	swws_staff_familiar varchar(200) NULL,
	swws_usage_monitoring varchar(200) NULL,
	swws_usage_info_evaluation varchar(200) NULL,
	swws_accessibility varchar(200) NULL,
	swws_delivery_role varchar(200) NULL,
	program_web_site bit NULL,
	pws_url varchar(100) NULL,
	pws_lsc_funded bit NULL,
	program_tech_contact_name_first varchar(100) NULL,
	program_tech_contact_name_last varchar(100) NULL,
	program_tech_contact_phone varchar(50) NULL,
	program_tech_contact_email varchar(100) NULL,
	sw_tech_contact_name_first varchar(100) NULL,
	sw_tech_contact_name_last varchar(100) NULL,
	sw_tech_contact_phone varchar(50) NULL,
	sw_tech_contact_email varchar(100) NULL,
	program_legalmeetings_host bit NULL,
	program_legalmeetings_usage varchar(250) NULL,
	applicant_internet_usage varchar(250) NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.LSC_SOFTWARE_QUESTION)
	 EXEC('INSERT INTO dbo.Tmp_LSC_SOFTWARE_QUESTION (lsc_software_question_id, grantee_project_id, case_management_single_db, dedicated_timekeeping_sw, timekeeping_sw_name, dedicated_server_count, remote_access_sw, vpn, backup_protocol_network, backup_protocol_pc, backup_storage_location, backup_last_restore, backup_access, web_software_product_id, web_software_product_other, web_db_software_product_id, web_db_software_product_other, swws_url, swws_coord_name_first, swws_coord_name_last, swws_coord_phone, swws_coord_email, hotdocs_use, hotdocs_use_description, swws_financial_contribution, swws_financial_contribution_amount, swws_content_contribution, swws_content_description, swws_program_priorities, swws_content_update_protocols, swws_content_languages, swws_stakeholder_mtgs, swws_outreach, swws_outreach_description, swws_staff_familiar, swws_usage_monitoring, swws_usage_info_evaluation, swws_accessibility, swws_delivery_role, program_web_site, pws_url, pws_lsc_funded, program_tech_contact_name_first, program_tech_contact_name_last, program_tech_contact_phone, program_tech_contact_email, sw_tech_contact_name_first, sw_tech_contact_name_last, sw_tech_contact_phone, sw_tech_contact_email, program_legalmeetings_host, program_legalmeetings_usage, applicant_internet_usage)
		SELECT lsc_software_question_id, grantee_project_id, case_management_single_db, dedicated_timekeeping_sw, timekeeping_sw_name, dedicated_server_count, remote_access_sw, vpn, backup_protocol_network, backup_protocol_pc, backup_storage_location, backup_last_restore, backup_access, web_software_product_id, web_software_product_other, web_db_software_product_id, web_db_software_product_other, swws_url, swws_coord_name_first, swws_coord_name_last, swws_coord_phone, swws_coord_email, hotdocs_use, hotdocs_use_description, swws_financial_contribution, swws_financial_contribution_amount, swws_content_contribution, swws_content_description, swws_program_priorities, swws_content_update_protocols, swws_content_languages, swws_stakeholder_mtgs, swws_outreach, swws_outreach_description, swws_staff_familiar, swws_usage_monitoring, swws_usage_info_evaluation, swws_accessibility, swws_delivery_role, program_web_site, pws_url, pws_lsc_funded, program_tech_contact_name_first, program_tech_contact_name_last, program_tech_contact_phone, program_tech_contact_email, sw_tech_contact_name_first, sw_tech_contact_name_last, sw_tech_contact_phone, sw_tech_contact_email, program_legalmeetings_host, program_legalmeetings_usage, applicant_internet_usage FROM dbo.LSC_SOFTWARE_QUESTION WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.LSC_SOFTWARE_QUESTION
GO
EXECUTE sp_rename N'dbo.Tmp_LSC_SOFTWARE_QUESTION', N'LSC_SOFTWARE_QUESTION', 'OBJECT' 
GO
ALTER TABLE dbo.LSC_SOFTWARE_QUESTION ADD CONSTRAINT
	PK_LSC_SOFTWARE_QUESTION PRIMARY KEY CLUSTERED 
	(
	lsc_software_question_id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
