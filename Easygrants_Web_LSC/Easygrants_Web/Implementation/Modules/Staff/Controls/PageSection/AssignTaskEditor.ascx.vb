Imports System.Diagnostics
Imports System.Web.UI
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web
Imports System.Text
Imports Core.Web.SvrCtls

Namespace Easygrants_Web.Modules.Staff.Controls.PageContent
Public MustInherit Class cAssignTaskEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

    Protected trReviewer As HtmlTableRow
    Protected spnReviewer As HtmlGenericControl
    Protected trTaskRole As HtmlTableRow
    Protected trOutcome As HtmlTableRow
    Protected trStatusNew As HtmlTableRow
    Protected ctlPerson As cPopUpSelectorLauncher
    Protected ctlTask As cDropDown
    Protected ctlTaskRole As cDropDown
    Protected ctlOutcome As cDropDown
    Protected ctlStatusNew As cDropDown
    Protected ctlStatus As cDropDown
    Protected ctlOutcome0 As cDropDown
	Protected btnTaskRole As cCSSButton
	Protected btnSave As cCSSButton
    Protected spnSave As HtmlGenericControl
    Protected lblValidationMessage as Label
    Protected lblPeopleAssigned as Label
    
'=============================================================

	Protected ReadOnly Property WfTaskAssignment() As cDataObject
		Get
			If Request.QueryString("WfTaskAssignmentID") Is Nothing Then Return Nothing

			Return WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", _
				Request.QueryString("WfTaskAssignmentID"))
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property TaskID() As String
		Get
            If Not Request.QueryString("TaskID") Is Nothing Then
                Return Request.QueryString("TaskID")
            Else
                Return ""
            End If
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property TaskRoleID() As String
		Get
			If Not Request.QueryString("TaskRoleID") Is Nothing Then Return Request.QueryString("TaskRoleID")

			If WfTaskAssignment Is Nothing Then Return ""

            Return WfTaskAssignment.GetPropertyString("WfTaskRoleID")
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property GranteeProjectID() As String
		Get			
			If WfTaskAssignment Is Nothing Then Return ""

            Return WfTaskAssignment.GetPropertyString("GranteeProjectID")
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property OutcomeID() As String
		Get
			If Not Request.QueryString("OutcomeID") Is Nothing Then Return Request.QueryString("OutcomeID")

			If WfTaskAssignment Is Nothing Then Return ""

            Return WfTaskAssignment.GetPropertyString("WfTaskOutcomeID")
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property StatusID() As String
		Get
			If Not Request.QueryString("StatusID") Is Nothing Then Return Request.QueryString("StatusID")

			If WfTaskAssignment Is Nothing Then Return ""

            Return WfTaskAssignment.GetPropertyString("WfTaskStatusID")
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property Outcome0ID() As String
		Get
		    If Not Request.QueryString("Outcome0ID") Is Nothing Then Return Request.QueryString("Outcome0ID")

			If WfTaskAssignment Is Nothing Then Return ""

            Return WfTaskAssignment.GetPropertyString("WfTaskOutcomeID")
		End Get
	End Property

