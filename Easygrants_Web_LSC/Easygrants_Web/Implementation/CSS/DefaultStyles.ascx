<%@ Control Language="vb" AutoEventWireup="false"  %>
<style>
<!--
	body, td {
		FONT-SIZE: 9pt;
		FONT-FAMILY: arial,helvetica,sans-serif;
	}

	body, td A{
		text-decoration: none
	}

	A:hover {
		text-decoration: underline;
	}

	.CSSButtonStyle{
        background-color: #EEEEEE;
        border: 2px #EEEEEE outset;
        padding: 1px 5px;
        color: black;
        height: 22px;
        vertical-align: middle;
        text-decoration: none;
        font: bold 100% arial,helvetica,sans-serif;
    }

    .CSSButtonStyle:visited{
        color: black;
    }

    .CSSButtonStyle:hover{
        border-style: inset;
        background-color: #B0C4DE;
        text-decoration: none;
        font: bold 100% arial,helvetica,sans-serif;
        padding: 1px 5px; /*shift text 1px to the right and down*/
    }

    .CSSButtonStyle:active{
        color: black;
    }

   	.MyEasygrantsTable {
		border: 0px solid #ffffff; 
		background-color: #ffffff; 
	}
	
	.MyEasygrantsRow1 {
		height: 24px;
	}

	.MyEasygrantsTabSelected {
		width: 150px;
		background-color: "#A2B5CD";
		border-right: 1px solid #a0a0a0;
		border-top: 1px solid #a0a0a0;
		border-left: 1px solid #a0a0a0;
		text-align: center;
		FONT-WEIGHT: bolder;
		FONT-SIZE: 10pt;
		padding: 1px;
		FONT-FAMILY: arial,helvetica,sans-serif;
	}

	.MyEasygrantsTabBorder {
		border-bottom: 5px solid #A2B5CD;
	}

	.MyEasygrantsTabSpace {
		width: 10px;
		background-color: "#ffffff";
		border-bottom: 1px solid #a0a0a0;
	}

	.MyEasygrantsTabSpaceLong {
		width: 120px;
		background-color: "#ffffff";
		border-bottom: 1px solid #a0a0a0;
	}

	.MyEasygrantsTabNotSelected {
		width: 150px;
		background-color: "#ebf2fa";
		text-align: center;
		border-right: 1px solid #a0a0a0;
		border-top: 1px solid #a0a0a0;
		border-left: 1px solid #a0a0a0;	
		border-bottom: 0px solid #a0a0a0;
		FONT-SIZE: 10pt;
		padding: 1px;
		FONT-FAMILY: arial,helvetica,sans-serif;
	}
	
	.CompetitionHdg {
		FONT-SIZE: 28pt;
		FONT-FAMILY: Garamond,Times;
		color: #000077;
		background-color: #ffffff;
	}
	
	.CompetitionHdgSmall {
		FONT-SIZE: 18pt;
		FONT-FAMILY: Garamond,Times;
		color: #000077;
		background-color: #ffffff;
	}

	.ModuleHdg {
		color: black;
		background-color: #A2B5CD;
	}

	.SeparatorHdg {
		color: #000000;
		FONT-WEIGHT: bolder;
		background-color: #A2B5CD;
	}
	.MinorSeparatorHdg {
		color: black;
		FONT-WEIGHT: bolder;
		background-color: #EEEEEE;
	}


	.CompetitionFooter {
		FONT-FAMILY: MS Sans Serif, Verdana, Arial, Helvetica;
		FONT-SIZE: 7pt;
		color: #336699;
	}

	.HelpNote {
		color: #39739c;
	}
	
	.AlertMessage {
		color: #0000ff;
		FONT-WEIGHT: bolder;
	}

	.NavigationStd {
		FONT-SIZE: 9pt;
		color: #666699;
		background-color: #A2B5CD;
	}
	.NavigationStd A {
		color: #000000;
		text-decoration: none;
	}
	.NavigationStd A:hover {
		color: #000000;
		text-decoration: underline;
		FONT-WEIGHT: bolder
	}
	
	.NavigationSel {
		FONT-SIZE: 9pt;
		color: #ffffff;
		background-color: #333367;
		FONT-WEIGHT: bolder
	}
	
	.NavigationSel A {
		FONT-SIZE: 9pt;
		color: #ffffff;
		background-color: #333367;
		FONT-WEIGHT: bolder
	}
	
	.NavigationSel A:hover {
		FONT-SIZE: 9pt;
		color: #ffffff;
		background-color: #333367;
		text-decoration: underline;
		FONT-WEIGHT: bolder
	}

	.NavigationDisabled {
		FONT-SIZE: 9pt;
		color: #CCCCCC;
		background-color: #eeeeee
		FONT-WEIGHT: bolder;
	}
	
	.ValidationSummary {
		background-color: #ffffff
	}
	
	.ValidationSummaryHeader {
		color: #ff0000;
		FONT-WEIGHT: bolder;
	}
	.FieldLabel {
		FONT-SIZE: 8pt;
		FONT-FAMILY: arial,helvetica,sans-serif;
	}
	
	.DebugText {
		FONT-SIZE: 8pt;
		FONT-FAMILY: Verdana,Tahoma, Arial;
	}	
	
	/*  styles for Message Box begins */

	.MessageBoxCssTitle {
		FONT-SIZE: 9pt;
		FONT-FAMILY: Arial;
		FONT-WEIGHT: bolder;
		color: #FFFFFF;
		background-color: #333367;
		cursor: Hand;
	}
			
	.MessageBoxCssMessage {
		FONT-SIZE: 8pt;
		FONT-FAMILY: Arial;
		FONT-WEIGHT: bolder;
		color: #000000;
		background-color: #eeeeee;
		border-color: #000000;	
		text-align: center;
	}
	
	/*  styles for Message Box ends */	
	
	
	/* styles for the datetextbox begins
	
	/* Default attributes of table container for entire calendar */
