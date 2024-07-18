/*
What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries (NO NULLS), regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve on 
*/

SELECT 
    skills_dim.skills,
    ROUND(AVG(job_postings_fact.salary_year_avg), 2) AS skill_avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst' AND
    job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    skill_avg_salary DESC
LIMIT 25

/*

Here's a breakdown of the results for top paying skills for Data Analysts:
- High Demand for Big Data & ML Skills: Top salaries are commanded by analysts skilled in big data technologies (PySpark, Couchbase), 
    machine learning tools (DataRobot, Jupyter), and Python libraries (Pandas, NumPy), reflecting the industry's high valuation of data processing and predictive modeling capabilities.
- Software Development & Deployment Proficiency: Knowledge in development and deployment tools (GitLab, Kubernetes, Airflow) indicates a lucrative crossover between data analysis and engineering, 
    with a premium on skills that facilitate automation and efficient data pipeline management.
- Cloud Computing Expertise: Familiarity with cloud and data engineering tools (Elasticsearch, Databricks, GCP) underscores the growing importance of cloud-based analytics environments, 
    suggesting that cloud proficiency significantly boosts earning potential in data analytics.

Results 
=========

[
  {
    "skills": "svn",
    "skill_avg_salary": "400000.00"
  },
  {
    "skills": "solidity",
    "skill_avg_salary": "179000.00"
  },
  {
    "skills": "couchbase",
    "skill_avg_salary": "160515.00"
  },
  {
    "skills": "datarobot",
    "skill_avg_salary": "155485.50"
  },
  {
    "skills": "golang",
    "skill_avg_salary": "155000.00"
  },
  {
    "skills": "mxnet",
    "skill_avg_salary": "149000.00"
  },
  {
    "skills": "dplyr",
    "skill_avg_salary": "147633.33"
  },
  {
    "skills": "vmware",
    "skill_avg_salary": "147500.00"
  },
  {
    "skills": "terraform",
    "skill_avg_salary": "146733.83"
  },
  {
    "skills": "twilio",
    "skill_avg_salary": "138500.00"
  },
  {
    "skills": "gitlab",
    "skill_avg_salary": "134126.00"
  },
  {
    "skills": "kafka",
    "skill_avg_salary": "129999.16"
  },
  {
    "skills": "puppet",
    "skill_avg_salary": "129820.00"
  },
  {
    "skills": "keras",
    "skill_avg_salary": "127013.33"
  },
  {
    "skills": "pytorch",
    "skill_avg_salary": "125226.20"
  },
  {
    "skills": "perl",
    "skill_avg_salary": "124685.75"
  },
  {
    "skills": "ansible",
    "skill_avg_salary": "124370.00"
  },
  {
    "skills": "hugging face",
    "skill_avg_salary": "123950.00"
  },
  {
    "skills": "tensorflow",
    "skill_avg_salary": "120646.83"
  },
  {
    "skills": "cassandra",
    "skill_avg_salary": "118406.68"
  },
  {
    "skills": "notion",
    "skill_avg_salary": "118091.67"
  },
  {
    "skills": "atlassian",
    "skill_avg_salary": "117965.60"
  },
  {
    "skills": "bitbucket",
    "skill_avg_salary": "116711.75"
  },
  {
    "skills": "airflow",
    "skill_avg_salary": "116387.26"
  },
  {
    "skills": "scala",
    "skill_avg_salary": "115479.53"
  }
]

*/