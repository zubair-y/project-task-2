INSERT INTO address (street,zip_code,city)
VALUES
  ('Ap #795-4353 Sem Street','67151','Tomsk'),
  ('3461 Facilisis Ave','68001','Wismar'),
  ('Ap #164-7038 Tempor Road','19419','Tvedestrand'),
  ('Ap #359-8161 Volutpat. St.','20575','Iksan'),
  ('903-6140 Nec St.','75850','Diem Dien'),
  ('200-1715 Integer Av.','33734','Tczew'),
  ('564-3623 Adipiscing St.','61669','Sullana'),
  ('Ap #309-2684 Enim Rd.','79883','Kobbegem'),
  ('481-8470 Et Rd.','72311','Shanghai'),
  ('703-7789 Eu Rd.','80324','Oldenzaal'),
  ('4579 Nunc Street','25250','Lustenau');

INSERT INTO contact_details (email)
VALUES
  ('nam.ac.nulla@google.org'),
  ('lacinia.mattis@hotmail.couk'),
  ('lorem.semper.auctor@outlook.couk'),
  ('ac.facilisis@hotmail.couk'),
  ('luctus.sit.amet@hotmail.ca'),
  ('quis@outlook.ca'),
  ('nams.ac.nulla@google.org'),
  ('lacgnia.mattis@hotmail.couk'),
  ('loraem.semper.auctor@outlook.couk'),
  ('asc.facilisis@hotmail.couk'),
  ('lucgtus.sit.amet@hotmail.ca');
  

INSERT INTO contact_details_phone_number (person_id,phone_number)
VALUES
  (1,'(748) 664-7544'),
  (2,'(672) 185-5493'),
  (3,'1-441-657-1081'),
  (4,'(757) 267-2617'),
  (5,'(643) 387-4865'),
  (6,'(633) 387-4841'),
  (7,'(753) 243-2617'),
  (8,'(643) 311-4865'),
  (9,'(633) 322-4314'),
  (10,'(717) 244-2655'),
  (11,'(123) 332-4945');

INSERT INTO instrument (type,stock,cost)
VALUES
  ('Piano',18,51),
  ('Symbal',27,83),
  ('Drums',94,27),
  ('Flute',28,38),
  ('Guitar',31,30),
  ('Saxophone',31,30);

INSERT INTO contact_person (person_number,first_name,last_name,contact_details_id,address_id)
VALUES
  ('436261845','Ivan','Wolf',1,1),
  ('419706965','Graham','Perry',2,2),
  ('419703214','zubair','Perry',3,3);

INSERT INTO instructor (person_number,first_name,last_name,instrument_id,contact_details_id,address_id)
VALUES
  ('266319487','Jackson','Ochoa',1,1,1),
  ('196385592','Matthew','Garza',2,2,2),
  ('183493963','Maxwell','Peck',3,3,3);


INSERT INTO student (person_number,first_name,last_name,contact_person_id,instrument_id,contact_details_id,address_id)
VALUES
  ('1','Jackson','Seldal',1,1,1,1),
  ('2','Brackson','Kim',2,2,2,2),
  ('3','Mackson','Robertson',3,3,3,3),
  ('4','Jones','Andersson',1,4,4,4),
  ('5','Crackson','Bulun',2,5,5,5),
  ('6','Zubair','Mr. Andersson',3,6,6,6);

INSERT INTO sibling (student_id, sibling_id)
VALUES
  (1, 2),
  (2, 1),
  (1, 5),
  (5, 1),
  (5, 2),
  (2 ,5),
  (3, 4),
  (4, 3);

INSERT INTO instrument_rental (id,date_rented,date_to_return,instrument_id)
VALUES
  (1,'Oct 25, 2022','Jun 14, 2023',1),
  (2,'Oct 4, 2022','Dec 5, 2022',2),
  (3,'Apr 21, 2023','Jul 14, 2023',3),
  (4,'Jul 12, 2023','Dec 30, 2021',4),
  (5,'Aug 19, 2023','Aug 4, 2023',5);


INSERT INTO skill_level (skill)
VALUES
('beginner'),
('intermediate'),
('advanced');

INSERT INTO ensemble (date,time,discount,instructor_id,genre,cost,min_students,max_students)
VALUES
  ('Jun 26, 2023','2022-08-23 18:42:02',30,1,'Rock',131,2,6),
  ('Nov 25, 2022','2022-08-23 18:42:02',40,2,'Rock,',379,2,6),
  ('Nov 27, 2022','2022-08-23 18:42:02',20,3,'Hip-Hop',117,2,6),
  ('Dec 12, 2022','2022-08-23 18:42:02',10,4,'Country',493,2,6),
  ('Dec 13, 2023','2022-08-23 18:42:02',15,5,'Indie',192,2,6),
  ('Dec 14, 2022','2022-08-23 18:42:02',15,5,'Orten-rap',192,2,2);

INSERT INTO private_lesson (date,time,discount,instructor_id,cost,skill_level_id,student_id)
VALUES
  ('Jun 26, 2023','2022-08-23 18:42:02',30,1,331,3,1),
  ('Feb 26, 2022','2022-08-23 18:42:02',40,2,270,3,2),
  ('Mar 26, 2022','2022-08-23 18:42:02',20,3,252,1,3),
  ('Apr 26, 2022','2022-08-23 18:42:02',10,4,270,1,4),
  ('May 26, 2023','2022-08-23 18:42:02',15,5,371,2,5);

INSERT INTO group_lesson (date,time,discount,instructor_id,cost,min_students,max_students,skill_level_id)
VALUES
  ('Mar 26, 2023','2022-08-23 18:42:02',30,1,331,6,16,3),
  ('Mar 26, 2022','2022-08-23 18:42:02',40,2,270,6,11,3),
  ('Jun 26, 2022','2022-08-23 18:42:02',20,3,252,9,19,1),
  ('Jun 26, 2022','2022-08-23 18:42:02',10,4,270,2,19,1),
  ('Dec 26, 2023','2022-08-23 18:42:02',15,5,371,5,14,2);

INSERT INTO lesson_students (ensemble_id,student_id)
VALUES
  (6, 1),
  (6, 2),
  (5, 3),
  (5, 5),
  (4, 4),
  (4, 5),
  (4, 1),
  (4, 2);
