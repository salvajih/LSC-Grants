<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cValidate' src='../../../../Easygrants/Controls/Base/ValidationContent.ascx' %>
<br />
<Core:cUserCtlLoader CtlID='ctlSubgrantInfo' 
	Src='Implementation/Modules/RequestSubgrantApproval/PageSection/SubgrantInfo.ascx'
	runat='server'/>
<br />
<div class='SeparatorHdg'>Instructions</div>

<p>The <b>Main</b> page provides a summary of the information requested and the application status.</p>

<p>The <b>Validation Summary</b> below displays the status of your submission, indicating whether each section is validated 
(complete). Click the section links in the Validation Summary below or use the links at the left to navigate through 
the sections of the application.</p>

<p>Other useful links that will appear in the navigation bar at left throughout the process include: </p>

<ul>
	<li><b>Home</b>, which brings you back to your Home page and out of this application </li>
	<li><b>Log Out</b>, which logs you out of the system </li>
</ul>
<br />
<div class='SeparatorHdg'>Request Subgrant Approval (Step 1)</div>
<p>
	This subgrant application procedure is a two-step process.
</p>
<p>
	In step one, all applicants are required to provide the information requested in the LSC Grants data fields provided in the Subrecipient Profile, Subgrant Summary, and Subrecipient Budget screens, and to upload a Draft Subgrant Agreement and other required documents.  As in past years, recipients are encouraged to use LSC�s Subgrant Agreement Form (Form A) which is available on LSC�s website.  If the Subgrant Agreement Form provided by LSC is not used, the proposed agreement should include, at a minimum, the substance of the provisions of that form. 
</p>
<!--<p>
	Applicants seeking to subgrant LSC Field Grants (i.e., Basic Field, Native American, and Migrant funds) are also requested to respond to the inquiries in Form B (for new subgrants) or Form C (for renewal subgrants).  These forms are also available on LSC�s Recipient Information Network, and detailed instructions for completing and uploading them are provided on each form.
</p> -->
<p>
	In step two, applicants will be required to request approval of their subgrant agreement(s) at least 45 days in advance of the effective date(s).  Applicants will not be required to provide to LSC information already provided in step one, if the information previously provided is still accurate at the time of the final approval request.  However, applicants will be asked to upload the signed subgrant agreement for which they seek approval. 
</p>
<br />
<div class='SeparatorHdg' width='100%'>Validation Summary</div>
<br />
<Core:cValidate id='ctlValidate' DisplayFormat='Summary' 
	runat='server'/>
<br />
<div style="text-align:center">
	<span runat='server' id='spnContinue'/>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Container='spnContinue'
						Caption='Continue'
						Type='cButton'
						GoToNextPage='True'>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>