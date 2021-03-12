-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-01-17 19:09:09.394

-- tables
-- Table: Osoba
CREATE TABLE Osoba (
    id_osoba number(8,0)  NOT NULL,
    Imie varchar2(20)  NOT NULL,
    Nazwisko varchar2(20)  NOT NULL,
    CONSTRAINT Osoba_pk PRIMARY KEY (id_osoba)
) ;

-- Table: Pracownik
CREATE TABLE Pracownik (
    id_pracownik number(8,0)  NOT NULL,
    stanowisko varchar2(20)  NOT NULL,
    pensja number(8,0)  NOT NULL,
    data_zatrudnienia date  NOT NULL,
    CONSTRAINT Pracownik_pk PRIMARY KEY (id_pracownik)
) ;

-- Table: Typ
CREATE TABLE Typ (
    id_typ number(8,0)  NOT NULL,
    nazwa varchar2(20)  NOT NULL,
    CONSTRAINT Typ_pk PRIMARY KEY (id_typ)
) ;

-- Table: Wyrob
CREATE TABLE Wyrob (
    id_wyrob number(8,0)  NOT NULL,
    nazwa varchar2(10)  NOT NULL,
    cena number(8,0)  NOT NULL,
    id_typ number(8,0)  NOT NULL,
    CONSTRAINT Wyrob_pk PRIMARY KEY (id_wyrob)
) ;

-- Table: Zamowienie
CREATE TABLE Zamowienie (
    id_zamowienie number(8,0)  NOT NULL,
    data_zamownienia date  NOT NULL,
    id_osoba number(8,0)  NOT NULL,
    id_pracownik number(8,0)  NOT NULL,
    CONSTRAINT Zamowienie_pk PRIMARY KEY (id_zamowienie)
) ;

-- Table: ZamowienieWyrob
CREATE TABLE ZamowienieWyrob (
    id_zamowienie number(8,0)  NOT NULL,
    id_wyrob number(8,0)  NOT NULL,
    ilosc_wyrobu number(8,0)  NOT NULL,
    CONSTRAINT ZamowienieWyrob_pk PRIMARY KEY (id_zamowienie,id_wyrob)
) ;

-- foreign keys
-- Reference: Pracownik_Osoba (table: Pracownik)
ALTER TABLE Pracownik ADD CONSTRAINT Pracownik_Osoba
    FOREIGN KEY (id_pracownik)
    REFERENCES Osoba (id_osoba);

-- Reference: Wyrob_Typ (table: Wyrob)
ALTER TABLE Wyrob ADD CONSTRAINT Wyrob_Typ
    FOREIGN KEY (id_typ)
    REFERENCES Typ (id_typ);

-- Reference: ZamowienieWyrob_Wyrob (table: ZamowienieWyrob)
ALTER TABLE ZamowienieWyrob ADD CONSTRAINT ZamowienieWyrob_Wyrob
    FOREIGN KEY (id_wyrob)
    REFERENCES Wyrob (id_wyrob);

-- Reference: ZamowienieWyrob_Zamowienie (table: ZamowienieWyrob)
ALTER TABLE ZamowienieWyrob ADD CONSTRAINT ZamowienieWyrob_Zamowienie
    FOREIGN KEY (id_zamowienie)
    REFERENCES Zamowienie (id_zamowienie);

-- Reference: Zamowienie_Osoba (table: Zamowienie)
ALTER TABLE Zamowienie ADD CONSTRAINT Zamowienie_Osoba
    FOREIGN KEY (id_osoba)
    REFERENCES Osoba (id_osoba);

-- Reference: Zamowienie_Pracownik (table: Zamowienie)
ALTER TABLE Zamowienie ADD CONSTRAINT Zamowienie_Pracownik
    FOREIGN KEY (id_pracownik)
    REFERENCES Pracownik (id_pracownik);

-- End of file.

