CREATE DATABASE ZakladPogrzebowy;

USE ZakladPogrzebowy;

-- Utwórz tabele, które są odniesieniami dla kluczy obcych
CREATE TABLE klienci (
    id_klienta INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(255) NOT NULL,
    nazwisko VARCHAR(255) NOT NULL
);

CREATE TABLE trumny (
    id_trumny INT AUTO_INCREMENT PRIMARY KEY,
    rozmiar INT NOT NULL,
    cena DECIMAL(10, 2) NOT NULL,
    klasa VARCHAR(255) NOT NULL,
    material_wykonania VARCHAR(255) NOT NULL
);

CREATE TABLE pracownicy (
    id_pracownika INT AUTO_INCREMENT PRIMARY KEY,
    imie VARCHAR(255) NOT NULL,
    nazwisko VARCHAR(255) NOT NULL,
    pensja DECIMAL(10, 2) NOT NULL,
    stanowisko VARCHAR(255) NOT NULL
);

CREATE TABLE samochody (
    id_samochodu INT AUTO_INCREMENT PRIMARY KEY,
    marka VARCHAR(255) NOT NULL,
    rok_produkcji INT NOT NULL,
    typ VARCHAR(255) NOT NULL
);

CREATE TABLE typ (
    id_typ INT AUTO_INCREMENT PRIMARY KEY,
    typ VARCHAR(255) NOT NULL
);

CREATE TABLE nagrobki (
    id_nagrobka INT AUTO_INCREMENT PRIMARY KEY,
    id_typ INT NOT NULL,
    rozmiar INT NOT NULL,
    material VARCHAR(255) NOT NULL,
    klasa VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_typ) REFERENCES typ(id_typ)
);

CREATE TABLE dane_zm (
    id_zmarlego INT AUTO_INCREMENT PRIMARY KEY,
    imie_zm VARCHAR(255) NOT NULL,
    nazwisko_zm VARCHAR(255) NOT NULL,
    data_ur_zm DATE NOT NULL,
    data_sm_zm DATE NOT NULL
);

-- Tabela pogrzebów, z odpowiednimi kluczami obcymi
CREATE TABLE pogrzeb (
    id_pogrzebu INT AUTO_INCREMENT PRIMARY KEY,
    miejscowosc VARCHAR(255) NOT NULL,
    data_pogrzebu DATETIME NOT NULL,
    id_klienta INT NOT NULL,
    id_zmarlego INT NOT NULL,
    id_trumny INT NOT NULL,
    id_pracownika INT NOT NULL,
    id_samochodu INT NOT NULL,
    id_nagrobka INT,
    FOREIGN KEY (id_klienta) REFERENCES klienci(id_klienta),
    FOREIGN KEY (id_zmarlego) REFERENCES dane_zm(id_zmarlego),
    FOREIGN KEY (id_trumny) REFERENCES trumny(id_trumny),
    FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika),
    FOREIGN KEY (id_samochodu) REFERENCES samochody(id_samochodu),
    FOREIGN KEY (id_nagrobka) REFERENCES nagrobki(id_nagrobka)
);

-- Dodawanie rekordów do tabeli klienci
INSERT INTO klienci (imie, nazwisko) VALUES
('Jan', 'Kowalski'),
('Anna', 'Nowak'),
('Piotr', 'Wiśniewski'),
('Katarzyna', 'Kamińska'),
('Tomasz', 'Wójcik');

-- Dodawanie rekordów do tabeli pracownicy
INSERT INTO pracownicy (imie, nazwisko, pensja, stanowisko) VALUES
('Andrzej', 'Kowalczyk', 4500.00, 'Grabiarz'),
('Magdalena', 'Zielińska', 4800.00, 'Kierownik'),
('Michał', 'Szymański', 4000.00, 'Kierowca'),
('Monika', 'Lewandowska', 4600.00, 'Sekretarka'),
('Rafał', 'Mazur', 4200.00, 'Kamieniarz');

-- Dodawanie rekordów do tabeli samochody
INSERT INTO samochody (marka, rok_produkcji, typ) VALUES
('Ford', 2019, 'Karawan'),
('Mercedes', 2020, 'Karawan'),
('Volvo', 2018, 'Karawan'),
('Audi', 2017, 'Karawan'),
('BMW', 2021, 'Karawan');

-- Dodawanie rekordów do tabeli typ
INSERT INTO typ (typ) VALUES
('Granit'),
('Marmur'),
('Piaskowiec'),
('Beton'),
('Wapień');

-- Dodawanie rekordów do tabeli nagrobki
INSERT INTO nagrobki (id_typ, rozmiar, material, klasa) VALUES
(1, 120, 'Granit', 'Klasa A'),
(2, 130, 'Marmur', 'Klasa B'),
(3, 140, 'Piaskowiec', 'Klasa C'),
(4, 150, 'Beton', 'Klasa D'),
(5, 160, 'Wapień', 'Klasa E');

-- Dodawanie rekordów do tabeli dane_zm
INSERT INTO dane_zm (imie_zm, nazwisko_zm, data_ur_zm, data_sm_zm) VALUES
('Maria', 'Zawadzka', '1945-05-12', '2022-10-20'),
('Krzysztof', 'Lewicki', '1950-07-15', '2023-02-14'),
('Barbara', 'Zając', '1930-03-18', '2021-12-25'),
('Andrzej', 'Woźniak', '1965-06-28', '2023-01-01'),
('Agnieszka', 'Polak', '1970-04-21', '2022-07-30');

-- Dodawanie rekordów do tabeli trumny
INSERT INTO trumny (rozmiar, cena, klasa, material_wykonania) VALUES
(180, 2000.00, 'Klasa A', 'Drewno'),
(190, 2500.00, 'Klasa B', 'Metal'),
(200, 3000.00, 'Klasa C', 'Drewno'),
(210, 3500.00, 'Klasa D', 'Metal'),
(220, 4000.00, 'Klasa E', 'Drewno');

-- Dodawanie rekordów do tabeli pogrzeb
INSERT INTO pogrzeb (miejscowosc, data_pogrzebu, id_klienta, id_zmarlego, id_trumny, id_pracownika, id_samochodu, id_nagrobka) VALUES
('Warszawa', '2023-05-10 10:00:00', 1, 1, 1, 1, 1, 1),
('Kraków', '2023-06-15 12:00:00', 2, 2, 2, 2, 2, 2),
('Poznań', '2023-07-20 14:00:00', 3, 3, 3, 3, 3, 3),
('Gdańsk', '2023-08-25 16:00:00', 4, 4, 4, 4, 4, 4),
('Wrocław', '2023-09-30 18:00:00', 5, 5, 5, 5, 5, 5);
