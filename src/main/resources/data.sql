
drop table if exists role;
drop table if exists user;
drop table if exists user_roles;

create table role (id int auto_increment, description varchar(255), name varchar(255), primary key (id));

create table user (id int not null auto_increment, username varchar(255), password varchar(255), primary key (id));

create table user_roles (user_id int not null, role_id int not null, primary key (user_id, role_id));

alter table user_roles add constraint fd_role_id foreign key (role_id) references role (id);

alter table user_roles add constraint fk_user_id foreign key (user_id) references user (id);

-- password is password1
INSERT INTO user (id, username, password) VALUES (1, 'user1', '$2a$04$Ye7/lJoJin6.m9sOJZ9ujeTgHEVM4VXgI2Ingpsnf9gXyXEXf/IlW');

-- password is password3
INSERT INTO user (id, username, password) VALUES (2, 'user2', '$2a$04$StghL1FYVyZLdi8/DIkAF./2rz61uiYPI3.MaAph5hUq03XKeflyW');

-- password is password3
INSERT INTO user (id, username, password) VALUES (3, 'user3', '$2a$04$Lk4zqXHrHd82w5/tiMy8ru9RpAXhvFfmHOuqTmFPWQcUhBD8SSJ6W');

INSERT INTO role (id, description, name) VALUES (4, 'Admin role', 'ADMIN');
INSERT INTO role (id, description, name) VALUES (5, 'User role', 'USER');

INSERT INTO user_roles (user_id, role_id) VALUES (1, 4);
INSERT INTO user_roles (user_id, role_id) VALUES (2, 5);
