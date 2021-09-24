-- ARTIST TABLE
-- Add 3 new artists to the artist table using INSERT. (It’s already created.)
INSERT INTO artist (name)
    VALUES ('Skillet'),
    ('System of a Down'),
    ('Bad Bunny');
-- Select 5 artists in alphabetical order.
  SELECT * FROM artist
  	ORDER BY artist
  	LIMIT 5;


-- EMPLOYEE TABEL
-- List all employee first and last names only that live in Calgary.
SELECT first_name, last_name 
  FROM employee
  WHERE city = 'Calgary';
-- Find everyone that reports to Nancy Edwards (Use the ReportsTo column). You will need to query the employee table to find the Id for Nancy Edwards
SELECT *
  FROM employee
  WHERE reports_to = 2;
-- Count how many people live in Lethbridge.
SELECT COUNT(*)
  FROM employee
  WHERE city = 'Lethbridge';

-- INVOICE TABLE
-- Count how many orders were made from the USA.
SELECT COUNT(*)
  FROM invoice
  WHERE billing_country = 'USA';
-- Find the largest order total amount.
SELECT *
  FROM invoice
  ORDER BY total DESC
  LIMIT 1;
-- Find the smallest order total amount.
SELECT *
  FROM invoice
  ORDER BY total 
  LIMIT 1;
-- Find all orders bigger than $5.
SELECT *
  FROM invoice 
  WHERE total > 5;
-- Count how many orders were smaller than $5.
SELECT *
  FROM invoice 
  WHERE total < 5;
-- Get the total sum of the orders.
SELECT SUM(total)
  FROM invoice;

-- JOIN Queries (Various tables)
-- Get all invoices where the unit_price on the invoice_line is greater than $0.99.
SELECT *
	FROM invoice i
	JOIN invoice_line il
  ON i.invoice_id = il.invoice_id
  WHERE unit_price > 0.99;
-- Get the invoice_date, customer first_name and last_name, and total from all invoices.
SELECT c.first_name, c.last_name, i.total
	FROM invoice i
	JOIN customer c
  ON i.customer_id = c.customer_id;
-- Get the customer first_name and last_name and the support rep’s first_name and last_name from all customers. Note that support reps are on the employee table.
SELECT c.first_name AS customer_name, c.last_name AS customer_last_name,
	e.first_name AS rep_first_name, e.last_name AS rep_last_name
	FROM employee e
	JOIN customer c
  ON e.employee_id = c.support_rep_id;
-- Get the album title and the artist name from all albums.
SELECT al.title, ar.name
  FROM album al
  JOIN artist ar
  ON al.artist_id = ar.artist_id;


-- EXTRA
-- Select 10 artists in reverse alphabetical order.
SELECT * 
  FROM artist
  ORDER BY artist DESC
  LIMIT 10;
-- Select all artists that start with the word ‘Black’.
SELECT * 
  FROM artist
  WHERE name ILIKE 'Black%';
-- Select all artists that contain the word ‘Black’.
SELECT * 
  FROM artist
  WHERE name ILIKE '%Black%';

-- Find the birthdate for the youngest employee.
SELECT * 
  FROM employee
  ORDER BY birth_date DESC
  LIMIT 1;
-- Find the birthdate for the oldest employee.
SELECT * 
  FROM employee
  ORDER BY birth_date 
  LIMIT 1;
-- Count how many orders were in CA, TX, or AZ (use IN).
SELECT COUNT(*) 
  FROM invoice
	WHERE billing_state IN ('TX','CA','AZ');
-- Get the average total of the orders.
SELECT AVG(total) 
  FROM invoice;

-- Get all playlist_track track_ids where the playlist name is Music.
SELECT  pt.track_id
  FROM playlist_track pt
  JOIN playlist pl ON pl.playlist_id = pt.playlist_id
  WHERE name = 'Music';
-- Get all track names for playlist_id 5.
SELECT  t.name
  FROM track t
  JOIN playlist_track pl ON pl.track_id = t.track_id
  WHERE playlist_id = 5;
-- Get all track names and the playlist name that they’re on ( 2 joins ).
SELECT  t.name AS Track_Name, p.name AS Playlist_name
  FROM track t
  JOIN playlist_track pl ON pl.track_id = t.track_id
  Join playlist p ON p.playlist_id = pl.playlist_id;
-- Get all track names and album titles that are the genre Alternative & Punk ( 2 joins ).
SELECT  t.name AS Track_Name, a.title 
  FROM track t
  JOIN genre g ON  g.genre_id = t.genre_id
  Join album a  ON a.album_id = t.album_id
  WHERE g.name = 'Alternative & Punk';

