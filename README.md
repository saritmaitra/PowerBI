# PowerBI

## Best Practices

There are a few recommended best practices that can help speed up data refresh operations. This is by no means a comprehensive list, but this list provides a starting point for building data models. Data models are the backbone of an efficient BI report and visualization.

- Only import necessary columns for reporting; remove all other columns from model.
- Only import necessary rows of data; filter out data that is not needed.
- Try to avoid highly unique columns; they have low compression and take up valuable resporces.
- Disable Auto date/ time for new files.
- Create new columns in the Power Query Editor, rather that DAX, when possible.
