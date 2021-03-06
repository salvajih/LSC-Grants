
GO
/****** Object:  View [dbo].[vTOTAL_PAYMENT_SCHEDULED]    Script Date: 01/29/2009 09:56:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vTOTAL_PAYMENT_SCHEDULED]
AS
SELECT     gpi.grantee_project_id, ISNULL(gpi.award_amount, 0) AS award_amount, SUM(dbo.PAYMENT.requested_amount) AS requested_amount, 
                      SUM(dbo.PAYMENT.requested_amount) * - 1 AS negative_format_requested_amount, ISNULL(gpi.award_amount, 0) 
                      - ISNULL(SUM(dbo.PAYMENT.requested_amount), 0) AS requested_amount_remaining_balance
FROM         dbo.PAYMENT RIGHT OUTER JOIN
                      dbo.GRANTEE_PROJECT_INFO AS gpi ON dbo.PAYMENT.grantee_project_id = gpi.grantee_project_id
GROUP BY gpi.grantee_project_id, gpi.award_amount

GO