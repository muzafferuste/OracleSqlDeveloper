/*=========================== EXISTS, NOT EXIST ================================
    EXISTS operatorü bir Boolean operatördür ve true - false deðer döndürür. 
    EXISTS operatorü sýklýkla Subquery'lerde satýrlarýn doðruluðunu test etmek 
    için kullanýlýr.
    
    Eðer bir subquery (altsorgu) bir satýrý döndürürse EXISTS operatörü de TRUE 
    deðer döndürür. Aksi takdirde, FALSE deðer döndürecektir.
    
    Özellikle altsorgularda hýzlý kontrol iþlemi gerçekleþtirmek için kullanýlýr
==============================================================================*/
   
    CREATE TABLE mart_satislar
    (
        urun_id number(10),
        musteri_isim varchar2(50), 
        urun_isim varchar2(50)
    );
    
    CREATE TABLE nisan_satislar 
    (
        urun_id number(10),
        musteri_isim varchar2(50), 
        urun_isim varchar2(50)
    );
    
    INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
    INSERT INTO mart_satislar VALUES (10, 'Mark', 'Honda');
    INSERT INTO mart_satislar VALUES (20, 'John', 'Toyota');
    INSERT INTO mart_satislar VALUES (30, 'Amy', 'Ford');
    INSERT INTO mart_satislar VALUES (20, 'Mark', 'Toyota');
    INSERT INTO mart_satislar VALUES (10, 'Adem', 'Honda');
    INSERT INTO mart_satislar VALUES (40, 'John', 'Hyundai');
    INSERT INTO mart_satislar VALUES (20, 'Eddie', 'Toyota');
    
    
    INSERT INTO nisan_satislar VALUES (10, 'Hasan', 'Honda');
    INSERT INTO nisan_satislar VALUES (10, 'Kemal', 'Honda');
    INSERT INTO nisan_satislar VALUES (20, 'Ayse', 'Toyota');
    INSERT INTO nisan_satislar VALUES (50, 'Yasar', 'Volvo');
    INSERT INTO nisan_satislar VALUES (20, 'Mine', 'Toyota');

    SELECT * FROM mart_satislar;
    SELECT * FROM nisan_satislar;
   
    DELETE FROM nisan_satislar;
    
/* -----------------------------------------------------------------------------
  ORNEK1: MART VE NÝSAN aylarýnda ayný URUN_ID ile satýlan ürünlerin
  URUN_ID’lerini listeleyen ve ayný zamanda bu ürünleri MART ayýnda alan
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yazýnýz. 
 -----------------------------------------------------------------------------*/       
    -- tablolara kýsa isim vermek mümkündür. Böylece sorgularýmýzýn daha kýsa 
    -- gözükmesini saðlabiliriz.
    
    -- AS  -> bir sutuna kýsa isim veriyor.
    -- Bir sorgu içerisinde  tabloya da kýsa isim vermek mümkün. 
    -- tablo_Adi kýsa_isim
    
    SELECT musteri_isim FROM mart_satislar mart
    WHERE EXISTS (SELECT urun_id FROM nisan_satislar nisan
                  WHERE urun_id = mart.urun_id);
                  
   -- WHERE urun_id IN(SELECT urun_id FROM nisan_satislar
   --          WHERE mart_satislar.urun_id = nisan_satislar.urun_id);  
   
/* -----------------------------------------------------------------------------
  ORNEK2: Her iki ayda da satýlan ürünlerin URUN_ISIM'lerini ve bu ürünleri
  NÝSAN ayýnda satýn alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazýnýz. 
 -----------------------------------------------------------------------------*/
    SELECT urun_isim, musteri_isim FROM nisan_satislar nisan
    
    WHERE EXISTS  (SELECT urun_id FROM mart_satislar mart
                  WHERE mart.urun_isim = nisan.urun_isim);
 
 /* ----------------------------------------------------------------------------
  ORNEK3: Her iki ayda da ortak olarak satýlmayan ürünlerin URUN_ISIM'lerini 
  ve bu ürünleri NÝSAN ayýnda satýn alan MUSTERI_ISIM'lerini listeleyiniz. 
 -----------------------------------------------------------------------------*/
    SELECT urun_isim, musteri_isim FROM nisan_satislar nisan
    
    WHERE NOT EXISTS  (SELECT urun_id FROM mart_satislar mart
                      WHERE mart.urun_isim = nisan.urun_isim);
                      
 /*===================== IS NULL, IS NOT NULL, COALESCE ========================
    
    IS NULL, ve IS NOT NULL BOOLEAN operatörleridir. Bir ifadenin NULL olup 
    olmadýðýný kontrol ederler.  
    
    COALESCE ise bir fonksiyondur ve içerisindeki parameterelerden NULL olmayan
    ilk ifadeyi döndürür. Eðer aldýðý tüm ifadeler NULL ise NULL döndürürür.
    
    sutun_adi = COALESCE(ifade1, ifade2, .....ifadeN)
    
==============================================================================*/

    CREATE TABLE insanlar 
    (
        ssn CHAR(9),
        isim VARCHAR2(50), 
        adres VARCHAR2(50) 
    );

    INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
    INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
    INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
    INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
    INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
    INSERT INTO insanlar (adres) VALUES('Sakarya');
    INSERT INTO insanlar (ssn) VALUES('999111222');
    
    SELECT * FROM insanlar;
    
/* ----------------------------------------------------------------------------
    ORNEK1: isim 'i NULL olanlarý sorgulayýnýz.
 -----------------------------------------------------------------------------*/
    SELECT * FROM insanlar
    WHERE isim IS NULL;

