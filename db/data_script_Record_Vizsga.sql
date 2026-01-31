/*------------------------------------------- REKORD TÍPUSOK ----------------------------------------------*/
insert into record_type(type_name)
    values
    	("Album"),
    	("EP"),
    	("Single")
;

/*------------------------------------------- ADMIN FELHASZNÁLÓ -------------------------------------------*/
insert into `user`(id,password_hash,`name`,email,phone)
    values(0,"admin","admin","admin@record.hu","06309353729");

/*------------------------------------------- SZERZŐK ------------------------------------------------------*/
insert into artist(`name`,active_since,nationality,`url`,is_group)
    values
        ("Metallica","1981","usa","https://www.metallica.com",1),
        ("Michael Jackson","1964","usa","https://www.michaeljackson.com",0),
        ("Playboi Carti","2015","usa","https://shop.playboicarti.com/",0),
        ("1001 Eyes", "2021", null, null, 0)
    ;
/*------------------------------------------- ALBUMOK ------------------------------------------------------*/
insert into `record`(`name`,type_id,release_year,`length`)
    values
        ("Master Of Dolls",1,"1986",8),
        ("Ride The Storm",1,"1984",64),
        ("Restock",1,"1997",13),
        ("Good",1,"1987",9),
        ("Freindly",1,"1991",9),
        ("Whole Lotta Blue",1,"2020",24),
        ("Live Lit",1,"2018",19),
        ("Melody",1,"2025",30),
        ("1001 Eyes", 1, 2021, 13),
        ("Singularity", 1, 2024, 15),
        ("SIGNAL: MEMORIES", 1, 2024, 7)
    ;
/*------------------------------------------- SZERZŐK - ALBUMOK KÖTÉS---------------------------------------*/
insert into artist_record(artist_id,record_id,`role`)
    values
        (1,1,"producer"),
        (1,2,"producer"),
        (1,3,"producer"),
        (2,4,"producer"),
        (2,5,"producer"),
        (3,6,"producer"),
        (3,7,"producer"),
        (3,8,"producer"),
        (4,9,"producer"),
        (4,10,"producer"),
        (4,11,"producer")

    ;
