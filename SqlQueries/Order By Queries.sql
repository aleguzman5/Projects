use Northwind;

select CategoryName, ProductName, UnitPrice, UnitsInStock
from Categories ct
inner join Products p on ct.CategoryId = p.CategoryId
order by CategoryName, ProductName;

select CategoryName, ProductName, UnitPrice, UnitsInStock
from Categories ct
inner join Products p on ct.CategoryId = p.CategoryId
order by CategoryName, UnitsInStock desc;

select CategoryName, ProductName, UnitPrice, UnitsInStock
from Categories ct
inner join Products p on ct.CategoryId = p.CategoryId
where CategoryName = 'Confections'
order by UnitPrice desc;

select CategoryName, ProductName, UnitPrice, UnitsInStock
from Categories ct
inner join Products p on ct.CategoryId = p.CategoryId
where CategoryName = 'Confections'
order by UnitPrice desc
limit 0,5;

select CategoryName, ProductName, UnitPrice, UnitsInStock
from Categories ct
inner join Products p on ct.CategoryId = p.CategoryId
where CategoryName = 'Confections'
order by UnitPrice desc
limit 5,5;