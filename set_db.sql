create table users (
 usersid INT primary key,
 name VARCHAR(50),
 age INT
)


insert into users (usersid, name, age)
values
	(1, 'Danya', 20),
	(2, 'Nastya', 25),
	(3, 'Vanya', 30);

	
select *
from users


update users
set age = 22
where usersid = 1


delete
from users 
where usersid = 2


alter table users
add email varchar(100)

alter table users 
drop column email


create index idx_name on users (name)


drop index idx_name 


DROP TABLE users;
