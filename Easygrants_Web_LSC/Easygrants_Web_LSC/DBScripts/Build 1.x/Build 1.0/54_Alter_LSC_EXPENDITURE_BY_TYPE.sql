/*
   Wednesday, March 05, 20085:11:43 PM
   User: sa
   Server: LSC-EGDEV
   Database: Easygrants_Migration
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_LSC_EXPENDITURE_BY_TYPE
	(
	lsc_expenditure_by_type_id int NOT NULL,
	grantee_project_id int NULL,
	wf_task_assignment_id int NULL,
	lsc_expenditure_type_id int NULL,
	amount float(53) NULL
	)  ON [PRIMARY]
GO
IF EXISTS(SELECT * FROM dbo.LSC_EXPENDITURE_BY_TYPE)
	 EXEC('INSERT INTO dbo.Tmp_LSC_EXPENDITURE_BY_TYPE (lsc_expenditure_by_type_id, grantee_project_id, lsc_expenditure_type_id, amount)
		SELECT lsc_expenditure_by_type_id, grantee_project_id, lsc_expenditure_type_id, amount FROM dbo.LSC_EXPENDITURE_BY_TYPE WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.LSC_EXPENDITURE_BY_TYPE
GO
EXECUTE sp_rename N'dbo.Tmp_LSC_EXPENDITURE_BY_TYPE', N'LSC_EXPENDITURE_BY_TYPE', 'OBJECT' 
GO
ALTER TABLE dbo.LSC_EXPENDITURE_BY_TYPE ADD CONSTRAINT
	PK_LSC_EXPENDITURE_BY_TYPE PRIMARY KEY CLUSTERED 
	(
	lsc_expenditure_by_type_id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
