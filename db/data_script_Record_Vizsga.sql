/*------------------------------------------- REKORD TÍPUSOK ----------------------------------------------*/
insert into record_type(type_name)
    values
    	("Album"),
    	("EP"),
    	("Single")
;

/*------------------------------------------- ADMIN FELHASZNÁLÓ -------------------------------------------*/
insert into `user`(id,`name`,password_hash,email,phone)
    values(0,"admin","$2y$12$ETL70RA2OEi6gZcCLUb03u8xapsiDTmk96NpCq2k.xL9ckxJhW0BG","admin@record.hu","06309353729"); /*DO NOT REPLACE PASSWORD IT IS FINE*/

/*------------------------------------------- SZERZŐK ------------------------------------------------------*/
insert into artist(`name`,active_since,nationality,`url`,is_group, file_path)
    values
        ("Metallica",                       "1981", "usa",  "https://www.metallica.com",            1,  "Metallica"), /*1*/
        ("Michael Jackson",                 "1964", "usa",  "https://www.michaeljackson.com",       0,  "Artists/MichaelJackson"), /*2*/
        ("Playboi Carti",                   "2015", "usa",  "https://soundcloud.com/playboicarti",  0,  "Artists/PlayboiCarti"), /*3*/
        ("1000 Eyes",                       "2021", null,   "https://thousandeyes.bandcamp.com",    0,  "Artists/1000Eyes"), /*4*/
        ("Masayoshi Takanaka",              "1970", "jpn",  "https://takanaka.com",                 0,  "Artists/MasayoshiTakanaka"), /*5*/
        ("Kárpátia",                        "2003", "hun",  "https://www.karpatiazenekar.hu",       0,  "Artists/Karpatia"), /*6*/
        ("Korda György",                    "1958", "hun",  null,                                   0,  "KordaGyorgy"), /*7*/
        ("The Neighbourhood",               "2011", "usa",  "https://tour.thenbhd.com",             1,  "Artists/TheNeighbourhood"), /*8*/
        ("Astrophysics",                    "2018", "bra",  "https://astrophysicsbrazil.bandcamp.com/music", 1, "Artists/Astrophysics"), /*9*/
        ("TV Girl",                         "2013", "usa",  "https://tvgirl.bandcamp.com",          1,  "Artists/TVGirl"), /*10*/
        ("Jordana",                         "2018", "usa",  "https://jordana.cool",                 0,  "Artists/Jordana"), /*11*/
        ("Julie",                           "2020", "usa",  "https://julie.bandcamp.com",           1,  "Artists/Julie"), /*12*/
        ("WEDNESDAY CAMPANELLA",            "2013", "jpn",  null,                                   1,  "Artists/WednesdayCampanella"), /*13*/
        ("MASS OF THE FERMENTING DREGS",    "2006", "jpn",  "https://www.motfd.com/",               1,  "Artists/MassOfTheFermentingDregs"), /*14*/
        ("mollywood",                       "2024", "hun",  "https://astromusic.hu/band/mollywood/",0,  "Artists/Mollywood"), /*15*/
        ("Irina",                           "2023", "hun",  "https://soundcloud.com/edina-nagy-865719925",0,  "Artists/Irina") /*16*/

    ;
/*------------------------------------------- ALBUMOK ------------------------------------------------------*/
/* copy paste template:   ("", , "", , "Records/.jpg"), /**/    */

