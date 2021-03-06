<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cLSCDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' tagname='NewWindowOpener' src='../../../../Core/Controls/Base/NewWindowOpener.ascx' %>
<Core:NewWindowOpener id='ctlNewWindowOpener' runat='server' />

<div style="width:600px">
	<h1>Post-Submission</h1>
	<p>
		Thank you for submitting your reports. If you have any questions, please contact us using the support information at the bottom of the page.  
	</p>			
	<p>
		To view your submitted reports, click <b>View</b> below.
	</p>
	
	<span runat='server' id='spnViewWord'/>
	<br />
	<br />
	<span runat='server' id='spnViewExcel'/>
	<br />
	<br />
	<span runat='server' id='spnViewMisc'/>
</div>

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
       <DataObject Key='SubmittedFileWord' DataObjectDefinitionKey='SubmittedFile' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID' />
				<Argument PropertyKey='UploadId' Value='58'>
					<RelatedProperty PropertyKey='TaskUploadType' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnViewWord'
						Type='cButton'
						Container='spnViewWord'
						Image='View Disaster Narrative Report'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='DocumentList_ViewConvertedUploadedFile'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='SubmittedFileWord' DataObjectPropertyKey='SubmittedFileID'/>
							</Parameters>	
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		<DataObject Key='SubmittedFileExcel' DataObjectDefinitionKey='SubmittedFile' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID' />
				<Argument PropertyKey='UploadId' Value='59'>
					<RelatedProperty PropertyKey='TaskUploadType' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnViewExcel'
						Type='cButton'
						Container='spnViewExcel'
						Image='View Disaster Data Report'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='DocumentList_ViewConvertedUploadedFile'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='SubmittedFileExcel' DataObjectPropertyKey='SubmittedFileID'/>
							</Parameters>	
						</Action>	
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
		
		 <DataObject Key='SubmittedFileMisc' DataObjectDefinitionKey='SubmittedFile' Updatable='False' CreateNew='False' >
			<Filters>
				<Argument Type='ModuleUser' TypeKey='WfTaskAssignmentID' PropertyKey='EntityID' />
				<Argument PropertyKey='UploadId' Value='60'>
					<RelatedProperty PropertyKey='TaskUploadType' />
				</Argument>
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnViewMisc'
						Type='cButton'
						Container='spnViewMisc'
						Image='View Miscellaneous Documents'>
						<Action PostBack='True'
							Object='DataPresenter'
							Method='DocumentList_ViewConvertedUploadedFile'>
							<Parameters>
								<Argument Type='DataObjectCollection' TypeKey='SubmittedFileMisc' DataObjectPropertyKey='SubmittedFileID'/>
							</Parameters>	
						</Action>	
						<Visible>
							<Argument PropertyKey='SubmittedFileID' Value='0' Operator='GreaterThan' NullDataObject='False' />
						</Visible>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
		
	</ModuleSection>
</span>
