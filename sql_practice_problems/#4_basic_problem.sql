/*
Question:

- Find the average salary and number of job postings for each skill for this:
    - Write a query to list each unique skill from the **`skills_dim`** table.
    - Count how many job postings mention each skill from the **`skills_to_job_dim`** table.
    - Calculate the average yearly salary for job postings associated with each skill.
    - Group the results by the skill name.
    - Order By the average salary
    - Only include postings where salary is not null
- Hint: Use **`LEFT JOIN`** to combine **`skills_dim`**, **`skills_job_dim`**, and **`job_postings_fact`** tables.
- Why? Understand the demand and pay for skills
*/

SELECT
    skills_dim.skills AS skill_name,
    COUNT(job_postings_fact.job_id) AS postings_count,
    ROUND(AVG(job_postings_fact.salary_year_avg),2) AS avg_salary
FROM
    skills_dim
LEFT JOIN skills_job_dim ON skills_dim.skill_id = skills_job_dim.skill_id
LEFT JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
WHERE
-- added condition where salary is not null because i am intrested in salary information 
    salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills
ORDER BY
    avg_salary DESC;

/*

Results
=========

[
  {
    "skill_name": "debian",
    "postings_count": "1",
    "avg_salary": "196500.00"
  },
  {
    "skill_name": "ringcentral",
    "postings_count": "2",
    "avg_salary": "182500.00"
  },
  {
    "skill_name": "mongo",
    "postings_count": "262",
    "avg_salary": "170714.89"
  },
  {
    "skill_name": "lua",
    "postings_count": "1",
    "avg_salary": "170500.00"
  },
  {
    "skill_name": "dplyr",
    "postings_count": "19",
    "avg_salary": "160667.21"
  },
  {
    "skill_name": "haskell",
    "postings_count": "3",
    "avg_salary": "155757.67"
  },
  {
    "skill_name": "asp.net core",
    "postings_count": "1",
    "avg_salary": "155000.00"
  },
  {
    "skill_name": "node",
    "postings_count": "65",
    "avg_salary": "154408.02"
  },
  {
    "skill_name": "cassandra",
    "postings_count": "530",
    "avg_salary": "154124.26"
  },
  {
    "skill_name": "solidity",
    "postings_count": "10",
    "avg_salary": "153639.95"
  },
  {
    "skill_name": "watson",
    "postings_count": "31",
    "avg_salary": "152844.23"
  },
  {
    "skill_name": "codecommit",
    "postings_count": "6",
    "avg_salary": "152289.01"
  },
  {
    "skill_name": "rshiny",
    "postings_count": "29",
    "avg_salary": "151611.15"
  },
  {
    "skill_name": "hugging face",
    "postings_count": "37",
    "avg_salary": "148648.18"
  },
  {
    "skill_name": "neo4j",
    "postings_count": "123",
    "avg_salary": "147707.93"
  },
  {
    "skill_name": "gatsby",
    "postings_count": "2",
    "avg_salary": "147500.00"
  },
  {
    "skill_name": "scala",
    "postings_count": "1912",
    "avg_salary": "145119.51"
  },
  {
    "skill_name": "mlr",
    "postings_count": "1",
    "avg_salary": "145000.00"
  },
  {
    "skill_name": "kafka",
    "postings_count": "1642",
    "avg_salary": "144753.82"
  },
  {
    "skill_name": "pytorch",
    "postings_count": "1081",
    "avg_salary": "144470.14"
  },
  {
    "skill_name": "couchdb",
    "postings_count": "3",
    "avg_salary": "144166.67"
  },
  {
    "skill_name": "mxnet",
    "postings_count": "50",
    "avg_salary": "143694.88"
  },
  {
    "skill_name": "theano",
    "postings_count": "37",
    "avg_salary": "143403.65"
  },
  {
    "skill_name": "shell",
    "postings_count": "731",
    "avg_salary": "143370.21"
  },
  {
    "skill_name": "golang",
    "postings_count": "109",
    "avg_salary": "143138.68"
  },
  {
    "skill_name": "airflow",
    "postings_count": "1506",
    "avg_salary": "142385.76"
  },
  {
    "skill_name": "tensorflow",
    "postings_count": "1225",
    "avg_salary": "142370.32"
  },
  {
    "skill_name": "spark",
    "postings_count": "4025",
    "avg_salary": "141733.54"
  },
  {
    "skill_name": "heroku",
    "postings_count": "6",
    "avg_salary": "141666.67"
  },
  {
    "skill_name": "redshift",
    "postings_count": "1520",
    "avg_salary": "140791.90"
  },
  {
    "skill_name": "airtable",
    "postings_count": "22",
    "avg_salary": "140615.34"
  },
  {
    "skill_name": "ruby on rails",
    "postings_count": "18",
    "avg_salary": "140129.53"
  },
  {
    "skill_name": "scikit-learn",
    "postings_count": "688",
    "avg_salary": "139602.92"
  },
  {
    "skill_name": "dynamodb",
    "postings_count": "220",
    "avg_salary": "139548.17"
  },
  {
    "skill_name": "rust",
    "postings_count": "71",
    "avg_salary": "139348.80"
  },
  {
    "skill_name": "clojure",
    "postings_count": "12",
    "avg_salary": "139342.33"
  },
  {
    "skill_name": "redis",
    "postings_count": "118",
    "avg_salary": "139212.93"
  },
  {
    "skill_name": "atlassian",
    "postings_count": "101",
    "avg_salary": "138650.53"
  },
  {
    "skill_name": "hadoop",
    "postings_count": "2272",
    "avg_salary": "138574.38"
  },
  {
    "skill_name": "snowflake",
    "postings_count": "2458",
    "avg_salary": "137960.50"
  },
  {
    "skill_name": "kubernetes",
    "postings_count": "923",
    "avg_salary": "137948.79"
  },
  {
    "skill_name": "pandas",
    "postings_count": "1049",
    "avg_salary": "137517.93"
  },
  {
    "skill_name": "openstack",
    "postings_count": "7",
    "avg_salary": "137455.45"
  },
  {
    "skill_name": "nosql",
    "postings_count": "1686",
    "avg_salary": "137039.29"
  },
  {
    "skill_name": "numpy",
    "postings_count": "664",
    "avg_salary": "136808.78"
  },
  {
    "skill_name": "fastapi",
    "postings_count": "48",
    "avg_salary": "136574.35"
  },
  {
    "skill_name": "aws",
    "postings_count": "4952",
    "avg_salary": "136480.71"
  },
  {
    "skill_name": "java",
    "postings_count": "2760",
    "avg_salary": "136210.03"
  },
  {
    "skill_name": "keras",
    "postings_count": "409",
    "avg_salary": "136026.35"
  },
  {
    "skill_name": "c",
    "postings_count": "599",
    "avg_salary": "135987.29"
  },
  {
    "skill_name": "splunk",
    "postings_count": "160",
    "avg_salary": "135745.56"
  },
  {
    "skill_name": "next.js",
    "postings_count": "8",
    "avg_salary": "135662.50"
  },
  {
    "skill_name": "kotlin",
    "postings_count": "49",
    "avg_salary": "135639.34"
  },
  {
    "skill_name": "seaborn",
    "postings_count": "151",
    "avg_salary": "135500.67"
  },
  {
    "skill_name": "mysql",
    "postings_count": "912",
    "avg_salary": "135432.35"
  },
  {
    "skill_name": "pyspark",
    "postings_count": "880",
    "avg_salary": "135010.71"
  },
  {
    "skill_name": "perl",
    "postings_count": "153",
    "avg_salary": "134373.87"
  },
  {
    "skill_name": "jupyter",
    "postings_count": "354",
    "avg_salary": "133829.24"
  },
  {
    "skill_name": "c++",
    "postings_count": "750",
    "avg_salary": "133733.17"
  },
  {
    "skill_name": "bigquery",
    "postings_count": "782",
    "avg_salary": "133648.61"
  },
  {
    "skill_name": "no-sql",
    "postings_count": "92",
    "avg_salary": "133555.77"
  },
  {
    "skill_name": "terraform",
    "postings_count": "467",
    "avg_salary": "133161.12"
  },
  {
    "skill_name": "fastify",
    "postings_count": "1",
    "avg_salary": "133000.00"
  },
  {
    "skill_name": "elasticsearch",
    "postings_count": "298",
    "avg_salary": "132741.73"
  },
  {
    "skill_name": "asana",
    "postings_count": "31",
    "avg_salary": "132696.71"
  },
  {
    "skill_name": "matplotlib",
    "postings_count": "372",
    "avg_salary": "132508.38"
  },
  {
    "skill_name": "python",
    "postings_count": "12883",
    "avg_salary": "132439.63"
  },
  {
    "skill_name": "arch",
    "postings_count": "8",
    "avg_salary": "132376.13"
  },
  {
    "skill_name": "datarobot",
    "postings_count": "38",
    "avg_salary": "132210.83"
  },
  {
    "skill_name": "typescript",
    "postings_count": "118",
    "avg_salary": "132149.13"
  },
  {
    "skill_name": "docker",
    "postings_count": "1112",
    "avg_salary": "132039.60"
  },
  {
    "skill_name": "couchbase",
    "postings_count": "27",
    "avg_salary": "131959.38"
  },
  {
    "skill_name": "flask",
    "postings_count": "131",
    "avg_salary": "131958.91"
  },
  {
    "skill_name": "objective-c",
    "postings_count": "2",
    "avg_salary": "131825.00"
  },
  {
    "skill_name": "gcp",
    "postings_count": "1252",
    "avg_salary": "131738.15"
  },
  {
    "skill_name": "go",
    "postings_count": "1394",
    "avg_salary": "131689.02"
  },
  {
    "skill_name": "plotly",
    "postings_count": "167",
    "avg_salary": "131609.85"
  },
  {
    "skill_name": "databricks",
    "postings_count": "1521",
    "avg_salary": "131524.95"
  },
  {
    "skill_name": "aurora",
    "postings_count": "128",
    "avg_salary": "131307.72"
  },
  {
    "skill_name": "mongodb",
    "postings_count": "974",
    "avg_salary": "131207.43"
  },
  {
    "skill_name": "express",
    "postings_count": "334",
    "avg_salary": "131088.49"
  },
  {
    "skill_name": "ruby",
    "postings_count": "270",
    "avg_salary": "130712.14"
  },
  {
    "skill_name": "azure",
    "postings_count": "3480",
    "avg_salary": "130432.96"
  },
  {
    "skill_name": "gitlab",
    "postings_count": "194",
    "avg_salary": "130256.50"
  },
  {
    "skill_name": "gdpr",
    "postings_count": "152",
    "avg_salary": "130194.05"
  },
  {
    "skill_name": "vue",
    "postings_count": "23",
    "avg_salary": "129863.22"
  },
  {
    "skill_name": "nltk",
    "postings_count": "88",
    "avg_salary": "129738.11"
  },
  {
    "skill_name": "svn",
    "postings_count": "27",
    "avg_salary": "129286.81"
  },
  {
    "skill_name": "tidyverse",
    "postings_count": "55",
    "avg_salary": "129103.11"
  },
  {
    "skill_name": "looker",
    "postings_count": "918",
    "avg_salary": "129005.84"
  },
  {
    "skill_name": "jenkins",
    "postings_count": "521",
    "avg_salary": "128872.31"
  },
  {
    "skill_name": "graphql",
    "postings_count": "66",
    "avg_salary": "128659.48"
  },
  {
    "skill_name": "linux",
    "postings_count": "691",
    "avg_salary": "128614.33"
  },
  {
    "skill_name": "django",
    "postings_count": "103",
    "avg_salary": "128528.50"
  },
  {
    "skill_name": "zoom",
    "postings_count": "78",
    "avg_salary": "128427.28"
  },
  {
    "skill_name": "julia",
    "postings_count": "104",
    "avg_salary": "128319.09"
  },
  {
    "skill_name": "git",
    "postings_count": "1358",
    "avg_salary": "128315.81"
  },
  {
    "skill_name": "ibm cloud",
    "postings_count": "70",
    "avg_salary": "127753.06"
  },
  {
    "skill_name": "ubuntu",
    "postings_count": "16",
    "avg_salary": "127649.38"
  },
  {
    "skill_name": "r",
    "postings_count": "5088",
    "avg_salary": "127115.43"
  },
  {
    "skill_name": "angular.js",
    "postings_count": "2",
    "avg_salary": "127050.00"
  },
  {
    "skill_name": "opencv",
    "postings_count": "81",
    "avg_salary": "127033.56"
  },
  {
    "skill_name": "notion",
    "postings_count": "31",
    "avg_salary": "127007.39"
  },
  {
    "skill_name": "ggplot2",
    "postings_count": "104",
    "avg_salary": "126629.58"
  },
  {
    "skill_name": "unity",
    "postings_count": "45",
    "avg_salary": "126608.30"
  },
  {
    "skill_name": "postgresql",
    "postings_count": "560",
    "avg_salary": "126401.34"
  },
  {
    "skill_name": "bitbucket",
    "postings_count": "110",
    "avg_salary": "126316.14"
  },
  {
    "skill_name": "chef",
    "postings_count": "56",
    "avg_salary": "126313.97"
  },
  {
    "skill_name": "twilio",
    "postings_count": "8",
    "avg_salary": "126210.00"
  },
  {
    "skill_name": "node.js",
    "postings_count": "85",
    "avg_salary": "126156.11"
  },
  {
    "skill_name": "centos",
    "postings_count": "24",
    "avg_salary": "125952.86"
  },
  {
    "skill_name": "angular",
    "postings_count": "112",
    "avg_salary": "125599.86"
  },
  {
    "skill_name": "suse",
    "postings_count": "1",
    "avg_salary": "125000.00"
  },
  {
    "skill_name": "ansible",
    "postings_count": "129",
    "avg_salary": "124991.19"
  },
  {
    "skill_name": "sqlite",
    "postings_count": "21",
    "avg_salary": "124975.95"
  },
  {
    "skill_name": "sql",
    "postings_count": "12974",
    "avg_salary": "124934.98"
  },
  {
    "skill_name": "github",
    "postings_count": "658",
    "avg_salary": "124816.07"
  },
  {
    "skill_name": "vmware",
    "postings_count": "22",
    "avg_salary": "124485.82"
  },
  {
    "skill_name": "jira",
    "postings_count": "646",
    "avg_salary": "124154.14"
  },
  {
    "skill_name": "php",
    "postings_count": "113",
    "avg_salary": "123898.27"
  },
  {
    "skill_name": "bash",
    "postings_count": "230",
    "avg_salary": "123892.52"
  },
  {
    "skill_name": "react",
    "postings_count": "197",
    "avg_salary": "123798.79"
  },
  {
    "skill_name": "confluence",
    "postings_count": "260",
    "avg_salary": "123223.30"
  },
  {
    "skill_name": "phoenix",
    "postings_count": "138",
    "avg_salary": "122995.98"
  },
  {
    "skill_name": "puppet",
    "postings_count": "34",
    "avg_salary": "122649.18"
  },
  {
    "skill_name": "c#",
    "postings_count": "496",
    "avg_salary": "122307.21"
  },
  {
    "skill_name": "unix",
    "postings_count": "347",
    "avg_salary": "122117.67"
  },
  {
    "skill_name": "matlab",
    "postings_count": "469",
    "avg_salary": "122047.90"
  },
  {
    "skill_name": "erlang",
    "postings_count": "6",
    "avg_salary": "121583.33"
  },
  {
    "skill_name": "redhat",
    "postings_count": "9",
    "avg_salary": "121466.67"
  },
  {
    "skill_name": "xamarin",
    "postings_count": "2",
    "avg_salary": "121250.00"
  },
  {
    "skill_name": "unify",
    "postings_count": "81",
    "avg_salary": "120250.54"
  },
  {
    "skill_name": "flow",
    "postings_count": "1037",
    "avg_salary": "120211.32"
  },
  {
    "skill_name": "slack",
    "postings_count": "89",
    "avg_salary": "120117.56"
  },
  {
    "skill_name": "swift",
    "postings_count": "41",
    "avg_salary": "119972.10"
  },
  {
    "skill_name": "selenium",
    "postings_count": "34",
    "avg_salary": "119914.15"
  },
  {
    "skill_name": "db2",
    "postings_count": "166",
    "avg_salary": "119823.78"
  },
  {
    "skill_name": "microstrategy",
    "postings_count": "153",
    "avg_salary": "119562.73"
  },
  {
    "skill_name": "spring",
    "postings_count": "220",
    "avg_salary": "119396.78"
  },
  {
    "skill_name": "mariadb",
    "postings_count": "28",
    "avg_salary": "119353.57"
  },
  {
    "skill_name": "groovy",
    "postings_count": "16",
    "avg_salary": "119250.78"
  },
  {
    "skill_name": "cordova",
    "postings_count": "8",
    "avg_salary": "117920.88"
  },
  {
    "skill_name": "powershell",
    "postings_count": "172",
    "avg_salary": "116802.56"
  },
  {
    "skill_name": "tableau",
    "postings_count": "4830",
    "avg_salary": "116795.70"
  },
  {
    "skill_name": "oracle",
    "postings_count": "1357",
    "avg_salary": "115124.95"
  },
  {
    "skill_name": "qlik",
    "postings_count": "366",
    "avg_salary": "115039.91"
  },
  {
    "skill_name": "javascript",
    "postings_count": "752",
    "avg_salary": "114837.07"
  },
  {
    "skill_name": "electron",
    "postings_count": "9",
    "avg_salary": "114678.44"
  },
  {
    "skill_name": "jquery",
    "postings_count": "50",
    "avg_salary": "114645.21"
  },
  {
    "skill_name": "react.js",
    "postings_count": "12",
    "avg_salary": "114449.96"
  },
  {
    "skill_name": "css",
    "postings_count": "144",
    "avg_salary": "113896.56"
  },
  {
    "skill_name": "assembly",
    "postings_count": "72",
    "avg_salary": "113118.58"
  },
  {
    "skill_name": "alteryx",
    "postings_count": "386",
    "avg_salary": "112907.29"
  },
  {
    "skill_name": "sas",
    "postings_count": "3126",
    "avg_salary": "112788.33"
  },
  {
    "skill_name": "unreal",
    "postings_count": "27",
    "avg_salary": "112667.11"
  },
  {
    "skill_name": "sql server",
    "postings_count": "1321",
    "avg_salary": "112487.00"
  },
  {
    "skill_name": "t-sql",
    "postings_count": "247",
    "avg_salary": "112402.81"
  },
  {
    "skill_name": "ssis",
    "postings_count": "569",
    "avg_salary": "112265.44"
  },
  {
    "skill_name": "elixir",
    "postings_count": "8",
    "avg_salary": "112073.46"
  },
  {
    "skill_name": "yarn",
    "postings_count": "58",
    "avg_salary": "111962.73"
  },
  {
    "skill_name": "pulumi",
    "postings_count": "9",
    "avg_salary": "111771.78"
  },
  {
    "skill_name": "terminal",
    "postings_count": "101",
    "avg_salary": "111581.64"
  },
  {
    "skill_name": "asp.net",
    "postings_count": "30",
    "avg_salary": "110963.23"
  },
  {
    "skill_name": "fortran",
    "postings_count": "9",
    "avg_salary": "110083.33"
  },
  {
    "skill_name": "qt",
    "postings_count": "1",
    "avg_salary": "110000.00"
  },
  {
    "skill_name": "windows",
    "postings_count": "321",
    "avg_salary": "109717.61"
  },
  {
    "skill_name": "html",
    "postings_count": "236",
    "avg_salary": "109678.18"
  },
  {
    "skill_name": "sass",
    "postings_count": "7",
    "avg_salary": "109585.29"
  },
  {
    "skill_name": "dax",
    "postings_count": "186",
    "avg_salary": "109408.42"
  },
  {
    "skill_name": "firebase",
    "postings_count": "28",
    "avg_salary": "109094.79"
  },
  {
    "skill_name": "sap",
    "postings_count": "503",
    "avg_salary": "108102.70"
  },
  {
    "skill_name": "power bi",
    "postings_count": "2589",
    "avg_salary": "106737.76"
  },
  {
    "skill_name": "cobol",
    "postings_count": "6",
    "avg_salary": "106496.50"
  },
  {
    "skill_name": "macos",
    "postings_count": "12",
    "avg_salary": "105771.48"
  },
  {
    "skill_name": "dart",
    "postings_count": "9",
    "avg_salary": "105372.94"
  },
  {
    "skill_name": "drupal",
    "postings_count": "7",
    "avg_salary": "105234.43"
  },
  {
    "skill_name": "chainer",
    "postings_count": "2",
    "avg_salary": "105000.00"
  },
  {
    "skill_name": "clickup",
    "postings_count": "3",
    "avg_salary": "105000.00"
  },
  {
    "skill_name": "vue.js",
    "postings_count": "6",
    "avg_salary": "104958.33"
  },
  {
    "skill_name": "lisp",
    "postings_count": "4",
    "avg_salary": "104123.75"
  },
  {
    "skill_name": "visio",
    "postings_count": "169",
    "avg_salary": "103748.82"
  },
  {
    "skill_name": "ssrs",
    "postings_count": "330",
    "avg_salary": "103188.88"
  },
  {
    "skill_name": "spss",
    "postings_count": "476",
    "avg_salary": "102626.66"
  },
  {
    "skill_name": "vba",
    "postings_count": "347",
    "avg_salary": "101845.84"
  },
  {
    "skill_name": "cognos",
    "postings_count": "146",
    "avg_salary": "101469.12"
  },
  {
    "skill_name": "wrike",
    "postings_count": "2",
    "avg_salary": "101250.00"
  },
  {
    "skill_name": "wire",
    "postings_count": "13",
    "avg_salary": "100704.42"
  },
  {
    "skill_name": "crystal",
    "postings_count": "132",
    "avg_salary": "99941.56"
  },
  {
    "skill_name": "excel",
    "postings_count": "3835",
    "avg_salary": "99750.75"
  },
  {
    "skill_name": "powerpoint",
    "postings_count": "956",
    "avg_salary": "99160.12"
  },
  {
    "skill_name": "word",
    "postings_count": "1012",
    "avg_salary": "99012.16"
  },
  {
    "skill_name": "sharepoint",
    "postings_count": "301",
    "avg_salary": "98611.50"
  },
  {
    "skill_name": "visual basic",
    "postings_count": "71",
    "avg_salary": "98511.39"
  },
  {
    "skill_name": "delphi",
    "postings_count": "1",
    "avg_salary": "98496.00"
  },
  {
    "skill_name": "symphony",
    "postings_count": "7",
    "avg_salary": "98400.00"
  },
  {
    "skill_name": "workfront",
    "postings_count": "7",
    "avg_salary": "97841.44"
  },
  {
    "skill_name": "npm",
    "postings_count": "10",
    "avg_salary": "97030.00"
  },
  {
    "skill_name": "homebrew",
    "postings_count": "1",
    "avg_salary": "96773.00"
  },
  {
    "skill_name": "svelte",
    "postings_count": "2",
    "avg_salary": "94575.00"
  },
  {
    "skill_name": "sheets",
    "postings_count": "215",
    "avg_salary": "94454.91"
  },
  {
    "skill_name": "spreadsheet",
    "postings_count": "167",
    "avg_salary": "93746.43"
  },
  {
    "skill_name": "microsoft teams",
    "postings_count": "18",
    "avg_salary": "93559.25"
  },
  {
    "skill_name": "outlook",
    "postings_count": "305",
    "avg_salary": "93219.83"
  },
  {
    "skill_name": "colocation",
    "postings_count": "5",
    "avg_salary": "92942.80"
  },
  {
    "skill_name": "trello",
    "postings_count": "20",
    "avg_salary": "92643.46"
  },
  {
    "skill_name": "ms access",
    "postings_count": "99",
    "avg_salary": "92340.97"
  },
  {
    "skill_name": "pascal",
    "postings_count": "1",
    "avg_salary": "92000.00"
  },
  {
    "skill_name": "apl",
    "postings_count": "2",
    "avg_salary": "90000.00"
  },
  {
    "skill_name": "kali",
    "postings_count": "1",
    "avg_salary": "89100.00"
  },
  {
    "skill_name": "webex",
    "postings_count": "4",
    "avg_salary": "88750.00"
  },
  {
    "skill_name": "flutter",
    "postings_count": "8",
    "avg_salary": "87702.13"
  },
  {
    "skill_name": "vb.net",
    "postings_count": "13",
    "avg_salary": "87226.38"
  },
  {
    "skill_name": "planner",
    "postings_count": "31",
    "avg_salary": "83419.64"
  },
  {
    "skill_name": "laravel",
    "postings_count": "5",
    "avg_salary": "82200.00"
  },
  {
    "skill_name": "smartsheet",
    "postings_count": "35",
    "avg_salary": "81049.00"
  },
  {
    "skill_name": "firestore",
    "postings_count": "3",
    "avg_salary": "80018.67"
  },
  {
    "skill_name": "monday.com",
    "postings_count": "8",
    "avg_salary": "77879.75"
  },
  {
    "skill_name": "blazor",
    "postings_count": "3",
    "avg_salary": "74733.33"
  },
  {
    "skill_name": "digitalocean",
    "postings_count": "2",
    "avg_salary": "65000.00"
  }
]
*/


