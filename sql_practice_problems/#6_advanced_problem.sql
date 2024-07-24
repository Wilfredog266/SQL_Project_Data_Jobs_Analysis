/*

I only want to look at job postings from the first quarter with a salary over $80k. 

- Note: I created three separate tables from the job_postings_fact table for each month of the first quarter of the year (Jan-Mar) with this query 

        CREATE TABLE (table name with month) AS

        SELECT
            *
        FROM
            job_postings_fact
        WHERE
            EXTRACT(MONTH FROM job_posted_date) = (month of the year);

- Alias is necessary because it will return an error without it. It’s needed for subqueries in the FROM clause.
- Combine job posting tables from the first quarter of 2023 (Jan-Mar) (Use UNION_ALL)
- Gets job postings with an average yearly salary > $80,000 from the first quarter of 2023 (Jan-Mar)
- Why? Look at job postings for the first quarter of 2023 (Jan-Mar) that have a salary > $80,000

*/

SELECT
    quarter1_job_postings.job_title_short,
    quarter1_job_postings.job_location,
    quarter1_job_postings.job_posted_date,
    quarter1_job_postings.salary_year_avg,
    quarter1_job_postings.job_work_from_home
-- use of a subquery in the FROM statement using UNION ALL to create a table containing the information on the job postings from the first quarter of the year
FROM
    (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL 
    SELECT *
    FROM march_jobs
    ) AS quarter1_job_postings 
WHERE
    quarter1_job_postings.salary_year_avg > 80000
ORDER BY
    quarter1_job_postings.salary_year_avg DESC;


