-- TABLO 1 HASTANELER ISIMLI TABLO OLUSTUR
    CREATE TABLE hastaneler
    (
    hastane_id VARCHAR2(4),
    hastane_isim VARCHAR2(20),
    hastane_sehir VARCHAR2(13),
    ozel_hastane CHAR(1),
    CONSTRAINT pk_hastane_id PRIMARY KEY(hastane_id)
    );
    
    INSERT INTO hastaneler VALUES('H101', 'ACI MADEM HASTANESI', 'ISTANBUL', 'Y');
    INSERT INTO hastaneler VALUES('H102', 'HASZEKI HASTANESI', 'ISTANBUL', 'N');
    INSERT INTO hastaneler VALUES('H103', 'MEDIKOL HASTANESI', 'IZMIR', 'Y');
    INSERT INTO hastaneler VALUES('H104', 'NEMORYIL HASTANESI', 'ANKARA', 'Y');
    
    SELECT * FROM hastaneler;
    
-- TABLO 2 HASTALAR ISIMLI TABLO OLUSTUR    
    CREATE TABLE hastalar
    (
    hasta_kimlik_no VARCHAR2(11),
    hasta_isim VARCHAR(20),
    hasta_teshis VARCHAR2(15),
    CONSTRAINT pk_hasta_tc PRIMARY KEY(hasta_kimlik_no)
    );
    
    INSERT INTO hastalar VALUES('12345678901', 'Ali Can', 'Gizli seker');
    INSERT INTO hastalar VALUES('45678901121', 'Ayse Yilmaz', 'Hipertansiyon');
    INSERT INTO hastalar VALUES('78901123451', 'Steve Job', 'Pankreatit');
    INSERT INTO hastalar VALUES('12344321251', 'Tom Hanks', 'Covid19');
    
    SELECT * FROM hastalar;
    
-- TABLO 3 BOLUMLER ISIMLI TABLO OLUSTUR
    CREATE TABLE bolumler
    (
    bolum_id VARCHAR2(4),
    bolum_isim VARCHAR(20),
    CONSTRAINT pk_bolum_id PRIMARY KEY(bolum_id)
    );
    
    INSERT INTO bolumler VALUES('DHL', 'Dahiliye');
    INSERT INTO bolumler VALUES('KBB', 'Kulak-Burun-Bogaz');
    INSERT INTO bolumler VALUES('NRJ', 'Noroloji');
    INSERT INTO bolumler VALUES('GAST', 'Gastroloji');
    INSERT INTO bolumler VALUES('KARD', 'Kardioloji');
    INSERT INTO bolumler VALUES('PSK', 'Psikiyatri');
    INSERT INTO bolumler VALUES('GOZ', 'Goz Hastaliklari');
    
    SELECT * FROM bolumler;
    
-- TABLO 4
    CREATE TABLE hasta_kayitlar
    (
    kimlik_no VARCHAR2(11),
    hasta_adi VARCHAR(20),
    hastane_adi VARCHAR2(20),
    bolum_adi VARCHAR2(20),
    teshis VARCHAR2(20),
    CONSTRAINT pk_kimlik_no PRIMARY KEY(kimlik_no)
    );
    
    INSERT INTO hasta_kayitlar(kimlik_no, hasta_adi) VALUES('1111', 'NONAME');
    INSERT INTO hasta_kayitlar(kimlik_no, hasta_adi) VALUES('2222', 'NONAME');
    INSERT INTO hasta_kayitlar(kimlik_no, hasta_adi) VALUES('3333', 'NONAME');
    
    SELECT * FROM hasta_kayýtlar;

--KAYIT_ID 3333 OLAN HASTAYI GUNCELLEME
    UPDATE hasta_kayitlar
    SET hasta_adý = 'Salvadore Dali',
    hastane_adi = 'John Hopins',
    bolum_adi = 'Noroloji',
    teshis = 'Parkinson',
    kimlik_no = '99991111222'
    WHERE kimlik_no = '3333';
    
-- KAYIT_ID 1111 OLAN HASTAYI GUNCELLEME
    UPDATE hasta_kayitlar
    SET hasta_adý = (SELECT hasta_isim FROM hastalar
                   WHERE hasta_isim = 'Ali Can'),
    hastane_adi = (SELECT hastane_isim FROM hastaneler
                    WHERE hastane_id = 'H104'),
    bolum_adi = (SELECT bolum_isim FROM bolumler
                    WHERE bolum_id = 'DHL'),
    teshis = (SELECT hasta_teshis FROM hastalar
                    WHERE hasta_isim = 'Ali Can'),
    kimlik_no = (SELECT hasta_kimlik_no FROM hastalar
                    WHERE hasta_isim = 'Ali Can')
    WHERE kimlik_no = '1111';
    
-- KAYIT_ID 2222 OLAN HASTAYI GUNCELLEME
    UPDATE hasta_kayitlar
    SET hasta_adý = (SELECT hasta_isim FROM hastalar
                   WHERE hasta_isim = 'Ayse Yilmaz'),
    hastane_adi = (SELECT hastane_isim FROM hastaneler
                    WHERE hastane_id = 'H103'),
    bolum_adi = (SELECT bolum_isim FROM bolumler
                    WHERE bolum_id = 'KBB'),
    teshis = (SELECT hasta_teshis FROM hastalar
                    WHERE hasta_isim = 'Tom Hanks'),
    kimlik_no = (SELECT hasta_kimlik_no FROM hastalar
                    WHERE hasta_isim = 'Steve Job')
    WHERE kimlik_no = '2222';
    
    SELECT * FROM hasta_kayitlar;