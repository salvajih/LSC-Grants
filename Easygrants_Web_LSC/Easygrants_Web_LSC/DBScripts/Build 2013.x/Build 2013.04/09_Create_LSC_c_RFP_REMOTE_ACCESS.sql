
CREATE TABLE [dbo].[LSC_c_RFP_REMOTE_ACCESS_PORTION]
   (
	[id] [int] NOT NULL,
	[abbr] [varchar](10) ,
	[description] [varchar](60) ,
	[sort_order] [int] NULL,
	[End_date] [datetime] NULL
   )


INSERT INTO [LSC_c_RFP_REMOTE_ACCESS_PORTION]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (1
           ,'All'
           ,'All or almost all staff (90% or more)'
           ,1)


INSERT INTO [LSC_c_RFP_REMOTE_ACCESS_PORTION]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (2
           ,'Most'
           ,'Most staff (50% - 89%)'
           ,2)


INSERT INTO [LSC_c_RFP_REMOTE_ACCESS_PORTION]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (3
           ,'Some'
           ,'Some staff (20% - 49%)'
           ,3)


INSERT INTO [LSC_c_RFP_REMOTE_ACCESS_PORTION]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (4
           ,'Few'
           ,'Few staff (less than 20% but more than zero)'
           ,4)


INSERT INTO [LSC_c_RFP_REMOTE_ACCESS_PORTION]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order])
     VALUES
           (5
           ,'None'
           ,'No staff'
           ,5)