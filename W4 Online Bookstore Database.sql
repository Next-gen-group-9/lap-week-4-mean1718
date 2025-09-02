create table Authors (
    author_id int primary key,
    name varchar(100),
    country varchar(50)
);
create table Books (
    book_id int primary key,
    title varchar(100),
    genre varchar(50),
    price decimal(5,2),
    stock int,
    author_id int,
	foreign key(author_id) references Authors(author_id)
);
-- Insert authors
insert into Authors values
(1, 'J.K. Rowling', 'UK'),
(2, 'Haruki Murakami', 'Japan'),
(3, 'George Orwell', 'UK'),
(4, 'Jane Austen', 'England'),
(5, 'Paulo Coelho', 'Brazil');

-- Insert books
insert into Books values
(1, 'Harry Potter and the Sorcerer\'s Stone', 'Fantasy', 12.99, 100, 1),
(2, 'Harry Potter and the Chamber of Secrets', 'Fantasy', 13.99, 80, 1),
(3, 'Norwegian Wood', 'Fiction', 10.50, 60, 2),
(4, 'Kafka on the Shore', 'Fantasy', 14.20, 55, 2),
(5, '1984', 'Dystopian', 9.99, 120, 3),
(6, 'Animal Farm', 'Fiction', 8.50, 90, 3),
(7, 'Pride and Prejudice', 'Romance', 7.99, 30, 4),
(8, 'Emma', 'Romance', 11.50, 10, 4),
(9, 'The Alchemist', 'Adventure', 15.00, 70, 5),
(10, 'Brida', 'Romance', 10.00, 25, 5);
-- part 3 :Beginner_level Queries
-- 1. Show all books
select * from Books;
-- 2. Show all authors from the UK
select * from Authors where country = 'UK';
-- 3. Show all books in the “Fantasy” genre
select * from Books where genre = 'Fantasy';
-- 4. Find all books with a price greater than 10
select * from Books where price > 10;
-- 5. Find all books with stock less than 20
select * from Books where stock < 20;
-- Part 4:Intermediate Queries
-- 6. Books that cost less than 15 AND have stock > 50
select * from Books where price < 15 and stock > 50;
-- 7. Books written by authors from the UK OR Japan
select b.*
from Books b
join Authors a on b.author_id = a.author_id
where a.country = 'UK' or a.country = 'Japan';
-- 8. Books that are NOT in the Romance genre
select * from Books where genre != 'Romance';
-- 9. Books where the stock is between 20 and 100
select * from Books where stock between 20 and 100;
-- 10. Books priced between 8 and 12
select * from Books where price between 8 and 12;
-- Part 5: Sorting & Ordering
-- 11. Show all books sorted by price (ascending)
select * from Books order by price ASC;
-- 12. Show all books sorted by stock (descending)
select * from Books order by stock DESC;
-- 13. Show the top 3 cheapest books
select * from Books order by price ASC LIMIT 3;

-- 14. Show the top 5 most expensive books
select * from Books order by price DESC LIMIT 5;
-- 15. Show all books sorted by author name, then by book title
select b.*
from Books b
join Authors a on b.author_id = a.author_id
order by a.name, b.title;
-- Part 7: Challenge Queries
-- 16. Show all books where the title contains the word “Adventure”
select * from Books where title like '%Adventure%';
-- 17. Show all authors who have written more than 1 book
select a.author_id, a.name, count(b.book_id) as book_count
from Authors a
join Books b on a.author_id = b.author_id
group by a.author_id, a.name
having count(b.book_id) > 1;
-- 18. Find the average price of books by UK authors
select avg(b.price) as avg_price
from Books b
join Authors a on b.author_id = a.author_id
where a.country = 'UK';
-- 19. Find the book(s) with the highest price
select *from Books
 where price = (select MAX(price) from Books);
 -- 20. Find the total stock of all Fantasy books
select SUM(stock) as total_fantasy_stock
from Books
where genre = 'Fantasy';


