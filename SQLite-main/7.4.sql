-- 7.1. INNER JOIN — только совпавшие строки:
--       фамилии студентов вместе с названием их группы
SELECT s.last_name, s.first_name, g.group_name
FROM students s
INNER JOIN groups g ON s.group_id = g.group_id
ORDER BY g.group_name, s.last_name;

-- 7.2. LEFT JOIN — все группы, даже те, где пока нет студентов
SELECT g.group_name, s.last_name
FROM groups g
LEFT JOIN students s ON s.group_id = g.group_id
ORDER BY g.group_name;

-- 7.3. JOIN трёх таблиц: студент — оценка — предмет
SELECT s.last_name, sub.subject_name, gr.grade, gr.grade_date
FROM grades gr
JOIN students s ON gr.student_id = s.student_id
JOIN subjects sub ON gr.subject_id = sub.subject_id
ORDER BY s.last_name, gr.grade_date;

-- 7.4. JOIN четырёх таблиц: полный отчёт об оценках
SELECT s.last_name  AS Студент,
       g.group_name AS Группа,
       sub.subject_name AS Предмет,
       t.last_name  AS Преподаватель,
       gr.grade     AS Оценка,
       gr.grade_date AS Дата
FROM grades gr
JOIN students s   ON gr.student_id = s.student_id
JOIN groups g     ON s.group_id = g.group_id
JOIN subjects sub ON gr.subject_id = sub.subject_id
JOIN teachers t   ON gr.teacher_id = t.teacher_id
ORDER BY gr.grade_date;

-- 7.5. LEFT JOIN + IS NULL: предметы, по которым ещё нет оценок
SELECT sub.subject_name
FROM subjects sub
LEFT JOIN grades gr ON gr.subject_id = sub.subject_id
WHERE gr.grade_id IS NULL;

-- 7.6. Средний балл с именами (агрегат + JOIN + GROUP BY)
SELECT s.last_name, s.first_name, AVG(gr.grade) AS Средний_балл
FROM grades gr
JOIN students s ON gr.student_id = s.student_id
GROUP BY s.student_id
ORDER BY Средний_балл DESC;

--7А
SELECT t.last_name AS Преподаватель, 
       sub.subject_name AS Предмет, 
       COUNT(gr.grade_id) AS Количество_оценок
FROM grades gr
JOIN teachers t ON gr.teacher_id = t.teacher_id
JOIN subjects sub ON gr.subject_id = sub.subject_id
GROUP BY t.teacher_id, t.last_name, sub.subject_id, sub.subject_name
ORDER BY t.last_name;