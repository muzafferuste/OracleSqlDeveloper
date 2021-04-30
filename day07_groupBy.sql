 /*============================= GROUP BY =====================================
    
    GROUP BY c�mleci�i bir SELECT ifadesinde sat�rlar�, sutunlar�n de�erlerine 
    g�re �zet olarak gruplamak i�in kullan�l�r. 
   
    GROUP BY c�mlece�i her grup ba��na bir sat�r d�nd�r�r. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonlar� ile birlikte kullan�l�r.
    
==============================================================================*/ 
      
    CREATE TABLE manav 
    (
        isim varchar2(50), 
        urun_adi varchar2(50), 
        urun_miktari number(9) 
    );
    
    INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
    INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
    INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
    INSERT INTO manav VALUES( 'Veli', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
    INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
    INSERT INTO manav VALUES( 'Ayse', 'Uzum', 4);
    INSERT INTO manav VALUES( 'Ali', '', 2);
    
/* -----------------------------------------------------------------------------
  ORNEK1: kisi ismine g�re sat�lan toplam meyve miktarlar�n� g�steren sorguyu 
  yaz�n�z.
------------------------------------------------------------------------------*/
    SELECT isim, SUM(urun_miktari) AS toplam_urun
    FROM manav
    GROUP BY isim;
    
/* ----------------------------------------------------------------------------
  ORNEK2: sat�lan meyve t�r�ne (urun_adi) g�re urun alan ki�i say�s�n� g�steren
  sorguyu yaz�n�z. NULL olarak girilen meyveyi listelemesin.
-----------------------------------------------------------------------------*/
    -- GROUP by ile birlikte WHERE c�mleci�i kullan�labilir.
    SELECT urun_adi, COUNT(isim) AS kisi_sayisi
    FROM manav
    WHERE urun_adi IS NOT NULL
    GROUP BY urun_adi
    ORDER BY kisi_sayisi;
    
/* ----------------------------------------------------------------------------
  ORNEK3: sat�lan meyve t�r�ne (urun_adi) g�re sat�lan (urun_miktari )MIN ve 
  MAX urun miktarlarini, MAX urun miktarina g�re s�ralayarak listeyen sorguyu 
  yaz�n�z.
-----------------------------------------------------------------------------*/ 
    SELECT urun_adi, MIN(urun_miktari) AS min_urun, MAX(urun_miktari) AS max_urun
    FROM manav
    WHERE urun_adi IS NOT NULL
    GROUP BY urun_adi
    ORDER BY max_urun DESC;

/* ----------------------------------------------------------------------------
  ORNEK4: kisi ismine ve urun ad�na g�re sat�lan �r�nlerin toplam�n� 
  grupland�ran ve isime g�re ters s�ras�da listeyen sorguyu yaz�n�z.
 -----------------------------------------------------------------------------*/
    SELECT isim, urun_adi, SUM(urun_miktari) AS urun_toplam
    FROM manav
    GROUP BY isim, urun_adi
    ORDER BY isim DESC;
    
/* ----------------------------------------------------------------------------
  ORNEK5: kisi ismine ve urun ad�na g�re sat�lan �r�nlerin toplam�n� bulan ve
  ve bu toplam de�eri 3 ve fazlas� olan kay�tlar� toplam urun miktarlarina g�re
  ters siralayarak listeyen sorguyu yaz�n�z.
 -----------------------------------------------------------------------------*/
    -- AGGREGATE fonksiyonlar� ile ilgili bir ko�ul koymak i�in GROUP BY'dan 
    -- sonra HAVING c�mleci�i kullan�l�r.
    SELECT isim, urun_adi, SUM(urun_miktari) AS toplam_miktar
    FROM manav
    GROUP BY isim, urun_adi
    HAVING SUM(urun_miktari) >= 3
    ORDER BY toplam_miktar DESC;
 
 /* ----------------------------------------------------------------------------
  ORNEK6: sat�lan urun_adi'na g�re MAX urun say�lar�n� s�ralayarak listeyen 
  sorguyu yaz�n�z. NOT: Sorgu, sadece MAKS urun_miktari MIN urun_miktar�na 
  e�it olmayan kay�tlar� listelemelidir.
 -----------------------------------------------------------------------------*/
    SELECT urun_adi, MAX(urun_miktari) AS max_urun
    FROM manav
    GROUP BY urun_adi
    HAVING MIN(urun_miktari) <> MAX(urun_miktari)
    ORDER BY max_urun;
 
/*============================= DISTINCT =====================================
    
    DISTINCT c�mleci�i bir SORGU ifadesinde benzer olan sat�rlar� flitrelemek
    i�in kullan�l�r. Dolay�s�yla se�ilen sutun yada sutunlar i�in benzersiz veri
    i�eren sat�rlar olu�turmaya yarar.
   
    SYNTAX
    -------
    SELECT DISTINCT sutun_adi1, sutun_adi2, satin_adi3
    FROM  tablo_ad�;
==============================================================================*/ 
/* ----------------------------------------------------------------------------
  ORNEK1: sat�lan farkl� meyve t�rlerinin say�s�n� listeyen sorguyu yaz�n�z.
-----------------------------------------------------------------------------*/
    SELECT COUNT(DISTINCT urun_adi) AS urun_sayisi
    FROM manav;

/* -----------------------------------------------------------------------------
  ORNEK2: sat�lan meyve ve isimlerin farkl� olanlar�n� listeyen sorguyu yaz�n�z.
------------------------------------------------------------------------------*/
     SELECT DISTINCT urun_adi,isim  -- 2 sutun icin beraber degerlendirirek
                                    -- benzerli olanlar� cikariyor.
     FROM manav; 
     
/* ----------------------------------------------------------------------------
  ORNEK3: sat�lan meyvelerin urun_mikarlarinin benzersiz  olanlar�n�n 
  toplamlarini listeyen sorguyu yaz�n�z.
-----------------------------------------------------------------------------*/
    SELECT SUM(DISTINCT urun_miktari) AS urun_sayisi
    FROM manav;
    
    SELECT DISTINCT urun_adi FROM manav;