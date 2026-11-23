INSERT INTO lab_report
SELECT l.*, d.department_name
FROM laboratorie l
JOIN departments d ON l.department_id = d.id
WHERE d.department_name ~* '^[бвгджзйклмнпрстфхцчшщ]';

SELECT * FROM lab_report;
