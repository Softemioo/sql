-- 8.1. UPDATE — изменить одну строку (ОБЯЗАТЕЛЬНО с WHERE!)
UPDATE students SET group_id = 2 WHERE student_id = 3;

-- 8.2. UPDATE — массовое изменение: поднять курс всем группам
UPDATE groups SET course = course + 1;

-- 8.3. DELETE — удалить одну строку (тоже с WHERE!)
DELETE FROM grades WHERE grade_id = 3;

-- 8.4. INSERT после изменений: вернуть удалённую оценку
INSERT INTO grades (student_id, subject_id, teacher_id, grade, grade_date)
VALUES (3, 1, 1, 4, '2026-09-05');

-- 8.5. Откат примеров 8.1–8.2, чтобы база осталась в исходном виде
UPDATE students SET group_id = 1 WHERE student_id = 3;
UPDATE groups SET course = course - 1;

-- ВАЖНО: после UPDATE/DELETE нажмите «Write Changes» (Ctrl+S)
-- или «Rollback Changes», чтобы отменить несохранённое.