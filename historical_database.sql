CREATE TABLE lesson(
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    date DATE NOT NULL, 
    time TIMESTAMP NOT NULL,
    discount INT,
    instructor_id int NOT NULL,
    cost INT NOT NULL,
    genre varchar(100),
    student_id INT,
    lesson_type VARCHAR(100) NOT NULL
);

INSERT INTO lesson(date,time,discount,instructor_id,cost,genre,student_id,lesson_type)
VALUES('Dec 8, 2022','2022-08-23 18:42:02',15,5,192,'Orten-rap',1,'ensemble');

INSERT INTO lesson(date,time,discount,instructor_id,cost,genre,student_id,lesson_type)
VALUES('Dec 5, 2022','2022-08-23 18:42:02',10,4,493,'Country',5,'Ensemble');

INSERT INTO lesson(date,time,discount,instructor_id,cost,student_id,lesson_type)
VALUES('Jun 26, 2023','2022-08-23 18:42:02',30,1,331,1,'private_lesson');

INSERT INTO lesson(date,time,discount,instructor_id,cost,student_id,lesson_type)
VALUES('May 26, 2023','2022-08-23 18:42:02',15,5,371,5,'private_lesson');