_______________________________________
alter table customer                  |
add email VARCHAR(100)                |
                                      |
alter table customer                  |
rename column email to Gmail          |
                                      |
create table Employee(                |
ID INT primary key unique,            |
first_name VARCHAR(50) ,              |
last_name VARCHAR(50) ,               |
Age INT,                              |
check (AGE>=18)                       |
)                                     |
_______________________________________




create table users (
 usersid INT primary key,
 name VARCHAR(50),
 age INT
)
______________________________________

insert into users (usersid, name, age)
values
	(1, 'Danya', 20),
	(2, 'Nastya', 25),
	(3, 'Vanya', 30);

______________________________________

update users
set age = 22
where usersid = 1

______________________________________
	
delete
from users 
where usersid = 2

______________________________________

alter table users
add email varchar(100)
______________________________________
	
alter table users 
drop column email


create index idx_name on users (name)


drop index idx_name 


DROP TABLE users;
