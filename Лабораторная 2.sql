-- Задание 1. 
SELECT id
FROM laboratorie
WHERE laboratory_name ILIKE '%компьютер%'
  AND (manager IS NULL OR TRIM(manager) = '');
-- Задание 2. 
SELECT l.id
FROM laboratorie l
JOIN departments d ON l.department_id = d.id
WHERE d.graduating_department = TRUE;
-- Задание 3. 
DROP TABLE IF EXISTS lab_report;

CREATE TABLE lab_report AS
SELECT l.*, d.department_name
FROM laboratorie l
JOIN departments d ON l.department_id = d.id
WHERE l.laboratory_name ILIKE '%компьютер%'
  AND (l.manager IS NULL OR TRIM(l.manager) = '');

SELECT * FROM lab_report;
-- Задание 4. 
INSERT INTO lab_report
SELECT l.*, d.department_name
FROM laboratorie l
JOIN departments d ON l.department_id = d.id
WHERE d.department_name ~* '^[бвгджзйклмнпрстфхцчшщ]';

SELECT * FROM lab_report;
-- Задание 5. 
UPDATE lab_report
SET workplaces = workplaces * 2
WHERE project_equipment = TRUE;

SELECT * FROM lab_report;
-- Задание 6. 
DELETE FROM lab_report
WHERE id = 2;

SELECT * FROM lab_report;
-- Задание 7. 
SELECT 
    d.department_name AS Кафедра,
    COUNT(l.id) AS Количество_лабораторий,
    ROUND(AVG(l.workplaces), 2) AS Среднее_число_мест
FROM departments d
LEFT JOIN laboratorie l ON d.id = l.department_id
GROUP BY d.id, d.department_name;

