--changeset Chuck.Rabb:1
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
grant select on BUILDING to courses_reader
;
grant select, insert, update, delete on BUILDING to courses_writer
;
--changeset Chuck.Rabb:2
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
grant select on CLASS_PARTICIPANT to courses_reader
;
grant select, insert, update, delete on CLASS_PARTICIPANT to courses_writer
;
--changeset Chuck.Rabb:3
--
-- TABLE: COURSE
--
CREATE TABLE COURSE(
    course_id      uuid           NOT NULL,
    course_name    varchar(20)    NOT NULL,
    CONSTRAINT pki_course PRIMARY KEY (course_id)
)
;
grant select on COURSE to courses_reader
;
grant select, insert, update, delete on COURSE to courses_writer
;
--changeset Chuck.Rabb:4
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
grant select on COURSE_OFFERING to courses_reader
;
grant select, insert, update, delete on COURSE_OFFERING to courses_writer
;
--changeset Chuck.Rabb:5
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
grant select on LESSON to courses_reader
;
grant select, insert, update, delete on LESSON to courses_writer
;
--changeset Chuck.Rabb:6
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
grant select on ROOM to courses_reader
;
grant select, insert, update, delete on ROOM to courses_writer
;
--changeset Chuck.Rabb:7
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
grant select on STUDENT to courses_reader
;
grant select, insert, update, delete on STUDENT to courses_writer
;
--changeset Chuck.Rabb:8
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
grant select on TEACHER to courses_reader
;
grant select, insert, update, delete on TEACHER to courses_writer
;
--changeset Chuck.Rabb:9
--
-- INDEX: ak1_building
--
CREATE UNIQUE INDEX ak1_building ON BUILDING(building_number)
;
--changeset Chuck.Rabb:10
--
-- INDEX: fki1_class_participant
--
CREATE INDEX fki1_class_participant ON CLASS_PARTICIPANT(lesson_id)
;
--changeset Chuck.Rabb:11
--
-- INDEX: aki1_course
--
CREATE UNIQUE INDEX aki1_course ON COURSE(course_name)
;
--changeset Chuck.Rabb:12
--
-- INDEX: aki1_course_offering
--
CREATE UNIQUE INDEX aki1_course_offering ON COURSE_OFFERING(course_id, teacher_id)
;
--changeset Chuck.Rabb:13
--
-- INDEX: fki1_course_offering
--
CREATE INDEX fki1_course_offering ON COURSE_OFFERING(teacher_id)
;
--changeset Chuck.Rabb:14
--
-- INDEX: ak1_class
--
CREATE UNIQUE INDEX ak1_class ON LESSON(room_id, time_hour)
;
--changeset Chuck.Rabb:15
--
-- INDEX: fki2_class
--
CREATE INDEX fki2_class ON LESSON(room_id)
;
--changeset Chuck.Rabb:16
--
-- INDEX: fki3_class
--
CREATE INDEX fki3_class ON LESSON(course_offering_id)
;
--changeset Chuck.Rabb:17
--
-- INDEX: aki1_room
--
CREATE UNIQUE INDEX aki1_room ON ROOM(building_id, room_number)
;
--changeset Chuck.Rabb:18
--
-- INDEX: fki1_room
--
CREATE INDEX fki1_room ON ROOM(building_id)
;
--changeset Chuck.Rabb:19
--
-- INDEX: aki1_student
--
CREATE UNIQUE INDEX aki1_student ON STUDENT(student_number)
;
--changeset Chuck.Rabb:20
--
-- INDEX: ak1_teacher
--
CREATE UNIQUE INDEX ak1_teacher ON TEACHER(teacher_number)
;
--changeset Chuck.Rabb:21
--
-- TABLE: CLASS_PARTICIPANT
--
ALTER TABLE CLASS_PARTICIPANT ADD CONSTRAINT fkc1_class_participant
    FOREIGN KEY (lesson_id)
    REFERENCES LESSON(lesson_id)
;
--changeset Chuck.Rabb:22
ALTER TABLE CLASS_PARTICIPANT ADD CONSTRAINT fkc2_class_participant
    FOREIGN KEY (student_id)
    REFERENCES STUDENT(student_id)
;
--changeset Chuck.Rabb:23
--
-- TABLE: COURSE_OFFERING
--
ALTER TABLE COURSE_OFFERING ADD CONSTRAINT fkc1_course_offering
    FOREIGN KEY (teacher_id)
    REFERENCES TEACHER(teacher_id)
;
--changeset Chuck.Rabb:24
ALTER TABLE COURSE_OFFERING ADD CONSTRAINT fkc2_course_offering
    FOREIGN KEY (course_id)
    REFERENCES COURSE(course_id)
;
--changeset Chuck.Rabb:25
--
-- TABLE: LESSON
--
ALTER TABLE LESSON ADD CONSTRAINT fkc2_class
    FOREIGN KEY (room_id)
    REFERENCES ROOM(room_id)
;
--changeset Chuck.Rabb:26
ALTER TABLE LESSON ADD CONSTRAINT fkc3_class
    FOREIGN KEY (course_offering_id)
    REFERENCES COURSE_OFFERING(course_offering_id)
;
--changeset Chuck.Rabb:27
--
-- TABLE: ROOM
--
ALTER TABLE ROOM ADD CONSTRAINT RefBUILDING3
    FOREIGN KEY (building_id)
    REFERENCES BUILDING(building_id)
;
