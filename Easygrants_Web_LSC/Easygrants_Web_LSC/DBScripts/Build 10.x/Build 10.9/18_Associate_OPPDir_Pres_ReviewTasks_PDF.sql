

--Associate OPP Dir Competition Review project tasks with PDF's
EXEC	spLSC_INSERT_PROJECT_TASK_COMP_REVIEW_OPPDIR_PDF
		@time_period_id = 17

--Associate President Competition Review project tasks with PDF's
EXEC	spLSC_INSERT_PROJECT_TASK_COMP_REVIEW_PRESIDENT_PDF
		@time_period_id = 17


-- Associate OPP Dir Renewal Review project tasks with PDF's
EXEC	spLSC_INSERT_PROJECT_TASK_RENEWAL_REVIEW_OPPDIR_PDF
		@time_period_id1 = 16,
		@time_period_id2 = 7

-- Associate President Renewal Review project tasks with PDF's
EXEC	spLSC_INSERT_PROJECT_TASK_RENEWAL_REVIEW_PRESIDENT_PDF
		@time_period_id1 = 16,
		@time_period_id2 = 7