.table-style {
	font-family: arial;
	border-width: 1; 
	border-style: solid; 
	border-color: #a0a0a0; 
	background-color: #ffffff;
	font-family: arial; 
	font-size: 11px;
}

/* Default attributes of DIV containing table container for entire calendar.
 * You probably don't want to alter this style.
 */
.div-style {
	z-index: 999;
	position: absolute;
	visibility: hidden;
}

/* Default attributes used in calendar title (month and year columns).*/
.title-style {
	padding: 2px;
	font-family: arial; 
	font-size: 11px;
	color: #ffffff;
}

/* Default attributes used in calendar title background.*/
.title-background-style {
	/*background-color: #cee3ef;*/
	background-color: #9f9fff
}

/* Normal appearance of controls in calendar title. */
/* Note: The right, left and down icons are images, which must be edited if you need to change them. */
.title-control-normal-style {
	border-style: none;
/*	border-width: 1;
	border-color: black; */
	cursor: pointer;
}

/* Moused-over (selected) appearance of controls in calendar title. */
.title-control-select-style {
	/*border-style: solid;
	border-width: 1;
	border-color: #3a6ea5; */
	cursor: pointer;
}

/* Default attributes of drop down lists (month and year). */
.dropdown-style {
	font-family: arial; 
	font-size: 11px; 
	border-width: 1; 
	border-style: solid; 
	/*border-color: #a0a0a0;
	background-color: #cee3ef;*/
	background-color: #0066cc;
	border-color: #cccccc;
	color: White;
	cursor: default;
}

/* Default attributes selected (mouse-over) item in drop down lists (month and year). */
.dropdown-select-style {
	background-color: #3a6ea5;
	cursor: hand;
}

/* Default attributes unselected (mouse-off) item in drop down lists (month and year). */
.dropdown-normal-style {
	background-color: #0;
}

/* Default attributes of calendar body (weekday titles and numbers). */
.body-style {
	padding: 5px;
	/*background-color: #cee3ef;*/
	background-color: white;
	font-family: verdana; 
	font-size: 10px;
}

/* Attributes of current day in calendar body. */
.current-day-style {
	/*color: red;*/
	color: red;
	font-weight: bold;
	text-decoration: none;
}

/* Attributes of end-of-week days (Sundays) in calendar body. */
.end-of-weekday-style {
	color: #909090;
	text-decoration: none;
}

/* Attributes of all other days in calendar body. */
.normal-day-style {
	color: black;
	text-decoration: none;
}

/* Attributes of border around selected day in calendar body. */
.selected-day-style {
	border-style: solid;
	border-width: 1px; 
	border-color: #a0a0a0;
	color: #0066cc;
	font-weight: bold;
}

/* Default attributes of designated holidays. */
.holiday-style {
	background-color: #FFDDDD;
}

/* Attributes of today display at bottom on calendar */
.today-style {
	padding: 0px;
	color: white;
	/*background-color: #cee3ef;*/
	background-color: #9f9fff;
	text-align: center;
	text-decoration: none;
}

/* Attributes of week number division (divider.gif) */
.weeknumber-div-style {
	background-color: #d0d0d0; 
	padding: 0px;
}

.DatalistWordBreak {
	width: auto; word-break: break-all;}
	
.autocomplete_completionListElement 
{  
	visibility : hidden;
	margin : 0px!important;
	background-color : inherit;
	color : windowtext;
	border : buttonshadow;
	border-width : 1px;
	border-style : solid;
	cursor : 'default';
	overflow : auto;
	height : 200px;
    text-align : left; 
    list-style-type : none;
}

/* AutoComplete highlighted item */

.autocomplete_highlightedListItem
{
	background-color: #ffff99;
	color: black;
	padding: 1px;
}

/* AutoComplete item */

.autocomplete_listItem 
{
	background-color : window;
	color : windowtext;
	padding : 1px;
}

/* styles for the datetextbox ends
-->	
</style>