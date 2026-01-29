/*------------------------------------------- REKORD TÍPUSOK ----------------------------------------------*/
insert into record_type(type_name)
    values("Album"),
    values("EP"),
    values("Single");

/*------------------------------------------- ADMIN FELHASZNÁLÓ -------------------------------------------*/
insert into `user`(id,`name`,email,phone)
    values(0,"admin","admin@record.hu","06309353729");

/*------------------------------------------- SZERZŐK ------------------------------------------------------*/
insert into artist(`name`,active_since,nationality,`url`,is_group)
    values("Metallica","1981","usa","https://www.metallica.com",1);
/*------------------------------------------- ALBUMOK ------------------------------------------------------*/
insert into `record`(`name`,type_id,release_date,`length`)
    values("Master Of Dolls",1,"1986",8),
    values("Ride The Storm",1,"1984",64),
    values("Restock",1,"1997",13)
    ;
/*------------------------------------------- SZERZŐK - ALBUMOK KÖTÉS---------------------------------------*/
insert into artist_record(artist_id,record_id,`role`)
    values(1,1,"producer"),
    values(1,2,"producer"),
    values(1,3,"producer"),
