ALTER TABLE LSC_PQV_RECOMMENDATION_SERVAREA
	ADD time_period_id INT

GO

UPDATE LSC_PQV_RECOMMENDATION_SERVAREA
	SET time_period_id = 17
