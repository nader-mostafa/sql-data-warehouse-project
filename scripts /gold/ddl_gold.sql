-- =============================================================================
-- Create Dimension: gold.dim_customers
-- =============================================================================

IF OBJECT_ID('gold.dim_customers', 'V') IS NOT NULL
    DROP VIEW gold.dim_customers;
GO

create view gold.dim_customers as
select 
		ROW_NUMBER() over(order by cst_id) as customer_key,
		ci.cst_id AS customer_id,
		ci.cst_key AS customer_number,
		ci.cst_firstname AS first_name,
		ci.cst_lastname as last_name,
		la.cntry  as country ,
		ci.cst_material_status as  martial_status ,
		case when ci.cst_gndr != 'n/a' then ci.cst_gndr 
				else coalesce(ca.gen , 'n/a')
		end as gender,
		ca.bdate as birth_date,
		ci.cst_create_data as create_date
	
from silver.crm_cus_info ci
left join silver.erp_cust_az12 ca 
on ci.cst_key = ca.cid
left join silver.erp_loc_a101 la
on ci.cst_key = la.cid
-- =============================================================================
-- Create Dimension: gold.dim_products
-- =============================================================================

IF OBJECT_ID('gold.dim_products', 'V') IS NOT NULL
    DROP VIEW gold.dim_products;
GO

create view gold.dim_products as 
select 
		ROW_NUMBER ()  over(order by pr.prd_start_dt , pr.prd_key) as product_key,
  pr.prd_id as product_id ,
  pr.prd_key as product_number,
  pr.prd_nm as product_name ,
  pr.cat_id as category_id,
  pc.cat as category,
  pc.subcat as subcategory,
  pc.maintenance ,
  pr.prd_cost as cost ,
  pr.prd_line as line ,
  pr.prd_start_dt as start_date
  
from silver.crm_prd_info pr
left join silver.erp_px_cat_g1v2 pc
on pr.cat_id =pc.id
where prd_end_dt  is null 

-- =============================================================================
-- Create Fact Table: gold.fact_sales
-- =============================================================================
IF OBJECT_ID('gold.fact_sales', 'V') IS NOT NULL
    DROP VIEW gold.fact_sales;
GO


create view gold.fact_sales as
select 
    s.sls_ord_num as order_number ,
    pr.product_number,
    cu.customer_key,
    s.sls_order_dt as order_date ,
    s.sls_ship_dt as shipping_date ,
    s.sls_due_dt as due_date ,
    s.sls_sales as sales ,
    s.sls_quantity as quantity ,
    s.sls_price as price 

from silver.crm_sales_details s
left join  gold.dim_products pr 
on s.sls_prd_key =pr.product_number 
left join gold.dim_customers cu
on s.sls_cust_id = cu.customer_id
