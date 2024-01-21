/*
CREATE DATABASE firma;

CREATE SCHEMA rozliczenia;
*/

/* KREOWANIE TABEL */

CREATE TABLE IF NOT EXISTS rozliczenia.pracownicy (
	id_pracownika INT NOT NULL PRIMARY KEY,
	imie VARCHAR(30),
	nazwisko VARCHAR(30),
	adres VARCHAR(100),
	telefon INT
);

CREATE TABLE IF NOT EXISTS rozliczenia.godziny (
	id_godziny INT NOT NULL PRIMARY KEY , 
	data_ DATE, 
	liczba_godzin INT, 
	id_pracownika INT NOT NULL
);

CREATE TABLE IF NOT EXISTS rozliczenia.pensje (
	id_pensji INT NOT NULL PRIMARY KEY ,
	stanowisko VARCHAR(60),
	kwota INT,
	id_premii INT NOT NULL
);

CREATE TABLE IF NOT EXISTS rozliczenia.premie (
	id_premii INT NOT NULL PRIMARY KEY ,
	rodzaj VARCHAR(30),
	kwota INT
);

/* DODAWANIE FOREIGN KEY'OW */

ALTER TABLE rozliczenia.godziny ADD
FOREIGN KEY (id_pracownika) REFERENCES rozliczenia.pracownicy(id_pracownika);

ALTER TABLE rozliczenia.pensje ADD
FOREIGN KEY (id_premii) REFERENCES rozliczenia.premie(id_premii);

/* DODAWANIE REKORDOW */
/* DODAWANIE PRACOWNIKOW */

INSERT INTO rozliczenia.pracownicy ( id_pracownika, imie, nazwisko, adres, telefon ) 
VALUES 
( 1, 'Andrzej', 'Stanowski', 'Kraków', 317836342 ),
( 2, 'Kamil', 'Ślimak', 'Warszawa', 786065100 ),
( 3, 'Piotr', 'Źięba', 'Pcim', 325793975 ),
( 4, 'Krzysztof', 'Włodarczyk', 'Chełm', 648635681 ),
( 5, 'Filip', 'Cichoń', 'Nowy Jork', 281849184 ),
( 6, 'Dawid', 'Łętocha', 'Los Angeles', 153073721 ),
( 7, 'Filip', 'Paruch', 'Myślenice', 555689162 ),
( 8, 'Szymon', 'Proszek', 'Zasań', 43713791 ),
( 9, 'Iza', 'Olszewska', 'Tokarnia', 777145294 ),
( 10, 'Bogumiła', 'Olszewska', 'Zasań', 950198293 );

/* DODAWANIE GODZIN */

INSERT INTO rozliczenia.godziny ( id_godziny, data_, liczba_godzin, id_pracownika) 
VALUES
( 1, '2023-05-12', 30, 1 ),
( 2, '2023-05-13', 31, 2 ),
( 3, '2023-05-14', 29, 3 ),
( 4, '2023-05-15', 32, 4 ),
( 5, '2023-05-16', 28, 5 ),
( 6, '2023-05-17', 33, 6 ),
( 7, '2023-05-18', 27, 7 ),
( 8, '2023-05-19', 34, 8 ),
( 9, '2023-05-20', 26, 9 ),
( 10, '2023-05-21', 35, 10 );

INSERT INTO rozliczenia.premie (id_premii, rodzaj, kwota) 
VALUES
( 1, 'intern_half', 300 ),
( 2, 'intern_year', 500 ),
( 3, 'data engineer_year', 500 ),
( 4, 'software manager_year', 500 ),
( 5, 'dev ops_year', 500 ),
( 6, 'social media_year', 200 ),
( 7, 'hr_year', 300 ),
( 8, 'ceo_year', 0 ),
( 9, 'manager_year', 200 ),
( 10, 'group manager_year', 300 );
 
INSERT INTO rozliczenia.pensje ( id_pensji, stanowisko, kwota, id_premii) 
VALUES
( 1, 'intern', 6000, 1 ),
( 2, 'intern', 6000, 2 ),
( 3, 'data engineer', 20000, 3 ),
( 4, 'software manager', 17500, 4 ),
( 5, 'dev ops', 25000, 5 ),
( 6, 'social media', 10000, 6 ),
( 7, 'hr', 12000, 7 ),
( 8, 'ceo', 40000, 8 ),
( 9, 'manager', 15000, 9 ),
( 10, 'group manager', 18000, 10 );
