--RECEIPT
SELECT RECEIPTKEY, CARRIERKEY, CARRIERNAME,type , STATUS, ADDDATE,ADDWHO
  FROM [SCPRD].[wmwhse1].[RECEIPT]
  WHERE ADDDATE > '20230224'
  and CARRIERNAME not in( 'РЦ ЛЬВІВ ТОВ РУШ', 'Курінна Ж. В. ЧП перевозчик', 'Інтернет-магазин Єва Львів')

--RECEIPTDETAIL
SELECT RECEIPTKEY, RECEIPTLINENUMBER, RD.SKU, S.DESCR, QTYEXPECTED, QTYRECEIVED, TOLOC, TOID, TOLOT, RD.STATUS, RD.LOTTABLE05
FROM [SCPRD].[wmwhse1].[RECEIPTDETAIL] RD 
JOIN [SCPRD].[wmwhse1].SKU S ON S.SKU = RD.SKU
WHERE RD.ADDDATE > '20230224'

--ORDERS
SELECT TOP (100) [ORDERKEY],[ORDERDATE],[DELIVERYDATE],[PRIORITY],[CONSIGNEEKEY],s.COMPANY,[OPENQTY],o.[STATUS],o.[TYPE],o.[ADDDATE],o.[ADDWHO]
FROM [SCPRD].[wmwhse1].[ORDERS] o
join [SCPRD].[wmwhse1].[STORER] s on s.STORERKEY = o.CONSIGNEEKEY
WHERE o.ADDDATE > '20230224'