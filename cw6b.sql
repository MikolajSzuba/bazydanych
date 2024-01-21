CREATE SCHEMA IF NOT EXISTS ksiegowosc;

CREATE TABLE IF NOT EXISTS ksiegowosc.pracownicy(
id_pracownika integer NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	imie text NOT NULL,
	nazwisko text NOT NULL,
	adres text NOT NULL,
	telefon text NOT NULL
);

CREATE TABLE IF NOT EXISTS ksiegowosc.godziny(
id_godziny int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	data date NOT NULL,
	liczba_godzin numeric(5,2) NOT NULL,
	id_pracownika integer NOT NULL,
	FOREIGN KEY (id_pracownika) REFERENCES ksiegowosc.pracownicy(id_pracownika)

);

CREATE TABLE IF NOT EXISTS ksiegowosc.pensje(
	id_pensji int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	stanowisko text NOT NULL,
	kwota numeric(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS ksiegowosc.premie(
  id_premii int  GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	rodzaj text,
	kwota numeric(10,2)

);
/* wynagrodzenie(id_wynagrodzenia, data, id_pracownika, id_godziny, id_pensji, id_premii)*/

CREATE TABLE IF NOT EXISTS ksiegowosc.wynagrodzenie(
id_wynagrodzenia int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	data date NOT NULL,
	id_pracownika int NOT NULL,
	FOREIGN KEY (id_pracownika) REFERENCES  ksiegowosc.pracownicy(id_pracownika),
id_godziny int NOT NULL,
	FOREIGN KEY(id_godziny) REFERENCES ksiegowosc.godziny(id_godziny),
	id_pensji int NOT NULL,
	FOREIGN KEY(id_pensji) REFERENCES ksiegowosc.pensje(id_pensji),
	id_premii int NOT NULL,
	FOREIGN KEY(id_premii) REFERENCES ksiegowosc.premie(id_premii)
); 

COMMENT ON TABLE ksiegowosc.pensje IS 'Tabela przechowująca informacje o pensjach na różnych stanowiskach';

COMMENT ON TABLE ksiegowosc.premie IS 'Tabela przechowująca informacje o przyznanych premiach';

COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Tabela przechowująca informacje o wynagrodzeniach pracowników';
COMMENT ON COLUMN ksiegowosc.wynagrodzenie.id_wynagrodzenia IS 'Unikalny identyfikator wynagrodzenia';
COMMENT ON COLUMN ksiegowosc.wynagrodzenie.data IS 'Data wynagrodzenia';
COMMENT ON COLUMN ksiegowosc.wynagrodzenie.id_pracownika IS 'ID pracownika, powiązanie z tabelą pracownicy';
COMMENT ON COLUMN ksiegowosc.wynagrodzenie.id_godziny IS 'ID godzin, powiązanie z tabelą godziny';
COMMENT ON COLUMN ksiegowosc.wynagrodzenie.id_pensji IS 'ID pensji, powiązanie z tabelą pensje';
COMMENT ON COLUMN ksiegowosc.wynagrodzenie.id_premii IS 'ID premii, powiązanie z tabelą premie';

/*
INSERT INTO ksiegowosc.pracownicy(imie, nazwisko, adres, telefon)
VALUES
('Mikołaj', 'Kowalski', 'ul. Kwiatowa 5', '123456789'),
('Krzysztof', 'Nowak', 'ul. Słoneczna 10', '987654321'),
('Tomasz', 'Wiśniewski', 'ul. Polna 15', '555123789'),
('Cristiano', 'Lewandowski', 'ul. Główna 20', '777888999'),
('Leo', 'Duda', 'ul. Wiejska 25', '333444555'),
('Roman', 'Jagiello', 'ul. Leśna 30', '111222333'),
('Stanisław', 'Wójcik', 'ul. Morska 35', '666999111'),
('Jacek', 'Placek', 'ul. Krótka 40', '888777666'),
('Wojciech', 'Jankowski', 'ul. Rycerska 45', '222333444'),
('Tadeusz', 'Kamiński', 'ul. Nowa 50', '999000111');
*/
/*
INSERT INTO rozliczenia.godziny( data, liczba_godzin, id_pracownika)
VALUES
 ('2021-08-01', 55, 1),
    ('2022-07-08', 68, 2),
    ('2022-06-17', 31, 3),
    ('2023-10-15', 56, 4),
    ('2023-09-16', 75, 5),
    ('2023-01-14', 43, 6),
    ('2021-02-21', 55, 7),
    ('2020-03-21', 65, 8),
    ('2021-04-09', 70, 9),
    ('2022-05-10', 37, 10);
*/
/*
INSERT INTO rozliczenia.pensje(stanowisko, kwota)
	VALUES
	 ('Szef', 20000.00),
    ('Asystent', 8000.00),
    ('Grafik', 6000.00),
    ('Asystent', 7000.00),
    ('Konsultant', 4500.00),
    ('Kierownik', 10000.00),
    ('Zastępca kierownika', 7500.00),
    ('Manager', 12000.00),
    ('Analityk finansowy', 7500.00),
    ('Kucharz', 5500.00);
	*/
	/*
INSERT INTO rozliczenia.premie(rodzaj, kwota)
	VALUES
	('Premia za rok', 4000.00),
	('Premia za miesiąc', 1000.00),
	('Premia za tydzień', 500.00),
	('Premia za rok', 7000.00),
	('Premia za rok', 6000.00),
	('Premia za tydzień', 400.00),
	('Premia za tydzień', 700.00),
	('Premia za miesiąc', 2000.00),
	('Premia za miesiąc', 1500.00),
	('Premia za rok',9000.00);*/
/*
INSERT INTO ksiegowosc.wynagrodzenie (data, id_pracownika, id_godziny, id_pensji, id_premii)
VALUES
('2020-03-15', 1, 1, 1, 1),
('2021-05-20', 2, 2, 2, 2),
('2022-08-11', 3, 3, 3, 3),
('2020-12-25', 4, 4, 4, 4),
('2023-02-05', 5, 5, 5, 5),
('2021-11-17', 6, 6, 6, 6),
('2022-07-08', 7, 7, 7, 7),
('2020-09-10', 8, 8, 8, 8),
('2023-01-30', 9, 9, 9, 9),
('2021-10-03', 10, 10, 10, 10);*/
/*
a) Wyświetl tylko id pracownika oraz jego nazwisko.
b) Wyświetl id pracowników, których płaca jest większa niż 1000.
c) Wyświetl id pracowników nieposiadających premii, których płaca jest większa niż 2000.
d) Wyświetl pracowników, których pierwsza litera imienia zaczyna się na literę ‘J’.
e) Wyświetl pracowników, których nazwisko zawiera literę ‘n’ oraz imię kończy się na literę ‘a’.
f) Wyświetl imię i nazwisko pracowników oraz liczbę ich nadgodzin, przyjmując, iż standardowy
czas pracy to 160 h miesięcznie.
g) Wyświetl imię i nazwisko pracowników, których pensja zawiera się w przedziale 1500 – 3000
PLN.
h) Wyświetl imię i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali
premii.
i) Uszereguj pracowników według pensji.
j) Uszereguj pracowników według pensji i premii malejąco.
k) Zlicz i pogrupuj pracowników według pola ‘stanowisko’.

l) Policz średnią, minimalną i maksymalną płacę dla stanowiska ‘kierownik’ (jeżeli takiego nie
masz, to przyjmij dowolne inne).
m) Policz sumę wszystkich wynagrodzeń.
n) Policz sumę wynagrodzeń w ramach danego stanowiska.
o) Wyznacz liczbę premii przyznanych dla pracowników danego stanowiska.
p) Usuń wszystkich pracowników mających pensję mniejszą niż 1200 zł
*/

/*a) Wyświetl tylko id pracownika oraz jego nazwisko.*/
SELECT id_pracownika, nazwisko
FROM ksiegowosc.pracownicy;

/*b) Wyświetl id pracowników, których płaca jest większa niż 1000.*/
SELECT ksiegowosc.wynagrodzenie.id_pracownika
FROM ksiegowosc.wynagrodzenie 
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii
GROUP BY wynagrodzenie.id_pracownika
HAVING SUM(pensje.kwota + premie.kwota) > 1000.00;

/*c) Wyświetl id pracowników nieposiadających premii, których płaca jest większa niż 2000.*/

SELECT id_pracownika
FROM ksiegowosc.wynagrodzenie
LEFT JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
WHERE premie.kwota = 0 AND pensje.kwota > 2000;

/* d) Wyświetl pracowników, których pierwsza litera imienia zaczyna się na literę ‘J’.*/

SELECT *
FROM ksiegowosc.pracownicy
WHERE imie LIKE 'J%';

/* e) Wyświetl pracowników, których nazwisko zawiera literę ‘n’ oraz imię kończy się na literę ‘a’.*/
SELECT * 
FROM ksiegowosc.pracownicy
WHERE imie LIKE '%a' AND nazwisko LIKE '%n%';

/* f) Wyświetl imię i nazwisko pracowników oraz liczbę ich nadgodzin, przyjmując, iż standardowy
czas pracy to 160 h miesięcznie.*/
SELECT imie, nazwisko, (liczba_godzin - 160) AS nadgodziny
FROM ksiegowosc.godziny
JOIN ksiegowosc.pracownicy ON godziny.id_pracownika = pracownicy.id_pracownika -- przypisuje poszczegolnym id z tabeli godziny.id do tabeli z pracowninycy id--
WHERE liczba_godzin > 160;

/* g) Wyświetl imię i nazwisko pracowników, których pensja zawiera się w przedziale 1500 – 3000
PLN.*/
SELECT imie, nazwisko
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
WHERE kwota >=1500 AND kwota <= 3000;


/* h) Wyświetl imię i nazwisko pracowników, którzy pracowali w nadgodzinach i nie otrzymali
premii.*/
SELECT imie, nazwisko
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.godziny ON wynagrodzenie.id_godziny = godziny.id_godziny
JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii
JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
WHERE godziny.liczba_godzin > 160 AND premie.kwota = 0;

/*i) Uszereguj pracowników według pensji.*/
SELECT * 
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
ORDER BY pensje.kwota DESC;

/* w tych laczeniach chodzi o to zeby za pomoca tej tabeli wynagrodzenie zrobic sobie polaczenia
czyli potrzebne w danej czesci polecenia to biore tabele co mam tą informacje i łącze z tabelka
wynagrodzenie.id_odpowiadajacaczesc ( to czego szukamy np pensje) i przypisujemy to do tej
tabelki z ktorej bierzemy czyli np pensje.id_pensji
i wtedy do tej kolumny id_pensji w tabeli wynagrodzenie przypisuje sie cala tabele pensje
dzieki temu mozemy uzywac kolumn z tabeli pensje za pomoca tabeli wynagrodzenie 
czyli jest polaczona */

/* DESC  - sortuje malejaco, ASC - rosnaco 

ORDER BY - sluzy do sortowania 
JOIN - laczenie tabel
JOIN nazwa tabeli ktora lacze ON kolumna z tabeli z ktorej laczymy = kolumna ta sama z tabeli tej przed ON */

/* j) Uszereguj pracowników według pensji i premii malejąco.*/

SELECT imie, nazwisko, (pensje.kwota + premie.kwota) AS wyplata
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii
ORDER BY (pensje.kwota + premie.kwota )DESC;


/* k) Zlicz i pogrupuj pracowników według pola ‘stanowisko’.*/
SELECT stanowisko, COUNT(*) AS liczba_pracownikow
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
GROUP BY stanowisko;

/* GROUP BY  - grupuje wedlug danych kryteriow
count(*) zlicza liczbe pracownikow*/

/* l) Policz średnią, minimalną i maksymalną płacę dla stanowiska ‘kierownik’ (jeżeli takiego nie
masz, to przyjmij dowolne inne).*/
SELECT stanowisko, AVG(kwota) AS srednia_pensja, MIN(kwota) AS minimalna_pensja, MAX(kwota) AS maksymalna_pensja
 FROM ksiegowosc.pensje
WHERE stanowisko = 'Kierownik'
GROUP BY stanowisko;

/* m) Policz sumę wszystkich wynagrodzeń.*/
SELECT SUM(pensje.kwota+ premie.kwota) AS suma_wynagrodzen
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii;

/* n) Policz sumę wynagrodzeń w ramach danego stanowiska.*/
SELECT stanowisko, SUM(pensje.kwota+ premie.kwota) AS suma_wynagrodzen
FROM ksiegowosc.wynagrodzenie
 JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
 JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii
GROUP BY stanowisko;

/* o) Wyznacz liczbę premii przyznanych dla pracowników danego stanowiska.*/
SELECT stanowisko, COUNT(id_premii) liczba_premii
FROM ksiegowosc.wynagrodzenie
 JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
GROUP BY stanowisko;

/* p) Usuń wszystkich pracowników mających pensję mniejszą niż 1200 zł
DELETE FROM ksiegowosc.pracownicy
WHERE id_pracownika IN (SELECT id_pracownika
					   FROM ksiegowosc.wynagrodzenie
					   JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
					   WHERE kwota < 1200);
*/
SELECT * FROM ksiegowosc.premie;



-- ćwiczenie 6b:



/* 
a) Zmodyfikuj numer telefonu w tabeli pracownicy, dodając do niego kierunkowy dla Polski
w nawiasie (+48)
*/

SELECT * FROM ksiegowosc.pracownicy;

/*UPDATE ksiegowosc.pracownicy
SET telefon = '(+48)' || telefon;
*/

SELECT * FROM ksiegowosc.pracownicy;

/*UPDATE ksiegowosc.pracownicy
SET telefon = REPLACE(telefon, '(+48)', '(+48) ');*/
SELECT * FROM ksiegowosc.pracownicy;

/*b) Zmodyfikuj atrybut telefon w tabeli pracownicy tak, aby numer oddzielony był myślnikami wg
wzoru: ‘555-222-333’
*/

/*
UPDATE ksiegowosc.pracownicy
SET telefon = CONCAT('(+48) ', SUBSTR(telefon, 1, 3), '-', SUBSTR(telefon, 4, 3), '-', SUBSTR(telefon, 7));
*/
/*SELECT * FROM ksiegowosc.pracownicy;
UPDATE ksiegowosc.pracownicy
SET telefon = REPLACE(telefon, '(+48) -', '(+48) ');
SELECT * FROM ksiegowosc.pracownicy;
*/

-- b) 
/*
UPDATE ksiegowosc.pracownicy
SET telefon = SUBSTRING(telefon FROM 1 FOR 3) || '-' || 
              SUBSTRING(telefon FROM 4 FOR 3) || '-' || 
              SUBSTRING(telefon FROM 7 FOR 3) || '-' || 
              SUBSTRING(telefon FROM 10 FOR 3); 
*/
 

/* 
c) Wyświetl dane pracownika, którego nazwisko jest najdłuższe, używając dużych liter
*/

SELECT id_pracownika, imie, nazwisko, adres, telefon, UPPER(nazwisko) AS "NAZWISKO"
FROM ksiegowosc.pracownicy
WHERE LENGTH(nazwisko) = (SELECT MAX(LENGTH(nazwisko)) FROM ksiegowosc.pracownicy);


/* 
d) Wyświetl dane pracowników i ich pensje zakodowane przy pomocy algorytmu md5
*/
SELECT MD5(CAST(ksiegowosc.pracownicy.imie AS TEXT) ||
      CAST(ksiegowosc.pracownicy.nazwisko AS TEXT) ||
      CAST(ksiegowosc.pracownicy.adres AS TEXT) ||
      CAST(ksiegowosc.pracownicy.telefon AS TEXT) ||
      CAST(ksiegowosc.pensje.kwota AS TEXT)) AS dane_md5
FROM ksiegowosc.pracownicy
JOIN ksiegowosc.wynagrodzenie ON ksiegowosc.pracownicy.id_pracownika = ksiegowosc.wynagrodzenie.id_pracownika
JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji;
  
/* 
f) Wyświetl pracowników, ich pensje oraz premie. Wykorzystaj złączenie lewostronne.
*/
SELECT  imie, nazwisko, pensje.kwota, premie.kwota
FROM ksiegowosc.wynagrodzenie
LEFT JOIN ksiegowosc.pracownicy ON wynagrodzenie.id_pracownika = pracownicy.id_pracownika
LEFT JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
LEFT JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii;

-- druga wersja 
SELECT  imie, nazwisko,adres, telefon, pensje.kwota AS pensja, premie.kwota AS premia
FROM ksiegowosc.pracownicy
LEFT JOIN ksiegowosc.wynagrodzenie ON pracownicy.id_pracownika = wynagrodzenie.id_pracownika
LEFT JOIN ksiegowosc.pensje ON wynagrodzenie.id_pensji = pensje.id_pensji
LEFT JOIN ksiegowosc.premie ON wynagrodzenie.id_premii = premie.id_premii;

-- jesli pracownik nie ma pensji lub premii to kolumny beda zwracaly null ale jego nazwisko sie pojawi 

/*
g) wygeneruj raport (zapytanie), które zwróci w wyniki treść wg poniższego szablonu:
Pracownik Jan Nowak, w dniu 7.08.2017 otrzymał pensję całkowitą na kwotę 7540 zł, gdzie
wynagrodzenie zasadnicze wynosiło: 5000 zł, premia: 2000 zł, nadgodziny: 540 zł
*/

SELECT
  'Pracownik ' || ksiegowosc.pracownicy.imie || ' ' || ksiegowosc.pracownicy.nazwisko ||
  ', w dniu ' || TO_CHAR(ksiegowosc.godziny.data, 'DD.MM.YYYY')  ||
  ' otrzymał pensję całkowitą na kwotę ' || ksiegowosc.pensje.kwota || ' zł, gdzie ' ||
  'wynagrodzenie zasadnicze wynosiło: ' || COALESCE(5000, 0) || ' zł, ' ||
  'premia: ' || COALESCE(ksiegowosc.premie.kwota, 0) || ' zł, ' ||
  'nadgodziny: ' || COALESCE(540, 0) || ' zł' AS raport
FROM ksiegowosc.wynagrodzenie
JOIN ksiegowosc.pracownicy ON ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
JOIN ksiegowosc.pensje ON ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensje.id_pensji
JOIN ksiegowosc.godziny ON ksiegowosc.wynagrodzenie.id_godziny = godziny.id_godziny
LEFT JOIN ksiegowosc.premie ON ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premie.id_premii
WHERE
  ksiegowosc.pracownicy.imie = 'Jan' AND ksiegowosc.pracownicy.nazwisko = 'Nowak' AND
  ksiegowosc.godziny.data = '2017-08-07' AND ksiegowosc.pensje.kwota = 7540 AND ksiegowosc.premie.kwota = 2000 ;


SELECT * FROM ksiegowosc.pracownicy;




