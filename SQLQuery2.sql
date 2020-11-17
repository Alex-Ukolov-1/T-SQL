 sp_configure 'show advanced options', 1;
   RECONFIGURE;
   GO
   sp_configure 'Ad Hoc Distributed Queries', 1;
   RECONFIGURE;
GO
   EXEC sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'AllowInProcess', 1
   GO
   EXEC sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'DynamicParameters', 1
   GO
  insert into Поставщик SELECT * FROM OPENDATASOURCE('Microsoft.ACE.OLEDB.12.0',
                                'Data Source=C:\Users\Lesha\Desktop\1\Книга1.xlsx;
                                 Extended Properties=Excel 12.0')...[Лист1$];