/* ============================== DELETE ===================================  */

    -- DELETE FROM tablo_ad�;  Tablonun t�m i�er�ini siler.
    -- Bu komut bir DML komutudur. Dolay�s�yla devam�nda WHERE gibi c�mlecikler
    -- kullan�labilir.
    
    
    -- DELETE FROM tablo_ad�
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
         Se�erek silmek i�in WHERE Anahtar kelimesi kullan�labilir. 
===============================================================================*/     

/* -----------------------------------------------------------------------------
  ORNEK1: id'si 124 olan ogrenciyi siliniz.
 -----------------------------------------------------------------------------*/ 
  
      DELETE FROM ogrenciler
      WHERE id = 124;
    
/* -----------------------------------------------------------------------------
  ORNEK2: ismi Kemal Yasa olan sat�r�n� siliniz.
 -----------------------------------------------------------------------------*/   
     
      DELETE FROM ogrenciler
      WHERE isim = 'Kemal Yasa';
      
/* -----------------------------------------------------------------------------
  ORNEK3: ismi Nesibe Yilmaz ve Mustafa Bak olan kay�tlar� silelim.
 -----------------------------------------------------------------------------*/        
      DELETE FROM ogrenciler
      WHERE isim = 'Nesibe Yilmaz' OR isim = 'Mustafa Bak';
  
/* ----------------------------------------------------------------------------
  ORNEK4: �smi Ali Can ve id'si 123 olan kayd� siliniz.
 -----------------------------------------------------------------------------*/    
      
     DELETE FROM ogrenciler
     WHERE isim = 'Ali Can' AND id = 123;
   
/* ----------------------------------------------------------------------------
  ORNEK5: id 'si 126'dan b�y�k olan kay�tlar� silelim.
 -----------------------------------------------------------------------------*/  
  
    DELETE FROM ogrenciler
    WHERE id>126;
 
 /* ----------------------------------------------------------------------------
  ORNEK6: id'si 123, 125 ve 126 olanlar� silelim.
 -----------------------------------------------------------------------------*/     
    
    DELETE FROM ogrenciler
    WHERE id IN(123,125,126);
    
/* ----------------------------------------------------------------------------
  ORNEK7:  TABLODAK� T�M KAYITLARI S�LEL�M..
 -----------------------------------------------------------------------------*/     
    DELETE FROM ogrenciler; 
    
                    
/* ======================== DELETE - TRUCATE - DROP ============================   
    
    1-) TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamam�n� siler.
    Ancak, se�meli silme yapamaz. ��nk� Truncate komutu DML de�il DDL komutudur. 
    
    2-) DELETE komutu beraberinde WHERE c�mleci�i kullan�labilir. TRUNCATE ile 
    kullan�lmaz.
    
    3-) Delete komutu ile silinen veriler ROLLBACK Komutu ile kolayl�kla geri 
    al�nabilir.
    
    4-) Truncate ile silinen veriler geri al�nmas� daha zordur. Ancak
    Transaction y�ntemi ile geri al�nmas� m�mk�n olabilir.
    
    5-) DROP komutu da bir DDL komutudur. Ancak DROP veriler ile tabloyu da 
    siler. Silinen tablo Veritaban�n�n geri d�n���m kutusuna gider. Silinen 
    tablo a�a��daki komut ile geri al�nabilir. Veya SQL GUI'den geri al�nabilir. 
        
     FLASHBACK TABLE tablo_ad� TO BEFORE DROP;  -> tabloyu geri al�r.
     
     PURGE TABLE tablo_ad�;        -> Geri d�n���mdeki tabloyu siler.
            
     DROP TABLE tablo_ad� PURGE;  -> Tabloyu tamamen siler
==============================================================================*/ 
    DELETE FROM ogrenciler;  -- T�m verileri sil.
    ROLLBACK;                -- Silinen Verileri geri getir.
    
        
    DROP TABLE ogrenciler;   -- Tabloyu siler ve Veritaban�n�n ��p kutusuna 
                             -- g�nderir. (DDL komutudur.)
    
    
    -- ��p kutusundaki tabloyu geri getirir.
    FLASHBACK TABLE ogrenciler TO BEFORE DROP; 
         
    -- Tabloyu tamamen siler (��p kutusuna atmaz.)
    DROP TABLE ogrenciler PURGE;  
    
    -- T�m veriler hassas bir �ekilde siler.
    TRUNCATE TABLE ogrenciler; 
 
/* =============================================================================
    Tablolar aras�nda ili�ki var ise veriler nas�l silinebilir?
============================================================================= */ 
    
         
/*============================== ON DELETE CASCADE =============================
  Her defas�nda �nce child tablodaki verileri silmek yerine ON DELETE CASCADE
  silme �zelli�ini aktif hale getirebiliriz.
  
  Bunun i�in FK olan sat�r�n en sonuna ON DELETE CASCADE komutunu yazmak yeterli
  
==============================================================================*/ 