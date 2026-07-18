-- attrition rate by department

SELECT 
  Department,
  COUNT(*) AS total_employees,
  SUM(AttritionFlag) AS employees_left,
  ROUND(100.0 * SUM(AttritionFlag) / COUNT(*), 2) AS attrition_rate
FROM hr_attrition_clean
GROUP BY Department
ORDER BY attrition_rate DESC;


-- overtime impact on attrition

select OverTime,
count(*) as total_employee,
sum(AttritionFlag) as employee_left,
round(100.0 * sum(AttritionFlag) / count(*),2) as attrition_rate
from hr_attrition_clean
group by OverTime
order by attrition_rate desc;


-- average salary for left vs stayed

select Attrition,
count(*) as total_employees,
round(avg(MonthlyIncome),0) as aerage_monthly_income
from hr_attrition_clean
group by Attrition;


-- attrition rate by tenure bucket

select TenureBucket,
  count(*) as total_employees,
  sum(AttritionFlag) as employees_left,
  round(100.0 * sum(AttritionFlag) / count(*), 2) as attrition_rate,
  rank() over (order by sum(AttritionFlag) * 1.0 / count(*) desc) as risk_rank
from hr_attrition_clean
group by TenureBucket
order by attrition_rate desc;