use swccorp;

select location.*, count(Employee.empId) from employee
	right outer join Location
    on Location.locationId = Employee.LocationID
    group by Location.LocationID;
    
select location.*, count(Employee.empId) from employee
	inner join Location
    on Location.locationId = Employee.LocationID
    group by Location.LocationID;
    
select * from `grant`;

select EmpId, group_concat(GrantName)
	from `grant`
    group by EmpID;
    
select distinct empid from `grant`;

select EmpId, sum(amount)
	from `grant`
    group by EmpID
    having sum(Amount)>20000
    order by sum(amount);