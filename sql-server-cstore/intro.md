# Goal:
After completing this scenario, users will be able to use, and modify RHEL tuned profiles using tuned-adm, and see the impact of that change
with Microsoft SQL "Server's" column store feature.

> Columnstore indexes were first introduced in SQL Server 2012. Column stores offer a new way to store the data from a table that improves the performance of certain query types by at least ten times. With column stores They are especially helpful with fact tables in data warehouses.

# Concepts included in this scenario:
* Verify whether SQL Server is installed on the system
* View the currently set RHEL tuned-profile 
* Check SQL Server query performance by running an sample analytic query with column stores
* Change the RHEL tuned-profile to set it improve database throughput
* Rerun the same SQL Server query with column stores to see the new result


# Example Use case:
Don, an analyst with the company has written a query that assesses the rate at which the stock is being sold, 
and estimates (based on the sales rate), when the excess stock will be sold. The problem with this query running
in SQL Server needs to run quickly even during busy order processing periods.  

