
create table person_data 
    (
        id int8 not null, 
        name varchar(30), 
        surname varchar(50),         
        pesel varchar(11),
    primary key (id));

create sequence hibernate_sequence start 1 increment 1;

INSERT INTO person_data (id, name, surname, pesel) VALUES (nextval('hibernate_sequence'), 'Mickey', 'Mouse', '82120400111' );
INSERT INTO person_data (id, name, surname, pesel) VALUES (nextval('hibernate_sequence'), 'Marek', 'Martofel', '70072706993');
INSERT INTO person_data (id, name, surname, pesel) VALUES (nextval('hibernate_sequence'), 'Elon', 'Musk', '68051200114');
INSERT INTO person_data (id, name, surname, pesel) VALUES (nextval('hibernate_sequence'), 'John', 'Doe', '56062100115');
INSERT INTO person_data (id, name, surname, pesel) VALUES (nextval('hibernate_sequence'), 'Qaz', 'Qwerty', '85092200116');