
GO
/****** Object:  View [dbo].[vTOTAL_PAYMENT]    Script Date: 09/09/2008 21:30:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[vTOTAL_PAYMENT]
AS
--SELECT     payment.grantee_project_id, SUM(payment_amount) AS payment_amount,
-- CASE WHEN SUM(dbo.PAYMENT.payment_amount) IS NULL THEN SUM(PAYMENT.payment_amount) 
--                      ELSE ('-' + CONVERT(varchar(100), SUM(dbo.PAYMENT.payment_amount))) END AS negative_format_payment_amount,
--SUM(requested_amount) AS requested_amount,
--CASE WHEN SUM(dbo.PAYMENT.requested_amount) IS NULL THEN SUM(PAYMENT.requested_amount) 
--                      ELSE ('-' + CONVERT(varchar(100), SUM(dbo.PAYMENT.requested_amount))) END AS negative_format_requested_amount,
--  ISNULL(gpi.award_amount, 0) - ISNULL(SUM(dbo.PAYMENT.payment_amount), 0) as payments_remaining_balance, 
--ISNULL(gpi.award_amount, 0) - ISNULL(SUM(dbo.PAYMENT.requested_amount), 0) as requested_amount_remaining_balance
--FROM dbo.PAYMENT left outer join grantee_project_info gpi on payment.grantee_project_id = gpi.grantee_project_id   
--GROUP BY payment.grantee_project_id, gpi.award_amount
SELECT     gpi.grantee_project_id, ISNULL(gpi.award_amount, 0) as award_amount, ISNULL(SUM(payment_amount), 0) AS payment_amount,
 CASE WHEN SUM(dbo.PAYMENT.payment_amount) IS NULL THEN SUM(PAYMENT.payment_amount) 
                      ELSE ('-' + CONVERT(varchar(100), SUM(dbo.PAYMENT.payment_amount))) END AS negative_format_payment_amount,
  ISNULL(gpi.award_amount, 0) - ISNULL(SUM(dbo.PAYMENT.payment_amount), 0) as payments_remaining_balance
FROM dbo.PAYMENT right outer join grantee_project_info gpi   on payment.grantee_project_id = gpi.grantee_project_id and PAYMENT.request_status_id = 4
GROUP BY gpi.grantee_project_id, gpi.award_amount


