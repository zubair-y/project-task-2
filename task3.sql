--DEL 1: ANTAL LESSONS PER MÅNAD FÖR ETT VISST ÅR
SELECT extract(MONTH FROM ensemble.date) AS month, extract(year FROM ensemble.date) AS year, count(*) AS ensemble
FROM ensemble 
WHERE extract(year FROM ensemble.date) = 2022 
GROUP BY extract(month FROM ensemble.date), extract(year FROM ensemble.date);

SELECT extract(MONTH FROM private_lesson.date) AS month, extract(year FROM private_lesson.date) AS year, count(*) AS private_lesson
FROM private_lesson 
WHERE extract(year FROM private_lesson.date) = 2022 
GROUP BY extract(month FROM private_lesson.date), extract(year FROM private_lesson.date);

SELECT extract(MONTH FROM group_lesson.date) AS month, extract(year FROM group_lesson.date) AS year, count(*) AS group_lesson
FROM group_lesson 
WHERE extract(year FROM group_lesson.date) = 2022 
GROUP BY extract(month FROM group_lesson.date), extract(year FROM group_lesson.date);

SELECT extract(MONTH FROM date) AS month, extract(year FROM date) as year, COUNT(*) AS total 
FROM lesson
WHERE extract(year FROM date) = 2022
GROUP BY extract(month FROM date), extract(year FROM date);

--DEL 2: ANTAL STUDENTER SOM HAR ETT VISST ANTAL SYSKON:
SELECT COUNT(*) AS students, sum AS siblings
FROM (SELECT SUM(CASE WHEN id = siblings THEN 1 ELSE 0 END)
FROM (SELECT student.id, sibling.student_id
  AS siblings FROM student LEFT OUTER JOIN sibling ON student.id = sibling.student_id)
  AS foo GROUP BY siblings)
  AS fooo
  GROUP BY sum
  ORDER BY students;
  
--DEL 3: ANTAL LEKTIONER FÖR LÄRARE FÖR DENNA MÅNAD.
SELECT EXTRACT(MONTH FROM current_date) as month, instructor_id, COUNT(*) AS lessons_booked 
FROM lesson 
WHERE EXTRACT(MONTH FROM date) = EXTRACT(MONTH FROM current_date) 
AND EXTRACT(YEAR FROM date) = EXTRACT(YEAR FROM current_date) 
GROUP BY instructor_id, month 
HAVING COUNT(*) >= 2 
ORDER BY instructor_id;

--DEL 4: LISTA ALLA ENSEMBLES SOM KOMMER ATT HÅLLAS NÄSTA VECKA.
SELECT ensemble.id AS ensemble_id, EXTRACT(DOW FROM ensemble.date) as day, ensemble.genre, 
CASE 
  WHEN ensemble.max_students - COUNT(*) = 0 THEN 'Fully booked'
  WHEN ensemble.max_students - COUNT(*) > 0 AND ensemble.max_students - COUNT(*) < 3 THEN '1-2'
  WHEN ensemble.max_students - COUNT(*) > 2 THEN 'more than 2'
END AS spots_left
FROM ensemble 
INNER JOIN lesson_students ON ensemble_id = lesson_students.ensemble_id
WHERE EXTRACT(WEEK FROM ensemble.date) = EXTRACT(WEEK FROM current_date) + 1 
AND ensemble.id = lesson_students.ensemble_id
GROUP BY ensemble.id
ORDER BY day, genre;

--SKAPA VIEWS
--DEL 1
CREATE VIEW query1_1 AS
SELECT extract(MONTH FROM ensemble.date) AS month, extract(year FROM ensemble.date) AS year, count(*) AS ensemble
FROM ensemble 
WHERE extract(year FROM ensemble.date) = 2022 
GROUP BY extract(month FROM ensemble.date), extract(year FROM ensemble.date);

CREATE VIEW query1_2 AS
SELECT extract(MONTH FROM private_lesson.date) AS month, extract(year FROM private_lesson.date) AS year, count(*) AS private_lesson
FROM private_lesson 
WHERE extract(year FROM private_lesson.date) = 2022 
GROUP BY extract(month FROM private_lesson.date), extract(year FROM private_lesson.date);

CREATE VIEW query1_3 AS
SELECT extract(MONTH FROM group_lesson.date) AS month, extract(year FROM group_lesson.date) AS year, count(*) AS group_lesson
FROM group_lesson 
WHERE extract(year FROM group_lesson.date) = 2022 
GROUP BY extract(month FROM group_lesson.date), extract(year FROM group_lesson.date);

CREATE VIEW query1_4 AS
SELECT extract(MONTH FROM date) AS month, extract(year FROM date) as year, COUNT(*) AS total 
FROM lesson
WHERE extract(year FROM date) = 2022
GROUP BY extract(month FROM date), extract(year FROM date);

--DEL 2
CREATE VIEW query2 AS
SELECT COUNT(*) AS students, sum AS siblings
FROM (SELECT SUM(CASE WHEN id = siblings THEN 1 ELSE 0 END)
FROM (SELECT student.id, sibling.student_id
  AS siblings FROM student LEFT OUTER JOIN sibling ON student.id = sibling.student_id)
  AS foo GROUP BY siblings)
  AS fooo
  GROUP BY sum
  ORDER BY students;

--DEL 3
CREATE VIEW query3 AS
SELECT EXTRACT(MONTH FROM current_date) as month, instructor_id, COUNT(*) AS lessons_booked 
FROM lesson 
WHERE EXTRACT(MONTH FROM date) = EXTRACT(MONTH FROM current_date) 
AND EXTRACT(YEAR FROM date) = EXTRACT(YEAR FROM current_date) 
GROUP BY instructor_id, month 
HAVING COUNT(*) >= 1 
ORDER BY instructor_id;

--DEL 4
CREATE VIEW query4 AS
SELECT ensemble.id AS ensemble_id, EXTRACT(DOW FROM ensemble.date) as day, ensemble.genre, 
CASE 
  WHEN ensemble.max_students - COUNT(*) = 0 THEN 'Fully booked'
  WHEN ensemble.max_students - COUNT(*) > 0 AND ensemble.max_students - COUNT(*) < 3 THEN '1-2'
  WHEN ensemble.max_students - COUNT(*) > 2 THEN 'more than 2'
END AS spots_left
FROM ensemble 
INNER JOIN lesson_students ON ensemble_id = lesson_students.ensemble_id
WHERE EXTRACT(WEEK FROM ensemble.date) = EXTRACT(WEEK FROM current_date) + 1 
AND ensemble.id = lesson_students.ensemble_id
GROUP BY ensemble.id
ORDER BY day, genre;
