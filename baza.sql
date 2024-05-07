CREATE database ZakladPogrzebowy;
USE ZakladPogrzebowy;

CREATE TABLE pogrzeb (
    id_pogrzebu integer auto_increment PRIMARY KEY,
    miejscowość varchar not null,
    data_pogrzebu datetime not null,
    id_klienta integer not null,
    id_zmarlego integer not null,
    id_trumny integer not null,
    id_pracownika integer not null,
    id_samochodu integer not null,
    id_nagrobka integer
    FOREIGN KEY (id_klienta) REFERENCES klienci(id_klienta)
    FOREIGN KEY (id_zmarlego) REFERENCES dane_zm(id_zmarlego)
    FOREIGN KEY (id_trumny) REFERENCES trumny(id_trumny)
    FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika)
    FOREIGN KEY (id_samochodu) REFERENCES samochody(id_samochodu)
    FOREIGN KEY (id_nagrobka) REFERENCES nagrobki(id_nagrobka)

)

CREATE TABLE klienci (
    id_klienta integer auto_increment PRIMARY KEY,
    imie varchar not null,
    nazwisko varchar not null
)

CREATE TABLE trumny (
    id_trumny integer auto_increment PRIMARY KEY,
    rozmiar integer not null,
    cena money not null,
    klasa varchar not null,
    material_wykonania varchar not null
)

CREATE TABLE pracownicy (
    id_pracownika integer auto_increment PRIMARY KEY,
    imie varchar not null,
    nazwisko varchar not null,
    pensja money not null,
    stanowisko varchar not null
)

CREATE TABLE samochody (
    id_samochodu integer auto_increment PRIMARY KEY,
    marka varchar not null,
    rok_produkcji integer not null,
    typ varchar not null
)

CREATE TABLE nagrobki (
    id_nagrobka integer auto_increment PRIMARY KEY,
    id_typ integer not null,
    rozmiar integer not null,
    material varchar not null,
    klasa varchar not null
    FOREIGN KEY (id_typ) REFERENCES typ(id_typ)
)

CREATE TABLE dane_zm (
    id_zmarlego integer auto_increment PRIMARY KEY,
    imie_zm varchar not null,
    nazwisko_zm varchar not null,
    data_ur_zm date not null,
    data_sm_zm date not null
)

CREATE TABLE typ (
    id_typ integer auto_increment PRIMARY KEY,
    typ varchar not null
)