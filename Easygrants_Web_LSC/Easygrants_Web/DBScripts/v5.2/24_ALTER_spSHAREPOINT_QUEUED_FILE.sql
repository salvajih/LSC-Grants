
ALTER  PROCEDURE [dbo].[spSHAREPOINT_QUEUED_FILE]
AS
	set nocount on
	
	select	SF.submitted_file_id as SubmittedFileID from SUBMITTED_FILE SF ,  s_SHAREPOINT_INTEGRATION SI
	where	(SF.conversion_status = -1) 
	and (SF.sharepoint_conversion_status = 0 or SF.sharepoint_conversion_status is null or SF.sharepoint_conversion_status = 1 or SF.sharepoint_conversion_status = 2) 
	and (SI.Active = 'True')
	order by SF.sharepoint_conversion_status