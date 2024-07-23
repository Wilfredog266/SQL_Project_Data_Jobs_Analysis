/*
Question:

- Find the average, minimum, and maximum salary range for each `job_title_short`
- Only include job titles with more than 5 postings (I.e., filter out outliers)
- Group data by `job_title_short`

- Why? Compare the salary metrics between the different types of data jobs
*/

SELECT
    job_title_short AS job_title,
-- included the count to see the difference in the ammount of postings per job title
    COUNT(job_id) AS job_postings,
    ROUND(AVG(salary_year_avg),2) AS avg_salary,
    MIN(salary_year_avg) AS min_salary,
    MAX(salary_year_avg) AS max_salary
FROM
    job_postings_fact
Group BY
    job_title_short
-- added this aggregation condition as practice alhtough the counts are no where near five job postings 
HAVING
    COUNT(job_id) > 5 
ORDER BY
    avg_salary DESC;

/*

Results
=========
[
  {
    "job_title": "Senior Data Scientist",
    "job_postings": "37076",
    "avg_salary": "154050.03",
    "min_salary": "45000.0",
    "max_salary": "890000.0"
  },
  {
    "job_title": "Senior Data Engineer",
    "job_postings": "44692",
    "avg_salary": "145866.87",
    "min_salary": "35000.0",
    "max_salary": "425000.0"
  },
  {
    "job_title": "Data Scientist",
    "job_postings": "172726",
    "avg_salary": "135929.48",
    "min_salary": "27000.0",
    "max_salary": "960000.0"
  },
  {
    "job_title": "Data Engineer",
    "job_postings": "186679",
    "avg_salary": "130266.87",
    "min_salary": "15000.0",
    "max_salary": "525000.0"
  },
  {
    "job_title": "Machine Learning Engineer",
    "job_postings": "14106",
    "avg_salary": "126785.91",
    "min_salary": "30000.0",
    "max_salary": "325000.0"
  },
  {
    "job_title": "Senior Data Analyst",
    "job_postings": "29289",
    "avg_salary": "114104.05",
    "min_salary": "30000.0",
    "max_salary": "425000.0"
  },
  {
    "job_title": "Software Engineer",
    "job_postings": "45019",
    "avg_salary": "112777.64",
    "min_salary": "28000.0",
    "max_salary": "375000.0"
  },
  {
    "job_title": "Cloud Engineer",
    "job_postings": "12346",
    "avg_salary": "111268.45",
    "min_salary": "42000.0",
    "max_salary": "280000.0"
  },
  {
    "job_title": "Data Analyst",
    "job_postings": "196593",
    "avg_salary": "93875.79",
    "min_salary": "25000.0",
    "max_salary": "650000.0"
  },
  {
    "job_title": "Business Analyst",
    "job_postings": "49160",
    "avg_salary": "91071.04",
    "min_salary": "16500.0",
    "max_salary": "387460.0"
  }
]

*/


