
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[vLSC_BUDGET_TIG_PERCENTAGES]
AS
SELECT	lsc_budget_tig_id,
        grantee_project_id,
		(cast(lsc_grantrequest_total as decimal)*100/nullif(cast(TOTAL as decimal),0)) percent1,
        (cast(programproject_total as decimal)*100/nullif(cast(TOTAL as decimal),0)) percent2,
		(cast(other_lsc_funded_partners as decimal)*100/nullif(cast(TOTAL as decimal),0)) percent3,
		(cast(non_lsc_funded_partners as decimal)*100/nullif(cast(TOTAL as decimal),0)) percent4,
		other_lsc_funded_partners + non_lsc_funded_partners	Total_Project_Budget,
		Round((cast(lsc_grantrequest_total as decimal)*100/nullif(cast(TOTAL as decimal),0)) +
		(cast(programproject_total as decimal)*100/nullif(cast(TOTAL as decimal),0)) +
		(cast(other_lsc_funded_partners as decimal)*100/nullif(cast(TOTAL as decimal),0)) +
		(cast(non_lsc_funded_partners as decimal)*100/nullif(cast(TOTAL as decimal),0)),1) TotalPercent
FROM vLSC_BUDGET_TIG












