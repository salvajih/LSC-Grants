

ALTER  PROCEDURE [dbo].[spSHAREPOINT_QUEUED_REPORT]
AS
SELECT RO.report_output_id AS ReportOutputID 
FROM REPORT_OUTPUT RO ,  s_SHAREPOINT_INTEGRATION SI
WHERE (status = -1 )  
and (RO.sharepoint_conversion_status = 0 or RO.sharepoint_conversion_status is null or RO.sharepoint_conversion_status = 1 or RO.sharepoint_conversion_status = 2)  
and (SI.Active = 'True') 
and definition_id <> 1 and definition_id <> 8 -- 1 and 8 are ids for staff query report and word merge
ORDER BY RO.sharepoint_conversion_status