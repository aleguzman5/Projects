use Slack;

select * from users;
select * from channels;
select * from messages;
select * from UsersAndChannels;

delete from Messages
	where MessageId = 2;

select 
	m.Message,
    ch.`Name` as 'Channel',
    u.FirstName as 'Sender'
from Messages m
inner join Channels ch on m.ChannelId = ch.ChannelId
inner join Users u on m.UserId = u.UserId;

select 
	u.FirstName as 'User',
    ch.`Name` as `Channel`
from UsersAndChannels uc
inner join Users u on uc.UserId = u.UserId
inner join Channels ch on uc.ChannelId = ch.ChannelId
where ch.`Name` = 'Random'
