CREATE TABLE "person"
(
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "person_number" VARCHAR(12) UNIQUE NOT NULL,
    "first_name" VARCHAR(500) NOT NULL,
    "last_name" VARCHAR(500) NOT NULL
);

CREATE TABLE "contact_person" 
(
    "id" int NOT NULL REFERENCES "person" ON DELETE CASCADE PRIMARY KEY
);

CREATE TABLE "student"
(
    "id" int NOT NULL REFERENCES "person" ON DELETE CASCADE PRIMARY KEY,
    "sibling" int,
    "contact_person_id" int
);

CREATE TABLE "instructor"
(
    "id" int NOT NULL REFERENCES "person" ON DELETE CASCADE PRIMARY KEY
);

CREATE TABLE "lesson" 
(
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "date" date NOT NULL,
    "time" timestamp NOT NULL,
    "discount" int,
    "instructor_id" int NOT NULL REFERENCES "instructor"
); 

CREATE TABLE "ensemble" 
(
    "id" int NOT NULL REFERENCES "lesson" ON DELETE CASCADE PRIMARY KEY,
    "genre" varchar(100) NOT NULL,
    "cost" int NOT NULL, 
    "min_students" int NOT NULL,
    "max_students" int NOT NULL
);

CREATE TABLE "skill_level"
(
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "skill" varchar(50) NOT NULL
);

CREATE TABLE "private_lesson" 
(
    "id" int NOT NULL REFERENCES "lesson" ON DELETE CASCADE PRIMARY KEY,
    "cost" int NOT NULL,
    "skill_level_id" int NOT NULL REFERENCES "skill_level"
);

CREATE TABLE "group_lesson" 
(
    "id" int NOT NULL REFERENCES "lesson" ON DELETE CASCADE PRIMARY KEY,
    "cost" int NOT NULL,
    "min_students" int NOT NULL,
    "max_students" int NOT NULL,
    "skill_level_id" int NOT NULL REFERENCES "skill_level"
);

CREATE TABLE "instrument" 
(
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "stock" int NOT NULL,
    "cost" int NOT NULL,
    "owner_id" int NOT NULL REFERENCES "person"
);

CREATE TABLE "instrument_rental" 
(
    "id" int NOT NULL REFERENCES "student" ON DELETE CASCADE PRIMARY KEY,
    "date_rented" date NOT NULL,
    "date_to_return" date NOT NULL,
    "instrument_id" int NOT NULL REFERENCES "instrument"
);

CREATE TABLE "contact_details" 
(
    "person_id" int NOT NULL REFERENCES "person" ON DELETE CASCADE PRIMARY KEY,
    "email" varchar(500) NOT NULL UNIQUE
);

CREATE TABLE "contact_details_phone_number"
(
    "person_id" int NOT NULL REFERENCES "contact_details" ON DELETE CASCADE PRIMARY KEY,
    "phone_number" varchar(100) NOT NULL
);

CREATE TABLE "address" 
(
    "person_id" int NOT NULL REFERENCES "person" ON DELETE CASCADE PRIMARY KEY,
    "street" varchar(500) NOT NULL,
    "zip_code" varchar(5) NOT NULL,
    "city" varchar(500) NOT NULL
);

