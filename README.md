# Purpose

The purpose of this document is to suggest improvements for a SQL query that takes approximately 8 seconds to produce a search result. In order to achieve this, we will delve into the intricacies of SQL queries and explore different techniques to optimize them. Specifically, we will examine the various components of the query, such as the SELECT, FROM, WHERE, and ORDER BY clauses, and identify potential areas for improvement. We will also discuss the importance of indexing and how it can significantly speed up the query performance. Moreover, we will explore the use of subqueries and joins, and how they can help in reducing the execution time of the query. Finally, we will consider the impact of database design and table structures on the query performance, and provide recommendations for optimizing them.

## Solution

After reviewing the SQL query, it appears that there are a few areas that could be improved upon. First, we could try optimizing the query by breaking it down into smaller, more efficient parts. Additionally, we could explore using different types of joins to improve performance. Furthermore, we might want to consider adding more detailed comments to the query in order to improve readability and make future modifications easier. Overall, by taking these steps, we can improve the efficiency and readability of the SQL query, resulting in a better overall solution.

view improve_version.sql

The improvements made to the SQL query were:

1. Optimization of the subqueries in the LEFT JOIN clauses to use GROUP_CONCAT and IN instead of multiple JOINs. This means that instead of performing multiple joins for each record, the subquery will use a single join and return a concatenated list of values that can be used for the join condition.
2. Moving the subqueries in the LEFT JOIN clauses to the ON clause to make them part of the join condition. This allows the subquery to be executed as part of the join rather than after the join, resulting in faster query execution.
3. Optimization of the WHERE clause to filter out deleted records faster. This is done by adding the condition "deleted IS NULL" to the WHERE clause, which filters out deleted records before the join operations are performed.
4. Updating the ORDER BY clause to sort by the indexed column to improve performance. This means that the query will use the index to sort the records, which is faster than sorting the records using other columns.

Overall, these improvements make the SQL query more efficient and faster, resulting in a better user experience.

## Time Spent

The total time spent on this improvement was approximately 1 hour. During this time, I focused on identifying areas for improvement, brainstorming potential solutions, and conducting research to determine the most effective strategies.

## Build Docker

In your terminal, navigate to the directory where you created the Dockerfile and run the following command to build the Docker container:

```bash
docker build -t job-container .
```

This will create a Docker container with the name `job-container`.

1. Once the container is built, you can run the following command to start the container and create the database and tables:

```
docker run -d -p 3306:3306 --name job-database job-container
```

This will start the container and create the database and tables. You can access the database using a SQL client such as MySQL Workbench, or by running the SQL query directly in the container using the docker exec command.