'-------------------------------------------------------------

	Public ReadOnly Property PersonID() As String
		Get
            'If Not Request.QueryString("PersonID") Is Nothing Then
            '    Return Request.QueryString("PersonID")
            'Else
            '    Return ""
            'End If
 
			If Not Request.QueryString("PersonID") Is Nothing Then Return Request.QueryString("PersonID")
			If WfTaskAssignment Is Nothing Then Return ""
			Return WfTaskAssignment.GetPropertyString("PersonID")
		End Get
	End Property

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		btnSave = CType(Me.FindControl("btnSave"), cCSSButton)
		Me.btnSave.Visible = False
		
		If Not TaskID = "" Then
			Dim aDataObjectList As cDataObjectList
			Dim aDataObject As cDataObject
			Dim aItem As ListItem
			Dim aReviewers As StringBuilder = New StringBuilder()
        
			trTaskRole.Visible = True

			aDataObject = Me.WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTask", TaskID)
            
			aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskRole", "TaskTypeID", aDataObject.GetPropertyString("WfTaskTypeID"))
			
			ctlTaskRole.Items.Clear()
			aItem = New ListItem("<None>", "")
            ctlTaskRole.Items.Add(aItem)
                    
			For Each aDataObject In aDataObjectList
                    aItem = New ListItem(aDataObject.GetPropertyString("WfTaskRole"), aDataObject.GetPropertyString("WfTaskRoleID"))
                    ctlTaskRole.Items.Add(aItem)
			Next

			btnTaskRole.Set_ServerClick(AddressOf btnGo_Click)
			ctlTask = CType(Me.FindControl("ctlTask"), cDropDown)
			ctlTask.SelectedField = TaskID
			trOutcome.Visible = False
			trStatusNew.Visible = False
			
			If Not TaskRoleID = "" Then
				aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskOutcome", "WfTaskID", TaskID)
			
				ctlOutcome.Items.Clear()
				aItem = New ListItem("<None>", "")
				ctlOutcome.Items.Add(aItem)
            
				For Each aDataObject In aDataObjectList
					aItem = New ListItem(aDataObject.GetPropertyString("WfTaskOutcome"), aDataObject.GetPropertyString("WfTaskOutcomeID"))
					Me.ctlOutcome.Items.Add(aItem)
				Next
                
				aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", _
																"WfTaskID", TaskID, "WfTaskRoleID", TaskRoleID, "GranteeProjectID", GranteeProjectID)
			
				'aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProject", "PrimaryPersonID", PersonID)
			
				If aDataObjectList.Count <> 0 Then
					'trReviewer.Visible = True
				
					For Each aDataObject In aDataObjectList						
						'if aDataObject.GetRelatedPropertyDataObject("GranteeProject").GetPropertyString("PrimaryPersonID") = PersonID then
							aReviewers.Append(aDataObject.GetRelatedPropertyDataObject("Person").GetPropertyString("LastNameFirstName"))
							aReviewers.Append("<br>")
						'End If												
					Next					
															
					spnReviewer.InnerHtml = aReviewers.ToString
				End If		
				
				if aReviewers.ToString = "" then
					lblPeopleAssigned.Text = "Currently no one is assigned to this task"
				else
					lblPeopleAssigned.Text = "Currrent People Assigned To This Task"
				End If					
				
				Me.ctlTaskRole.SelectedField = TaskRoleID
				Me.ctlOutcome.SelectedField = OutcomeID
				Me.trOutcome.Visible = True
				Me.trStatusNew.Visible = True
				Me.btnSave.Visible = True
			End If
		End If

	End Sub

'=============================================================

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		
		ctlStatus = CType(Me.FindControl("ctlStatus"), cDropDown)
		ctlStatus.SelectedField = StatusID
		ctlOutcome0 = CType(Me.FindControl("ctlOutcome0"), cDropDown)
		ctlOutcome0.SelectedField = Outcome0ID
		ctlPerson = CType(Me.FindControl("ctlPerson"), cPopUpSelectorLauncher)
		ctlPerson.ObjID = PersonID
		
	End Sub

'=============================================================

	Public Sub GoClick(ByVal aStepName As String, ByVal aValue As String, ByVal aStatus As String, ByVal aOutcome0 As String, ByVal aPerson As String)
		Dim aURL As String

		aURL = Request.RawUrl.ToString()

		Select Case aStepName
			Case "Task"
				aURL = cWebLib.AddQuerystringParameter(aURL, "TaskRoleID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "OutcomeID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "StatusID", aStatus)
				aURL = cWebLib.AddQuerystringParameter(aURL, "Outcome0ID", aOutcome0)
				aURL = cWebLib.AddQuerystringParameter(aURL, "PersonID", aPerson)
				aURL = cWebLib.AddQuerystringParameter(aURL, "TaskID", aValue)
			Case "TaskRole"
				aURL = cWebLib.AddQuerystringParameter(aURL, "OutcomeID", "")
				aURL = cWebLib.AddQuerystringParameter(aURL, "TaskRoleID", aValue)
		End Select

		Response.Redirect(aURL)
	End Sub

