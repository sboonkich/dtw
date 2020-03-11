USE [Pumpui]
GO

SELECT   'INSERT INTO [dbo].[TB_ITRAN] ([ITN_STS],[ITN_IDOCTYPE],[ITN_DOCNO],[ITN_DATE] ,[ITN_LINE],[ITN_DOCTYPE],[ITN_SYMBOL],[ITN_WHF] ,[ITN_WHT],[ITN_DESC],[ITN_GOODS],[ITN_QTY] ,[ITN_UM],[ITN_STOCKQTY],[ITN_STOCKKUM],[ITN_VALUE] ,[ITN_USER],[ITN_UDATE]) ',
         'values (0, ''22'',' ,  ''''+DocNo+'/'+RefDocNo+'''',',' ,''''+convert(varchar(10),DocDate,111)+'''' ,',', ((Seq+1)*10)+1,',9,1,' ,
       case SaleCode 
			when	'401'	then	'''1A'''
			when	'402'	then	'''1B'''
			when	'403'	then	'''1C'''
			when	'404'	then	'''1D'''
			when	'405'	then	'''1E'''
			when	'406'	then	'''1F'''
			when	'501'	then	'''2A'''
			when	'502'	then	'''2B'''
			when	'503'	then	'''2C'''
			when	'504'	then	'''2D'''
			when	'505'	then	'''2E'''
			when	'506'	then	'''2F'''
			when	'507'	then	'''2G'''
			when	'508'	then	'''2H'''
			when	'509'	then	'''2I'''
			when	'510'	then	'''2J'''
			when	'511'	then	'''2K'''
			when	'512'	then	'''2P'''
			when	'513'	then	'''2R'''
			when	'514'	then	'''2S'''
			when	'515'	then	'''2T'''
			when	'516'	then	'''2U'''
			when	'517'	then	'''2V'''
			when	'518'	then	'''2W'''
			when	'519'	then	'''2X'''
			when	'520'	then	'''2Y'''
			when	'521'	then	'''2Z'''
			when	'522'	then	'''3A'''
			when	'523'	then	'''3B'''
			when	'524'	then	'''3C'''
			when	'531'	then	'''2L'''
			when	'532'	then	'''2M'''
			when	'533'	then	'''2N'''
			when	'534'	then	'''2O'''
	   end  WHF ,','
	   ,''''''  WHT,','
	   , ''''+T1.Remark+'''',','
	   , ''''+T1.ProductCode+'''',',' 
	   ,T1.TransQty ,','
	   ,T1.UnitCode ,','
	   , T1.TransQty *tg.UnitRatio ,','
	   , 1,','
	   ,0,','
	   ,'''VANSD''',',',''''+convert(varchar(10),T1.UpdateDate,111)+''');'
--,	   *
  FROM [dbo].tbTransferItem T0 inner join tbTransferItemDetail T1
  on T0.InventoryID = T1.InventoryID 
                               inner join [tbProductDetail] tg
  on T1.ProductCode = tg.ProductCode 
  and T1.UnitCode = tg.UnitCode 							    
where DocDate >= '20200201' 
and DocStatus =2
;


--select top 100 * from [dbo].[tbProductDetail]




--select *
----distinct DocStatus
--FROM [dbo].tbTransferItem T0
--where 1=1
----and DocStatus=1
--and DocNo='764' 
--and RefDocNo='17';






