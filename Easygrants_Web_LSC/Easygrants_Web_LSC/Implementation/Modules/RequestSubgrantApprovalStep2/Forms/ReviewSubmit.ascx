<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<%@ Register Tagprefix='EasyGrants' tagname='cReportOutputLink' src='../../../../Core/Controls/Base/ReportOutputLink.ascx' %>
<br />
<Core:cUserCtlLoader CtlID='ctlSubgrantInfo' 
	Src='Implementation/Modules/RequestSubgrantApproval/PageSection/SubgrantInfo.ascx'
	runat='server'/>
<br />
<div class='SeparatorHdg' width='100%'>Instructions</div>
<br />
<p>Click <strong>View PDF</strong> to view a PDF of your subgrant approval request.

<EasyGrants:cReportOutputLink id='ctlApplicantReportLink' runat='server'/></p>

<p>The <strong>Validation Summary</strong> section below displays the status of your submission, indicating whether each section is validated (complete). 
<b>PLEASE NOTE</b>: Some areas in the Validation Summary may be checked as complete even though you may need or wish to provide additional information. In particular, pages for which information is not required will be checked as complete whether or not information is submitted. If you wish to provide such information in your request, check to ensure that you have done so before you submit the request.  </p>

<p>To make changes to the application before submitting, click the name of the form you want to change under <b>Page Name</b> below.</p> 

<p>If all the validation rules have been met, you will see a <b>Submit</b> button in the <strong>Notice to Applicants</strong> section below. Once your application is complete, click the <strong>Submit</strong> button to submit the application.
You will receive a confirmation email that your application was received. Please save this confirmation email. </p>

<p>To return to your full list of subgrant approval requests, click on "Home" in the left navigation bar.</p>

<div class='SeparatorHdg' width='100%'>Notice to Applicants</div>

<p>Once an applicant has submitted step two of this process, under 45 CFR &#167; 1627.3(a)(2), LSC has 45 days to process the request.</p>

<Core:cUserCtlLoader ID="CUserCtlLoader2" CtlID='ctlSubmissionButton' Src='Easygrants/Controls/Base/Submission_Button.ascx' Properties='ForceGen=False' runat='server' />
<br />
<div class='SeparatorHdg' width='100%'>Validation Summary</div>
<br />
<Core:cValidate id='ctlValidate' DisplayFormat='Detail' 
	runat='server'/>

  
  
  
  
  <!-- Embedded XML Page Functionality - please do not edit -->
  <span id='spnConfigXML' visible='false' runat='server'>
    <ModuleSection>
		<DataObject Key='ReportOutputLink' DataObjectDefinitionKey='WfTaskAssignment'>
			<Filters>
				<Argument Type='ModuleUser' 
					TypeKey='WfTaskAssignmentID'
					PropertyKey='WfTaskAssignmentID'
					Value='' 
					bool=''/>
			</Filters>
			<DisplayProperties>				
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlApplicantReportLink'
						Type='cReportOutputLink'
						DisplayText='~View PDF~'>
						<Parameters>
							<Argument Type='ModuleUser'
								TypeKey='WfTaskAssignmentID'
								PropertyKey='EntityID'
								Value=''/>
							<Argument Type='DataObjectCollection'
								TypeKey='ReportOutputLink'
								DataObjectPropertyKey='WfProjectTask.WfProjectTaskPDF.FinalPDFReportKeyLink.ReportOutputDefinitionID'
								PropertyKey='DefinitionID'/>
						</Parameters>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

    </ModuleSection>
  </span>