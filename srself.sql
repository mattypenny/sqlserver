SELECT TOP 1000 -- [InstanceName]
      [ItemPath]
      ,[UserName]
      -- ,[ExecutionId]
      ,substring([RequestType], 1, 1)
      ,[Format]
      ,[ItemAction]
      ,convert(varchar(10),[TimeStart], 2) + ' ' + convert(varchar(10),[TimeStart], 108) as Started
      ,convert(varchar(10),[TimeEnd], 2) + ' ' + convert(varchar(10),[TimeEnd], 108) as Ended
      ,[TimeDataRetrieval] as Data
      ,[TimeProcessing] as Pro
      ,[TimeRendering] as Rend
      ,[Source]
      ,[Status]
      ,[ByteCount]
      ,[RowCount]
 	  ,[Parameters]
      ,[AdditionalInfo]
      ,[TimeStart]
      ,[TimeEnd]
      FROM [dbo].[ExecutionLog3]
  where timestart > getdate() - 100
  and status <> 'rsSuccess'
  order by TimeStart desc