'-------------------------------------------------------------

	Private Sub btnGo_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
		
		Select Case CType(sender, Control).Parent.ID
			Case "btnTaskRole"
				
				GoClick("TaskRole", ctlTaskRole.SelectedValue, "", "", "")
		End Select
	End Sub

'=============================================================

    Public Overloads Overrides Function EventController_Save() As Boolean
        Dim aValid as Boolean = True
        ctlTask = CType(Me.FindControl("ctlTask"), cDropDown)        
        ctlTaskRole = CType(Me.FindControl("ctlTaskRole"), cDropDown) 
		ctlPerson = CType(Me.FindControl("ctlPerson"), cPopUpSelectorLauncher)
        ctlOutcome = CType(Me.FindControl("ctlOutcome"), cDropDown) 
        ctlStatusNew = CType(Me.FindControl("ctlStatusNew"), cDropDown) 

        If ctlTask.SelectedValue = "" then
            lblValidationMessage.Text = "Please select a task.<br>"
            aValid=False
        End If
        If ctlTaskRole.SelectedValue = "" then
            lblValidationMessage.Text += "Please select a task role.<br>"
            aValid=False
        End If
        If ctlPerson.ObjID = "" then
            lblValidationMessage.Text += "Please select a person.<br>"
            aValid=False
        End If        
        'If ctlOutcome.SelectedValue = "" then
        '    lblValidationMessage.Text += "Please select an outcome.<br>"
        '    aValid=False
        'End If 
        If ctlStatusNew.SelectedValue = "" then
            lblValidationMessage.Text += "Please select a status.<br>"
            aValid=False
        End If 

        if aValid = False then
            exit Function
        End If

        MyBase.EventController_Save()
        Response.Redirect(Request.QueryString("ReturnURL"))
    End Function

'=============================================================

	Public Overrides Sub DataPresenter_SaveDataObjects()
        MyBase.DataPresenter_SaveDataObjects()
        Dim aDataObjectList As cDataObjectList
		Dim aDataObject As cDataObject
        
		ctlPerson = CType(Me.FindControl("ctlPerson"), cPopUpSelectorLauncher)
        ctlTask = CType(Me.FindControl("ctlTask"), cDropDown)
        	
		Dim aFilterProperties() As String = {"GranteeProjectID", "PersonID", "WfTaskID", "WfTaskRoleID"}
        Dim aFilterValues() As String = {WfTaskAssignment.GetPropertyString("GranteeProjectID"), ctlPerson.ObjID.ToString(), _
			ctlTask.SelectedValue.ToString(), ctlTaskRole.SelectedValue.ToString()}
		aDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", aFilterProperties, aFilterValues)

		If aDataObjectList.Count = 0 Then
			aDataObject = Me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskAssignment")
			aDataObject("GranteeProjectID") = WfTaskAssignment("GranteeProjectID")
			ctlStatus = CType(Me.FindControl("ctlStatus"), cDropDown)
			aDataObject("WfTaskStatusID") = ctlStatus.SelectedValue
		Else
			aDataObject = aDataObjectList(0)
		End If		
        
        aDataObject("PersonID") = ctlPerson.ObjID
        
		aDataObject("WfTaskID") = ctlTask.SelectedValue
		aDataObject("WfTaskRoleID") = ctlTaskRole.SelectedValue
        If ctlOutcome.SelectedValue <> "" then
			aDataObject("WfTaskOutcomeID") = ctlOutcome.SelectedValue
		End If
        If ctlStatusNew.SelectedValue <> "" then
			aDataObject("WfTaskStatusID") = ctlStatusNew.SelectedValue
		End If
		WebSession.DataObjectFactory.SaveDataObject(aDataObject)
	End Sub
	
'=============================================================

End Class
End Namespace