SELECT 
    d.department_name AS Кафедра,
    COUNT(l.id) AS Количество_лабораторий,
    ROUND(AVG(l.workplaces), 2) AS Среднее_число_мест
FROM departments d
LEFT JOIN laboratorie l ON d.id = l.department_id
GROUP BY d.id, d.department_name;
