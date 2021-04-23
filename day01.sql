/*============================================================
            TABLO OLUÞTURMA  (CRUD - Create)                  
============================================================*/
CREATE TABLE student 
(   
    std_id VARCHAR(4),
    std_name VARCHAR(20),
    std_age NUMBER
);
/*===========================================================
                    VERÝ GÝRÝÞÝ 
===========================================================*/

INSERT INTO student VALUES('1001', 'MEHMET ALÝ', 25);
INSERT INTO student VALUES('1002', 'AYÞE YILMAZ', 34);
INSERT INTO student VALUES('1003', 'JOHN STAR', 56);
INSERT INTO student VALUES('1004', 'MARY BROWN', 17);

/*===========================================================
                    PARÇALI VERÝ GÝRÝÞÝ 
===========================================================*/
-- NOT: Veri giriþi yapýlmayan deðiþkenlere NULL atanýr.

INSERT INTO student(std_id,std_name) VALUES('1005','MUSTAFA KARAR');

/*===========================================================
            TABLODAN VERÝ SORGULAMA  (CRUD - Read)  
===========================================================*/

SELECT * FROM student;

/*===========================================================
                TABLO SÝLME  (CRUD - Drop )
===========================================================*/

DROP TABLE student;

/*===========================================================
                        CRUD ÖRNEK  
 ============================================================
             
 Veritabanýmýzda urunler adýnda bir Tablo oluþturalým.
 urun_id  => NUMBER
 urun_adý => VARCHAR2(50)
 fiyat => NUMBER(5,2)
 tett => DATE,      
 stok_adedi => NUMBER(10)  
 Tabloya, Ürün giriþi yapalým.Örneðin CÝPS, KOLA, AYRAN, BÝSKÜVÝ,  
 (100, ‘CÝPS’, 5.50, ‘01-05-2022’, 500)
 Verilerimizi çekelim.
============================================================*/

CREATE TABLE urunler
(   
    urun_id NUMBER,
    urun_adý VARCHAR2(50),
    fiyat NUMBER(5,2),
    tett DATE,
    stok_adedi NUMBER(10)
);

INSERT INTO urunler VALUES(101,'CÝPS',5.25,'01-05-2022', 1500);
INSERT INTO urunler VALUES(102,'BÝSKÜVÝ',2.50,'01-07-2024',300);
INSERT INTO urunler VALUES(103,'GOFRET',1.50,'05-09-2023',120);
INSERT INTO urunler VALUES(104,'KOLA',4.50,'21-09-2025',50);
INSERT INTO urunler VALUES(105,'AYRAN',2.50,'01-05-2021',5);

SELECT * FROM urunler;