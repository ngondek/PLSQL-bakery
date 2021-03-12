SET SERVEROUTPUT ON;

-- Wypisanie liczby zatrudnioncyh osob na podanym stanowisku

CREATE OR REPLACE PROCEDURE osobyNaStanowisku (st VARCHAR) AS
x INT;
BEGIN
    SELECT COUNT(*) liczba_pracownikow INTO x
    FROM pracownik
    WHERE stanowisko = st
    GROUP BY stanowisko ;
    dbms_output.put_line(' Liczba pracownikow na stanowisku ' || st || ' wynosi: ' || x );
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('Podane stanowisko nie istnieje');
END;

EXECUTE osobyNaStanowisku ('STARSZY SPRZEDAWCA' );

-- Wypisanie dla danej osoby liczby zlozonych zamowien

CREATE OR REPLACE PROCEDURE zamowieniaOsoby (im VARCHAR, naz VARCHAR) AS
x INT;
BEGIN
    SELECT COUNT(*) l_zamowien INTO x
    FROM Zamowienie
    WHERE id_osoba = (SELECT id_osoba FROM osoba WHERE imie = im AND nazwisko = naz)
    GROUP BY id_osoba;
    dbms_output.put_line('Liczba zamowien zlozonych przez ' || im || ' ' || naz || ' wynosi: ' || x );
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('Podana osoba nie istnieje w Zamowienia');
END;

--  Wyzwalacz, który przy wstawianiu lub modyfikowaniu danych w tabeli Pracownik sprawdzi czy nowe zarobki (wstawiane lub modyfikowane) s¹ wiêksze ni¿ 1000.
CREATE OR REPLACE TRIGGER triggerMinSal
BEFORE INSERT OR UPDATE
ON Pracownik
FOR EACH ROW
BEGIN
    IF :NEW.sal <= 1000 THEN
        raise_application_error(-20500, 'Zarobki ponizej 1000');
    END IF;
END;

-- Wyzwalacz, który nie pozwoli zmieniæ nazwiska pracownika

CREATE OR REPLACE TRIGGER triggerNameChange
BEFORE UPDATE
ON Pracownik
FOR EACH ROW
BEGIN
     IF :NEW.ename != :OLD.ename THEN
          raise_application_error(-20500, 'Nie mozna zmieniac nazwiska pracownika');
     END IF;
END;





