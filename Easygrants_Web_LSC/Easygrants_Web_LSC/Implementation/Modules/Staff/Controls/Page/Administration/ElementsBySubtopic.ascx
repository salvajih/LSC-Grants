<%@ Control Language="vb" AutoEventWireup="true" Inherits="Core_Web.Controls.Base.cDataPresenterCtl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<b>Competition Year</b>: <span runat='server' id='spnCompetitionYear' /><br />
<b>Performance Area</b>: <span runat='server' id='spnPerformanceArea' /><br />
<b>Category</b>: <span runat='server' id='spnCategory' /><br />
<b>Criterion</b>: <span runat='server' id='spnCriterion' /><br />
<b>Inquiry</b>: <span runat='server' id='spnInquiry' /><br />
<b>Subtopic</b>: <span runat='server' id='spnSubtopic' /><br /><br />

<br /><span runat='server' id='spnAdd' />
<div style="height:5pt" >&nbsp;</div>
<div width='100%' class='SeparatorHdg'>
	Strong Elements
</div>
<span runat='server' id='spnStrongElements' />
<div style="height:10pt" >&nbsp;</div>
<div width='100%' class='SeparatorHdg'>
	Weak Elements
</div>
<span runat='server' id='spnWeakElements' />
<div style="height:10pt" >&nbsp;</div>
<div width='100%' class='SeparatorHdg'>
	Sufficient Elements
</div>
<span runat='server' id='spnSufficientElements' />
<br />
<span runat='server' id='spnUp' />

<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
		<DataObject Key='LscReviewSubtopic' DataObjectDefinitionKey='LscReviewSubtopic' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='SubtopicID' PropertyKey='LscReviewSubtopicID' />
			</Filters>
			<DisplayProperties>
				<DisplayProperty PropertyKey='LscReviewInquiry.LscReviewCriterion.LscReviewCategory.LscReviewPerformanceArea.TimePeriod.Abbr'>
					<Control ID='spnCompetitionYear'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewInquiry.LscReviewCriterion.LscReviewCategory.LscReviewPerformanceArea.SortOrder'>
					<Control ID='spnPerformanceArea'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewInquiry.LscReviewCriterion.LscReviewCategory.Description'>
					<Control ID='spnCategory'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewInquiry.LscReviewCriterion.Abbr'>
					<Control ID='spnCriterion'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='LscReviewInquiry.Abbr'>
					<Control ID='spnInquiry'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey='Abbr'>
					<Control ID='spnSubtopic'
						Type='HtmlGenericControl' />
				</DisplayProperty>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnUp'
						Type='cButton'
						Container='spnUp'
						Caption='Up to Subtopics'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='Subtopics' />
								<Argument Type='DataObjectCollection' TypeKey='LscReviewSubtopic' DataObjectPropertyKey='LscReviewInquiryID' BaseValue='InquiryID='/>
							</Parameters>
						</Action>
						
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='StrongElements' DataObjectDefinitionKey='LscReviewElement' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='SubtopicID' PropertyKey='LscReviewSubtopicID' />
				<Argument PropertyKey='LscReviewElementTypeID' Value='1' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey=''>
					<Control ID='btnAdd'
						Type='cButton'
						Container='spnAdd'
						Caption='Add Element'>
						<Action PostBack='True'
							Object='EventController'
							Method='EventController_NavigateToModulePageKey'>
							<Parameters>
								<Argument Value='ElementEditorBySubtopic'/>
								<Argument Type='QueryString' TypeKey='SubtopicID' BaseValue='SubtopicID=' />
								<Argument Value='ElementID=0' />
							</Parameters>	
						</Action>	
					</Control>
				</DisplayProperty>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlStrongElements'
						Type='cDataListCtl'
						Container='spnStrongElements'
						DataObjectDefinitionKey='LscReviewElement'>
						<DisplayProperty PropertyKey='SortOrder' ColumnHeader='Number' />
						<DisplayProperty PropertyKey='Description' />
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderAlign='Center' DataAlign='Center'  >
							<Control ID='btnEditStrong'
								Type='cButton'
								Caption='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ElementEditorBySubtopic'/>
										<Argument Type='DataObject' TypeKey='LscReviewElementID' AttributeName='ElementID' BaseValue='ElementID=' />
										<Argument Type='DataObject' TypeKey='LscReviewSubtopicID' AttributeName='SubtopicID' BaseValue='SubtopicID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='WeakElements' DataObjectDefinitionKey='LscReviewElement' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='SubtopicID' PropertyKey='LscReviewSubtopicID' />
				<Argument PropertyKey='LscReviewElementTypeID' Value='2' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlWeakElements'
						Type='cDataListCtl'
						Container='spnWeakElements'
						DataObjectDefinitionKey='LscReviewElement'>
						<DisplayProperty PropertyKey='SortOrder' ColumnHeader='Number' />
						<DisplayProperty PropertyKey='Description' />
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderAlign='Center' DataAlign='Center'  >
							<Control ID='btnEditWeak'
								Type='cButton'
								Caption='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ElementEditorBySubtopic'/>
										<Argument Type='DataObject' TypeKey='LscReviewElementID' AttributeName='ElementID' BaseValue='ElementID=' />
										<Argument Type='DataObject' TypeKey='LscReviewSubtopicID' AttributeName='SubtopicID' BaseValue='SubtopicID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

		<DataObject Key='SufficientElements' DataObjectDefinitionKey='LscReviewElement' Updatable='False' CreateNew='False'>
			<Filters>
				<Argument Type='QueryString' TypeKey='SubtopicID' PropertyKey='LscReviewSubtopicID' />
				<Argument PropertyKey='LscReviewElementTypeID' Value='3' />
			</Filters>
			<Sort>
				<Argument PropertyKey='SortOrder'/>
			</Sort>
			<DisplayProperties>
				<DisplayProperty PropertyKey='DataObjectDefinitionKey' HtmlEncode='False'>
					<Control ID='ctlSufficientElements'
						Type='cDataListCtl'
						Container='spnSufficientElements'
						DataObjectDefinitionKey='LscReviewElement'>
						<DisplayProperty PropertyKey='SortOrder' ColumnHeader='Number' />
						<DisplayProperty PropertyKey='Description' />
						<DisplayProperty PropertyKey='' ColumnHeader='Options' HeaderAlign='Center' DataAlign='Center'  >
							<Control ID='btnEditSufficient'
								Type='cButton'
								Caption='Edit'>
								<Action
									PostBack='True'
									Object='EventController'
									Method='EventController_NavigateToModulePageKey'>
									<Parameters>
										<Argument AttributeName='PageKey' Value='ElementEditorBySubtopic'/>
										<Argument Type='DataObject' TypeKey='LscReviewElementID' AttributeName='ElementID' BaseValue='ElementID=' />
										<Argument Type='DataObject' TypeKey='LscReviewSubtopicID' AttributeName='SubtopicID' BaseValue='SubtopicID=' />
									</Parameters>
								</Action>
							</Control>
						</DisplayProperty>
					</Control>
				</DisplayProperty>
			</DisplayProperties>
		</DataObject>

	</ModuleSection>
	<!-- End Embedded XML -->
</span>
