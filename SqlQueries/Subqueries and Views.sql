use NorthWind;

select (o.OrderId), OrderDate, CompanyName
from Orders o
inner join Customers c on o.CustomerId = c.CustomerId
inner join Order_Details od on o.OrderId = od.OrderId
where od.ProductId in

	(select ProductId
    from products
    where UnitPrice > 90.00
    order by UnitPrice desc)
order by CompanyName, OrderId;

select (o.OrderId), OrderDate, CompanyName
from Orders o
inner join Customers c on o.CustomerId = c.CustomerId
inner join Order_Details od on o.OrderId = od.OrderId
inner join
	(select ProductId
    from products
    where UnitPrice > 90.00
    order by UnitPrice desc)
as TopProducts
on od.ProductId = TopProducts.ProductId
order by CompanyName, OrderId;

select o.OrderId, o.OrderDate,
	(select max(od.UnitPrice)
    from order_details od
    where o.OrderId = od.OrderID)
as MaxUnitPrice
from Orders o;

create view ProductsAndCategories
as
select 
	p.ProductId, p.ProductName, c.CategoryName, s.CompanyName
from Products p
inner join Categories c on p.CategoryId = c.CategoryId
inner join Suppliers s on p.SupplierId = s.SupplierId;

select * 
from ProductsAndCategories;