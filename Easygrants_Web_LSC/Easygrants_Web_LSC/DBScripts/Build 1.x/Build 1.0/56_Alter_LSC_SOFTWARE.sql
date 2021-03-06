/*
   Wednesday, March 05, 20085:14:57 PM
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
ALTER TABLE dbo.LSC_SOFTWARE
	DROP CONSTRAINT DF_LSC_SOFTWARE_in_use
GO
CREATE TABLE dbo.Tmp_LSC_SOFTWARE
	(
	lsc_software_id int NOT NULL,
	lsc_software_product_id int NULL,
	grantee_project_id int NULL,
	wf_task_assignment_id int NULL,
	in_use bit NULL,
	version varchar(50) NULL,
	percent_staff int NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_LSC_SOFTWARE ADD CONSTRAINT
	DF_LSC_SOFTWARE_in_use DEFAULT ((0)) FOR in_use
GO
IF EXISTS(SELECT * FROM dbo.LSC_SOFTWARE)
	 EXEC('INSERT INTO dbo.Tmp_LSC_SOFTWARE (lsc_software_id, lsc_software_product_id, grantee_project_id, in_use, version, percent_staff)
		SELECT lsc_software_id, lsc_software_product_id, grantee_project_id, in_use, version, percent_staff FROM dbo.LSC_SOFTWARE WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.LSC_SOFTWARE
GO
EXECUTE sp_rename N'dbo.Tmp_LSC_SOFTWARE', N'LSC_SOFTWARE', 'OBJECT' 
GO
ALTER TABLE dbo.LSC_SOFTWARE ADD CONSTRAINT
	PK_LSC_SOFTWARE PRIMARY KEY CLUSTERED 
	(
	lsc_software_id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
