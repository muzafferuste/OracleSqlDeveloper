/*============================================================
            TABLO OLU�TURMA  (CRUD - Create)                  
============================================================*/
CREATE TABLE student 
(   
    std_id VARCHAR(4),
    std_name VARCHAR(20),
    std_age NUMBER
);
/*===========================================================
                    VER� G�R��� 
===========================================================*/

INSERT INTO student VALUES('1001', 'MEHMET AL�', 25);
INSERT INTO student VALUES('1002', 'AY�E YILMAZ', 34);
INSERT INTO student VALUES('1003', 'JOHN STAR', 56);
INSERT INTO student VALUES('1004', 'MARY BROWN', 17);

/*===========================================================
                    PAR�ALI VER� G�R��� 
===========================================================*/
-- NOT: Veri giri�i yap�lmayan de�i�kenlere NULL atan�r.

INSERT INTO student(std_id,std_name) VALUES('1005','MUSTAFA KARAR');

/*===========================================================
            TABLODAN VER� SORGULAMA  (CRUD - Read)  
===========================================================*/

SELECT * FROM student;

/*===========================================================
                TABLO S�LME  (CRUD - Drop )
===========================================================*/

DROP TABLE student;

/*===========================================================
                        CRUD �RNEK  
 ============================================================
             
 Veritaban�m�zda urunler ad�nda bir Tablo olu�tural�m.
 urun_id  => NUMBER
 urun_ad� => VARCHAR2(50)
 fiyat => NUMBER(5,2)
 tett => DATE,      
 stok_adedi => NUMBER(10)  
 Tabloya, �r�n giri�i yapal�m.�rne�in C�PS, KOLA, AYRAN, B�SK�V�,  
 (100, �C�PS�, 5.50, �01-05-2022�, 500)
 Verilerimizi �ekelim.
============================================================*/

CREATE TABLE urunler
(   
    urun_id NUMBER,
    urun_ad� VARCHAR2(50),
    fiyat NUMBER(5,2),
    tett DATE,
    stok_adedi NUMBER(10)
);

INSERT INTO urunler VALUES(101,'C�PS',5.25,'01-05-2022', 1500);
INSERT INTO urunler VALUES(102,'B�SK�V�',2.50,'01-07-2024',300);
INSERT INTO urunler VALUES(103,'GOFRET',1.50,'05-09-2023',120);
INSERT INTO urunler VALUES(104,'KOLA',4.50,'21-09-2025',50);
INSERT INTO urunler VALUES(105,'AYRAN',2.50,'01-05-2021',5);

SELECT * FROM urunler;