/*
=================================================================================
Quality Checks 
=================================================================================
Script purpose:
    This script performs various quality checks for data consistency, accuracy,
    and standardization across the 'silver' schema. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
        - Run these checks after data loading Silver Layer.
        - Investigate and resolve any discrepancies found during the checks.
=================================================================================
*/

/*
=================================================================================
Quality Checks 
=================================================================================
Script purpose:
    This script performs various quality checks for data consistency, accuracy,
    and standardization across the 'silver' schema. It includes checks for:
    - Null or duplicate primary keys.
    - Unwanted spaces in string fields.
    - Data standardization and consistency.
    - Invalid date ranges and orders.
    - Data consistency between related fields.

Usage Notes:
        - Run these checks after data loading Silver Layer.
        - Investigate and resolve any discrepancies found during the checks.
=================================================================================
*/

--======================================
-- Checks for 'silver.crm_cust_info'
--======================================
--Check For Nulls or Duplicates in primary key
--Expectation: No Result
SELECT 
	cst_id,
	COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

--Check for unwanted Spaces
--Expectation: No Result
SELECT 
	cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname) 


SELECT 
	cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname )

SELECT 
	cst_gndr 
FROM silver.crm_cust_info
WHERE cst_gndr != TRIM(cst_gndr )


SELECT 
	cst_marital_status 
FROM silver.crm_cust_info
WHERE cst_marital_status != TRIM(cst_marital_status)

--Data Standardization & Consistency
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info

SELECT DISTINCT cst_marital_status
FROM silver.crm_cust_info


--======================================
-- Checks for 'silver.crm_prd_info'
--======================================

--Check For Nulls or Duplicates in primary key
--Expectation: No Result
SELECT
	prd_id,
	COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL

-- Check for unwanted Spaces
-- Expectation: No Results
SELECT 
	prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm)

-- Check for Nulls or Negative Numbers
-- Expectation: No Results	
SELECT
	prd_cost
FROM silver.crm_prd_info
WHERE prd_cost IS NULL OR prd_cost < 0

-- Check for Invalid Date Orders
SELECT *
FROM silver.crm_prd_info
WHERE  prd_end_dt < prd_start_dt 


SELECT 
	prd_id,
	prd_key,
	prd_nm,
	prd_start_dt,
	prd_end_dt,
	LEAD(prd_start_dt) OVER(PARTITION BY prd_key ORDER BY prd_start_dt ASC)-1 AS prd_end_dt_test
FROM silver.crm_prd_info
WHERE  prd_key IN ('AC-HE-HL-U509-R','AC-HE-HL-U509')


--Data Standardization & Consistency
SELECT DISTINCT prd_line
FROM silver.crm_prd_info


--======================================
-- Checks for 'silver.crm_sales_details'
--======================================
--Check for invalid Dates
SELECT
	NULLIF(sls_order_dt,0) AS sls_order_dt
FROM bronze.crm_sales_details
WHERE sls_order_dt <= 0 
	OR LEN(sls_order_dt) <> 8 
	OR sls_order_dt > 20500101
	OR sls_order_dt < 19000101
------------
SELECT
	NULLIF(sls_ship_dt,0) AS sls_ship_dt
FROM bronze.crm_sales_details
WHERE sls_ship_dt <= 0 
	OR LEN(sls_ship_dt) <> 8 
	OR sls_ship_dt > 20500101
	OR sls_ship_dt < 19000101

------------
SELECT
	NULLIF(sls_due_dt,0) AS sls_due_dt
FROM bronze.crm_sales_details
WHERE sls_due_dt<= 0 
	OR LEN(sls_due_dt) <> 8 
	OR sls_due_dt > 20500101
	OR sls_due_dt < 19000101
-----------
SELECT 
*
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt OR sls_ship_dt > sls_due_dt


--Check Data Consistency: Between Sales, Quantity, and price
-- >> Sales = Quantity * price
-- >> Values must not be Null, zero or negative.
SELECT DISTINCT
	sls_sales ,
	sls_quantity,
	sls_price 
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price 
	OR sls_sales  IS NULL OR sls_quantity IS NULL OR sls_price IS NULL 
	OR sls_sales  <= 0 OR sls_quantity <= 0	OR sls_price  <= 0
ORDER BY sls_sales, sls_quantity, sls_price

--If sales in negative, zero or Null derive it using Quantity and price
--If price is zero or null, calculate it using Sales and Quantity.
--If price is negative, convert it to a positive value


--======================================
-- Checks for 'silver.erp_cust_az12'
--======================================
-- Identify Out-of-Range Date
SELECT DISTINCT 
bdate
FROM silver.erp_cust_az12
WHERE bdate < '1924-01-01' OR bdate > GETDATE()

-- Data Standardization & Consistency
SELECT DISTINCT
	gen
FROM silver.erp_cust_az12

--======================================
-- Checks for 'silver.erp_loc_a101'
--======================================
-- Data Standardization & Consistency
SELECT DISTINCT
	cntry
FROM silver.erp_loc_a101

--======================================
-- Checks for 'silver.erp_px_cat_giv2'
--======================================
-- Check for unwanted Spaces
SELECT
	*
FROM silver.erp_px_cat_giv2
WHERE cat != TRIM(cat) OR subcat != TRIM(subcat) OR maintenance != TRIM(maintenance)
-- Data Standardization & Consistency
SELECT DISTINCT 
	cat
FROM silver.erp_px_cat_giv2
-----------------
SELECT DISTINCT 
	subcat
FROM silver.erp_px_cat_giv2
-----------------
SELECT DISTINCT
	maintenance
FROM silver.erp_px_cat_giv2
