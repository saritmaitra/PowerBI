# PowerBI

## Best Practices

There are a few recommended best practices that can help speed up data refresh operations. This is by no means a comprehensive list, but this list provides a starting point for building data models. Data models are the backbone of an efficient BI report and visualization.

- Only import necessary columns for reporting; remove all other columns from model.
- Only import necessary rows of data; filter out data that is not needed.
- Try to avoid highly unique columns; they have low compression and take up valuable resporces.
- Disable Auto date/ time for new files.
- Create new columns in the Power Query Editor, rather that DAX, when possible.

## Relationship
- The line between two tables represents that a relationship exists.
- The arrow indicates in which direction filtering will occur.
- The 1 indicates the Customer table as the one side of the relationship. This means the key from one sdie of the relationship is always unique in that table.
- The * indicates that the FactInternetSales table is the many side of the relationship. The key will appear in the sales table for each transaction; therefore, the key appears many times.

## Editing relationship

To edit an existing re;ationship, select that relationship and then click on edit
