/*
Question: What are the top-paying data analyst jobs?
- Identify the top 20 highest-paying Data Analyst roles that are available remotely or in Florida or New York
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Inlcude company names of the top 20 roles
- Why? Aims to highlight the top-paying opportunities for Data Analysts, 
    offering insights into employment options and location flexibility
*/

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
    20;


/*
Insights from the Data Analyst Job Postings in 2023

Average Salary Across All Listed Roles:
The average salary for the top 20 data analyst roles is approximately $215,278.43 per year.

Distribution of Job Titles:
The most common job title is "Data Analyst," appearing 3 times.
Several unique roles appear only once, such as "ERM Data Analyst," "Principal Data Intelligence Analyst - Cardiac - Remote," and "Manager, Data Analyst."

Companies with the Highest Average Salary Offers:
Mantys offers the highest average salary at $650,000.00.
Other companies with notable average salaries include Meta ($336,500.00) and AT&T ($255,829.50).

Results 
========

[
  {
    "job_id": 226942,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "650000.0",
    "job_posted_date": "2023-02-20 15:13:33",
    "company_name": "Mantys"
  },
  {
    "job_id": 547382,
    "job_title": "Director of Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "336500.0",
    "job_posted_date": "2023-08-23 12:04:42",
    "company_name": "Meta"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "job_posted_date": "2023-06-18 16:03:12",
    "company_name": "AT&T"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "job_posted_date": "2023-12-05 20:00:40",
    "company_name": "Pinterest Job Advertisements"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "job_posted_date": "2023-01-17 00:17:23",
    "company_name": "Uclahealthcareers"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "job_posted_date": "2023-08-09 11:00:01",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "job_posted_date": "2023-12-07 15:00:13",
    "company_name": "Inclusively"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "job_posted_date": "2023-01-05 00:00:25",
    "company_name": "Motional"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "job_posted_date": "2023-07-11 16:00:05",
    "company_name": "SmartAsset"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "184000.0",
    "job_posted_date": "2023-06-09 08:01:04",
    "company_name": "Get It Recruit - Information Technology"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "job_location": "Anywhere",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "170000.0",
    "job_posted_date": "2023-01-23 22:28:01",
    "company_name": "Kelly Science, Engineering, Technology & Telecom"
  },
  {
    "job_id": 1352513,
    "job_title": "REMOTE Director of Data Analytics",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "170000.0",
    "job_posted_date": "2023-08-09 14:02:45",
    "company_name": "A-Line Staffing Solutions"
  },
  {
    "job_id": 1781684,
    "job_title": "DTCC Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "170000.0",
    "job_posted_date": "2023-10-06 00:01:41",
    "company_name": "Robert Half"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "167000.0",
    "job_posted_date": "2023-04-18 07:01:17",
    "company_name": "Uber"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-12-08 09:16:37",
    "company_name": "Plexus Resource Solutions"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14 16:01:19",
    "company_name": "Get It Recruit - Information Technology"
  },
  {
    "job_id": 1799883,
    "job_title": "Principal Data Science Analyst- Remote",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "164746.0",
    "job_posted_date": "2023-04-14 12:05:19",
    "company_name": "Mayo Clinic"
  },
  {
    "job_id": 1423236,
    "job_title": "Principal Data Science Analyst- Remote",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "164746.0",
    "job_posted_date": "2023-01-13 13:04:39",
    "company_name": "Mayo Clinic"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163500.0",
    "job_posted_date": "2023-09-20 13:00:44",
    "company_name": "CEDARS-SINAI"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160515.0",
    "job_posted_date": "2023-06-14 21:01:17",
    "company_name": "DIRECTV"
  }
]
*/