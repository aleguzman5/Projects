use Northwind;

select count(*)
from Products
where UnitPrice > 20;

#get a count of Products by category

select count(*) as NumProducts, CategoryName
from Products p
inner join categories c on p.CategoryId = c.CategoryID
group by CategoryName;

#Sum of Customer Orders by Country from Most to Least in 1996
select(od.UnitPrice * od.Quantity) as Total, Country
from Orders o
inner join order_details od on o.OrderId = od.OrderId
inner join Customers c on c.CustomerId = o.CustomerId
where OrderDate between '1996/1/1' and '1996/12/31'
group by Country
order by Total desc;

select FirstName, LastName, sum(UnitPrice * Quantity) as TotalSales
from Orders o
inner join order_details od on o.OrderId = od.OrderID
inner join employees e on o.EmployeeId = e.EmployeeID
group by FirstName, LastName
having sum(UnitPrice * Quantity) > 200000
order by TotalSales desc;

select Country, sum(UnitPrice * Quantity) as TotalSales, 
min(UnitPrice * Quantity) as SmallestOrder,
max(UnitPrice * Quantity) as LargestOrder,      
avg(UnitPrice * Quantity) as AverageOrder,
count(o.OrderID) as TotalOrders
from Orders o 
inner join Order_Details od on o.OrderID = od.OrderID        
inner join Customers c on o.CustomerID = c.CustomerID
group by Country
order by TotalSales desc;

select count(Region)
FROM Customers;
 
select count(*)
from Customers;

select distinct(Country)
from Customers
order by Country;