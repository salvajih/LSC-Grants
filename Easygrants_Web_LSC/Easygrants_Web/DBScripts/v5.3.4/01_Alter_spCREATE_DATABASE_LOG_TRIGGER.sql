
/*
Developer		: 	Vikram Kumar Alle
Date			:	06/25/2009
Modification	:	Updated getid_sel to use Mode 2 as mode 1 returns select statement which causing issue if any stored procedure returns select statement.
*/

GO
/****** Object:  StoredProcedure [dbo].[spCREATE_DATABASE_LOG_TRIGGER]    Script Date: 06/23/2009 14:18:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spCREATE_DATABASE_LOG_TRIGGER]
		@RestrictUser	varchar(500),
		@RestrictTablesList Varchar(5000)

AS

DECLARE @tableName varchar(200),
	    @str nvarchar(4000),
		@str1 nvarchar(4000),
		@database_log_id varchar(100),
		@triggername varchar(500),
		@PrimaryID varchar(500),
		@IsExists int,
		@IsTableExists int

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- By default DATABASE_LOG AND S_ID_GEN Tables added to @RestrictTablesList variable
	set @RestrictTablesList = 'DATABASE_LOG,s_ID_GEN,' + @RestrictTablesList + ','


	DECLARE systables_cursor CURSOR
		FOR SELECT name as tableName FROM sys.Tables order by name
	OPEN systables_cursor
	FETCH NEXT FROM systables_cursor INTO @tableName

	WHILE @@FETCH_STATUS = 0
	BEGIN
		-- Assigning a trigger name to a Variable
		SET @triggername = 't_' + @tableName + '_DBLOG'

		-- If trigger already exists with the name then trigger is droped.
		IF exists (SELECT * FROM dbo.sysobjects WHERE id = object_id(@triggername) and OBJECTPROPERTY(id, N'Istrigger') = 1)
	    BEGIN
			SET @str1 = 'DROP TRIGGER t_' + @tableName + '_DBLOG'
			EXECUTE sp_executesql @str1
		End
		
		-- Here if the Table exists in @RestrictTablesList variable then PATINDEX returns that particular index 
		SELECT @IsTableExists = PATINDEX('%' + @tableName + ',%',@RestrictTablesList)
		-- Here we are checking for the Tables whether it contains text,ntext,image as one of their column.
		SELECT @IsExists = COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name=@tableName AND  DATA_TYPE IN ('text','ntext','image')

		IF  (@IsExists >= 1)
		BEGIN
			PRINT 'Trigger Cannot be created for ' + @tableName + ' Table as it contains text,ntext or imgae  as column datatype' 
		END
		ELSE IF(@IsTableExists >= 1)
		BEGIN
			PRINT 'Trigger NOT created for ' + @tableName + ' Table '
		END
		ELSE
		BEGIN
			SELECT @PrimaryID = c.name FROM sysindexes i 
			join sysobjects o ON i.id = o.id 
			join sysobjects pk ON i.name = pk.name AND pk.parent_obj = i.id AND pk.xtype = 'PK'
			join sysindexkeys ik on i.id = ik.id and i.indid = ik.indid
			join syscolumns c ON ik.id = c.id AND ik.colid = c.colid
		    WHERE o.name = @tableName ORDER BY ik.keyno

			--PRINT @PrimaryID
			-- Creating a new trigger.
			SET @str = '
				CREATE TRIGGER ' + @triggername + 
				' ON ' + @tableName + ' FOR INSERT,UPDATE,DELETE
				AS
				BEGIN
					DECLARE @IsIns int, @IsDel int,@database_log_id int,@PkeyVal int,@PKeyValDel int,@PkeyValUpdate int
					DECLARE @ColumnName varchar(100),@ColumnValue varchar(8000),@ColumnValue1 varchar(8000),@strSQL nvarchar(4000),@value varchar(8000),@Orginalvalues varchar(8000), @DBUsrName varchar(8000),@PKey varchar(500)
					SELECT @IsIns = 0, @IsDel = 0
					SELECT @IsIns = 1 from inserted
					SELECT @IsDel = 1 from deleted
					--SELECT @database_log_id = MAX(database_log_id) + 1 FROM Database_log
					--EXEC @database_log_id = getid_sel @table=''DATABASE_LOG''
					SET @Orginalvalues=''''
					SELECT @DBUsrName = user_name()
					
					IF @IsIns > @IsDel
					BEGIN
						SELECT * Into #NEWTABLEINSERT FROM inserted
						DECLARE inserted_rows CURSOR
							FOR SELECT ' + @PrimaryID + '  from #NEWTABLEINSERT 
						OPEN inserted_rows
							FETCH NEXT FROM inserted_rows INTO @PKey
						WHILE @@FETCH_STATUS = 0 
						BEGIN
							EXEC @database_log_id = getid_sel @table=''DATABASE_LOG'', @mode = 2
							if(''' + @RestrictUser + ''' != @DBUsrName)
								INSERT INTO DATABASE_LOG (database_log_id,user_id,change_date,table_name,primary_key,original_values,change_type,db_user_id,from_trigger) values (@database_log_id , 0 ,GETDATE(),''' + @tableName + ''', @PKey ,'''', ''insert'',@DBUsrName,''true'')

							FETCH NEXT FROM inserted_rows INTO @PKey
						END 
						CLOSE inserted_rows
						DEALLOCATE inserted_rows	
						DROP TABLE #NEWTABLEINSERT
					END 
				
					IF (@IsIns < @IsDel) or (@IsIns = @IsDel)
					BEGIN
						SELECT * Into #NEWTABLE FROM deleted
							DECLARE deleted_rows CURSOR
							FOR SELECT ' + @PrimaryID + ' from #NEWTABLE 
						OPEN deleted_rows
							FETCH NEXT FROM deleted_rows INTO @PKey
						WHILE @@FETCH_STATUS = 0 
						BEGIN
							DECLARE tables_Colums CURSOR
								FOR SELECT  c1.COLUMN_NAME FROM INFORMATION_SCHEMA.TABLES  t1 
								INNER JOIN INFORMATION_SCHEMA.COLUMNS c1 ON t1.TABLE_NAME = c1.TABLE_NAME 
								WHERE  t1.TABLE_NAME = ''' + @tableName + '''
							OPEN tables_Colums
								FETCH NEXT FROM tables_Colums INTO @ColumnName
							WHILE @@FETCH_STATUS = 0
							BEGIN
								SET @strSQL= (''select @ColumnValue = '' + @ColumnName + '' FROM #NEWTABLE WHERE ' + @PrimaryID + ' = '' + @PKey )
								EXEC sp_executeSql @strSQL, N''@ColumnValue varchar(8000) out'', @ColumnValue out
								SELECT @ColumnValue1=@ColumnValue
								IF (@columnValue1 is NULL)
									SET @value = @ColumnName + ''=null~^''
								ELSE
									SET @value = @ColumnName + ''='' + @ColumnValue1 + ''~^''
	
								SET @Orginalvalues = @Orginalvalues + @Value 
								FETCH NEXT FROM tables_Colums INTO @ColumnName
							END
							CLOSE tables_Colums
							DEALLOCATE tables_Colums
							EXEC @database_log_id = getid_sel @table=''DATABASE_LOG'', @mode = 2
							IF @IsIns < @IsDel
								if(''' + @RestrictUser + ''' != @DBUsrName) 
									INSERT INTO DATABASE_LOG (database_log_id,user_id,change_date,table_name,primary_key,original_values,change_type,db_user_id,from_trigger) values (@database_log_id , 0 ,GETDATE(),''' + @tableName + ''', @PKey ,@Orginalvalues, ''delete'',@DBUsrName,''true'')
							ELSE IF @IsIns = @IsDel
								if(''' + @RestrictUser + ''' != @DBUsrName)
									INSERT INTO DATABASE_LOG (database_log_id,user_id,change_date,table_name,primary_key,original_values,change_type,db_user_id,from_trigger) values (@database_log_id , 0 ,GETDATE(),''' + @tableName + ''', @PKey ,@Orginalvalues, ''update'',@DBUsrName,''true'')
	
							SET @Orginalvalues=''''
							FETCH NEXT FROM deleted_rows INTO @PKey
						END 
						CLOSE deleted_rows
						DEALLOCATE deleted_rows	
						DROP TABLE #NEWTABLE
					END
				END'
			--print @str
			EXECUTE sp_executesql @str
		END
				
	   FETCH NEXT FROM systables_cursor INTO @tableName
	   
	END
	CLOSE systables_cursor
    DEALLOCATE systables_cursor

END

GO
