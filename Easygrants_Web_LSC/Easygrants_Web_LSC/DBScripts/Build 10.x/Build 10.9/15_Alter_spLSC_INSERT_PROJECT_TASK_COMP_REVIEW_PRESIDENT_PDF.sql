set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go




ALTER PROCEDURE [dbo].[spLSC_INSERT_PROJECT_TASK_COMP_REVIEW_PRESIDENT_PDF]
(@time_period_id int)
--Create association between project tasks and PDFs for Competition Review - President tasks

AS


--Create temp table 
CREATE TABLE #pdf(
		ident int identity(0,1),
		id int ,
		wf_project_task_id int ,
		report_output_definition_type_id int ,
		final_pdf_report_key varchar(50) ,
		description varchar(100) ,
		generation_id bit )


--Populate temp table
INSERT #pdf
		(wf_project_task_id ,
		report_output_definition_type_id ,
		final_pdf_report_key ,
		description ,
		generation_id )
		SELECT 
            wfpt.id ,
			2,
			'CompAppPresidentReview',
			'Comp App President Review',
			0
        FROM a_wf_project_task wfpt
			join a_wf_task wft on wfpt.wf_task_id = wft.id
            join a_wf_project awfp on wfpt.wf_project_id = awfp.id
        Where wft.id = 56 and
            awfp.time_period_id = @time_period_id

--Get IDs from the ID generation table and set in temp table. This will allow insertion into the actual data table.			

DECLARE @rowcount int, @first_new_id int

SELECT @rowcount = count(*) FROM #pdf

	EXEC @first_new_id = spGETID_RANGE_SEL @table = 'a_WF_PROJECT_TASK_PDF', @count = @rowcount, @mode = 2

	UPDATE #pdf
		SET id = ident + @first_new_id

---Insertion into the actual data table.	
INSERT a_WF_PROJECT_TASK_PDF
		(id,
		wf_project_task_id ,
		report_output_definition_type_id ,
		final_pdf_report_key ,
		description ,
		generation_id )
		SELECT id,
			wf_project_task_id ,
			report_output_definition_type_id ,
			final_pdf_report_key ,
			description ,
			generation_id
			FROM #pdf










