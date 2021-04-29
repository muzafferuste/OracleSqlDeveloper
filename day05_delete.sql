/* ============================== DELETE ===================================  */

    -- DELETE FROM tablo_adý;  Tablonun tüm içerðini siler.
    -- Bu komut bir DML komutudur. Dolayýsýyla devamýnda WHERE gibi cümlecikler
    -- kullanýlabilir.
    
    
    -- DELETE FROM tablo_adý
    -- WHERE sutun_adi = veri;
    
    CREATE TABLE ogrenciler
    (
        id CHAR(3),
        isim VARCHAR2(50),
        veli_isim VARCHAR2(50),
        yazili_notu NUMBER(3)       
    );
    
    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
	INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);

    SELECT * FROM ogrenciler;
    
     DROP TABLE ogrenciler;      
     
/* =============================================================================
         Seçerek silmek için WHERE Anahtar kelimesi kullanýlabilir. 
===============================================================================*/     

/* -----------------------------------------------------------------------------
  ORNEK1: id'si 124 olan ogrenciyi siliniz.
 -----------------------------------------------------------------------------*/ 
  
      DELETE FROM ogrenciler
      WHERE id = 124;
    
/* -----------------------------------------------------------------------------
  ORNEK2: ismi Kemal Yasa olan satýrýný siliniz.
 -----------------------------------------------------------------------------*/   
     
      DELETE FROM ogrenciler
      WHERE isim = 'Kemal Yasa';
      
/* -----------------------------------------------------------------------------
  ORNEK3: ismi Nesibe Yilmaz ve Mustafa Bak olan kayýtlarý silelim.
 -----------------------------------------------------------------------------*/        
      DELETE FROM ogrenciler
      WHERE isim = 'Nesibe Yilmaz' OR isim = 'Mustafa Bak';
  
/* ----------------------------------------------------------------------------
  ORNEK4: Ýsmi Ali Can ve id'si 123 olan kaydý siliniz.
 -----------------------------------------------------------------------------*/    
      
     DELETE FROM ogrenciler
     WHERE isim = 'Ali Can' AND id = 123;
   
/* ----------------------------------------------------------------------------
  ORNEK5: id 'si 126'dan büyük olan kayýtlarý silelim.
 -----------------------------------------------------------------------------*/  
  
    DELETE FROM ogrenciler
    WHERE id>126;
 
 /* ----------------------------------------------------------------------------
  ORNEK6: id'si 123, 125 ve 126 olanlarý silelim.
 -----------------------------------------------------------------------------*/     
    
    DELETE FROM ogrenciler
    WHERE id IN(123,125,126);
    
/* ----------------------------------------------------------------------------
  ORNEK7:  TABLODAKÝ TÜM KAYITLARI SÝLELÝM..
 -----------------------------------------------------------------------------*/     
    DELETE FROM ogrenciler; 
    
                    
/* ======================== DELETE - TRUCATE - DROP ============================   
    
    1-) TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamamýný siler.
    Ancak, seçmeli silme yapamaz. Çünkü Truncate komutu DML deðil DDL komutudur. 
    
    2-) DELETE komutu beraberinde WHERE cümleciði kullanýlabilir. TRUNCATE ile 
    kullanýlmaz.
    
    3-) Delete komutu ile silinen veriler ROLLBACK Komutu ile kolaylýkla geri 
    alýnabilir.
    
    4-) Truncate ile silinen veriler geri alýnmasý daha zordur. Ancak
    Transaction yöntemi ile geri alýnmasý mümkün olabilir.
    
    5-) DROP komutu da bir DDL komutudur. Ancak DROP veriler ile tabloyu da 
    siler. Silinen tablo Veritabanýnýn geri dönüþüm kutusuna gider. Silinen 
    tablo aþaðýdaki komut ile geri alýnabilir. Veya SQL GUI'den geri alýnabilir. 
        
     FLASHBACK TABLE tablo_adý TO BEFORE DROP;  -> tabloyu geri alýr.
     
     PURGE TABLE tablo_adý;        -> Geri dönüþümdeki tabloyu siler.
            
     DROP TABLE tablo_adý PURGE;  -> Tabloyu tamamen siler
==============================================================================*/ 
    DELETE FROM ogrenciler;  -- Tüm verileri sil.
    ROLLBACK;                -- Silinen Verileri geri getir.
    
        
    DROP TABLE ogrenciler;   -- Tabloyu siler ve Veritabanýnýn Çöp kutusuna 
                             -- gönderir. (DDL komutudur.)
    
    
    -- Çöp kutusundaki tabloyu geri getirir.
    FLASHBACK TABLE ogrenciler TO BEFORE DROP; 
         
    -- Tabloyu tamamen siler (Çöp kutusuna atmaz.)
    DROP TABLE ogrenciler PURGE;  
    
    -- Tüm veriler hassas bir þekilde siler.
    TRUNCATE TABLE ogrenciler; 
 
/* =============================================================================
    Tablolar arasýnda iliþki var ise veriler nasýl silinebilir?
============================================================================= */ 
    
         
/*============================== ON DELETE CASCADE =============================
  Her defasýnda önce child tablodaki verileri silmek yerine ON DELETE CASCADE
  silme özelliðini aktif hale getirebiliriz.
  
  Bunun için FK olan satýrýn en sonuna ON DELETE CASCADE komutunu yazmak yeterli
  
==============================================================================*/ 