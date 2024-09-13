# PowerBI

## Best Practices

There are a few recommended best practices that can help speed up data refresh operations. This is by no means a comprehensive list, but this list provides a starting point for building data models. Data models are the backbone of an efficient BI report and visualization.

- Only import necessary columns for reporting; remove all other columns from model.
- Only import necessary rows of data; filter out data that is not needed.
- Try to avoid highly unique columns; they have low compression and take up valuable resporces.
- Disable Auto date/ time for new files.
- Create new columns in the Power Query Editor, rather that DAX, when possible.

## Relationship

We will start with "Building Data Model.pbix" file. Please download and open that file in your PowerBI desktop.

![image](https://github.com/user-attachments/assets/ee0d3741-ff1e-4374-bb85-f99df619a29f)

- The line between two tables represents that a relationship exists.
- The arrow indicates in which direction filtering will occur.
- The 1 indicates the Customer table as the one side of the relationship. This means the key from one sdie of the relationship is always unique in that table.
- The * indicates that the FactInternetSales table is the many side of the relationship. The key will appear in the sales table for each transaction; therefore, the key appears many times.

## Editing relationship

To edit an existing re;ationship, select that relationship and then click on edit.

## Create new relationship
Complete the following steps to create a new relationship:
- Select FactInternetSales from the list of tables in the dropdown
- Select OrderDate from the list of columns and use the scroll bar to scroll all the way to right
- Select DimDate from the next drop-down list
- Select FullDateAlternateKey from the list of columns
- Cardinality, Cross filter direction and whether the relationship is active or inactive is updated automatically by PowerBI
- Click OK to close the editor.
  
![image](https://github.com/user-attachments/assets/c45c0e61-3f45-4731-8b4d-faccf2d51d66)


![image](https://github.com/user-attachments/assets/a49d4cd7-2ed5-4b70-9963-c6e2ea4c9d58)

The date table in the PowerBI data model is important for developing time intelligence calculations. When we define our relationship on the date key, rather than date column, it is important to also mark the date table as a 'Date table'. Marking a tav=ble as date table can only be accomploshed in the Report view or Data View as shown below. Go to Report View and right click on DimDate to achieve the below.

![image](https://github.com/user-attachments/assets/25b68773-3aa3-4c8a-9c33-ae84681fccd2)

Once mark as date table is selected, we will be prompted to select Date Column from the Date table as shown below.

![image](https://github.com/user-attachments/assets/0c18d39f-7121-4ab8-871f-9c58d8d65ccb)

There is one important thing to note on this configuration screen: the built-in data tables that were associated with this table are removed. In the background, Power BI creates a hidden date table for each field that has a date or date/time field. Depending on the number of date fields in the data model, this can create a lot of extra objects and will consume more memory in the data model. As a best oractice, it is recommended disabling this functionality as shown below.

Fil | Option and Settings | Options | Global | Data Load

![image](https://github.com/user-attachments/assets/0b91ff71-1872-48f2-82c2-eff7e0d22445)

## Many to Many relationships
Many to many relationships is when multiple rows in one table are associated with multiple rows in nanother table. as an examples of a many to many relationships between products and customers. A product can be sold to many customers, likewise, a customer can purchase many products. This relationships between products and customerzs is a many to many relationship. We created the following report in report view.


![image](https://github.com/user-attachments/assets/997515c5-c4ab-4bb8-b25e-83253a65c98a)


- ElglishProductName from DimProduct table
- Total sales is the sum of SalesAmout from FactInternetSales table
- Total Transactions is the count of associated rows from factIntenetSales table (create anew measure -> Total transactions = countrows([FactIntenetSales])
- Custome Counts is the count of the CustomerKey clumn from DimCustomer table; create a new measure in DimCustoer table -> Customer count = countsrows([DimCustomer])

Here we see the customer count is the same number in all the rows and filtering is not happening. This is a red flag for BI report.

![image](https://github.com/user-attachments/assets/d59e4a76-33ff-49ad-9464-3e470856291d)


To fix this, we go back to model view and double click on the connection line between DimCustimer and factInternetSales. In the edit relatioship, we turn the cross finter direction to Both and apply as shown below.

![image](https://github.com/user-attachments/assets/10ba4c79-f187-4f9a-9ced-84ac33a8a49b)

We go to report view again and validate the report as shown below. This time we find the correct numbers in all the rows in customer count.

![image](https://github.com/user-attachments/assets/09726e16-2845-48a6-9ad1-a9a37774f6da)

## Calculated measures
Here six simple calculated measures are ccreated. These measures will create additional metrics that can be used in visualizations and reports to obtain deeper insights from the data.
- Total sales
- Total costs
- Profit
- Profit margin
- YTD Sales
- Fiscal YTD saees

We can create these measure in the factInterntSales table.
- Total sales = sum(FactInternetSales[SalesAmount])
- Total cost = sum(FactInternetSales[TotalProductCost])
- Profit = sum(FactInternetSales[SalesAmount]) - sum(FactInternetSales[TotalProductCost]) or the most efficient way is Profit = [Total sales] - [Total cost]
- Profit margin = DIVIDE([Profit], [Total sales])
- YTD Sales = TOTALYTD([Total sales], FactInternetSales[OrderDate])
- Fiscal YTD sales = TOTALYTD([Total sales], FactInternetSales[OrderDate], "03/31") considering 31 March is fiscal year end.

We can create another metrics with the abobe measures as shown below.

![image](https://github.com/user-attachments/assets/c5f6990e-73ee-470e-9d16-2dd6d92b0445)

