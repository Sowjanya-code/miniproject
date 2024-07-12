create database MINIPROJECT1;
use MINIPROJECT1;

 create table publishers (
 publisher_id int primary key,
 publisher_name varchar(237) not null 
 );
  
  insert into publishers values(1,'Hal Leonard Corporation');
  insert into publishers values(2,' Atria Books');
  insert into publishers values(3,' Bloomsbury');
   
   create table categories (
   category_id int primary key,
   category_name varchar(237) unique not null
   );
   
   insert into categories values(1, 'adventure');
   insert into categories values(2, 'fantasy');
   insert into categories values(3, 'scfi');
  
  
   create table users (
   user_id int primary key,
   user_name varchar(237) not null,
   email varchar(237) unique not null,
   phone_number bigint unique not null
   );
   
   insert into users values(10,'sow','sow@123',9876543210);
   insert into users values(11,'janya','janya@456',9123456789);
   insert into users values(12,'dusky','dusky@789',9098765432);
   

   
   create table books (
    book_id int primary key,
    title varchar(237) not null,
    ISBN  bigint unique not null,
    publication_year date not null,
    publisher_id int,
    category_id int,
    auther_name varchar(237) check(auther_name is not null),
    foreign key (publisher_id) references publishers(publisher_id) on delete cascade,
    foreign key (category_id) references categories(category_id) on delete cascade 
    );
    
    insert into books values(100,'THE LION KING',10,'1999-08-01',1,1,'LEONARD ');
	insert into books values(101,'CRINDERELLA',11,'2002-08-12',2,2,'CHARLES PERRAULT');
	insert into books values(102,'AVATAR',12,'2003-08-12',3,3,'JAMES CAMERON');
    

    
   create table Borrowings (
    Borrow_id int primary key,
    user_id int,
	book_id int,
    Borrow_date date not null,
    return_date date not null,
    foreign key(user_id) references users (user_id) on delete cascade,
    foreign key(book_id) references books (book_id) on delete cascade
   );
   select * from borrowings;
    insert into Borrowings values(200,10,100,'2024-12-12','2024-12-15');
    insert into Borrowings values(201,11,101,'2024-12-07','2024-12-18');
    insert into Borrowings values(202,12,102,'2024-12-03','2014-12-13');
    drop table borrowings;
	
select publisher_name,category_name,user_name,email,phone_number,title,ISBN, publication_year,  auther_name,Borrow_id, Borrow_date, return_date from books b
join publishers p on (b.publisher_id=p.publisher_id)
join categories c on (b.category_id=c.category_id)
join Borrowings  br on (b.book_id=br.book_id)
join users u on (br.user_id=u.user_id);
