use MovieCatalogue;

insert into Actor(FirstName, LastName, BirthDate) values ('Bill', 'Murray', '1950/09/21');
insert into Actor(FirstName, LastName, BirthDate) values ('Dan', 'Aykroyd', '1952/07/1');
insert into Actor(FirstName, LastName, BirthDate) values ('John', 'Candy', '1950/10/31');
insert into Actor(FirstName, LastName) values ('Steve', 'Martin');
insert into Actor(FirstName, LastName) values ('Sylvester', 'Stallone');

insert into Director(FirstName, LastName, BirthDate) values ('Ivan', 'Reitman', '1946/10/27');
insert into Director(FirstName, LastName) values ('Ted', 'Kotcheff');

insert into Rating(RatingName) values ('G');
insert into Rating(RatingName) values ('PG');
insert into Rating(RatingName) values ('PG-13');
insert into Rating(RatingName) values ('R');

insert into Genre(GenreName) value ('Action');
insert into Genre(GenreName) value ('Comedy');
insert into Genre(GenreName) value ('Drama');
insert into Genre(GenreName) value ('Horror');

insert into Movie(GenreId, DirectorId, RatingId, Title, ReleaseDate) values (1, 2, 4, 'Rambo: First Blood', '1982/10/22');
insert into Movie(GenreId, RatingId, Title, ReleaseDate) values (2, 4, 'Planes, Trains & Automobiles', '1987/11/25');
insert into Movie(GenreId, DirectorId, RatingId, Title) values (2, 1, 2, 'Ghostbusters');
insert into Movie(GenreId, RatingId, Title, ReleaseDate) values (2, 2, 'The Great Outdoors', '1988/06/17');

insert into CastMembers(ActorId, MovieId, Role) values
(5, 1, 'John Rambo'),
(4, 2, 'Neil Page'),
(3, 2, 'Del Griffith'),
(1, 3, 'Dr. Peter Venkman'),
(2, 3, 'Dr. Raymond Stanz'),
(2, 4, 'Roman Craig'),
(3, 4, 'Chet Ripley');

update Movie set
Title = 'Ghostbusters (1984)'
where MovieId = 3;

update Genre set
GenreName = 'Action/Adventure'
where GenreId = 1;

delete from castmembers
where MovieId = 1;

delete from Movie
where MovieId = 1;

alter Table Actor
add DateOfDeath date null;

update Actor set
DateOfDeath = '1994/3/4'
where ActorId = 3;