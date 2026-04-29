SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS salary

FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    salary DESC

LIMIT 25;

--The highest-paying skills are mostly specialized and advanced technologies rather than basic ones. Skills in blockchain (Solidity), backend development (Golang), and distributed databases (Couchbase) command some of the highest salaries.

There is also strong representation of AI and machine learning tools (TensorFlow, PyTorch, Hugging Face), showing that expertise in this area is highly valued. In addition, cloud, DevOps, and data engineering tools (Terraform, Kafka, Airflow, Ansible) are linked to high pay, reflecting demand for managing large-scale systems.

Overall, the key insight is that top salaries are driven by niche, high-impact skills in AI, cloud, and scalable systems, rather than general or entry-level technologies.