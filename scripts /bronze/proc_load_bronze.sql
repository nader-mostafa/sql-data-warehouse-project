EXEC bronze.load_bronze
GO


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME , @batch_start_time DATETIME, @batch_end_time DATETIME ;
BEGIN TRY 
		set @batch_start_time =GETDATE () ;
		PRINT '=============================================================';
		PRINT'Loading bronze layer ';
		PRINT '=============================================================';


		
		PRINT '-------------------------------------------------------------';
		PRINT 'Loading CRM Tables ';
		PRINT '-------------------------------------------------------------';


		set @start_time =GETDATE();
		PRINT '>> truncating table : bronze.crm_cus_info';
		TRUNCATE TABLE  bronze.crm_cus_info;

		PRINT '>>inserting  table : bronze.crm_cus_info';
		BULK INSERT bronze.crm_cus_info
		FROM 'C:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time =GETDATE();
		PRINT '>> Load Duration ' +cast( DATEDIFF(second , @start_time ,@end_time) AS NVARCHAR )+'seconds' ;
		PRINT '--------------';




		set @start_time =GETDATE();
		PRINT '>> truncating table : bronze.crm_prd_info';
		TRUNCATE TABLE  bronze.crm_prd_info;

		PRINT '>>inserting  table : bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time =GETDATE();
		PRINT '>> Load Duration ' +cast( DATEDIFF(second , @start_time ,@end_time) AS NVARCHAR )+'seconds' ;
		PRINT '--------------';




		set @start_time =GETDATE();
		PRINT '>> truncating table : bronze.crm_sales_details';
		TRUNCATE TABLE  bronze.crm_sales_details;
	
		PRINT '>>inserting  table : bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time =GETDATE();
		PRINT '>> Load Duration ' +cast( DATEDIFF(second , @start_time ,@end_time) AS NVARCHAR )+'seconds' ;
		PRINT '--------------';


 

 		PRINT '-------------------------------------------------------------';
		PRINT 'Loading ERP Tables ';
		PRINT '-------------------------------------------------------------';



		set @start_time =GETDATE();
		PRINT '>> truncating table :  bronze.erp_CUST_AZ12';
		TRUNCATE TABLE  bronze.erp_CUST_AZ12;

		PRINT '>>inserting  table :  bronze.erp_CUST_AZ12';
		BULK INSERT bronze.erp_CUST_AZ12
		FROM 'C:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time =GETDATE();
		PRINT '>> Load Duration ' +cast( DATEDIFF(second , @start_time ,@end_time) AS NVARCHAR )+'seconds' ;
		PRINT '--------------';




		set @start_time =GETDATE();
		PRINT '>> truncating table : bronze.erp_LOC_A101';
		TRUNCATE TABLE  bronze.erp_LOC_A101;

		PRINT '>>inserting  table : bronze.erp_LOC_A101';
		BULK INSERT bronze.erp_LOC_A101
		FROM 'C:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time =GETDATE();
		PRINT '>> Load Duration ' +cast( DATEDIFF(second , @start_time ,@end_time) AS NVARCHAR )+'seconds' ;
		PRINT '--------------';





		set @start_time =GETDATE();
		PRINT '>> truncating table : bronze.erp_PX_CAT_G1V2';
		TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;

		PRINT '>>inserting  table : bronze.erp_PX_CAT_G1V2';
		BULK INSERT bronze.erp_PX_CAT_G1V2
		FROM 'C:\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		set @end_time =GETDATE();
		PRINT '>> Load Duration ' +cast( DATEDIFF(second , @start_time ,@end_time) AS NVARCHAR )+'seconds' ;
		PRINT '--------------';




		set @batch_end_time =GETDATE () ;
		PRINT '=============================================================';
	PRINT'Loading Bronze Layer is Completed ';
	PRINT'Total Load Duration : ' + CAST (DATEDIFF (second , @batch_start_time , @batch_end_time) AS NVARCHAR)+'seconds';
	PRINT'ERROR MESSAGE' + CAST (ERROR_STATE () AS NVARCHAR);
	PRINT '=============================================================';



	END TRY 
	BEGIN CATCH 
	PRINT '=============================================================';
	PRINT'ERROR OCCURED DURING LOADING bronze layer ';
	PRINT'ERROR MESSAGE' + ERROR_MESSAGE();
	PRINT'ERROR MESSAGE' + CAST (ERROR_NUMBER () AS NVARCHAR);
	PRINT'ERROR MESSAGE' + CAST (ERROR_STATE () AS NVARCHAR);
	PRINT '=============================================================';
	END CATCH 
END









