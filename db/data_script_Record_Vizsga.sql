/*------------------------------------------- REKORD TÍPUSOK ----------------------------------------------*/
insert into record_type(type_name)
    values
    	("Album"),
    	("EP"),
    	("Single")
;

/*------------------------------------------- ADMIN FELHASZNÁLÓ -------------------------------------------*/
insert into `user`(id,password_hash,`name`,email,phone)
    values(0,"admin","$2y$12$ETL70RA2OEi6gZcCLUb03u8xapsiDTmk96NpCq2k.xL9ckxJhW0BG","admin@record.hu","06309353729"); /*DO NOT REPLACE PASSWORD IT IS FINE*/

/*------------------------------------------- SZERZŐK ------------------------------------------------------*/
insert into artist(`name`,active_since,nationality,`url`,is_group)
    values
        ("Metallica","1981","usa","https://www.metallica.com",1),
        ("Michael Jackson","1964","usa","https://www.michaeljackson.com",0),
        ("Playboi Carti","2015","usa",null,0),
        ("1000 Eyes", "2021", null, null, 0),
        ("Masayoshi Takanaka","1970","jpn","https://takanaka.com",0),
        ("Kárpátia","2003","hun","https://www.karpatiazenekar.hu",0),
        ("Korda György","1958","hun",null,0),
        ("The Neighbourhood", "2011", "usa", "https://tour.thenbhd.com",1)
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
        ("1000 Eyes", 1, "2021", 13),
        ("Singularity", 1, "2024", 15),
        ("SIGNAL: MEMORIES", 1, "2024", 7),
        ("THE RAINBOW SKELETONS",1,"1981",14),
        ("LEG DANCIN'",2,"2006",4),
        ("BRASILIAN LAND",1,"1978",8),
        ("AL OF YOU",1,"2006",14),
        ("Merészeké a szerencse",1,"2014",11),
        ("Az Üldözött",1,"2013",13),
        ("Napsütés kell a világnak - Tegnap és ma",1,"2005",15),
        ("(((((infraSOUND)))))", 1,2025,15),
        ("Easy To Imagine The Neigbourhood Changing", 1, 2018, 21),
        ("You're Welcome,", 3, 2012, 2)
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
        (4,11,"producer"),
        (5,12,"producer"),
        (5,13,"producer"),
        (5,14,"producer"),
        (5,15,"producer"),
        (6,16,"producer"),
        (6,17,"producer"),
        (7,18,"producer"),
        (8,19,"producer"),
        (8,20,"producer"),
        (8,21,"producer"),
    ;
