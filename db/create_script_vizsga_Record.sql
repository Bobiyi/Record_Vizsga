create database vizsga_record
character set utf8mb4
collate utf8mb4_hungarian_ci;

use vizsga_record;

set NAMES utf8mb4 collate utf8mb4_hungarian_ci;

create table artist(
	id int primary key auto_increment,
	name varchar(64) not null,
	active_since year,
	nationality varchar(64),
	`url` varchar(128),
	is_group int(1),
	file_path varchar(255)
);

create table `record`(
	id int primary key auto_increment,
	`name` varchar(64) not null,
	type_id int,
	release_year year,
	`length` int,
	file_path varchar(255)
);

create table record_type (
	id int primary key auto_increment,
	type_name varchar(32) not null
);

create table artist_record(
	artist_id int,
	record_id int,
	`role` enum("featured","producer"),
	primary key(artist_id,record_id)
);

alter table artist_record add constraint frk_Artist_ID foreign key (artist_id) references artist(id) on delete cascade;
alter table artist_record add constraint frk_Record_ID foreign key (record_id) references record(id) on delete cascade;

alter table record add constraint frk_Type foreign key (type_id) references record_type(id);
alter table record modify release_year int default year(CURRENT_DATE());
alter table record modify `length` int default 1;
alter table record add constraint chk_Length check (`length`>0);

alter table record_type add constraint uc_Type unique (type_name);

alter table artist add constraint uc_Name unique (name);

create index idx_Record_Artist on artist_record(artist_id,record_id);

create table `user`(
	id int primary key auto_increment,
	password_hash char(60) not null,
	name varchar(64) not null,
	email varchar(64),
	phone varchar(15));

create table favourite(
	user_id int,
	record_id int,
	primary key(user_id,record_id)
);

alter table favourite add constraint frk_User_ID foreign key (user_id) references user(id);
alter table favourite add constraint frk_Favourite_Record_ID foreign key (record_id) references record(id);

alter table `user` add constraint uc_Email unique (email);
alter table `user` add constraint uc_Phone unique (phone);

create index idx_Favourite on favourite(user_id,record_id);

create index idx_User_Name on user(name);