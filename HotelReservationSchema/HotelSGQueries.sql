use HotelSG;

select * from Customer;

select * 
from Room r
inner join reservationdetails rd on r.RoomId = rd.RoomId
inner join reservation res on rd.ReservationId = res.ReservationId;

select 
	r.`Number`,
    r.Floor
from Room r
left outer join reservationdetails rd on r.RoomId = rd.RoomId
left outer join reservation res on rd.ReservationId = res.ReservationId
	where res.FromDate != '2017/11/01' and res.ToDate != '2017/11/05'; 
    #res.FromDate is null and res.ToDate is null;
    
select 
	res.ReservationId,
    c.FirstName,
    c.LastName,
	r.`Number`,
    res.FromDate,
    res.ToDate
from Room r
inner join reservationdetails rd on r.RoomId = rd.RoomId
inner join reservation res on rd.ReservationId = res.ReservationId
inner join customer c on res.CustomerId = c.CustomerId
	where c.FirstName = 'Sally' and c.LastName = 'Smith';
 
select * from RoomAmmenities;

select 
	*
from Ammenities a
inner join roomammenities ra on a.AmmenitiesId = ra.AmmenitiesId
inner join room r on ra.RoomId = r.RoomId
	where a.Description = 'Minibar' #and a.Description = 'WiFi';
    #group by ra.RoomId
    ;
    
select
	res.ReservationId,
	c.FirstName,
    c.LastName,
    res.FromDate,
	res.ToDate
from Reservation res
inner join Customer c on res.CustomerId = c.CuStomerId
where res.ToDate = '2017/11/05';

select * from promotioncode;