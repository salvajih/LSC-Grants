CREATE TRIGGER LSC_a_REVIEW_INQUIRY_AFTER_INSERT
   ON dbo.LSC_a_REVIEW_INQUIRY
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;

    UPDATE LSC_a_REVIEW_INQUIRY
		SET base_inquiry_id = i.id
		FROM LSC_a_REVIEW_INQUIRY q
			JOIN inserted i ON q.id = i.id
END

GO
