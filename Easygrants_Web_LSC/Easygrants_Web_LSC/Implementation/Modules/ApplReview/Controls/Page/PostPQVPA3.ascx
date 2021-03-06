<%@ Control Language="vb" AutoEventWireup="true" Inherits="Easygrants_Web.Controls.Base.cWfTADataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>
<%@ Register Tagprefix='Core' tagname='cNewWindowOpener' src='../../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:cNewWindowOpener runat='server' id='ctlNewWindowOpener'/>
<br />
	<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlAppInfo'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/PPQVApplicantInformation.ascx'
	runat='server'/>
	<br />
<p>
<div class='SeparatorHdg'>Performance Area Three</div><br />
<div class="MinorSeparatorHdg">Recommendations</div>
<span runat='server' id='spnNoRecs'/>
<span runat='server' id='spnDPL' />

<div style="text-align:center">
	<span runat='server' id='spnSaveb4Signifi'/>
</div>
<br />

<div class="MinorSeparatorHdg">Significant Changes</div>
<b>Performance Area Three: </b>Significant changes or major developments in the delivery system since the PQV ended, and those anticipated during the grant year.
<br /><br />
<b>Applicant's response </b><br />
<span runat='server' id='spnPA3ApplicantResponse'/>
<br /><br />

<div style="text-align:center">
	<span runat='server' id='spnSaveb4WebForms'/>
</div>
<br />
<div class="MinorSeparatorHdg">Relevant Web Forms</div>
<p><span style="color:red"><b>IMPORTANT</b></span>: Click one of the <span style="color:red">Save</span> buttons on the page before opening a Web Form to avoid losing data.</p>
<span runat='server' id='spnTrainingForm' />
<br /><br />
<span runat='server' id='spnLegalWorkMngtForm' />
<br /><br />
<span runat='server' id='spnCasehandling' />
<br /><br />
<span runat='server' id='spnCaseDevAct' />
<br /><br />
<span runat='server' id='spnAccompExcludingPAI' />
<br /><br />
<span runat='server' id='spnPAIForm' />
<br /><br />
<span runat='server' id='spnRecruitPvtAtt' />
<br /><br />
<span runat='server' id='spnRetainPvtAttVol' />
<br /><br />
<span runat='server' id='spnAccomplishThroughPAI' />
<br /><br />
<span runat='server' id='spnJusticeAndAdvocacy' />
<br /><br />

<%--<div class="MinorSeparatorHdg">Supplemental Inquiries</div><br />
Describe Applicant's three most significant accomplishments for clients achieved within the last twenty-four months.  Describe the issue(s), outcome(s) and benefit to other low-income people with a similar problem, or for the client population as a whole.<br />
<br />
<b>Applicant's response </b><br />
	<span runat='server' id='spnApplicantSignifAccomp'/>
<br /><br />--%>

<div class="MinorSeparatorHdg">Overall Staff Analysis and  Assessment</div></p>
<br />
<span runat='server' id='spnCategory6'/>
<table width='100%' cellpadding=0 cellspacing=0>
	<tr>
	    <td width='53%'><b>LSC Staff's Comment on this Performance Area Category<span style="color:red">*</span> </b></td>
	    <td width='47%'align='left'><span runat='server' id='spnCategoryScore6'/><span style="color:red">*</span></td>
	</tr>
</table>
<span runat='server' id='spnCategory6Comment'/>
<br /><br />
<br /><br />
<span runat='server' id='spnCategory7'/>
<table width='100%' cellpadding=0 cellspacing=0>
	<tr>
	    <td width='53%'><b>LSC Staff's Comment on this Performance Area Category<span style="color:red">*</span> </b></td>
	    <td width='47%'align='left'><span runat='server' id='spnCategoryScore7'/><span style="color:red">*</span></td>
	</tr>
</table>
<span runat='server' id='spnCategory7Comment'/>
<br /><br />
<br /><br />
<span runat='server' id='spnCategory8'/>
<table width='100%' cellpadding=0 cellspacing=0>
	<tr>
	    <td width='53%'><b>LSC Staff's Comment on this Performance Area Category<span style="color:red">*</span> </b></td>
	    <td width='47%'align='left'><span runat='server' id='spnCategoryScore8'/><span style="color:red">*</span></td>
	</tr>
