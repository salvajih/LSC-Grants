ALTER PROCEDURE [dbo].[spLSC_POSTSUBMISSION_SUBGRANT_APPROVAL_REQ_REVIEW_OPPSTAFF]
	@WfTaskAssignmentID INT  
AS

DECLARE @status_id INT, @success BIT, @status_message VARCHAR(250)

DECLARE 
	@grantee_project_id INT,
	@wf_task_id INT,
	@new_task_id INT,
	@new_outcome_id INT,
	@due_date DATETIME, 
    @OppDirectorReviewTaskID INT

    SELECT @grantee_project_id = grantee_project_id
		,@wf_task_id = wf_task_id
		FROM WF_TASK_ASSIGNMENT
		WHERE wf_task_assignment_id = @WfTaskAssignmentID

	SET @new_task_id = CASE WHEN @wf_task_id = 84 THEN 85
		WHEN @wf_task_id = 105 THEN 108 
		WHEN @wf_task_id = 119 THEN 120 END

	SELECT @new_outcome_id = id
		FROM a_WF_TASK_OUTCOME
		WHERE task_id = @new_task_id
			AND description = 'In Process'

	SELECT @due_date = opp_director_review_due
		FROM vLSC_SUBGRANT_REVIEW_DUE_DATES
		WHERE wf_task_assignment_id = @WfTaskAssignmentID

    SELECT @OppDirectorReviewTaskID = wf_task_assignment_id
		FROM WF_TASK_ASSIGNMENT
		WHERE grantee_project_id = @grantee_project_id and wf_task_id = @new_task_id

	
--If OPP Director review task does not exist then Create it
 IF @OppDirectorReviewTaskID IS NULL
	BEGIN

	EXEC @OppDirectorReviewTaskID = getid_sel @table='WF_TASK_ASSIGNMENT',
		@mode = 2

	INSERT WF_TASK_ASSIGNMENT
		(wf_task_assignment_id,
		wf_task_id,
		wf_task_status_id,
		wf_task_outcome_id,
		grantee_project_id,
		due_date,
		workgroup_id,
		wf_task_role_id,
		create_date)
		VALUES(@OppDirectorReviewTaskID,
			@new_task_id,
			1,
			@new_outcome_id,
			@grantee_project_id,
			@due_date,
			9, --OPP Director workgroup 
			7,
			getdate())
    END

 ELSE
    
    BEGIN

		UPDATE WF_TASK_ASSIGNMENT
			SET wf_task_status_id = 1
			WHERE wf_task_assignment_id = @OppDirectorReviewTaskID
    END


set @status_id = 1
set @success = 1
set @status_message = 'SUCCESS'

select @status_id As StatusID, @success as Success, @status_message As StatusMessage
