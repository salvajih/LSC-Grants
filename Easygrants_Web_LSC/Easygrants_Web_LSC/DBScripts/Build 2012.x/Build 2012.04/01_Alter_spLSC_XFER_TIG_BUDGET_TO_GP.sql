/****** Object:  StoredProcedure [dbo].[spLSC_XFER_TIG_BUDGET_TO_GP]    Script Date: 04/12/2012 10:59:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--transfer revised grant budget data from task assignment back to grant
ALTER PROCEDURE [dbo].[spLSC_XFER_TIG_BUDGET_TO_GP]
	@WfTaskAssignmentID INT --task assignment in which budget data was revised

AS

Declare @ReturnCode INT, @NewID int, @GranteeProjectID int, @wfta_budget_id int, @gp_budget_id int, 
	@min_budget_item_id int, @new_budget_item_id int, @item_count int, @lsc_tig_budget_type_id int

SELECT @GranteeProjectID = grantee_project_id
	FROM WF_TASK_ASSIGNMENT
	WHERE wf_task_assignment_id = @WfTaskAssignmentID

SELECT @wfta_budget_id = lsc_tig_budget_id,
	@lsc_tig_budget_type_id = lsc_tig_budget_type_id
	FROM LSC_TIG_BUDGET
	WHERE wf_task_assignment_id = @WfTaskAssignmentID

SELECT @gp_budget_id = lsc_tig_budget_id
	FROM LSC_TIG_BUDGET
	WHERE grantee_project_id = @GranteeProjectID
		AND lsc_tig_budget_type_id = @lsc_tig_budget_type_id

BEGIN TRAN

	--If no grant budget exists, create it
	IF @gp_budget_id IS NULL
	BEGIN

		EXEC @gp_budget_id = getid_sel 
			@table='LSC_TIG_BUDGET',
			@mode = 2

		INSERT LSC_TIG_BUDGET
			(lsc_tig_budget_id,
			grantee_project_id,
			lsc_tig_budget_type_id)
			VALUES(@gp_budget_id,
				@GranteeProjectID,
				@lsc_tig_budget_type_id)

	END

	--Clear out existing budget items
	DELETE LSC_TIG_BUDGET_ITEM
		WHERE lsc_tig_budget_id = @gp_budget_id

	--Find lowest budget item ID from WfTA budget - this will be used in setting IDs for new budget items
	--NOTE: This methodology can cause problems if existing budget items do not have contiguous IDs. Needs to be fixed.
	SELECT @min_budget_item_id = MIN(lsc_tig_budget_item_id),
		@item_count = COUNT(*)
		FROM LSC_TIG_BUDGET_ITEM tbi
			WHERE lsc_tig_budget_id = @wfta_budget_id

	--Assign a range of IDs for new budget items
	EXEC @new_budget_item_id = spGETID_RANGE_SEL
				@table = 'LSC_TIG_BUDGET_ITEM',
				@count = @item_count,
				@mode = 2

	--Create new budget items in grant budget based on WfTA budget
	INSERT INTO [LSC_TIG_BUDGET_ITEM]
			   ([lsc_tig_budget_item_id]
			   ,[lsc_tig_budget_id]
			   ,[lsc_tig_budget_line_id]
			   ,[lsc_tig_budget_funding_type_id]
			   ,[amount]
			   ,[comment])
		 SELECT
			   lsc_tig_budget_item_id - @min_budget_item_id + @new_budget_item_id
			   ,@gp_budget_id
			   ,lsc_tig_budget_line_id
			   ,lsc_tig_budget_funding_type_id
			   ,amount
			   ,comment
			FROM LSC_TIG_BUDGET_ITEM
			WHERE lsc_tig_budget_id = @wfta_budget_id

	--Copy updated contracts data to grant file
	EXEC spLSC_XFER_TIG_CONTRACTS_TO_GRANT @wf_task_assignment_id = @WfTaskAssignmentID

	--Correct s_ID_GEN table (see NOTE above)
	EXEC spUPDATE_IDGEN @select = 0
COMMIT TRAN
