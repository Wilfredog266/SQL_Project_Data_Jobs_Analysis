/*
Question:

- Look for non-senior data analyst or business analyst roles
    - Only get job titles that include either ‘Data’ or ‘Business’
    - Also include those with ‘Analyst’ in any part of the title
    - Don’t include any job titles with ‘Senior’ followed by any character

- Get the job title, location, and average yearly salary
    - rename the columns appropriately
*/

SELECT
    job_title,
    job_location AS location,
    salary_year_avg AS avg_salary
FROM
    job_postings_fact
-- put into parenthesis the most important conditions so they would be filtered out first since they target specific job titles 
WHERE
    (job_title LIKE '%Data%' OR job_title LIKE '%Business%') AND
    job_title LIKE '%Analyst%' AND 
    job_title NOT LIKE 'Senior%' AND
-- added salary not null because I am intrested in seeing job postings with their salary
    salary_year_avg IS NOT NULL
-- order by salary in descending to see the top paying jobs 
ORDER BY
    salary_year_avg DESC
-- limit to 20 to get top twentie paying jobs that match my conditions
LIMIT 20;

/*

Results
==========
[
  {
    "job_title": "Data Analyst",
    "location": "Anywhere",
    "avg_salary": "650000.0"
  },
  {
    "job_title": "Sr Data Analyst",
    "location": "Bethesda, MD",
    "avg_salary": "375000.0"
  },
  {
    "job_title": "HC Data Analyst , Senior",
    "location": "Bethesda, MD",
    "avg_salary": "375000.0"
  },
  {
    "job_title": "Sr. Oracle Database Analyst",
    "location": "Springfield, VA",
    "avg_salary": "375000.0"
  },
  {
    "job_title": "Data Analyst",
    "location": "San Francisco, CA",
    "avg_salary": "350000.0"
  },
  {
    "job_title": "Data Analyst",
    "location": "San Francisco, CA",
    "avg_salary": "240000.0"
  },
  {
    "job_title": "Data Sector Analyst - Hedge Fund in Midtown",
    "location": "New York, NY",
    "avg_salary": "240000.0"
  },
  {
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "location": "New York, NY",
    "avg_salary": "239777.5"
  },
  {
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "location": "New York, NY",
    "avg_salary": "239777.5"
  },
  {
    "job_title": "Principal, Data Analyst",
    "location": "Sunnyvale, CA",
    "avg_salary": "234000.0"
  },
  {
    "job_title": "Data Analyst, Marketing",
    "location": "Anywhere",
    "avg_salary": "232423.0"
  },
  {
    "job_title": "Data Analyst",
    "location": "Fairfax, VA",
    "avg_salary": "225000.0"
  },
  {
    "job_title": "Artemis Analyst & Data Science Engineer",
    "location": "Orlando, FL",
    "avg_salary": "225000.0"
  },
  {
    "job_title": "Reference Data Analyst",
    "location": "New York, NY",
    "avg_salary": "225000.0"
  },
  {
    "job_title": "Data Analyst Director",
    "location": "Boston, MA",
    "avg_salary": "225000.0"
  },
  {
    "job_title": "E-commerce Data Analyst",
    "location": "San Jose, CA",
    "avg_salary": "224500.0"
  },
  {
    "job_title": "Data Analyst Manager, TikTok-US-Data Security",
    "location": "Los Angeles, CA",
    "avg_salary": "222500.0"
  },
  {
    "job_title": "TikTok Shop - Data Analyst",
    "location": "San Jose, CA",
    "avg_salary": "222093.5"
  },
  {
    "job_title": "Staff Consultant - Data Analyst - Springfield, VA location",
    "location": "Chantilly, VA",
    "avg_salary": "218500.0"
  },
  {
    "job_title": "Staff Consultant - Data Analyst --- Springfield, VA location",
    "location": "Chantilly, VA",
    "avg_salary": "218500.0"
  }
]

*/