</table>
<span runat='server' id='spnCategory8Comment'/>
<br /><br />
<br /><br />
<span runat='server' id='spnCategory9'/>
<table width='100%' cellpadding=0 cellspacing=0>
	<tr>
	    <td width='53%'><b>LSC Staff's Comment on this Performance Area Category<span style="color:red">*</span> </b></td>
	    <td width='47%'align='left'><span runat='server' id='spnCategoryScore9'/><span style="color:red">*</span></td>
	</tr>
</table>
<span runat='server' id='spnCategory9Comment'/>
<br /><br />
<br /><br />
<span runat='server' id='spnCategory10'/>
<table width='100%' cellpadding=0 cellspacing=0>
	<tr>
	    <td width='53%'><b>LSC Staff's Comment on this Performance Area Category<span style="color:red">*</span> </b></td>
	    <td width='47%'align='left'><span runat='server' id='spnCategoryScore10'/><span style="color:red">*</span></td>
	</tr>
</table>
<span runat='server' id='spnCategory10Comment'/>
<br /><br />

<div style="text-align:center">
	<span runat='server' id='spnSave'/>&nbsp;
	<span runat='server' id='spnSaveContinue'/>&nbsp;
	<span runat='server' id='spnSaveClose'/>
</div>
<br /><br />
<div style="text-align:center">
	<span runat='server' id='spnContinue'/>&nbsp;
	<span runat='server' id='spnClose'/>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='GranteeProject' DataObjectDefinitionKey='GranteeProject' Updatable='False'  >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
			</Filters>
		</DataObject>

	    <DataObject Key='LscPQVRecommendationVisitData' DataObjectDefinitionKey='LscPQVRecommendationVisitData' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='GranteeProject' DataObjectPropertyKey='PrimaryOrganizationID' PropertyKey='OrganizationID' />
			</Filters>
			<Sort>
			   <Argument PropertyKey='VisitDate' Direction='Descending'/>
			</Sort>
	   </DataObject>
	
		<DataObject Key='vLSCCompWftaOrgServareaYear' DataObjectDefinitionKey='vLSCCompWftaOrgServareaYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey="WfTaskAssignmentID" PropertyKey="WfTaskAssignmentID"/>
			</Filters>
		</DataObject>
	
	  <DataObject Key='LscPQVRecommendationServArea' DataObjectDefinitionKey='LscPQVRecommendationServArea' Updatable='True' CreateNew='False' >
			<Filters>
				<Argument Type='DataObjectCollection' TypeKey='LscPQVRecommendationVisitData' DataObjectPropertyKey='LscPQVReportID' PropertyKey='LscPQVReportID' >
					<RelatedProperty PropertyKey='LscPQVRecommendation' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='3' >
					<RelatedProperty PropertyKey='LscPQVRecommendation.LscReviewCriterion.LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='CompetitionID' DataObjectListIndex='0' PropertyKey='CompetitionID'/>
				<Argument Type='DataObjectCollection' TypeKey='vLSCCompWftaOrgServareaYear' DataObjectPropertyKey='TimePeriodID' DataObjectListIndex='0' PropertyKey='TimePeriodID'/>
			</Filters>
			<DisplayProperties>
			    <DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlDPL' 
						Container='spnDPL' 
						Type='cDataPresenterList' 
						DataPresenterID='DPL' 
						DataPresenterURL='Implementation/Modules/RenewalReview/Controls/Page/PostPQVChild.ascx' />
				</DisplayProperty>
				
				<DisplayProperty PropertyKey=''>
					<Control ID='lblNoRecs'
						Container='spnNoRecs'
						Type='cLabel'
						LabelText='The Program Quality Visit report contained no Tier 1 recommendations for Performance Area Three'>
						<Visible>
							<Argument PropertyKey='LscPQVRecommendationServAreaID' Value='True' NullDataObject='True'/>
						</Visible>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		 <DataObject Key='AppWfTA' DataObjectDefinitionKey='WfTaskAssignment' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='GranteeProjectID' PropertyKey='GranteeProjectID' />
				<Argument PropertyKey='WfTaskID' Value='66' />
			</Filters>
		</DataObject>
		
		<DataObject Key='LscWftaPostPQVApp' DataObjectDefinitionKey='LscWftaPostPQVApp' Updatable='True' CreateNew='True'>
           <Filters>
				<Argument Type='DataObjectCollection' TypeKey='AppWfTA' DataObjectPropertyKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='PA3Response' >
					<Control ID='spnPA3ApplicantResponse'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<%--<DisplayProperty PropertyKey='SignificantAccomplishments' >
					<Control ID='spnApplicantSignifAccomp'
						Type='HtmlGenericControl' />
				</DisplayProperty>--%>
			</DisplayProperties>
		</DataObject>




        <DataObject Key='WfTACompetitionYear' DataObjectDefinitionKey='WfTACompetitionYear' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID'/>
			</Filters>
		</DataObject>

		<DataObject Key='LscReviewCategory6' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False'>
			<Filters>
			    <Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='3' >
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='1' >
					<RelatedProperty PropertyKey='LscReviewCategory' />
				</Argument>
            </Filters>
            <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCategory6'
						Type='cDataListCtl'
						Container='spnCategory6'
						DataObjectDefinitionKey='LscReviewCriterion'>
						<DisplayProperty PropertyKey='Abbr' ColumnHeader='Criterion' Width='20'/>
						<DisplayProperty PropertyKey='Description' ColumnHeader=' '/>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewCategory7' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False'>
			<Filters>
			    <Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='3' >
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='2' >
					<RelatedProperty PropertyKey='LscReviewCategory' />
				</Argument>
            </Filters>
            <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCategory7'
						Type='cDataListCtl'
						Container='spnCategory7'
						DataObjectDefinitionKey='LscReviewCriterion'>
						<DisplayProperty PropertyKey='Abbr'   ColumnHeader='Criterion' Width='20' />
						<DisplayProperty PropertyKey='Description' ColumnHeader=' ' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewCategory8' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False'>
			<Filters>
			    <Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='3' >
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='3' >
					<RelatedProperty PropertyKey='LscReviewCategory' />
				</Argument>
            </Filters>
            <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCategory8'
						Type='cDataListCtl'
						Container='spnCategory8'
						DataObjectDefinitionKey='LscReviewCriterion'>
						<DisplayProperty PropertyKey='Abbr'   ColumnHeader='Criterion' Width='20' />
						<DisplayProperty PropertyKey='Description' ColumnHeader=' ' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewCategory9' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False'>
			<Filters>
			    <Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='3' >
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='4' >
					<RelatedProperty PropertyKey='LscReviewCategory' />
				</Argument>
            </Filters>
            <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCategory9'
						Type='cDataListCtl'
						Container='spnCategory9'
						DataObjectDefinitionKey='LscReviewCriterion'>
						<DisplayProperty PropertyKey='Abbr'   ColumnHeader='Criterion' Width='20' />
						<DisplayProperty PropertyKey='Description' ColumnHeader=' ' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewCategory10' DataObjectDefinitionKey='LscReviewCriterion' Updatable='False' CreateNew='False'>
			<Filters>
			    <Argument Type='DataObjectCollection' TypeKey='WfTACompetitionYear' DataObjectPropertyKey='TimePeriodID' PropertyKey='TimePeriodID'>
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='3' >
					<RelatedProperty PropertyKey='LscReviewCategory.LscReviewPerformanceArea' />
				</Argument>
				<Argument PropertyKey='SortOrder' Value='5' >
					<RelatedProperty PropertyKey='LscReviewCategory' />
				</Argument>
            </Filters>
            <DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlCategory10'
						Type='cDataListCtl'
						Container='spnCategory10'
						DataObjectDefinitionKey='LscReviewCriterion'>
						<DisplayProperty PropertyKey='Abbr'   ColumnHeader='Criterion' Width='20' />
						<DisplayProperty PropertyKey='Description' ColumnHeader=' ' />
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
				
		<DataObject Key='LscReviewAssignmentCategory6' DataObjectDefinitionKey='LscReviewAssignmentCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscReviewCategory6' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' />
			</Filters>
			<DefaultValues>
                <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
			    <Argument Type='DataObjectCollection' TypeKey='LscReviewCategory6' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtCategory6Comment'
						Type='cTextArea'
						Container='spnCategory6Comment'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewInquiryScoreID'>
					<Control ID='ctlCategoryScore6'
						Type='cDropDown'
						Container='spnCategoryScore6'
						DataObjectDefinitionKey='LscReviewInquiryScore'
						StoredValue='LscReviewInquiryScoreID'
						DisplayValue='Value' 
						DisplayText='Select'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewAssignmentCategory7' DataObjectDefinitionKey='LscReviewAssignmentCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscReviewCategory7' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' />
			</Filters>
			<DefaultValues>
                <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
			    <Argument Type='DataObjectCollection' TypeKey='LscReviewCategory7' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtCategory7Comment'
						Type='cTextArea'
						Container='spnCategory7Comment'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewInquiryScoreID'>
					<Control ID='ctlCategoryScore7'
						Type='cDropDown'
						Container='spnCategoryScore7'
						DataObjectDefinitionKey='LscReviewInquiryScore'
						StoredValue='LscReviewInquiryScoreID'
						DisplayValue='Value' 
						DisplayText='Select'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

        <DataObject Key='LscReviewAssignmentCategory8' DataObjectDefinitionKey='LscReviewAssignmentCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscReviewCategory8' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' />
			</Filters>
			<DefaultValues>
                <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
			    <Argument Type='DataObjectCollection' TypeKey='LscReviewCategory8' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtCategory8Comment'
						Type='cTextArea'
						Container='spnCategory8Comment'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewInquiryScoreID'>
					<Control ID='ctlCategoryScore8'
						Type='cDropDown'
						Container='spnCategoryScore8'
						DataObjectDefinitionKey='LscReviewInquiryScore'
						StoredValue='LscReviewInquiryScoreID'
						DisplayValue='Value' 
						DisplayText='Select'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
        
        <DataObject Key='LscReviewAssignmentCategory9' DataObjectDefinitionKey='LscReviewAssignmentCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscReviewCategory9' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' />
			</Filters>
			<DefaultValues>
                <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
			    <Argument Type='DataObjectCollection' TypeKey='LscReviewCategory9' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtCategory9Comment'
						Type='cTextArea'
						Container='spnCategory9Comment'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewInquiryScoreID'>
					<Control ID='ctlCategoryScore9'
						Type='cDropDown'
						Container='spnCategoryScore9'
						DataObjectDefinitionKey='LscReviewInquiryScore'
						StoredValue='LscReviewInquiryScoreID'
						DisplayValue='Value' 
						DisplayText='Select'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='LscReviewAssignmentCategory10' DataObjectDefinitionKey='LscReviewAssignmentCategory' Updatable='True' CreateNew='True'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' />
				<Argument Type='DataObjectCollection' TypeKey='LscReviewCategory10' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' />
			</Filters>
			<DefaultValues>
                <Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='WfTaskAssignmentID' Update='False' Create='True'/>
			    <Argument Type='DataObjectCollection' TypeKey='LscReviewCategory10' DataObjectPropertyKey='LscReviewCategory.LscReviewCategoryID' PropertyKey='LscReviewCategoryID' Update='False' Create='True'/>
			</DefaultValues>
			<DisplayProperties>
				<DisplayProperty PropertyKey='Comment'>
					<Control ID='txtCategory10Comment'
						Type='cTextArea'
						Container='spnCategory10Comment'
						Rows='5'
						Cols='100' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewInquiryScoreID'>
					<Control ID='ctlCategoryScore10'
						Type='cDropDown'
						Container='spnCategoryScore10'
						DataObjectDefinitionKey='LscReviewInquiryScore'
						StoredValue='LscReviewInquiryScoreID'
						DisplayValue='Value' 
						DisplayText='Select'/>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>


				
		<DataObject Key='Base' DataObjectDefinitionKey=''>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave1'
						Type='cButton'
						Caption='Save'
						Container='spnSaveb4Signifi'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave2'
						Type='cButton'
						Caption='Save'
						Container='spnSaveb4WebForms'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSave'
						Type='cButton'
						Caption='Save'
						Container='spnSave'>
						<Action PostBack='True'
							AutoSave='True' />
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveContinue'
						Type='cButton'
						Caption='Save and Continue'
						Container='spnSaveContinue'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PostPQVPA4' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnSaveClose'
						Type='cButton'
						Caption='Save and Close'
						Container='spnSaveClose'>
						<Action PostBack='True'
							AutoSave='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PostPQVForm' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnContinue'
						Type='cButton'
						Caption='Continue Without Saving'
						Container='spnContinue'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PostPQVPA4' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnClose'
						Type='cButton'
						Caption='Close'
						Container='spnClose'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='PostPQVForm' />
							</Parameters>	
						</Action>
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='ctlTrainingForm' Container='spnTrainingForm' Type='cLink' Caption='Click to view the Training Form'>
					  <Action PostBack='True' Object='EventController' Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
						<Parameters>			
							<Argument Value='PV_Training'/>					
				        <Argument Value='PageFrame=Print' />
						</Parameters>
					  </Action>
					</Control>
		       </DisplayProperty>
		       <DisplayProperty PropertyKey=''>
					<Control ID='ctlLegalWorkMngtForm' Container='spnLegalWorkMngtForm' Type='cLink' Caption='Click to view the Legal Work Management Form'>
					  <Action PostBack='True' Object='EventController' Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
						<Parameters>			
							<Argument Value='PV_Legal_Work_Mngt' />				
				        <Argument Value='PageFrame=Print' />
						</Parameters>
					  </Action>
					</Control>
		       </DisplayProperty>
		       <DisplayProperty PropertyKey=''>
					<Control ID='ctlCasehandling' Container='spnCasehandling' Type='cLink' Caption='Click to view the Casehandling Protocols Form'>
					  <Action PostBack='True' Object='EventController' Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
						<Parameters>			
							<Argument Value='PV_CaseHandling' />				
				        <Argument Value='PageFrame=Print' />
						</Parameters>
					  </Action>
					</Control>
		       </DisplayProperty>
		       <DisplayProperty PropertyKey=''>
					<Control ID='ctlCaseDevAct' Container='spnCaseDevAct' Type='cLink' Caption='Click to view the Case Development Activities Form'>
					  <Action PostBack='True' Object='EventController' Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
						<Parameters>			
							<Argument Value='PV_CaseDevelopment' />				
				        <Argument Value='PageFrame=Print' />
						</Parameters>
					  </Action>
					</Control>
		       </DisplayProperty>
		       <DisplayProperty PropertyKey=''>
					<Control ID='ctlPAIForm' Container='spnPAIForm' Type='cLink' Caption='Click to view the Private Attorney Involvement Form'>
					  <Action PostBack='True' Object='EventController' Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
						<Parameters>			
							<Argument Value='PV_PAI' />				
				        <Argument Value='PageFrame=Print' />
						</Parameters>
					  </Action>
					</Control>
		       </DisplayProperty>
		       <DisplayProperty PropertyKey=''>
					<Control ID='ctlRecruitPvtAtt' Container='spnRecruitPvtAtt' Type='cLink' Caption='Click to view the Methods Used to Recruit Private Attorneys Form'>
					  <Action PostBack='True' Object='EventController' Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
						<Parameters>			
							<Argument Value='PV_Recruit_PA' />				
				        <Argument Value='PageFrame=Print' />
						</Parameters>
					  </Action>
					</Control>
		       </DisplayProperty>
		       <DisplayProperty PropertyKey=''>
					<Control ID='ctlRetainPvtAttVol' Container='spnRetainPvtAttVol' Type='cLink' Caption='Click to view the Methods Used to Retain Private Attorney Volunteers Form'>
					  <Action PostBack='True' Object='EventController' Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
						<Parameters>			
							<Argument Value='PV_Retain_PA' />				
				        <Argument Value='PageFrame=Print' />
						</Parameters>
					  </Action>
					</Control>
		       </DisplayProperty>
		       <DisplayProperty PropertyKey=''>
					<Control ID='ctlAccompExcludingPAI' Container='spnAccompExcludingPAI' Type='cLink' Caption='Click to view the Accomplishments for Clients (Excluding PAI) Form'>
					  <Action PostBack='True' Object='EventController' Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
						<Parameters>			
							<Argument Value='PV_Accomplish_Clients' />				
				        <Argument Value='PageFrame=Print' />
						</Parameters>
					  </Action>
					</Control>
		       </DisplayProperty>
		       <DisplayProperty PropertyKey=''>
					<Control ID='ctlAccomplishThroughPAI' Container='spnAccomplishThroughPAI' Type='cLink' Caption='Click to view the Accomplishments for Clients through PAI Form'>
					  <Action PostBack='True' Object='EventController' Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
						<Parameters>			
							<Argument Value='PV_Accomplish_Clients_PAI' />				
				        <Argument Value='PageFrame=Print' />
						</Parameters>
					  </Action>
					</Control>
		       </DisplayProperty>
		        <DisplayProperty PropertyKey=''>
					<Control ID='ctlJusticeAndAdvocacy' Container='spnJusticeAndAdvocacy' Type='cLink' Caption='Click to view the Involvement with Justice and Advocacy Community Form'>
					  <Action PostBack='True' Object='EventController' Method='LSC_EventController_NavigateFromModulePageKey_NewWindowOpener'>
						<Parameters>			
							<Argument Value='PV_Justice_Advocacy' />				
				        <Argument Value='PageFrame=Print' />
						</Parameters>
					  </Action>
					</Control>
		       </DisplayProperty>
			</DisplayProperties>
		</DataObject>
	  
	</ModuleSection>
</span>