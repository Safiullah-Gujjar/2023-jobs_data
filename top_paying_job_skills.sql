
WITH top_paying_jobs AS (
    SELECT
        job_id,
        name AS company_name,
        job_title,
        salary_year_avg

    FROM
        job_postings_fact
    lEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
) 
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

--This project analyzed the skills required in top-paying jobs to identify which are most in demand. The results show that SQL, Python, and Tableau are the most frequently required skills, making them the core foundation for high-paying roles.

Beyond these basics, employers strongly value skills in cloud platforms (AWS, Azure) and big data tools (Spark, Databricks), which are more closely linked to higher salaries. Visualization and spreadsheet tools like Tableau and Excel are commonly expected, but mainly as supporting skills.

Overall, the findings highlight that the most in-demand candidates combine data, programming, and cloud skills, showing that a well-rounded technical skill set is key to accessing top-paying opportunities.