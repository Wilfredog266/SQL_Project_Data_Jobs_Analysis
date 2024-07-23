/*
Question:

- Get job details for BOTH 'Data Analyst' or 'Business Analyst' positions
    - For ‘Data Analyst,’ I want jobs only > $100k
    - For ‘Business Analyst,’ I only want jobs > $70K
- Only include jobs located in EITHER:
    - 'Boston, MA'
    - 'Anywhere' (i.e., Remote jobs)
- Query Notes: Include job title abbreviation, location, posting source, and average yearly salary

*/

SELECT
    job_title_short AS job_title,
    job_location AS location,
    job_via AS posting_source,
    salary_year_avg AS avg_salary
FROM
    job_postings_fact
WHERE
-- used (IN) because the location of the job posting can be either no matter the job title
    job_location IN ('Boston, MA', 'Anywhere') AND
    (
-- used closed parenthesis to apply specicfic conditions per job title ensuring it will be filtered out accordingly
    (job_title_short = 'Data Analyst' AND salary_year_avg > 100000) OR
    (job_title_short = 'Business Analyst' AND salary_year_avg > 70000)
    )
-- ordered by salary_year_avg in descending to see which jobs are the top paying ones amongst both titles 
ORDER BY
    salary_year_avg DESC

-- Limit to 10 for purpose of showcasing the top ten results in query
LIMIT 10;

/*

Results
=========
[
  {
    "job_title": "Data Analyst",
    "location": "Anywhere",
    "posting_source": "via Y Combinator",
    "avg_salary": "650000.0"
  },
  {
    "job_title": "Data Analyst",
    "location": "Anywhere",
    "posting_source": "via LinkedIn",
    "avg_salary": "336500.0"
  },
  {
    "job_title": "Data Analyst",
    "location": "Anywhere",
    "posting_source": "via ZipRecruiter",
    "avg_salary": "255829.5"
  },
  {
    "job_title": "Data Analyst",
    "location": "Anywhere",
    "posting_source": "via Indeed",
    "avg_salary": "232423.0"
  },
  {
    "job_title": "Data Analyst",
    "location": "Boston, MA",
    "posting_source": "via Ladders",
    "avg_salary": "225000.0"
  },
  {
    "job_title": "Business Analyst",
    "location": "Anywhere",
    "posting_source": "via LinkedIn",
    "avg_salary": "220000.0"
  },
  {
    "job_title": "Data Analyst",
    "location": "Anywhere",
    "posting_source": "via Recruit.net",
    "avg_salary": "217000.0"
  },
  {
    "job_title": "Business Analyst",
    "location": "Anywhere",
    "posting_source": "via ZipRecruiter",
    "avg_salary": "214500.0"
  },
  {
    "job_title": "Data Analyst",
    "location": "Anywhere",
    "posting_source": "via Built In NYC",
    "avg_salary": "205000.0"
  },
  {
    "job_title": "Business Analyst",
    "location": "Anywhere",
    "posting_source": "via Wellfound",
    "avg_salary": "200000.0"
  }
]

*/