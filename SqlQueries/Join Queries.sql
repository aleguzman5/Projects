use Northwind;

select 
	e.FirstName,
    e.LastName,
    t.TerritoryDescription 
from Employees e
inner join employeeterritories et on e.EmployeeId = et.EmployeeId
inner join territories t on et.territoryId = t.territoryId;

select
	c.CompanyName,
    o.OrderDate,
    p.ProductName
from Customers c
inner join orders o on c.CustomerId = o.CustomerId
inner join order_details od on o.OrderID = od.OrderID
inner join products p on od.ProductId = p.ProductID
where c.Country='USA';

select *
from orders;
    
select *
from customers;
    
select *
from order_details;
    
select *
from products;

select
	o.*
from Products p
inner join order_details od on od.ProductId = p.ProductID
inner join Orders o on o.OrderID = od.OrderId
where p.ProductName = 'Chai';

select  
	* 
from Orders o 
inner join order_details od on o.OrderId = od.OrderID 
inner join Products p on od.ProductID = p.ProductId 
where p.ProductID = 1; 

select *
from employees;
select *
from employeeterritories;
select *
from territories;

USE swccorp;

select 
	e.FirstName, 
    e.LastName, 
    l.City
from Employee e 
cross join Location l;

select *
from Employee;

select *
from `Grant`;

select 
	e.EmpId,
	e.FirstName,
    e.LastName
from Employee e
left join `Grant` g on e.EmpId = g.EmpId  
where g.GrantId is null;
