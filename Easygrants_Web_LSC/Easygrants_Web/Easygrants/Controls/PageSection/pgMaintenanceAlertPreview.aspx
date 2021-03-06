<%@ Page Language="vb" AutoEventWireup="true" Inherits="Core.Web.cCorePage" %>
<%--<%@ Register tagprefix='Core' tagname='Styles' src='../../../Implementation/Modules/Home/Controls/Style/HomeModuleStyle.ascx' %>--%>
<%@ Register Tagprefix='Easygrants' tagname='cMaintenanceAlertPreviewHtml' src='MaintenanceAlertPreviewHtml.ascx' %>
	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>Maintenance Alert Preview</title>
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.DefaultStylesPath%>" />
	<link rel="stylesheet" type="text/css" href="<%=WebAppl.ClientStylesPath%>" />
</head>
<body>
<%--<Core:Styles id='ctlStyles' runat='server'/>--%>
	<form name='frmMain' runat='server'>
		<span id='spnMaintenanceAlertPreviewHtml' visible='true' runat='server'>
			<Easygrants:cMaintenanceAlertPreviewHtml id='ctlMaintenanceAlertPreviewHtml' runat='server'/>
		</span>
	</form>
	<script type="text/javascript">
		var trackKey = new String('<%=WebAppl.GetSystemSetting("GoogleAnalytics") %>');
		if (trackKey != "") {
			var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
			document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
		}
	</script>
	<script type="text/javascript">
		var trackKey = new String('<%=WebAppl.GetSystemSetting("GoogleAnalytics") %>');
		if (trackKey != "") {
			var pageTracker = _gat._getTracker(trackKey);
			pageTracker._trackPageview();
		}
	</script>
</body>
</html>
