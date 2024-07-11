/*
Question: What are the top-paying data analyst jobs, and what skills are required?
- Use the top 20 highest-paying Data Analyst jobs from the first query
- Add the specific skills required for these roles.
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (

    SELECT
        job_id,
        job_title,
        job_location,
        job_schedule_type,
        salary_year_avg,
        job_posted_date,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN 
        company_dim ON job_postings_fact.company_id = company_dim.company_id   
    WHERE
        (job_title_short = 'Data Analyst' AND (job_location = 'Florida' OR job_location = 'New York' OR job_location = 'Anywhere'))
        AND salary_year_avg IS NOT NULL 
    ORDER BY
        salary_year_avg DESC
    LIMIT
        20
)

SELECT *
FROM top_paying_jobs
