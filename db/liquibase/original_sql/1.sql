--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      couses.DM1
--
-- Date Created : Monday, June 07, 2021 09:18:13
-- Target DBMS : PostgreSQL 10.x-12.x
--

-- 
-- TABLE: BUILDING 
--

CREATE TABLE BUILDING(
    building_id        uuid           NOT NULL,
    building_number    varchar(10)    NOT NULL,
    CONSTRAINT pki_building PRIMARY KEY (building_id)
)
;



-- 
-- TABLE: CLASS_PARTICIPANT 
--

CREATE TABLE CLASS_PARTICIPANT(
    student_id      uuid             NOT NULL,
    lesson_id       uuid             NOT NULL,
    grade_number    decimal(1, 1)    NOT NULL,
    CONSTRAINT pki_class_participation PRIMARY KEY (student_id, lesson_id)
)
;



-- 
-- TABLE: COURSE 
--

CREATE TABLE COURSE(
    course_id      uuid           NOT NULL,
    course_name    varchar(20)    NOT NULL,
    CONSTRAINT pki_course PRIMARY KEY (course_id)
)
;



-- 
-- TABLE: COURSE_OFFERING 
--

CREATE TABLE COURSE_OFFERING(
    course_offering_id    uuid    NOT NULL,
    teacher_id            uuid    NOT NULL,
    course_id             uuid    NOT NULL,
    CONSTRAINT pki_course_offering PRIMARY KEY (course_offering_id)
)
;



-- 
-- TABLE: LESSON 
--

CREATE TABLE LESSON(
    lesson_id              uuid             NOT NULL,
    room_id                uuid             NOT NULL,
    course_offering_id     uuid             NOT NULL,
    day_name               varchar(10)      NOT NULL,
    time_hour              character(10)    NOT NULL,
    duration_in_minutes    integer          NOT NULL,
    CONSTRAINT pki1_class PRIMARY KEY (lesson_id)
)
;



-- 
-- TABLE: ROOM 
--

CREATE TABLE ROOM(
    room_id        uuid             NOT NULL,
    building_id    uuid             NOT NULL,
    room_number    character(10)    NOT NULL,
    CONSTRAINT pki_room PRIMARY KEY (room_id)
)
;



-- 
-- TABLE: STUDENT 
--

CREATE TABLE STUDENT(
    student_id        uuid           NOT NULL,
    student_number    varchar(10)    NOT NULL,
    first_name        bit varying    NOT NULL,
    last_name         varchar(50)    NOT NULL,
    CONSTRAINT pki_student PRIMARY KEY (student_id)
)
;



-- 
-- TABLE: TEACHER 
--

CREATE TABLE TEACHER(
    teacher_id        uuid           NOT NULL,
    teacher_number    varchar(10)    NOT NULL,
    first_name        varchar(30)    NOT NULL,
    last_name         varchar(50)    NOT NULL,
    CONSTRAINT pki_teacher PRIMARY KEY (teacher_id)
)
;



-- 
-- INDEX: ak1_building 
--

CREATE UNIQUE INDEX ak1_building ON BUILDING(building_number)
;
-- 
-- INDEX: fki1_class_participant 
--

CREATE INDEX fki1_class_participant ON CLASS_PARTICIPANT(lesson_id)
;
-- 
-- INDEX: aki1_course 
--

CREATE UNIQUE INDEX aki1_course ON COURSE(course_name)
;
-- 
-- INDEX: aki1_course_offering 
--

CREATE UNIQUE INDEX aki1_course_offering ON COURSE_OFFERING(course_id, teacher_id)
;
-- 
-- INDEX: fki1_course_offering 
--

CREATE INDEX fki1_course_offering ON COURSE_OFFERING(teacher_id)
;
-- 
-- INDEX: ak1_class 
--

CREATE UNIQUE INDEX ak1_class ON LESSON(room_id, time_hour)
;
-- 
-- INDEX: fki2_class 
--

CREATE INDEX fki2_class ON LESSON(room_id)
;
-- 
-- INDEX: fki3_class 
--

CREATE INDEX fki3_class ON LESSON(course_offering_id)
;
-- 
-- INDEX: aki1_room 
--

CREATE UNIQUE INDEX aki1_room ON ROOM(building_id, room_number)
;
-- 
-- INDEX: fki1_room 
--

CREATE INDEX fki1_room ON ROOM(building_id)
;
-- 
-- INDEX: aki1_student 
--

CREATE UNIQUE INDEX aki1_student ON STUDENT(student_number)
;
-- 
-- INDEX: ak1_teacher 
--

CREATE UNIQUE INDEX ak1_teacher ON TEACHER(teacher_number)
;
-- 
-- TABLE: CLASS_PARTICIPANT 
--

ALTER TABLE CLASS_PARTICIPANT ADD CONSTRAINT fkc1_class_participant 
    FOREIGN KEY (lesson_id)
    REFERENCES LESSON(lesson_id)
;

ALTER TABLE CLASS_PARTICIPANT ADD CONSTRAINT fkc2_class_participant 
    FOREIGN KEY (student_id)
    REFERENCES STUDENT(student_id)
;


-- 
-- TABLE: COURSE_OFFERING 
--

ALTER TABLE COURSE_OFFERING ADD CONSTRAINT fkc1_course_offering 
    FOREIGN KEY (teacher_id)
    REFERENCES TEACHER(teacher_id)
;

ALTER TABLE COURSE_OFFERING ADD CONSTRAINT fkc2_course_offering 
    FOREIGN KEY (course_id)
    REFERENCES COURSE(course_id)
;


-- 
-- TABLE: LESSON 
--

ALTER TABLE LESSON ADD CONSTRAINT fkc2_class 
    FOREIGN KEY (room_id)
    REFERENCES ROOM(room_id)
;

ALTER TABLE LESSON ADD CONSTRAINT fkc3_class 
    FOREIGN KEY (course_offering_id)
    REFERENCES COURSE_OFFERING(course_offering_id)
;


-- 
-- TABLE: ROOM 
--

ALTER TABLE ROOM ADD CONSTRAINT RefBUILDING3 
    FOREIGN KEY (building_id)
    REFERENCES BUILDING(building_id)
;


