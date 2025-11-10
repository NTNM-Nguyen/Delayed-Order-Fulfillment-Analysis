-- Create View with agreed filter conditions
CREATE VIEW [dbo]. [Shipment_Analysis_EMEA]
AS Select *
FROM [Raw_Data]. [dbo].[Special_Model]
where [JDE_PLANNED_DESPATCH_DATE_TIME] > '2024-05-01" and [JDE_PLANNED_DESPATCH_DATE_TIME] < "2025-03-31"
and [RICOH_WORKDAYS_ORACLE_SAD_TO_JDF_PLANNED_ARRIVAL] > -100
and [ABBREVIATION] in ('FI’, ‘NO', ‘ZA', 'HE', 'HU’, ‘EN', ‘IE', 'PO', 'AT’, ‘SP’, ‘IT', 'CH', F’, ‘UK’, ‘PL’, ‘DE’, ‘FR’,’ES’,’NL’)

-- Standardize OpCo names and remove duplicates
WITH Cleaned_OpCo AS (
    SELECT 
        DISTINCT
        TRIM(UPPER(OPCO_NAME)) AS OPCO_NAME_STD,
        OPCO_CODE,
        COUNTRY,
        REGION,
        DIR_INDIR_FLAG,
        ACTIVE_STATUS
    FROM OpCo_Master
)
SELECT *
INTO OpCo_Master_Clean
FROM Cleaned_OpCo;

-- Flag missing or invalid shipment dates
UPDATE Shipment_Analysis_EMEA
SET IS_DELAYED = NULL
WHERE 
    ACTUAL_SHIPMENT_DATE IS NULL 
    OR JDE_PLANNED_ARRIVAL_DATE IS NULL
    OR JDE_PLANNED_DESPATCH_DATE_TIME IS NULL;

-- Match shipments with missing warehouse IDs using ship-from name
UPDATE s
SET s.WAREHOUSE_ID = w.WAREHOUSE_ID
FROM Shipment_Analysis_EMEA s
INNER JOIN Warehouse_Master w
    ON TRIM(UPPER(s.HISTORY_SHIP_FROM)) = TRIM(UPPER(w.WAREHOUSE_NAME))
WHERE s.WAREHOUSE_ID IS NULL;


-- Top 5 OpCos with highest number of shipments
SELECT [ABBREVIATION] as Opco,
Count(*) Count_of_Shipment,
SUM(COUNT(*)) OVER () as Total_Shipment,
ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER (), 2) AS Percentage_of_Total
FROM [Raw_Data]. [dbo]. [Shipment_Analysis_EMEA]
GROUP BY [ABBREVIATION]
ORDER BY [Count_of_Shipment] DESC;
