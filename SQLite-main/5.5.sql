-- 5.1. Все столбцы и все строки таблицы
SELECT * FROM students;

-- 5.2. Только нужные столбцы
SELECT last_name, first_name FROM students;

-- 5.3. Столбцы с русскими псевдонимами (AS)
SELECT last_name AS Фамилия, first_name AS Имя, group_id AS Группа
FROM students;

-- 5.4. Фильтр WHERE: точное равенство
SELECT * FROM students WHERE group_id = 1;

-- 5.5. Сравнение чисел
SELECT * FROM subjects WHERE hours > 60;

-- 5.6. Текстовый поиск с шаблоном LIKE (% — любая последовательность)
SELECT * FROM students WHERE last_name LIKE 'И%';

-- 5.7. Несколько условий: AND / OR / NOT
SELECT * FROM grades WHERE grade = 5 AND subject_id = 1;
SELECT * FROM students WHERE group_id = 1 OR group_id = 2;
SELECT * FROM grades WHERE NOT grade = 5;

-- 5.8. Диапазон значений: BETWEEN и IN
SELECT * FROM grades WHERE grade BETWEEN 4 AND 5;
SELECT * FROM students WHERE group_id IN (1, 3);

-- 5.9. Сортировка ORDER BY (DESC — по убыванию)
SELECT last_name, first_name, group_id
FROM students
ORDER BY group_id, last_name;

SELECT * FROM grades ORDER BY grade DESC, grade_date;

-- 5.10. Ограничение числа строк LIMIT
SELECT * FROM grades ORDER BY grade_date LIMIT 5;

--5A
SELECT * 
FROM subjects 
WHERE hours > 60 
ORDER BY hours DESC;

--5B
SELECT last_name, first_name 
FROM students 
WHERE group_id = 1 
ORDER BY last_name;