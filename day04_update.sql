/* ============================== UPDATE SET ===================================    
    
    Ýlk olarak aþaðýdaki gibi tedarikciler adýnda bir tablo oluþturunu ve 
    vergi_no sutununu primary key yapýnýz.Ayrýca aþðýdaki verileri tabloya giriniz.
    
    vergi_no NUMBER(3),
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50),
        
    INSERT INTO tedarikciler VALUES (101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES (102, 'Huawei', 'Çin Li');
    INSERT INTO tedarikciler VALUES (103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES (104, 'Apple', 'Adam Eve');
        
    Sonrasýnda aþaðýdaki gibi urunler adýnda bir baþka tablo oluþturunuz ve bu
    tablonun ted_vergino sutunu ile tedarikciler tablosunun vergi_no sutularý
    yardýmýyla iliþkilendiriniz. Verileri giriniz.
    
    ted_vergino NUMBER(3), 
    urun_id NUMBER(11), 
    urun_isim VARCHAR2(50), 
    musteri_isim VARCHAR2(50),
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayþe Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yýlmaz');
    
==============================================================================*/ 

    CREATE TABLE tedarikciler
    (
    vergi_no NUMBER(3) ,
    firma_ismi VARCHAR2(50),
    irtibat_ismi VARCHAR2(50),
    CONSTRAINT pk_ted PRIMARY KEY(vergi_no)
    );
    
    DROP TABLE tedarikciler;
    
    INSERT INTO tedarikciler VALUES(101, 'IBM', 'Kim Yon');
    INSERT INTO tedarikciler VALUES(102, 'Huawei', 'Çin Li');
    INSERT INTO tedarikciler VALUES(103, 'Erikson', 'Maki Tammamen');
    INSERT INTO tedarikciler VALUES(104, 'Apple', 'Adam Eve');
    
    SELECT * FROM tedarikciler;
    
    CREATE TABLE urunler
    (
    ted_vergino NUMBER(3), 
    urun_id NUMBER(11), 
    urun_isim VARCHAR2(50), 
    musteri_isim VARCHAR2(50),
    CONSTRAINT fak_urunler FOREIGN KEY(ted_vergino) REFERENCES tedarikciler(vergi_no)
    );
    
    DROP TABLE urunler;
    
    INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Ayþe Can');
    INSERT INTO urunler VALUES(102, 1002,'Phone', 'Fatma Aka');
    INSERT INTO urunler VALUES(102, 1003,'TV', 'Ramazan Öz');
    INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Veli Han');
    INSERT INTO urunler VALUES(103, 1005,'Phone', 'Canan Ak');
    INSERT INTO urunler VALUES(104, 1006,'TV', 'Ali Bak');
    INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Yýlmaz');
    
    SELECT * FROM urunler;
    SELECT * FROM tedarikciler;
    
    -- SYNTAX
    ----------
    -- UPDATE tablo_adý
    -- SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,...  
    -- WHERE koþul;
    
    /* ----------------------------------------------------------------------------
    ORNEK1: vergi_no’su 101 olan tedarikcinin ismini 'LG' olarak güncelleyeniz. 
    -----------------------------------------------------------------------------*/
    UPDATE tedarikciler
    SET fýrma_ýsmý = 'LG'
    WHERE vergi_no = 101;
    
    SELECT * FROM urunler;
    SELECT * FROM tedarikciler;
    
    /* ----------------------------------------------------------------------------
    ORNEK2: Tedarikciler tablosundak tüm firma isimlerini 'Samsung' olarak 
    güncelleyeniz. 
    -----------------------------------------------------------------------------*/
    UPDATE tedarikciler
    SET firma_ismi = 'Samsung';
    
    -- Tablonun ÝÇERÝÐÝNÝ siler..
    DELETE FROM tedarikciler;  -- DROP TABLE tablonun TAMAMINI siler.
    
    /* ----------------------------------------------------------------------------
    ORNEK3: vergi_no’su 102 olan tedarikcinin ismini 'Samsung' ve irtibat_ismi’ni 
    'Ali Veli' olarak güncelleyeniz. 
    -----------------------------------------------------------------------------*/
    
    UPDATE tedarikciler
    SET firma_ismi = 'Samsung', irtibat_ismi = 'Ali Veli'
    WHERE vergi_no = 102;
    
    SELECT * FROM urunler;
    SELECT * FROM tedarikciler;
    
    /* ----------------------------------------------------------------------------
    ORNEK4: firma_ismi Samsung olan tedarikcinin irtibat_ismini 'Ayþe Yýlmaz' 
    olarak güncelleyiniz.
    -----------------------------------------------------------------------------*/
    UPDATE tedarikciler
    SET irtibat_ismi = 'Ayse Yilmaz'
    WHERE firma_ismi = 'Samsung';
    
    /* ----------------------------------------------------------------------------
    ORNEK5: urunler tablosundaki 'Phone' deðerlerini Telefon olarak güncelleyiniz.
    -----------------------------------------------------------------------------*/
    UPDATE urunler
    SET urun_isim = 'Telefon'
    WHERE urun_isim = 'Phone';
    
    /* ----------------------------------------------------------------------------
    ORNEK6: urunler tablosundaki urun_id deðeri 1004'ten büyük olanlarýn urun_id
    deðerlerini bir arttýrýnýz
    -----------------------------------------------------------------------------*/
    UPDATE urunler
    SET  urun_id = urun_id+1
    WHERE urun_id > 1004;
    
    /* ----------------------------------------------------------------------------
    ORNEK7: urunler tablosundaki tüm ürünlerin urun_id deðerini ted_vergino 
    sutun deðerleri ile toplayarak güncelleyiniz.
    -----------------------------------------------------------------------------*/
    UPDATE urunler
    SET urun_id = ted_vergino + urun_id;
    
    /*-----------------------------------------------------------------------------
    ORNEK8: urunler tablosundan Ali Bak’in aldigi urunun ismini, tedarikci 
    tablosunda irtibat_ismi 'Adam Eve' olan firmanýn ismi (firma_ismi) ile 
    degistiriniz.
    -----------------------------------------------------------------------------*/
    UPDATE urunler
    SET urun_isim = (SELECT firma_ismi FROM tedarikciler
                     WHERE irtibat_ismi = 'Adam Eve')
    WHERE musterý_ýsým = 'Ali Bak';
    
    /*-----------------------------------------------------------------------------
    ORNEK9: Laptop satin alan musterilerin ismini, Apple’in irtibat_isim'i ile 
    degistirin
    -----------------------------------------------------------------------------*/
    UPDATE urunler
    SET musteri_isim = (SELECT irtibat_ismi FROM tedarikciler
                        WHERE firma_ismi = 'Apple')
    WHERE urun_isim = 'Laptop';

    SELECT * FROM urunler;
    SELECT * FROM tedarikciler;