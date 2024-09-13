# PowerBI

## Best Practices

There are a few recommended best practices that can help speed up data refresh operations. This is by no means a comprehensive list, but this list provides a starting point for building data models. Data models are the backbone of an efficient BI report and visualization.

- Only import necessary columns for reporting; remove all other columns from model.
- Only import necessary rows of data; filter out data that is not needed.
- Try to avoid highly unique columns; they have low compression and take up valuable resporces.
- Disable Auto date/ time for new files.
- Create new columns in the Power Query Editor, rather that DAX, when possible.

## Relationship

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


