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
    values("Metallica","1981","usa","https://www.metallica.com",1),
    values("Michael Jackson","1964","usa","https://www.michaeljackson.com",0),
    values("Playboi Carti","2015","usa","https://shop.playboicarti.com/",0)
    ;
/*------------------------------------------- ALBUMOK ------------------------------------------------------*/
insert into `record`(`name`,type_id,release_date,`length`)
    values("Master Of Dolls",1,"1986",8),
    values("Ride The Storm",1,"1984",64),
    values("Restock",1,"1997",13),
    values("Good",1,"1987",9),
    values("Freindly",1,"1991",9),
    values("Whole Lotta Blue",1,"2020",24),
    values("Live Lit",1,"2018",19),
    values("Melody",1,"2025",30)
    ;
/*------------------------------------------- SZERZŐK - ALBUMOK KÖTÉS---------------------------------------*/
insert into artist_record(artist_id,record_id,`role`)
    values(1,1,"producer"),
    values(1,2,"producer"),
    values(1,3,"producer"),
    values(2,4,"producer"),
    values(2,5,"producer"),
    values(3,6,"producer"),
    values(3,7,"producer"),
    values(3,8,"producer"),
    ;