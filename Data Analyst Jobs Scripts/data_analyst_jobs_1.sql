SELECT *
FROM data_analyst_jobs;


--


--1. How many rows are in the data_analyst_jobs table?
SELECT COUNT (*)
FROM data_analyst_jobs;

--answer: 1793


--


--2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
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


--4. How many postings in Tennessee have a star rating above 4?
SELECT COUNT (star_rating)
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;

--answer: 3


--


--5. How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT (review_count)
FROM data_analyst_jobs
WHERE (review_count BETWEEN 500 And 1000);

--answer: 151


--


--6. Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?
SELECT location AS state, AVG (star_rating) AS avg_rating 
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;

--answer: Nebraska


--


--7. Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs;

--answer: 881


--


--8. How many unique job titles are there for California companies?
SELECT COUNT (DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

--answer: 230


--


--9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
SELECT company, AVG (star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000
AND company IS NOT NULL
GROUP BY company;

--answer: 40


--


--10. Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT company, AVG (star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000
AND company IS NOT NULL
GROUP BY company
ORDER BY AVG (star_rating) DESC;

--answer: There were six companies with the same average star rating: Unilever, General Motors, Nike, American Express, Microsoft, and Kaiser Permanente


--


--11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 
SELECT DISTINCT (title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

--answer: 774 unique job titles contain the word "Analyst"; 1,669 total job titles contain the word "Analyst"


--


--12. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
SELECT *
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';

--answer: There are four job titles that do not have "Analyst" or "Analytics" in them, and the word these titles have in common appears to be the word "Tableau".


--


--BONUS: You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
-- Disregard any postings where the domain is NULL. 
-- Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
SELECT domain, COUNT(title)
FROM data_analyst_jobs
WHERE skill ILIKE 'SQL'
	AND days_since_posting > (7*3)
	AND domain IS NOT NULL
GROUP BY domain
ORDER BY COUNT(title) DESC;

--answer: Consulting and Business Services and Consumer Goods and Services are the two industries with the most long-standing job openings

--Bonus, part 2:  Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?
SELECT domain, COUNT(title)
FROM data_analyst_jobs
WHERE skill ILIKE 'SQL'
	AND days_since_posting > (7*3)
	AND domain IS NOT NULL
GROUP BY domain
ORDER BY COUNT(title) DESC
LIMIT 4;

--answer: The top four industries for hard to fill jobs are Consulting and Business Services, Consumer Goods and Services, Computers and Electronics, and Internet and Software. For Consulting and Business services there are five jobs that have been listed for more than three weeks. For Consumer Goods and Services there are two jobs that have been listed for more than three weeks. For both Computers and Electronics and Internet and Software, there have been one job each that have been listed for more than three weeks.