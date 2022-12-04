CREATE TABLE "contact_details" 
(
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "email" varchar(500) NOT NULL UNIQUE
);

CREATE TABLE "address" 
(
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "street" varchar(500) NOT NULL,
    "zip_code" varchar(5) NOT NULL,
    "city" varchar(500) NOT NULL
);

CREATE TABLE "contact_person" 
(
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "person_number" VARCHAR(12) UNIQUE NOT NULL,
    "first_name" VARCHAR(500) NOT NULL,
    "last_name" VARCHAR(500) NOT NULL,
    "contact_details_id" int NOT NULL REFERENCES "contact_details",
    "address_id" int NOT NULL REFERENCES "address"
);

CREATE TABLE "instrument" 
(
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "type" VARCHAR(100) UNIQUE NOT NULL,
    "stock" int NOT NULL,
    "cost" int NOT NULL
);

CREATE TABLE "student"
(
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "person_number" VARCHAR(12) UNIQUE NOT NULL,
    "first_name" VARCHAR(500) NOT NULL,
    "last_name" VARCHAR(500) NOT NULL,
    "contact_person_id" int REFERENCES "contact_person",
    "instrument_id" int NOT NULL REFERENCES "instrument",
    "contact_details_id" int NOT NULL REFERENCES "contact_details",
    "address_id" int NOT NULL REFERENCES "address"
);



CREATE TABLE "instructor"
(
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "person_number" VARCHAR(12) UNIQUE NOT NULL,
    "first_name" VARCHAR(500) NOT NULL,
    "last_name" VARCHAR(500) NOT NULL,
    "instrument_id" int NOT NULL REFERENCES "instrument",
    "contact_details_id" int NOT NULL REFERENCES "contact_details",
    "address_id" int NOT NULL REFERENCES "address"
);


CREATE TABLE "sibling"
(
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "student_id" int NOT NULL REFERENCES "student",
    "sibling_id" int NOT NULL REFERENCES "student"
);

CREATE TABLE "skill_level"
(
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "skill" varchar(50) NOT NULL
);

CREATE TABLE "lesson" 
(
    "date" date NOT NULL,
    "time" timestamp NOT NULL,
    "discount" int,
    "instructor_id" int NOT NULL REFERENCES "instructor"
); 

CREATE TABLE "ensemble" 
(
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "genre" varchar(100) NOT NULL,
    "cost" int NOT NULL, 
    "min_students" int NOT NULL,
    "max_students" int NOT NULL
)INHERITS(lesson);

CREATE TABLE "private_lesson" 
(
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "cost" int NOT NULL,
    "skill_level_id" int NOT NULL REFERENCES "skill_level",
    "student_id" int NOT NULL REFERENCES "student"
)INHERITS(lesson);

CREATE TABLE "group_lesson" 
(
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "cost" int NOT NULL,
    "min_students" int NOT NULL,
    "max_students" int NOT NULL,
    "skill_level_id" int NOT NULL REFERENCES "skill_level"
)INHERITS(lesson);

CREATE TABLE "lesson_students"
(
    "id" int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "ensemble_id" int REFERENCES "ensemble",
    "group_lesson_id" int REFERENCES "group_lesson",
    "student_id" int NOT NULL REFERENCES "student"
);

CREATE TABLE "instrument_rental" 
(
    "id" int NOT NULL REFERENCES "student" ON DELETE CASCADE PRIMARY KEY,
    "date_rented" date NOT NULL,
    "date_to_return" date NOT NULL,
    "instrument_id" int NOT NULL REFERENCES "instrument"
);

CREATE TABLE "contact_details_phone_number"
(
    "person_id" int NOT NULL REFERENCES "contact_details" ON DELETE CASCADE PRIMARY KEY,
    "phone_number" varchar(100) NOT NULL
);