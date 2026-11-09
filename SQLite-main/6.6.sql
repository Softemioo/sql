-- 6.1. COUNT — сколько всего строк
SELECT COUNT(*) AS Всего_студентов FROM students;

-- 6.2. AVG, MIN, MAX, SUM
-- (агрегат применяется к столбцу той таблицы, что указана в FROM)
SELECT AVG(grade) AS Средний_балл,
       MIN(grade) AS Минимум,
       MAX(grade) AS Максимум
FROM grades;

SELECT SUM(hours) AS Всего_часов FROM subjects;

-- 6.3. GROUP BY — средний балл по каждому студенту
SELECT student_id, AVG(grade) AS Средний_балл, COUNT(*) AS Число_оценок
FROM grades
GROUP BY student_id;

-- 6.4. GROUP BY + ORDER BY: средний балл по предметам, от высшего к низшему
SELECT subject_id, AVG(grade) AS Средний_балл
FROM grades
GROUP BY subject_id
ORDER BY Средний_балл DESC;

-- 6.5. HAVING — фильтр по результату группировки
-- (только студенты, у которых больше одной оценки)
SELECT student_id, COUNT(*) AS Число_оценок
FROM grades
GROUP BY student_id
HAVING COUNT(*) > 1;

-- 6.6. DISTINCT — уникальные значения
SELECT DISTINCT grade FROM grades;
SELECT DISTINCT group_id FROM students;

--6A
SELECT group_id, COUNT(*) AS Количество_студентов
FROM students
GROUP BY group_id;

--6B
SELECT AVG(grade) AS Средняя_оценка
FROM grades
WHERE subject_id = 1;