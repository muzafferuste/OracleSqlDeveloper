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