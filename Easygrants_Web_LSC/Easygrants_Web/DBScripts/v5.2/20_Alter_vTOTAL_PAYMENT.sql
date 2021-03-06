
GO
/****** Object:  View [dbo].[vTOTAL_PAYMENT]    Script Date: 09/08/2008 12:05:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[vTOTAL_PAYMENT]
AS
SELECT     payment.grantee_project_id, SUM(payment_amount) AS payment_amount,
 CASE WHEN SUM(dbo.PAYMENT.payment_amount) IS NULL THEN SUM(PAYMENT.payment_amount) 
                      ELSE ('-' + CONVERT(varchar(100), SUM(dbo.PAYMENT.payment_amount))) END AS negative_format_payment_amount,
SUM(requested_amount) AS requested_amount,
CASE WHEN SUM(dbo.PAYMENT.requested_amount) IS NULL THEN SUM(PAYMENT.requested_amount) 
                      ELSE ('-' + CONVERT(varchar(100), SUM(dbo.PAYMENT.requested_amount))) END AS negative_format_requested_amount,
  ISNULL(gpi.award_amount, 0) - ISNULL(SUM(dbo.PAYMENT.payment_amount), 0) as payments_remaining_balance, 
ISNULL(gpi.award_amount, 0) - ISNULL(SUM(dbo.PAYMENT.requested_amount), 0) as requested_amount_remaining_balance
FROM dbo.PAYMENT left outer join grantee_project_info gpi on payment.grantee_project_id = gpi.grantee_project_id   
GROUP BY payment.grantee_project_id, gpi.award_amount

