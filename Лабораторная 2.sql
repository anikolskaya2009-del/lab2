-- Задание 1. Выбрать номера компьютерных лабораторий, с вакантной должностью заведующего лабораторией.
SELECT id
FROM laboratorie
WHERE laboratory_name ILIKE '%компьютер%'
  AND (manager IS NULL OR TRIM(manager) = '');
-- Задание 2. Выбрать номера всех лабораторий, входящих в состав выпускающих кафедр.
SELECT l.id
FROM laboratorie l
JOIN departments d ON l.department_id = d.id
WHERE d.graduating_department = TRUE;
-- Задание 3. Создать таблицу, содержащую данные 1 запроса с указанием кафедр, к которым относятся лаборатории, и данных из таблицы «лаборатории».
DROP TABLE IF EXISTS lab_report;

CREATE TABLE lab_report AS
SELECT l.*, d.department_name
FROM laboratorie l
JOIN departments d ON l.department_id = d.id
WHERE l.laboratory_name ILIKE '%компьютер%'
  AND (l.manager IS NULL OR TRIM(l.manager) = '');

SELECT * FROM lab_report;
-- Задание 4. Добавить в созданную таблицу все лаборатории кафедр, названия которых начинаются на согласные буквы.
INSERT INTO lab_report
SELECT l.*, d.department_name
FROM laboratorie l
JOIN departments d ON l.department_id = d.id
WHERE d.department_name ~* '^[бвгджзйклмнпрстфхцчшщ]';

SELECT * FROM lab_report;
-- Задание 5. Увеличить количество рабочих мест в 2 раза всем лабораториям, имеющим проектное оборудование.
UPDATE lab_report
SET workplaces = workplaces * 2
WHERE project_equipment = TRUE;

SELECT * FROM lab_report;
-- Задание 6. Из созданной таблицы удалить все записи для лабораторий, находящихся на 2 этаже.
DELETE FROM lab_report
WHERE id = 2;

SELECT * FROM lab_report;
-- Задание 7. Посчитать количество лабораторий и среднее количество оборудованных рабочих мест в лабораториях на каждой кафедре.
SELECT 
    d.department_name AS Кафедра,
    COUNT(l.id) AS Количество_лабораторий,
    ROUND(AVG(l.workplaces), 2) AS Среднее_число_мест
FROM departments d
LEFT JOIN laboratorie l ON d.id = l.department_id
GROUP BY d.id, d.department_name;

