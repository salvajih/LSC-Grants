<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<br />
<div class='SeparatorHdg'>TIG Application Review - Open/Replication/Website Improvement</div>
<br />
<span runat='server' id='spnReviews' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscToDoListTigAppReviewORWI' DataObjectDefinitionKey='LscToDoListTigAppReviewORWI' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='ModuleUser' TypeKey='PersonID' PropertyKey='PersonID' />
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='LessThanEqual' PropertyKey='StartDate'/>
				<Argument Type='CurrentDateTime' TypeKey='DateTime' Operator='GreaterThanEqual' PropertyKey='EndDate'/>
				<Argument PropertyKey='WfTaskID' Value='43' />
			</Filters>
			<Sort>
				<Argument PropertyKey='ReviewAssignmentTypeID' />
				<Argument PropertyKey='Tig' />
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey'>
					<Control ID='ctlReviews'
						Type='cDataListCtl'
						Container='spnReviews'
						DataObjectDefinitionKey='LscToDoListTigAppReviewORWI'
						SeparatorWidth='2'
						MaxPerPage='15'
						NoRecordMessage='There are no current TIG Open/Replication/Website Improvement Application Review items.'>
						<DisplayProperty PropertyKey='tig' ColumnHeader='TIG'>
							<Parameters>
								<Argument Value='2' ValueKey='WfTaskStatusID' Operator='GreaterThanEqual' DisplayValue='' PropertyKey='tig' />
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='LessThanEqual' DisplayValue='' PropertyKey='tig'/>
								<Argument Value='CurrentDate' ValueKey='CloseDate' Operator='GreaterThanEqual' DisplayValue='Control' PropertyKey='tig'>
									<Control ID='ctlLink2'
										Type='cLink'>
										<Action
											PostBack='True'
											Object='WebSession'
											Method='RedirectToModule'>
											<Parameters>
												<Argument AttributeName='PageKey1' Type='DataObject' TypeKey='ModuleName' />
												<Argument AttributeName='PageKey2' Type='DataObject' TypeKey='ModuleConfigFilename' />
												<Argument AttributeName='PageKey3' Value='' />
												<Argument AttributeName='PageKey4' Type='DataObject' TypeKey='WfTaskAssignmentID' Value='' />
											</Parameters>
										</Action>
									</Control>
								</Argument>
							</Parameters>
						</DisplayProperty>
						<DisplayProperty PropertyKey='OrganizationName' ColumnHeader='Organization' >
							<Sortable>
								<Argument PropertyKey='OrganizationName' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='ReviewAssignmentType' ColumnHeader='Assignment Type' >
							<Sortable>
								<Argument PropertyKey='ReviewAssignmentType' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='Purpose' ColumnHeader='Purpose' >
						    <Sortable>
								<Argument PropertyKey='Purpose' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='StaffReviewCompleted' ColumnHeader='Staff Reviews Completed' Format='YesNo' >
						    <Sortable>
								<Argument PropertyKey='StaffReviewCompleted' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='DataEntryCompleted' ColumnHeader='Completed' Format='YesNo' >
						    <Sortable>
								<Argument PropertyKey='DataEntryCompleted' />
							</Sortable>
						</DisplayProperty>
						<DisplayProperty PropertyKey='WfTaskStatus' ColumnHeader='Status' >
							<Sortable>
								<Argument PropertyKey='WfTaskStatus' />
							</Sortable>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>
	</ModuleSection>
</span>