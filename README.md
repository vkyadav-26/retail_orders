# retail_orders

This is a end to end analytics project using Python and SQL. We have used kaggle API to download the dataset. The initial data processing and cleaning is done using Python pandas library. Then the data is loaded to SQL using sqlalchemy and further insights have been generated using MSSQL.


![pro](https://github.com/vkyadav-26/retail_orders/assets/32729513/c6d1c918-ecf9-4b12-92fb-313550ea5017)

## Steps in this analysis-

#### 1. Data import and extraction
   -- import kaggle on jupyter notebook and download data using kaggle api </br>
   -- Extract csv file from zip folder</br>
   -- read the csv file using pandas library</br>

#### 2. Data Preprocessing
   -- assigning appropriate dtype to columns</br>
   -- converting unusual values to "nan" values</br>
   -- Rename columns to appropriate and easily understandable names</br>
   -- Create new columns based on the business requirements and remove the unnecessary columns.</br>
   -- load the processed dataset to sql server using sqlalchemy connection.</br>

#### 3. Data analysis in SQL server
   #### we are answering 5 major questions asked by the stakeholders
   -- Top 10 highest revenue generating product </br>
   -- Top 5 highest selling product in each region </br>
   -- Month over Month growth comparison from 2022 and 2023 sales </br>
   -- Highest sales month for each category </br>
   -- Which subcategory had the highest growth by profit in 2023 compared to 2022 </br>
   





