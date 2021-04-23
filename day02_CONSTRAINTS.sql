/*======================= CONSTRAINTS - KISITLAMALAR ======================================

    NOT NULL - Bir Sütunun  NULL içermemesini garanti eder. 
    UNIQUE - Bir sütundaki tüm deðerlerin BENZERSÝZ olmasýný garanti eder.  
    PRIMARY KEY - Bir sütünün NULL içermemesini ve sütundaki verilerin 
                  BENZERSÝZ olmasýný garanti eder.(NOT NULL ve UNIQUE birleþimi gibi)
    FOREIGN KEY - Baþka bir tablodaki Primary Key’i referans göstermek için kullanýlýr. 
                  Böylelikle, tablolar arasýnda iliþki kurulmuþ olur. 
    CHECK - Bir sutundaki tüm verilerin belirlenen özel bir þartý saðlamasýný garanti eder. 
    DEFAULT - Herhangi bir deðer atanamadýðýnda Baþlangýç deðerinin atanmasýný saðlar.
========================================================================================*/

----------------------------------------------------------------
-- KISITLAMALAR (ORNEK1 - PRIMARY KEY)
----------------------------------------------------------------

CREATE TABLE calisanlar
(
    id CHAR(5) PRIMARY KEY,
    isim VARCHAR2(50) UNIQUE,
    maas NUMBER(5) NOT NULL,
    ise_baslama DATE
);

INSERT INTO calisanlar VALUES('10001', 'Ahmet Aslan',7000, '13-04-2018');
INSERT INTO calisanlar VALUES( '10002', 'Mehmet Yýlmaz' ,12000, '14-04-18');
INSERT INTO calisanlar VALUES('10003', '', 5000, '14-04-18');
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '14-04-18');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '14-04-18'); 
INSERT INTO calisanlar VALUES('10006', 'Canan Yaþ', NULL, '12-04-19');

SELECT * FROM calisanlar;

DROP TABLE calisanlar;

-- 10001 id'li calisani silme (Ýleride bu konuyu göreceðiz).
DELETE calisanlar
WHERE id='10001';

----------------------------------------------------------------
-- KISITLAMALAR (ORNEK2 - PRIMARY KEY ALTERNATÝF YÖNTEM)
----------------------------------------------------------------
-- Bu yöntemde Kýsýtlamaya istediðimiz ismi atayabiliriz 
-- ve DISABLE komutuyla istediðimizde pasif hale getirebiliriz. 

CREATE TABLE calisanlar
(
    id CHAR(5), 
    isim VARCHAR2(50) UNIQUE,
    maas NUMBER(5) NOT NULL,
    ise_baslama DATE,
    CONSTRAINT id_pk PRIMARY KEY(id) --DISABLE
);

INSERT INTO calisanlar VALUES('10001', 'Ahmet Aslan',7000, '13-04-2018');
INSERT INTO calisanlar VALUES( '10002', 'Mehmet Yýlmaz' ,12000, '14-04-18');
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '14-04-18');

----------------------------------------------------------------
-- KISITLAMALAR (ORNEK3 - FOREIGN KEY)
----------------------------------------------------------------

CREATE TABLE adresler
(
    adres_id CHAR(5), -- REFERENCES calisanlar(id),
    sokak VARCHAR2(50),
    cadde VARCHAR2(30),
    sehir VARCHAR2(15),
    CONSTRAINT id_fk FOREIGN KEY(adres_id) REFERENCES calisanlar(id) 
);

INSERT INTO adresler VALUES('10001','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10001','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Aða Sok', '30.Cad.','Antep');
-- FK'ye null deðeri atanabilir. 
INSERT INTO adresler VALUES('','Aða Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES('','Aða Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan bir id ile ekleme yapýlamaz.
INSERT INTO adresler VALUES('10004','Gel Sok', '60.Cad.','Van');

SELECT * FROM adresler;
SELECT * FROM calisanlar;

-- Child tablo silinmeden parent tablo silinemez.
DROP TABLE adresler;
DROP TABLE calisanlar;

-- FK ile birleþtirilen tablolardaki tüm verileri çekmek için 
-- JOIN Ýþlemi yapmak gerekir. Bu konuyu sonra göreceðiz.
SELECT * FROM calisanlar, adresler WHERE calisanlar.id = adresler.adres_id;

CREATE TABLE sehirler
(
    alan_kodu NUMBER(3) DEFAULT 34,
    isim VARCHAR2(20) DEFAULT 'ISTANBUL',
    nufus NUMBER(8) CHECK(NUFUS>0)
);

INSERT INTO sehirler VALUES(54, 'sakarya', 1250000);
INSERT INTO sehirler VALUES('', '', 1800000);

SELECT * FROM sehýrler;