CREATE procedure [dbo].[spPOSTASSIGNMENT_PROJECTTITLE_MODIFY]
	(
		@WfTaskAssignmentID INT
	)
AS
set nocount on

	Declare @status_id int, @success bit, @status_message varchar(250)
	Declare @ReturnCode INT, @NewID int, @GranteeProjectID int
	
	Declare @project_title varchar(500)
	select @GranteeProjectID = grantee_project_id from WF_TASK_ASSIGNMENT where wf_task_assignment_id = @WfTaskAssignmentID
	select @project_title = grant_title 
		from GRANTEE_PROJECT gp INNER JOIN WF_TASK_ASSIGNMENT wta ON gp.grantee_project_id = wta.grantee_project_id
		where wta.wf_task_assignment_id = @WfTaskAssignmentID

	
	update GRANTEE_PROJECT set grant_title = 'EVENT MANAGER ' + isnull(@project_title, '')
		from GRANTEE_PROJECT gp where grantee_project_id = @GranteeProjectID

	IF @@ERROR <> 0
		BEGIN
			set @status_id = 0
			set @success = 0
			set @status_message = 'Project Title update failed.'
			print @@ERROR
		END
	ELSE
		BEGIN
			set @status_id = 1
			set @success = 1
			set @status_message = 'Project Title is updated.'
		END

	exec @ReturnCode = getid_sel @table = 'NOTES', @id = @NewID OUTPUT, @mode = 2
	insert into NOTES (id, entity_id, entity_type_id, subject) values (@NewID, @GranteeProjectID, 3, @status_message)


	select @status_id As StatusID, @success as Success, @status_message As StatusMessage