insert into `record`(`name`,type_id,release_year,`length`,file_path)
    values
        ("Master Of Puppets",1,"1986",8,"Records/MasterOfPuppets.jpg"), /*1*/
        ("Ride The Lightning",1,"1984",8,"Records/RideTheLightning.jpg"), /*2*/
        ("Reload",1,"1997",13,"Records/Reload.jpg"), /*3*/
        ("Bad",1,"1987",9,"Records/Bad.jpg"), /*4*/
        ("Dangerous",1,"1991",9,"Records/Dangerous.jpg"), /*5*/
        ("Whole Lotta Red",1,"2020",24,"Records/WholeLottaRed.jpg"), /*6*/
        ("Die Lit",1,"2018",19,"Records/DieLit.jpg"), /*7*/
        ("MUSIC",1,"2025",30,"Records/MUSIC.jpg"), /*8*/
        ("1000 Eyes", 1, "2021", 13,"Records/1000Eyes.jpg"), /*9*/
        ("Duality", 1, "2024", 15,"Records/Duality.jpg"), /*10*/
        ("SIGNALIS: MEMORIES", 1, "2024", 7,"Records/SignalisMemories.jpg"), /*11*/
        ("THE RAINBOW GOBLINS",1,"1981",14,"Records/TheRainbowGoblins.jpg"), /*12*/
        ("FINGER DANCIN'",2,"2006",4,"Records/FingerDancin.jpg"), /*13*/
        ("BRASILIAN SKIES",1,"1978",8,"Records/BrasilianSkies.jpg"), /*14*/
        ("ALL OF ME",1,"2006",14,"Records/AllOfMe.jpg"), /*15*/
        ("Bátraké a szerencse",1,"2014",11,"Records/BatrakeASzerencse.jpg"), /*16*/
        ("A Száműzött",1,"2013",13,"Records/ASzamuzott.jpg"), /*17*/
        ("Napfény kell a világnak - Tegnap és ma",1,"2005",15,"Records/NapfenyKellAVilagnakTegnapEsMa.jpg"), /*18*/
        ("(((((ultraSOUND)))))", 1,"2025",15,"Records/UltraSound.jpg"), /*19*/
        ("Hard To Imagine The Neighbourhood Ever Changing", 1, "2018", 21,"Records/HardToImagineTheNeighbourhoodEverChanging.jpg"), /*20*/
        ("Thank you,", 3, "2012", 2,"Records/Thankyou.jpg"), /*21*/
        ("HOPE LEFT ME", 1, "2022", 12,"Records/HopeLeftMe.jpg"), /*22*/
        ("Who Really Cares", 1, "2016", 10,"Records/WhoReallyCares.jpg"), /*23*/
        ("Fauxllennium", 1,"2024",7,"Records/Fauxllennium.jpg"), /*24*/
        ("Summer's Over", 1, "2021", 7,"Records/SummersOver.jpg"), /*25*/
        ("flutter", 3, "2020", 1,"Records/Flutter.jpg"), /*26*/
        ("starjump/kit", 3, "2020", 2,"Records/StarjumpKit.jpg"), /*27*/
        ("pushing daisies", 2, "2021", 6,"Records/PushingDaisies.jpg"), /*28*/
        ("my anti-aircraft friend", 1, "2024", 10,"Records/MyAntiAircraftFriend.jpg"), /*29*/
        ("Kawaii girl", 1, "2025", 8,"Records/KawaiiGirl.jpg"), /*30*/
        ("POP DELIVERY", 1, "2024", 8,"Records/PopDelivery.jpg"), /*31*/
        ("Summer Time Ghost", 3, "2025", 1,"Records/SummerTimeGhost.jpg"), /*32*/
        ("World Is Yours", 2, "2009", 6, "Records/WorldIsYours.jpg"), /*33*/
        ("MASS OF THE FERMENTING DREGS", 2, "2008", 6, "Records/MassOfTheFermentingDregs.jpg"), /*34*/
        ("Larissza Radio", 1, "2025", 9, "Records/LarisszaRadio.jpg"), /*35*/
        ("Europa", 1, "2025", 11, "Records/Europa.jpg"), /*36*/
        ("gyógynövény", 3, "2023", 1, "Records/Gyogynoveny.jpg"), /*37*/
        ("dohányozni tilos", 1, "2024", 9, "Records/DohanyozniTilos.jpg"), /*38*/
        ("halovány", 3, "2025", 1, "Records/Halovany.jpg") /*39*/
    ;
/*------------------------------------------- SZERZŐK - ALBUMOK KÖTÉS---------------------------------------*/
insert into artist_record(artist_id,record_id,`role`)
    values
        /*Metallica*/
        (1,1,"producer"),
        (1,2,"producer"),
        (1,3,"producer"),
        /*Michael Jackson*/
        (2,4,"producer"),
        (2,5,"producer"),
        /*playboi carti*/
        (3,6,"producer"),
        (3,7,"producer"),
        (3,8,"producer"),
        /*1000 eyes*/
        (4,9,"producer"),
        (4,10,"producer"),
        (4,11,"producer"),
        /*takanaka*/
        (5,12,"producer"),
        (5,13,"producer"),
        (5,14,"producer"),
        (5,15,"producer"),
        /*karpatia*/
        (6,16,"producer"),
        (6,17,"producer"),
        /*Korda György*/
        (7,18,"producer"),
        /*The neighbourhood*/
        (8,19,"producer"),
        (8,20,"producer"),
        (8,21,"producer"),
        /*Astrophysics*/
        (9,22,"producer"),
        /*tv girl*/
        (10,23,"producer"),
        (10,24,"producer"),
        /*jordana*/
        (11,25,"producer"),
        (10,25,"featured"),
        /*julie*/
        (12,26,"producer"),
        (12,27,"producer"),
        (12,28,"producer"),
        (12,29,"producer"),
        /*WEDNESDAY CAMPANELLA*/
        (13,30,"producer"),
        (13,31,"producer"),
        (13,32,"producer"),
        /*MASS OF THE FERMENTING DREGS*/
        (14,33,"producer"),
        (14,34,"producer"),
        /*mollywood*/
        (15,35,"producer"),
        (15,36,"producer"),
        /*Irina*/
        (16,37,"producer"),
        (16,38,"producer"),
        (16,39,"producer")
    ;
/*!!!!!ARTIST_ID - RECORD_ID!!!!!*/