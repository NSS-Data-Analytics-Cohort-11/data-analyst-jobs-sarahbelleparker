SELECT *
FROM data_analyst_jobs;


--


--1. How many rows are in the data_analyst_jobs table?
SELECT COUNT (*)
FROM data_analyst_jobs;

--answer: 1793


--


--2.Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT *
FROM data_analyst_jobs
LIMIT 10;

--answer: ExxonMobil


--


--3. How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT COUNT (location)
FROM data_analyst_jobs
WHERE location = 'TN';

--answer: (TN only) 21

SELECT COUNT (location)
FROM data_analyst_jobs
WHERE location = 'TN'
	OR location = 'KY';
	
--answer: (TN and KY) 27


--


--Question 4. How many postings in Tennessee have a star rating above 4?
SELECT COUNT (star_rating)
FROM data_analyst_jobs
WHERE star_rating > 4;

--answer: 416