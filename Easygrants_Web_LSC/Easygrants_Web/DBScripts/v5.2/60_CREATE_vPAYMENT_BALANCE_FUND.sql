
CREATE View [dbo].[vPAYMENT_BALANCE_FUND] AS
SELECT grantee_project_id , request_account_fund_id , SUM(ISNULL(payment_amount,requested_amount)) as TotAmount FROM payment
Group BY grantee_project_id , request_account_fund_id