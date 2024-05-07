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
