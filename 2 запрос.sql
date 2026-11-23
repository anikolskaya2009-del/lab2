DROP TABLE IF EXISTS lab_report;

CREATE TABLE lab_report AS
SELECT l.*, d.department_name
FROM laboratorie l
JOIN departments d ON l.department_id = d.id
WHERE l.laboratory_name ILIKE '%компьютер%'
  AND (l.manager IS NULL OR TRIM(l.manager) = '');
