INSERT INTO degree (titlos,idryma,bathmida) VALUES ("fisiko","upatras","BSc"),
("xhmiko","pamak","BSc"),("geoponiko","auth","MSc"),("paidagogiko","auth","BSc"),("mathimatiko","upatras","BSc");

INSERT INTO employee (username,bio,sistatikes,certificates) VALUES ("antonia","MIXANIKOS STOUS KINITIRES ESOTERIKIS KAUSIS ME 5 XRONIA EMPEIRIA","SISTIMENOS APO TO PANEPISTIMIO MOY","MECHANICAL ENGINEER"),
("giorgos","EXW 4 XRONIA EMPEIRIA STON PROGRAMMATISMO ME GLOSSA C++","SISTIMENH APO INTRASOFT","SOFTWARE ENGINEER"),
("thanasis","EIMAI EKSIDIKEYMENOS OS DATA SCIENTIST 3 XRONIA","SISTIMENOS APO INTRACOM TELECOM","COMPUTER ENGINEER"),
("theofilos","EIMAI WEB DEVELOPER ME 6 XRONIA EMPEIRIA","SISTIMENOS APO DELOITTE","WEB DEVELOPMENT"),
("manos","EIMAI EIDIKEYMENOS STO CYBER SECURITY","SISTIMENOS APO INTRASOFT","CYBERSECURITY"),
("ourania","EIMAI GRAPHIC DESIGNER ME PANW APO 9 XRONIA EMPEIRIA STO XWRO","SUSTIMENH APO VIVA WALLET","GRAPHIC DESIGNER");

INSERT INTO applies (cand_usrname,job_id) VALUES ("antonia",1),("giorgos",2),
("thanasis",3),("theofilos",4),("manos",5),("ourania",6);

INSERT INTO etaireia(AFM,DOY,name_,tel,street,num,city,country) VALUES ("1","PATRAS","INTRACOM","2613445680","PANEPISTHMIOY",5,"PATRA","ELLADA"),
("2","ATHINAS","DELOITTE","2103045670","POSIDONOS",4,"ATHINA","ELLADA"),
("3","XANIA","OMILIA","2402030460","AMALIAS",9,"KRHTH","ELLADA"),
("4", "THESSALONIKIS", "INTRASOFT", "2312567890", "THERMI", 12, "THESSALONIKI", "ELLADA"),
("5", "HERAKLION", "IBM", "2813456789", "LEOFOROS", 21, "HERAKLION", "ELLADA"),
("6", "RHODES", "COSMOTE", "2241324567", "RIGAS FERAIOS", 7, "RHODES", "ELLADA");


INSERT INTO evaluator (username, exp_years, firm)
VALUES
  ("mixalis", 4, "1"),
  ("ioanna", 3, "2"),
  ("menelaos", 7, "3"),
  ("ashmenia", 2, "4"),
  ("spuros", 10, "5"),
  ("gianna", 1, "6");

INSERT INTO has_degree (degr_title,degr_idryma,cand_usrname,etos,grade) VALUES ("fisiko","upatras","antonia",2005,7),
("xhmiko","pamak","giorgos",2007,9),("geoponiko","auth","thanasis",2009,6),("paidagogiko","auth","theofilos",2013,8);

INSERT INTO job (id,start_date_,salary,position,edra,evaluator,announce_date,submission_date) VALUES (8,"2020-1-1",1900,"manager","athina","mixalis","2019-12-9","2019-12-28"),
(1,"2018-2-2",1500,"COMPUTER ENGINEER","THESSALONIKI","ioanna","2018-1-1","2018-1-30"),
(2,"2019-5-2",2000,"CEO","ATHINA","menelaos","2019-4-5","2019-4-30"),
(3,"2017-4-1",1200,"WEB DEVELOPER","PATRA","ashmenia","2017-3-1","2017-3-30"),
(4,"2019-6-24",1300,"GRAPHIC DESIGNER","XANTHI","spuros","2019-2-14","2019-3-5"),
(5,"2022-4-5",1200,"IT","IOANNINA","gianna","2022-1-20","2022-2-20"),
(6,"2021-5-5",1300,"CYBER SECURITY","CHALKIDA","mixalis","2021-3-2","2021-4-5"),
(7,"2024-7-2",1450,"DATA ANALYST","ATHINA","ioanna","2024-5-3","2024-6-29"),



