/* ======================= SELECT - WHERE ==================================*/

    CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );    CREATE TABLE ogrenciler
    (
        id NUMBER(9),
        isim VARCHAR2(50),
        adres VARCHAR2(100),
        sinav_notu NUMBER(3)
    );
    
    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara',85);
    INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Istanbul',85);
    
    SELECT * FROM ogrenciler;
    
/* ============================================================================
   Verileri SELECT komutu ile veritabanýndan çekerken filtreleme yapmak için 
   
   Syntax
   --------
    SELECT ile birlikte WHERE komutu kullanýlabilir. 
   
    SELECT sutün1, sutün2
        ...
    FROM  tablo_adýWHERE koþul;
==============================================================================*/
  
/* -----------------------------------------------------------------------------
  ORNEK1: Sýnav notu 80'den büyük olan öðrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/  
    SELECT * FROM ogrenciler 
    WHERE sinav_notu>80;
    
    -- notu 80 den büyük olanlarýn sadece isim ve not bilgilerini listeleme
    SELECT isim,sinav_notu
    FROM ogrenciler 
    WHERE sinav_notu>80;
    
 /* -----------------------------------------------------------------------------
  ORNEK2: Adresi Ankara olan öðrencilerin isim ve adres bilgilerini listele
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM ogrenciler
    WHERE adres = 'Ankara';
    
    
 /* ----------------------------------------------------------------------------
  ORNEK3: id'si 124 olan öðrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/
    SELECT * FROM ogrenciler
    WHERE id = 124;
    
            
/* ======================= SELECT - BETWEEN ==================================*/ 
    CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR2(50),
        maas NUMBER(5)
    );

    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES( '10002', 'Mehmet Yýlmaz' ,12000);
    INSERT INTO personel VALUES('10003', 'Meryem ', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10005', 'Ayþe Can', 4000);

    SELECT * FROM personel;
    
    -- NOT:BETWEEN iki mantýksal ifade ile tanýmlayabileceðimiz durumlarý 
    -- tek komutla yazabilme imkâný verir. Yazdýðýmýz 2 sýnýr da aralýða dahildir.
    
/*============================================================================*/
   
/* -----------------------------------------------------------------------------
  ORNEK4: id'si 10002 ile 10005 arasýnda olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/
    --1.Yöntem (AND) 
    SELECT * FROM personel
    WHERE id>='10002' AND id <='10005'; 
    
   --2.Yöntem (BETWEEN)
    SELECT id, isim,maas 
    FROM personel
    WHERE id BETWEEN '10002' AND '10005'; -- ALT VE ÜST LÝMÝTLER DAHÝLDÝR.
    
     
/* -----------------------------------------------------------------------------
  ORNEK5: ismi Mehmet Yýlmaz ile Veli Han arasýndaki olan personel bilgilerini 
  listeleyiniz. personelin bilgilerini listele
 -----------------------------------------------------------------------------*/  
   
    SELECT * FROM  personel
    WHERE isim BETWEEN 'Mehmet Yýlmaz' AND 'Veli Han';
    
/* -----------------------------------------------------------------------------
  ORNEK6: id’si 10002 - 10004 arasýnda olmayan personelin bilgilerini listele
-------------------------------------------------------------------------------*/ 
    SELECT * FROM personel
    WHERE id NOT BETWEEN '10002' AND '10004';
    
              
/* ======================= SELECT - IN ======================================
    IN birden fazla mantýksal ifade ile tanýmlayabileceðimiz durumlarý 
    tek komutla yazabilme imkâný verir
    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_adý
    WHERE sutun_adý IN (deger1, deger2, ...);
/* ========================================================================== */
    
/* -----------------------------------------------------------------------------
  ORNEK7: id’si 10001,10002 ve 10004 olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/   
    --1.YOL:
    SELECT id, isim, maas
    FROM personel
    WHERE id = 10001 OR id = 10002 OR id = 10004;
    
     --2.YOL:
    SELECT id, isim, maas
    FROM personel
    WHERE id IN(10001, 10002, 10004);   
    
/* -----------------------------------------------------------------------------
  ORNEK8: Maaþý sadece 7000  ve 12000 olan personelin bilgilerini listele
-----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE maas IN(7000,12000);
    
/* ======================= SELECT - LIKE ======================================
    NOT:LIKE anahtar kelimesi, sorgulama yaparken belirli patternleri 
    kullanabilmemize olanak saðlar.
    SYNTAX:
    -------
    SELECT sutün1, sutün2,…
    FROM  tablo_adýWHERE sütunN LIKE pattern
    
    PATTERN ÝÇÝN
    -------------
    % 	 ---> 0 veya daha fazla karakteri belirtir. 
    _  	 ---> Tek bir karakteri temsil eder.
        
/* ========================================================================== */
    
/* -----------------------------------------------------------------------------
  ORNEK9:  ismi A harfi ile baþlayanlarý listeleyiniz
 -----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE isim LIKE 'A%';
/* -----------------------------------------------------------------------------
  ORNEK10:  ismi n harfi ile bitenleri listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim LIKE '%n';
 /* -----------------------------------------------------------------------------
  ORNEK11:  isminin 2. harfi e olanlarý listeleyiniz
 -----------------------------------------------------------------------------*/ 
    SELECT * FROM personel
    WHERE isim LIKE '_e%';
/* -----------------------------------------------------------------------------
  ORNEK12:  isminin 2. harfi e olup diðer harflerinde y olanlarý listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim LIKE '_e%y%';

/* -----------------------------------------------------------------------------
  ORNEK13:  ismi A ile baþlamayanlarý listeleyiniz
 -----------------------------------------------------------------------------*/    
    SELECT * FROM personel
    WHERE isim NOT LIKE 'A%';

/* -----------------------------------------------------------------------------
  ORNEK14:  ismi n ile bitmeyenleri listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%n';

/* -----------------------------------------------------------------------------
  ORNEK15:  isminde a harfi olmayanlarý listeleyiniz
 -----------------------------------------------------------------------------*/
    SELECT * FROM personel
    WHERE isim NOT LIKE '%a%';

 /* -----------------------------------------------------------------------------
  ORNEK16:  maaþýnýn son 2 hanesi 00 olmayanlarý listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE '%00';

/* -----------------------------------------------------------------------------
  ORNEK17:  maaþýnýn 4000 olmayanlarý listeleyiniz
 -----------------------------------------------------------------------------*/  
    SELECT * FROM personel
    WHERE maas NOT LIKE 4000;
    
 /* -----------------------------------------------------------------------------
  ORNEK18: maaþý 5 haneli olanlarý listeleyiniz
 -----------------------------------------------------------------------------*/     
    SELECT * FROM personel
    WHERE maas LIKE '_____';
    
  /* -----------------------------------------------------------------------------
  ORNEK19: maaþýnýn  5 haneli olmayanlarý listeleyiniz
 -----------------------------------------------------------------------------*/   
    SELECT * FROM personel
    WHERE maas NOT LIKE '_____';
      
/* -----------------------------------------------------------------------------
  ORNEK20: 1. harfi A ve 7.harfi A olan perspneli listeleyiniz.
 -----------------------------------------------------------------------------*/  

    SELECT * FROM personel
    WHERE isim LIKE 'A_____a%';
    
/* ======================= SELECT - REGEXP_LIKE ================================
    Daha karmaþýk pattern ile sorgulama iþlemi için REGEXP_LIKE kullanýlabilir.  
?
    Syntax:
    --------
    REGEXP_LIKE(sutun_adý, ‘pattern[] ‘, ‘c’ ] ) 
            
/* ========================================================================== */
    
    CREATE TABLE kelimeler
    (
        id NUMBER(10) UNIQUE,
        kelime VARCHAR2(50) NOT NULL,
        harf_sayisi NUMBER(6)
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
    
    SELECT * FROM kelimeler;
    
    -- içerisinde 'hi' harfleri geçen kelimeleri sorgulaynýz.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'hi');
    
    -- içerisinde herhangi bir yerde h veya i bulunan kelimeler
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '[hi]');
    
    --içerisinde ot veya at harfleri olan kelimeleri sorgulayýnýz.
    -- veya islemi | karakteri ile yapýlýr.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at');
    
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 'ot|at', 'i');
    
    -- hi veya ho ile baþlayan kelimeleri sorgulayýnýz.
    -- Baþlama için ^ karakteri kullanýlýr.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, '^hi|^ho', 'i');
    
    -- t veya m ile biten kelimeleri Büyük-Küçük harf duyarsýz þekilde listeyeniz.
    --bitiþ için $ ilareti kullanýlýr.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime, 't$|m$', 'i');
    
    -- h ile baþlayýp t ile biten 3 harfli kelimeleri büyük-küçük harfe 
    -- dikkat etmeksizin listeleyeniz.
    -- - (tire) karakteri bir aralýk verir.
    -- köþeli parantez tek bir karakter gösterir.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'h[a-z|0-9]t','i');
    
    -- Ýlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli 
    -- kelimelerin tüm bilgilerini sorgulayalým.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE (kelime,'h[ai]t','i');
    
    -- Ýçinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'h[mie](*)');
    
    -- Ilk harfi h olan ve Ýçinde m veya i veya e olan kelimelerin
    --tüm bilgilerini listeleyiniz.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'h[mie](*)');
    
    -- içerisinde en az 2 adet oo barýndýran kelimelerin tüm bilgilerini 
    -- listeleyiniz.
    
    -- {2}
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime, '[o]{2}', 'i')
    
    -- içerisinde en az 2 adet a barýndýran kelimelerin tüm bilgilerini 
    -- listeleyiniz.
    SELECT * FROM kelimeler
    WHERE REGEXP_LIKE(kelime,'[a]{2}','i'); 