INSERT INTO person (person_number,first_name,last_name)
VALUES
  ('436261845','Ivan','Wolf'),
  ('419706965','Graham','Perry'),
  ('266319487','Jackson','Ochoa'),
  ('196385592','Matthew','Garza'),
  ('18349396','Maxwell','Peck');

INSERT INTO address (person_id,street,zip_code,city)
VALUES
  (1,'quis@outlook.ca',2681,'Los Sauces'),
  (2,'mus.proin.vel@protonmail.couk',3994,'San Rafael'),
  (3,'nec.ligula.consectetuer@protonmail.couk',7497,'Alessandria'),
  (4,'a.auctor.non@outlook.com',8352,'Bima'),
  (5,'ullamcorper.eu@aol.edu',7000,'Mysore');

INSERT INTO contact_details (person_id,email)
VALUES
  (1,'nam.ac.nulla@google.org'),
  (2,'lacinia.mattis@hotmail.couk'),
  (3,'lorem.semper.auctor@outlook.couk'),
  (4,'ac.facilisis@hotmail.couk'),
  (5,'luctus.sit.amet@hotmail.ca');

INSERT INTO contact_details_phone_number (person_id,phone_number)
VALUES
  (1,'(748) 664-7544'),
  (2,'(672) 185-5493'),
  (3,'1-441-657-1081'),
  (4,'(757) 267-2617'),
  (5,'(643) 387-4865');

INSERT INTO contact_person (id)
VALUES
  (1),
  (2),
  (3),
  (4),
  (5);

INSERT INTO instructor (id)
VALUES
  (1),
  (2),
  (3),
  (4),
  (5);


INSERT INTO student (id,sibling,contact_person_id)
VALUES
  (1,18,1),
  (2,27,2),
  (3,94,3),
  (4,28,4),
  (5,31,5);

INSERT INTO lesson (date,time,discount,instructor_id)
VALUES
  ('Jun 26, 2023','2022-08-23 18:42:02',1,1),
  ('Nov 25, 2022','2022-08-23 18:42:02',1,2),
  ('Nov 27, 2022','2022-08-23 18:42:02',2,3),
  ('Oct 5, 2022','2022-08-23 18:42:02',2,4),
  ('Apr 17, 2023','2022-08-23 18:42:02',1,5);

INSERT INTO instrument (stock,cost,owner_id)
VALUES
  (18,51,1),
  (27,83,2),
  (94,27,3),
  (28,38,4),
  (31,30,5);

INSERT INTO instrument_rental (id,date_rented,date_to_return,instrument_id)
VALUES
  (1,'Oct 25, 2022','Jun 14, 2023',1),
  (2,'Oct 4, 2022','Dec 5, 2022',2),
  (3,'Apr 21, 2023','Jul 14, 2023',3),
  (4,'Jul 12, 2023','Dec 30, 2021',4),
  (5,'Aug 19, 2023','Aug 4, 2023',5);

INSERT INTO ensemble (id,genre,cost,min_students,max_students)
VALUES
  (1,'sagittis',131,4,16),
  (2,'facilisis,',379,3,19),
  (3,'diam',117,2,14),
  (4,'non',493,1,16),
  (5,'Praesent',192,4,19);

INSERT INTO private_lesson (id,cost,skill_level)
VALUES
  (1,131,'intermediate'),
  (2,379,'beginner'),
  (3,117,'intermediate'),
  (4,493,'intermediate'),
  (5,192,'intermediate');

INSERT INTO group_lesson (id,cost,min_students,max_students,skill_level)
VALUES
  (1,14,2,10,'beginner'),
  (2,86,2,10,'beginner'),
  (3,53,2,10,'beginner'),
  (4,60,2,10,'intermediate'),
  (5,37,2,10,'advanced');