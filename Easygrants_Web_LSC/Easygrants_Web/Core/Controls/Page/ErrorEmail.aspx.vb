Imports System.Xml
Imports System.Web.Mail
Imports System.Web.Mail.MailMessage
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports Core.Web.User
Imports EasyGrants.Correspondence
Imports EasyGrants.Web.User
Imports EasyGrants.Web
Imports Easygrants_Web.Controls.Base
Imports System.Text


Namespace Core_Web.Controls.Base

Public Class cErrorEmail
    Inherits Core.Web.cCorePage
    
'====================================================================

		Private mEmailArgs As IEmailArgs
		Protected btnSubmit As cCSSButton
		'Protected btnCancel As cCSSButton
		Protected txtFromEmail As cEmailTextBox
		Protected txtSubject As cTextBox
		Protected txtMessage As cTextArea
		Protected tblSentMessage as HtmlTable
		Protected tblMessage as HtmlTable
		Protected tblCloseWindow as HtmlTable
		Protected tblSubmit as HtmlTable

'====================================================================

		Public Overrides Sub CorePage_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
			btnSubmit.Set_ServerClick(AddressOf btnSubmit_Click)
			'btnCancel.Set_ServerClick(AddressOf btnCancel_Click)
			If (Request.QueryString("Sent") = "1") Then
				tblMessage.Visible = False
				tblSubmit.Visible = False
				tblSentMessage.Visible = True
				tblCloseWindow.Visible = True
			Else
				tblMessage.Visible = True
				tblSubmit.Visible = True
				tblSentMessage.Visible = False
				tblCloseWindow.Visible = False
			End If       
		End Sub
		
'--------------------------------------------------------------------

		'Public Sub btnCancel_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
		'	Response.Redirect(Request.QueryString.Get("ReturnURL"))
		'End Sub
	
'--------------------------------------------------------------------

		Public Sub btnSubmit_Click(ByVal aSrc As Object, ByVal aArgs As EventArgs)
			Page.Validate()
			If Page.IsValid = False Then
				Exit Sub
			End If
			Dim aEmailBody As String
			aEmailBody = txtMessage.Value + vbCrLf + vbCrLf + "Error URL : " + WebAppl.Build_RootURL(WebSession.CurrentUrl) + vbCrLf + _
						"Error Message : " + WebSession.CurrentException.Message + vbCrLf + "Error Stack Trace : " + WebSession.CurrentException.StackTrace + vbCrLf
			Dim aMsgBody As StringBuilder = New StringBuilder(txtMessage.Value)
			If Not WebSession Is Nothing Then
				aMsgBody.Append(vbCrLf)
				aMsgBody.Append("Error URL : " + WebAppl.Build_RootURL(WebSession.CurrentUrl))
				aMsgBody.Append(vbCrLf)
				aMsgBody.Append("Error Message : " + WebSession.CurrentException.Message)
				aMsgBody.Append(vbCrLf)
				aMsgBody.Append("Error Stack Trace : " + WebSession.CurrentException.StackTrace)
				aMsgBody.Append(vbCrLf)
			End If
			If txtFromEmail.Value = "" Then

			End If
			SendEmail(txtFromEmail.Value, "System Error Notification", aEmailBody)
		End Sub

'--------------------------------------------------------------------

		Public Sub SendEmail(aFrom as String, aSubject as String, aMessageBody as String)
			'Dim aMessage As MailMessage
			'Dim aMail As SmtpMail
			Dim aMessageText As String
			'Dim aWfProjectDataObject As cDataObject
			Dim aSupportAddressNode as XmlNode
			Dim aToAddress as String
			Dim aCorrespondenceDefinition As cDataObject
			'Dim aXmlDoc As cXMLDoc
			'Dim aDataObjectNode As XmlNode
			'Dim aFiltersNode As XmlNode

			'Page.Validate()
			'If Not Page.IsValid Then
			'	Exit Sub
			'End If

			Dim aUserID as Integer
			aUserID = 0

			If WebSession.Users.Count > 0 Then
				Dim aEntry As DictionaryEntry
				Dim aUser As cEGUser
				For Each aEntry In WebSession.Users
					aUser = aEntry.Value
					aUserID = aUser.UserID
					Exit For
				Next
			End If	
			
			aSupportAddressNode = WebAppl.ConfigDoc.DocElement.SelectSingleNode("Appl/EMailParams/DefaultSupportEmail/ReleaseBuild[@BuildKey='" + WebAppl.BuildKey + "']")
			aToAddress = cXMLDoc.AttributeToString(aSupportAddressNode.ParentNode, "TechAddress")

			aMessageText = ""
			aMessageText += vbCrLf & vbCrLf & "Message: " & aMessageBody
			aCorrespondenceDefinition = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("CorrespondenceDefinition",15)
			aCorrespondenceDefinition("CorrespondenceFrom") = aFrom
			aCorrespondenceDefinition("CorrespondenceTo") = aToAddress
			aCorrespondenceDefinition("CorrespondenceCC") = ""
			aCorrespondenceDefinition("CorrespondenceBCC") = ""
			aCorrespondenceDefinition("Subject") = aSubject
			aCorrespondenceDefinition("Body") = aMessageText   

			Dim aCorrespondenceJob As cCorrespondenceJob
			aCorrespondenceJob = New cCorrespondenceJob(aUserID)

			aCorrespondenceJob.CorrespondenceDefinition = aCorrespondenceDefinition
			aCorrespondenceJob.EmailArgs = mEmailArgs
			
			Try
				aCorrespondenceJob.SendEmail(WebSession.WebAppl)
			Catch e As Exception
	            Response.Redirect(Core.Web.cWebLib.AddQuerystringParameter(Request.RawUrl.ToString(), "Sent", "0"))
			End Try
			
			Response.Redirect(Core.Web.cWebLib.AddQuerystringParameter(Request.RawUrl.ToString(), "Sent", "1"))

		End Sub	

'====================================================================

End Class
End Namespace