INSERT INTO languages (candid,lang) VALUES ("antonia","EN"),
("giorgos","GE"),("thanasis","SP"),("theofilos","CH");

INSERT INTO project (candid,num,descr,url_) VALUES ("antonia",1,"SEARCH ENGINE","WWWW.SEARCHENGINE.COM"),
("giorgos",2,"DIKTUA","WWWW.DIKTUA.COM"),("thanasis",3,"ALGORITHMOI","WWWW.ALGORITHMOI.COM"),
("theofilos",4,"AI","WWWW.AI.COM"),("manos",5,"DATABASE","WWWW.DATABASE.COM"),("ourania",6,"ECOMMERCE","WWWW.ECOMMERCE.COM"),
("tasos",7,"TRANSPORTATION","WWWW.TRANSPORTATION.COM");

INSERT INTO requires (job_id,subject_title) VALUES (8,"COMPUTER ENGINEER"),
(1,"CEO"),(2,"WEB DEVELOPER"),(3,"GRAPHIC DESIGNER"),(4,"IT"),
(5,"CYBERSECURITY"),(6,"DATA ANALYST"),(7,"MATH SOLVER");

INSERT INTO subject_ (title,descr,belongs_to) VALUES ("COMPUTER ENGINEER","CREATES APPLICATIONS","COMPUTER ENGINEER"),
("CEO","RESPONSIBLE FOR COMPANY","CEO"),("WEB DEVELOPER","CREATES WEBSITES","WEB DEVELOPER"),
("GRAPHIC DESIGNER","CREATES GRAPHICS","GRAPHIC DESIGNER"),("IT","FIX ISSUES","IT"),
("CYBERSECURITY","RESPONSIBLE FOR SAFETY ","CYBERSECURITY"),("DATA ANALYST","ANALIZE INFORMATION","DATA ANALYST"),
("MATH SOLVER","GIVE MATHEMATIC SOLUTIONS","MATH SOLVER");


INSERT INTO user (username,password_,name_,lastname,reg_date,email) VALUES 
("theofilos","aefaefaefa","theofilos","tzounis","2022-1-22","THEOFILOSTZ@GMAIL.COM"),
("thanasis","srtssrtsr","thanasis","kalavris","2022-1-14","KALAVRIS@GMAIL.COM"),
("xrusa","PSSDFSDF","xrusa","glombou","2022-5-12","XRUSAGLOMPOU@GMAIL.COM"),
("manos","CYBERSEC","manos","zisis","2022-1-10","MANOLISZISIS@GMAIL.COM"),
("antonis","WEDZZD","antonis","apostolou","2022-3-12","ANTAPOSTOLOU@GMAIL.COM"),
("xenia","DFSZZFZD","xenia","karapa","2022-1-11","KARAPA@GMAIL.COM"),
("tasos","PANZDFZ","tasos","mpezimikis","2022-2-10","MPEZIMIKISTASOS@GMAIL.COM"),
("ourania","PTUXIZDF","ourania","giatzoglou","2022-4-1","OURANIA76@GMAIL.COM"),
("zenia","PTUXIO45","zenia","ioannidi","2022-5-1","ZENIAIOANNIDI@GMAIL.COM"),
("giorgos","PTUSDFS","giorgos","tzoudas","2022-1-4","TZOUDAS32@GMAIL.COM"),
("stefanos","PSDFSDF","stefanos","troulis","2022-2-1","STEFANOSTR@GMAIL.COM");