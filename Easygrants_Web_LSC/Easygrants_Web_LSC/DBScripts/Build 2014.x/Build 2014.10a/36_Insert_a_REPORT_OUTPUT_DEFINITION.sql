insert a_report_output_definition
	(report_output_definition_id
	,definition_key
	,description
	,entity_dataobject_key
	,output_MIME_type
	,delete_on_view)
	values(82
		,'PBIFPresReview'
		,'PBIF President Review'
		,'WfTaskAssignment'
		,'application/pdf'
		,0)

update s_id_gen
	set next_id = 83
	where table_name = 'a_report_output_definition'
