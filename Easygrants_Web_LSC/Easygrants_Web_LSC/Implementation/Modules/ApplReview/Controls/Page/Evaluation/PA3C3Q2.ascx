<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ApplReview.Controls.PageSection.cEvaluation" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader CtlID='ctlEval'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/Evaluation.ascx'
	Properties='PA=3&C=3&Q=2'
	runat='server'/>


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>