/* ----------------------------------------------------------------------------
  ORNEK2: isim 'i NULL olmayanlarý sorgulayýnýz.
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM insanlar
    WHERE isim IS NOT NULL;
    
/* ----------------------------------------------------------------------------
  ORNEK3: isim 'i NULL olan kiþilerin isim'ine NO NAME atayýnýz. 
-----------------------------------------------------------------------------*/
    UPDATE insanlar
    SET isim = 'NO NAME'
    WHERE isim IS NULL;
    
/* ----------------------------------------------------------------------------
  ORNEK4:   isim 'i NULL olanlara 'Henuz isim girilmedi'
            adres 'i NULL olanlara 'Henuz adres girilmedi'
            ssn 'i NULL olanlara ' no ssn' atayalým.
-----------------------------------------------------------------------------*/
    UPDATE insanlar
    SET isim = COALESCE (isim, 'Henüz isim girilmedi'),
       adres = COALESCE (adres, 'Henüz adres girilmedi'),
       ssn= COALESCE (ssn, 'No SSN');
       
/*================================ ORDER BY  ===================================
   ORDER BY cümleciði bir SORGU deyimi içerisinde belli bir SUTUN’a göre 
   SIRALAMA yapmak için kullanýlýr.
   
   Syntax
   -------
      ORDER BY sutun_adi ASC   -- ARTAN
      ORDER BY sutun_adi DESC  -- AZALAN
==============================================================================*/       
    CREATE TABLE kisiler 
    (
        ssn CHAR(9) PRIMARY KEY,
        isim VARCHAR2(50), 
        soyisim VARCHAR2(50), 
        maas NUMBER,
        adres VARCHAR2(50) 
    );
    
    INSERT INTO kisiler VALUES(123456789, 'Ali','Can', 3000,'Istanbul');
    INSERT INTO kisiler VALUES(234567890, 'Veli','Cem', 2890,'Ankara');
    INSERT INTO kisiler VALUES(345678901, 'Mine','Bulut',4200,'Ankara');
    INSERT INTO kisiler VALUES(256789012, 'Mahmut','Bulut',3150,'Istanbul');
    INSERT INTO kisiler VALUES (344678901, 'Mine','Yasa', 5000,'Ankara');
    INSERT INTO kisiler VALUES (345458901, 'Veli','Yilmaz',7000,'Istanbul');

    SELECT * FROM kisiler;
    
/* ----------------------------------------------------------------------------
  ORNEK1: kisiler tablosunu adres'e göre sýralayarak sorgulayýnýz.
 -----------------------------------------------------------------------------*/
    SELECT * FROM kisiler
    ORDER BY adres ASC;
    
/* ----------------------------------------------------------------------------
  ORNEK2: kisiler tablosunu maas'a göre sýralayarak sorgulayýnýz.
 -----------------------------------------------------------------------------*/
    SELECT * FROM kisiler
    ORDER BY maas ASC;
 /* ----------------------------------------------------------------------------
  ORNEK3: kisiler tablosunu maas'a göre AZALAN sýrada sorgulayýnýz.
 -----------------------------------------------------------------------------*/
    SELECT * FROM kisiler
    ORDER BY maas DESC;
    
/* ----------------------------------------------------------------------------
  ORNEK4: ismi Mine olanlarý, SSN'e göre AZALAN sýrada sorgulayýnýz.
-----------------------------------------------------------------------------*/
    SELECT * FROM kisiler
    WHERE isim = 'Mine'
    ORDER BY ssn DESC;
    
/* ----------------------------------------------------------------------------
  ORNEK5: soyisim'i Bulut olanlarý isim sýralý olarak sorgulayýnýz.
-----------------------------------------------------------------------------*/ 
    SELECT * FROM kisiler
    WHERE soyisim = 'Bulut'
    ORDER BY 2 ASC; -- "ORDER BY isim" ile ayni silemi yapar
    
/*====================== FETCH NEXT, OFFSET (12C VE ÜSTÜ) ======================
   FETCH cümleciði ile listelenecek kayýtlarý sýnýrlandýrabiliriz. Ýstersek 
   satýr sayýsýna göre istersek de toplam satýr sayýsýnýn belli bir yüzdesine 
   göre sýnýrlandýrma koymak mümkündür. 
   
   Syntax
   ---------
   FETCH NEXT satir_sayisi ROWS ONLY;
   FETCH NEXT satir_yuzdesi PERCENT ROWS ONLY;
   
   
   OFFSET Cümleciði ile de listenecek olan satýrlardan sýrasýyla istediðimiz 
   kadarýný atlayabiliriz.  
   
   Syntax
   ----------
   OFFSET satýr_sayisi ROWS;
  
==============================================================================*/ 
/* ----------------------------------------------------------------------------
  ORNEK1: MAAÞ'ý en yüksek 3 kiþinin bilgilerini listeleyen sorguyu yazýnýz.
-----------------------------------------------------------------------------*/
    SELECT * FROM kisiler
    ORDER BY maas DESC
    FETCH NEXT 3 ROWS ONLY;

/* ----------------------------------------------------------------------------
  ORNEK2: MAAÞ'ý en DÜÞÜK 2 kiþinin bilgilerini listeleyen sorguyu yazýnýz.
-----------------------------------------------------------------------------*/
    SELECT * FROM kisiler
    ORDER BY maas ASC
    FETCH NEXT 2 ROWS ONLY;
    
/* ----------------------------------------------------------------------------
  ORNEK3: MAAÞ'a göre sýralamada 4. ile 6. kiþilerin bilgilerini listeleyen 
  sorguyu yazýnýz.
-----------------------------------------------------------------------------*/     
    SELECT * FROM kisiler
    ORDER BY maas DESC
    OFFSET 3 ROWS           -- ilk 3 kaydý atladýk
    FETCH NEXT 3 ROWS ONLY; -- sonraki 3 kaydý seçtik.