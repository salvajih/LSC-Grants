CREATE procedure [dbo].[spPOSTSUBMISSIONWORKFLOW_STATE_CHECK]
	(
		@WfTaskAssignmentID INT
	)
AS
set nocount on

	Declare @status_id int, @success bit, @status_message varchar(250)
	Declare @ReturnCode INT, @NewID int, @GranteeProjectID int
	
	select @GranteeProjectID = grantee_project_id from WF_TASK_ASSIGNMENT where wf_task_assignment_id = @WfTaskAssignmentID

	if exists(SELECT * FROM  ADDRESS INNER JOIN
		GRANTEE_PROJECT gp ON ADDRESS.entity_id = gp.primary_person_id
		WHERE (ADDRESS.entity_type_id = 1) AND (ADDRESS.state_province_id = 45) AND gp.grantee_project_id = @GranteeProjectID)
		BEGIN
			set @status_id = 1
			set @success = 1
			set @status_message = 'Primary Person Address has VA as state.'
		END
	ELSE
		BEGIN
			set @status_id = 0
			set @success = 0
			set @status_message = 'Primary Person Address does not have VA as state.'
		END

	exec @ReturnCode = getid_sel @table = 'NOTES', @id = @NewID OUTPUT, @mode = 2
	insert into NOTES (id, entity_id, entity_type_id, subject) values (@NewID, @GranteeProjectID, 3, @status_message)


	select @status_id As StatusID, @success as Success, @status_message As StatusMessage