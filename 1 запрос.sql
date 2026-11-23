SELECT l.id
FROM laboratorie l
JOIN departments d ON l.department_id = d.id
WHERE d.graduating_department = TRUE;
