-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-01-17 19:09:09.394

-- foreign keys
ALTER TABLE Pracownik
    DROP CONSTRAINT Pracownik_Osoba;

ALTER TABLE Wyrob
    DROP CONSTRAINT Wyrob_Typ;

ALTER TABLE ZamowienieWyrob
    DROP CONSTRAINT ZamowienieWyrob_Wyrob;

ALTER TABLE ZamowienieWyrob
    DROP CONSTRAINT ZamowienieWyrob_Zamowienie;

ALTER TABLE Zamowienie
    DROP CONSTRAINT Zamowienie_Osoba;

ALTER TABLE Zamowienie
    DROP CONSTRAINT Zamowienie_Pracownik;

-- tables
DROP TABLE Osoba;

DROP TABLE Pracownik;

DROP TABLE Typ;

DROP TABLE Wyrob;

DROP TABLE Zamowienie;

DROP TABLE ZamowienieWyrob;

-- End of file.

