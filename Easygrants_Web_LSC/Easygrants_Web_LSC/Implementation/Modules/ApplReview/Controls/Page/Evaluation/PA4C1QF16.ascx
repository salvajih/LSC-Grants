<%@ Control Language="vb" AutoEventWireup="true" Inherits="Implementation.Modules.ApplReview.Controls.PageSection.cEvaluation" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>
<%@ Register Tagprefix='Core' Namespace='Core.Web.SvrCtls' Assembly='Core' %>

<Core:cUserCtlLoader ID="CUserCtlLoader1" CtlID='ctlEval'
	Src='Implementation/Modules/ApplReview/Controls/PageSection/Evaluation.ascx'
	Properties='PA=4&C=1&Q=F16'
	runat='server'/>


<span id='spnConfigXML' visible='false' runat='server'>
	<ModuleSection>
	</ModuleSection>
</span>