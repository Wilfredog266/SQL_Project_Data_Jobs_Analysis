/*
Question:

- Find the count of the number of remote job postings per skill
    - Display the top 5 skills in descending order by their demand in remote jobs
    - Include skill ID, name, and count of postings requiring the skill
    - Why? Identify the top 5 skills in demand for remote jobs
*/
-- created a CTE to help make it be more readable 
WITH remote_skill_demand AS 
(
    SELECT
        skills_job_dim.skill_id,
        COUNT(*) AS skill_count
    FROM
        job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE
        job_work_from_home = TRUE
    GROUP BY
        skills_job_dim.skill_id
)

SELECT
    remote_skill_demand.skill_id,
    skills_dim.skills AS skill_name,
    remote_skill_demand.skill_count AS demand_count
FROM
    remote_skill_demand 
    INNER JOIN skills_dim ON remote_skill_demand.skill_id = skills_dim.skill_id
ORDER BY
    remote_skill_demand.skill_count DESC
LIMIT 5;

/*

Results
========

[
  {
    "skill_id": 1,
    "skill_name": "python",
    "demand_count": "40524"
  },
  {
    "skill_id": 0,
    "skill_name": "sql",
    "demand_count": "40254"
  },
  {
    "skill_id": 76,
    "skill_name": "aws",
    "demand_count": "18264"
  },
  {
    "skill_id": 74,
    "skill_name": "azure",
    "demand_count": "13913"
  },
  {
    "skill_id": 92,
    "skill_name": "spark",
    "demand_count": "13066"
  }
]
*/