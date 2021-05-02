    CREATE TABLE bolumler 
    (
      bolum_id   NUMBER(2) CONSTRAINT bolum_pk PRIMARY KEY,
      bolum_isim VARCHAR2(14),
      konum      VARCHAR2(13)
    );
    
    INSERT INTO bolumler VALUES (10,'MUHASABE','IST');
    INSERT INTO bolumler VALUES (20,'MUDURLUK','ANKARA');
    INSERT INTO bolumler VALUES (30,'SATIS','IZMIR');
    INSERT INTO bolumler VALUES (40,'ISLETME','BURSA');
    INSERT INTO bolumler VALUES (50,'DEPO', 'YOZGAT');
?
    CREATE TABLE personel
    (
      personel_id   NUMBER(4) CONSTRAINT personel_pk PRIMARY KEY,
      personel_isim VARCHAR2(10),
      meslek        VARCHAR2(9),
      mudur_id      NUMBER(4),
      ise_baslama   DATE,
      maas          NUMBER(7,2),
      bolum_id      NUMBER(2) 
    );
    
   SELECT * FROM bolumler;
  
    INSERT INTO personel VALUES (7369,'AHMET','KATIP',7902,'17-12-1980',800,20);
    INSERT INTO personel VALUES (7499,'BAHATTIN','SATIS',7698,'20-2-1981',1600,30);
    INSERT INTO personel VALUES (7521,'NESE','SATIS',7698,'22-2-1981',1250,30);
    INSERT INTO personel VALUES (7566,'MUZAFFER','MUDUR',7839,'2-4-1981',2975,20);
    INSERT INTO personel VALUES (7654,'MUHAMMET','SATIS',7698,'28-9-1981',1250,30);
    INSERT INTO personel VALUES (7698,'EMINE','MUDUR',7839,'1-5-1981',2850,30);
    INSERT INTO personel VALUES (7782,'HARUN','MUDUR',7839,'9-6-1981', 2450,10);
    INSERT INTO personel VALUES (7788,'MESUT','ANALIST',7566,'13-07-87',3000,20);
    INSERT INTO personel VALUES (7839,'SEHER','BASKAN',NULL,'17-11-1981',5000,10);
    INSERT INTO personel VALUES (7844,'DUYGU','SATIS',7698,'8-9-1981',1500,30);
    INSERT INTO personel VALUES (7876,'ALI','KATIP',7788,'13-07-87',1100,20);
    INSERT INTO personel VALUES (7900,'MERVE','KATIP',7698,'3-12-1981',950,30);
    INSERT INTO personel VALUES (7902,'NAZLI','ANALIST',7566,'3-12-1981',3000,20);
    INSERT INTO personel VALUES (7934,'EBRU','KATIP',7782,'23-1-1982',1300,10);
    INSERT INTO personel VALUES (7956,'SIBEL','MIMAR',7782,'29-1-1991',3300,60);
    INSERT INTO personel VALUES (7933,'ZEKI','MUHENDIS',7782,'26-1-1987',4300,60);
     
    SELECT * FROM personel;

 /* -----------------------------------------------------------------------------
  ORNEK1: SATIS ve MUHASABE bolumlerinde calisan personelin isimlerini ve 
  bolumlerini, once bolum sonra isim sýralý olarak listeleyiniz
------------------------------------------------------------------------------*/