/* =========================================================
   DATA PREPARATION QUERIES
   Purpose:
   - Pre-cleaned analytical datasets for BI reporting
   - SQL-first transformation approach
   - Sanitized for public GitHub portfolio use
   ========================================================= */


/* =========================================================
   SALES ORDER – HEADER LEVEL
   ========================================================= */

SELECT DISTINCT
    T1.DocEntry        AS ORDR_DocEntry,
    T1.DocNum          AS ORDR_DocNum,
    T1.DocStatus       AS ORDR_DocStatus,
    T1.DocDate         AS ORDR_DocDate,

    YEAR(T1.DocDate)              AS [Year],
    FORMAT(T1.DocDate, 'MMM')     AS [Month],
    DATEPART(QUARTER, T1.DocDate) AS [Quarter],

    T1.GroupNum,
    T1.CardCode,
    T1.VatSum,
    T1.DocTotal,
    T1.GrosProfit,
    T1.SlpCode,
    T1.U_QGWebOrderID,
    T1.U_QGWebOrderIncID,
    T1.U_QGSapOrderID,
    T1.U_OrderSource,
    T1.DiscPrcnt,
    T1.DiscSum,

    T3.DocEntry        AS OINV_DocEntry,
    T3.DocNum          AS OINV_DocNum,
    T5.DocStatus       AS OINV_DocStatus,
    T5.DocDate         AS OINV_DocDate

FROM RDR1 T0
INNER JOIN ORDR T1
    ON T0.DocEntry = T1.DocEntry

LEFT JOIN DLN1 T2
    ON T2.BaseEntry = T0.DocEntry
   AND T2.BaseLine  = T0.LineNum

LEFT JOIN ODLN T3
    ON T2.DocEntry = T3.DocEntry

LEFT JOIN INV1 T4
    ON T4.BaseEntry = T3.DocEntry
   AND T4.BaseLine  = T2.LineNum
   AND T4.BaseType  = 15

LEFT JOIN OINV T5
    ON T5.DocEntry = T4.DocEntry

LEFT JOIN RIN1 T6
    ON T6.BaseEntry = T5.DocEntry
   AND T6.BaseLine  = T4.LineNum

WHERE T1.CardCode IN (
    SELECT CardCode
    FROM OCRD
    WHERE CardCode LIKE 'C0%'
      AND E_Mail NOT LIKE '%@internal-domain%'
      AND CardCode NOT IN ('CXXXXX','CYYYYY')
)
AND CAST(T1.DocDate AS DATE) BETWEEN '2024-01-01' AND '2025-12-31'
AND T1.CANCELED = 'N'
AND T3.CANCELED = 'N'
AND T5.CANCELED = 'N'
AND T5.DocEntry IS NOT NULL;


/* =========================================================
   SALES ORDER – ITEM LEVEL
   ========================================================= */

SELECT
    T1.DocEntry,
    T1.LineNum,
    T1.LineStatus,
    T1.TargetType,
    T1.TrgetEntry,
    T1.BaseEntry,
    T1.BaseLine,
    T1.ItemCode,
    T1.Dscription,
    T1.Price,
    T1.Quantity,
    T1.LineTotal,
    T1.DiscPrcnt,
    T1.VatSum,
    T1.GTotal,
    T1.GrossBuyPr,
    T1.GrssProfit,
    T1.WhsCode
FROM RDR1 T1;


/* =========================================================
   CUSTOMER MASTER
   ========================================================= */

SELECT
    U_QGCustomerID,
    CardCode,
    CardName,
    CardType,
    CntctPrsn,
    ListNum,
    SlpCode,
    ZipCode,
    Phone1,
    E_Mail,
    City,
    County,
    MailCity,
    MailCounty
FROM OCRD
WHERE CardCode LIKE 'C0%'
  AND E_Mail NOT LIKE '%@internal-domain%'
  AND CardCode NOT IN ('CXXXXX','CYYYYY');


/* =========================================================
   PRODUCT MASTER
   ========================================================= */

SELECT
    T1.ItemCode,
    T1.ItemName,
    T1.OnHand,
    T1.IsCommited,
    T1.OnOrder,
    T1.LastPurPrc,
    T1.U_QGItemID,
    T1.ItmsGrpCod,
    T2.ItmsGrpNam,
    T1.U_Brand,
    T3.Name            AS BrandName,
    T3.U_MagBrandValue AS MageBrandCode
FROM OITM T1
INNER JOIN OITB T2
    ON T1.ItmsGrpCod = T2.ItmsGrpCod
INNER JOIN [@BRAND] T3
    ON T1.U_Brand = T3.Code;


/* =========================================================
   WAREHOUSE STOCK – CURRENT INVENTORY
   ========================================================= */

SELECT
    ItemCode,
    WhsCode,
    OnHand,
    IsCommited,
    OnOrder
FROM OITW;


/* =========================================================
   SALES EMPLOYEE / ACCOUNT MANAGER
   ========================================================= */

SELECT *
FROM OSLP;

