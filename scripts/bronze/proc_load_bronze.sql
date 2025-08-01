/*
=================================================================================
Stored Procedure : Load Bronze Layer (Source -> Bronze )
=================================================================================
Script Purpose : 
  This stored procedure loads data into the 'bronze' schema from external CSV files.
  It performs the following actions:
    - Truncate the bronze tablesz before loading the data.
    - Uses the 'BULK INSERT' command to load data from csv files to bronze tables.

Parameters:
    None
    This stored procedure does not accept any paramerters or return any values.

Usage Example:
    EXEC bronze.load_bronze;

=================================================================================
*/

/*this bulk insert method helps us to insert the data from any file in bulk without having any need of uploading the data row by row*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME , @batch_start_time DATETIME , @batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE() ;
		PRINT '===============================================';
		PRINT 'Loading Bronze Layer';
		PRINT '===============================================';

		PRINT '-----------------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '-----------------------------------------------';

		SET @start_time = GETDATE() ;
		PRINT '>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info ;

		PRINT '>> Inserting Data Into : bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\rasto\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE() ;
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second , @start_time , @end_time) AS NVARCHAR) + 'seconds'
		PRINT '>> --------------------';

		SET @start_time = GETDATE() ;
		PRINT '>> Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info ;

		PRINT '>> Inserting Data Into : bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\rasto\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE() ;
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second , @start_time , @end_time) AS NVARCHAR) + 'seconds'
		PRINT '>> --------------------';

		SET @start_time = GETDATE() ;
		PRINT '>> Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details ;

		PRINT '>> Inserting Data Into : bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\rasto\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE() ;
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second , @start_time , @end_time) AS NVARCHAR) + 'seconds'
		PRINT '>> --------------------';

		PRINT '-----------------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '-----------------------------------------------';

		SET @start_time = GETDATE() ;
		PRINT '>> Truncating Table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12 ;

		PRINT '>> Inserting Data Into : bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\rasto\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE() ;
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second , @start_time , @end_time) AS NVARCHAR) + 'seconds'
		PRINT '>> --------------------';

		SET @start_time = GETDATE() ;
		PRINT '>> Truncating Table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101 ;

		PRINT '>> Inserting Data Into : bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\rasto\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE() ;
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second , @start_time , @end_time) AS NVARCHAR) + 'seconds'
		PRINT '>> --------------------';

		SET @start_time = GETDATE() ;
		PRINT '>> Truncating Table: bronze.erp_px_cat_giv2';
		TRUNCATE TABLE bronze.erp_px_cat_giv2 ;

		PRINT '>> Inserting Data Into : bronze.erp_px_cat_giv2';
		BULK INSERT bronze.erp_px_cat_giv2
		FROM 'C:\Users\rasto\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE() ;
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second , @start_time , @end_time) AS NVARCHAR) + 'seconds'
		PRINT '>> --------------------';

		SET @batch_end_time = GETDATE() ;
		PRINT '========================================='
		PRINT 'Loading Bronze Layer is Completed'
		PRINT '  - Total Load Duration: ' + CAST(DATEDIFF(SECOND , @batch_start_time , @batch_end_time) AS NVARCHAR ) + 'seconds';
		PRINT '========================================='

	END TRY
	BEGIN CATCH
		PRINT '========================================='
		PRINT 'ERROR OCURRED DURING LOADING BRONZE LAYER'
		PRINT 'ERROR MESSAGE ' + ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE ' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR MESSAGE ' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '========================================='
	END CATCH
END
