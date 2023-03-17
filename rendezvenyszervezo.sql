-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Már 17. 12:24
-- Kiszolgáló verziója: 10.4.6-MariaDB
-- PHP verzió: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `rendezvenyszervezo`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `jelszo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`id`, `nev`, `email`, `jelszo`) VALUES
(1, 'Kovács Ádám', 'kovacs.adam@example.com', 'jelszo123'),
(2, 'Nagy Péter', 'nagy.peter@example.com', 'abc123'),
(3, 'Kiss Gábor', 'kiss.gabor@example.com', 'password'),
(4, 'Szabó Béla', 'szabo.bela@example.com', '123456'),
(5, 'Horváth Zoltán', 'horvath.zoltan@example.com', 'qwerty');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `helyszinek`
--

CREATE TABLE `helyszinek` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `cim` varchar(255) NOT NULL,
  `varos` varchar(255) NOT NULL,
  `iranyitoszam` varchar(255) NOT NULL,
  `orszag` varchar(255) NOT NULL,
  `telefon` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `leiras` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `helyszinek`
--

INSERT INTO `helyszinek` (`id`, `nev`, `cim`, `varos`, `iranyitoszam`, `orszag`, `telefon`, `email`, `website`, `leiras`) VALUES
(1, 'Millenáris Park', 'Kis Rókus u. 16-20.', 'Budapest', '1024', 'Magyarország', '+3617896754', 'info@millenaris.hu', 'www.millenaris.hu', 'A Millenáris Park Budapest egyik legújabb kulturális és szórakoztató központja.'),
(2, 'Erzsébet Királyné Szálloda', 'Bathory u. 6.', 'Gödöll?', '2100', 'Magyarország', '+3628905678', 'info@erzsebetkiralynehotel.hu', 'www.erzsebetkiralynehotel.hu', 'Az Erzsébet Királyné Szálloda a történelmi Gödöll? városában, az egykori Grassalkovich-kastély szomszédságában található.'),
(3, 'Zemplén', 'Zemplén', '', '', 'Magyarország', '', '', '', 'A Zemplén hegység a Keleti-Kárpátokban, a Magyarország és Szlovákia határán fekszik.'),
(4, 'Hilton Hotel', 'Hess András tér 1-3.', 'Budapest', '1014', 'Magyarország', '+3618896700', 'info@hiltonbudapest.com', 'www.hiltonbudapest.com', 'Az elegáns Hilton Budapest történelmi épülete a budai Várnegyedben található.'),
(5, 'Vajdahunyad Vár', 'Vajdahunyad tér 1-3.', 'Budapest', '1146', 'Magyarország', '+3614220765', 'info@vajdahunyadvar.hu', 'www.vajdahunyadvar.hu', 'A Vajdahunyad Vár a budapesti Városligetben található, ?si magyar építészeti stílusokat bemutató múzeumként m?ködik.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendezvenyek`
--

CREATE TABLE `rendezvenyek` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `helyszin` varchar(255) NOT NULL,
  `datum` date NOT NULL,
  `rendezvenytipus_id` int(11) NOT NULL,
  `szervezo_id` int(11) DEFAULT NULL,
  `helyszin_id` int(11) DEFAULT NULL,
  `tipus_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `rendezvenyek`
--

INSERT INTO `rendezvenyek` (`id`, `nev`, `helyszin`, `datum`, `rendezvenytipus_id`, `szervezo_id`, `helyszin_id`, `tipus_id`) VALUES
(1, 'Konferencia a Millenáris Parkban', 'Millenáris Park', '2023-04-10', 0, NULL, NULL, NULL),
(2, 'Gála vacsora az Erzsébet Királyné Szállodában', 'Erzsébet Királyné Szálloda', '2023-05-20', 0, NULL, NULL, NULL),
(3, 'Csapatépít? tréning a Zemplénben', 'Zemplén', '2023-06-05', 0, NULL, NULL, NULL),
(4, 'Szállodai konferencia a Hilton Hotelben', 'Hilton Hotel', '2023-07-12', 0, NULL, NULL, NULL),
(5, 'Lakodalom a Vajdahunyad Várában', 'Vajdahunyad Vár', '2023-09-01', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendezvenyszponzorok`
--

CREATE TABLE `rendezvenyszponzorok` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `logo` longblob NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefonszam` varchar(255) NOT NULL,
  `szponzor_id` int(11) DEFAULT NULL,
  `rendezveny_id` int(11) DEFAULT NULL,
  `szolgaltato_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `rendezvenyszponzorok`
--

INSERT INTO `rendezvenyszponzorok` (`id`, `nev`, `logo`, `email`, `telefonszam`, `szponzor_id`, `rendezveny_id`, `szolgaltato_id`) VALUES
(1, 'Szálloda Lánc Kft.', '', 'info@szallodalanc.hu', '+36201234567', NULL, NULL, NULL),
(2, 'Gyémánt Ékszerek Kft.', '', 'info@gyemantekszer.hu', '+36203456789', NULL, NULL, NULL),
(3, 'Autókereskedés Kft.', '', 'info@autokereskedes.hu', '+36201234568', NULL, NULL, NULL),
(4, 'Bank Kft.', '', 'info@bank.hu', '+36203456790', NULL, NULL, NULL),
(5, 'Étterem Kft.', '', 'info@etterem.hu', '+36201234569', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendezvenytipusok`
--

CREATE TABLE `rendezvenytipusok` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `leiras` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `rendezvenytipusok`
--

INSERT INTO `rendezvenytipusok` (`id`, `nev`, `leiras`) VALUES
(1, 'Konferencia', 'Olyan rendezvény, amelyen a résztvev?k el?adásokat, beszélgetéseket, workshopokat, stb. hallgatnak.'),
(2, 'Gála vacsora', 'Formális vacsora, amelyen díjátadó ünnepségeket, táncos el?adásokat, stb. is tartanak.'),
(3, 'Szállodai konferencia', 'Konferencia, amelyet egy szálloda vagy konferenciaközpont szervez.'),
(4, 'Csapatépít? tréning', 'Olyan rendezvény, amelyen a résztvev?k csapatépít? játékokon, feladatokon és kihívásokon vesznek részt.'),
(5, 'Lakodalom', 'Esküv?i fogadás, amelyen az ifjú pár és a vendégek ünneplik a házasságkötést.');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `resztvevok`
--

CREATE TABLE `resztvevok` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `rendezveny_id` int(11) NOT NULL,
  `felhasznalo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `resztvevok`
--

INSERT INTO `resztvevok` (`id`, `nev`, `email`, `rendezveny_id`, `felhasznalo_id`) VALUES
(1, 'Kiss Katalin', 'kiss.katalin@example.com', 1, NULL),
(2, 'Nagy Béla', 'nagy.bela@example.com', 1, NULL),
(3, 'Kovács Gábor', 'kovacs.gabor@example.com', 2, NULL),
(4, 'Szabó Anna', 'szabo.anna@example.com', 2, NULL),
(5, 'Horváth Zsolt', 'horvath.zsolt@example.com', 3, NULL),
(6, 'Tóth Eszter', 'toth.eszter@example.com', 3, NULL),
(7, 'Varga László', 'varga.laszlo@example.com', 4, NULL),
(8, 'Kis Viktória', 'kis.viktoria@example.com', 4, NULL),
(9, 'Farkas Péter', 'farkas.peter@example.com', 5, NULL),
(10, 'Takács Zsuzsanna', 'takacs.zsuzsanna@example.com', 5, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szolgaltatok`
--

CREATE TABLE `szolgaltatok` (
  `id` int(11) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefonszam` varchar(255) NOT NULL,
  `szolgaltatasok` varchar(255) NOT NULL,
  `szolgaltato_id` int(11) DEFAULT NULL,
  `rendezveny_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- A tábla adatainak kiíratása `szolgaltatok`
--

INSERT INTO `szolgaltatok` (`id`, `nev`, `email`, `telefonszam`, `szolgaltatasok`, `szolgaltato_id`, `rendezveny_id`) VALUES
(1, 'Rendezvényhelyszín Kft.', 'info@rendezvenyhelyszin.hu', '+36201234567', 'Rendezvényhelyszínek bérlése', NULL, NULL),
(2, 'Catering Kft.', 'info@catering.hu', '+36203456789', 'Étel-ital szolgáltatások', NULL, NULL),
(3, 'Dekor Kft.', 'info@dekor.hu', '+36201234568', 'Dekoráció szolgáltatások', NULL, NULL),
(4, 'Fotó-Videó Kft.', 'info@foto-video.hu', '+36203456790', 'Fotó- és videófelvétel', NULL, NULL),
(5, 'Zenei szolgáltatások Kft.', 'info@zeneszolgaltatas.hu', '+36201234569', 'DJ szolgáltatások', NULL, NULL);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `helyszinek`
--
ALTER TABLE `helyszinek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `rendezvenyek`
--
ALTER TABLE `rendezvenyek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_szervezo_id` (`szervezo_id`),
  ADD KEY `fk_helyszin_id` (`helyszin_id`),
  ADD KEY `fk_tipus_id` (`tipus_id`);

--
-- A tábla indexei `rendezvenyszponzorok`
--
ALTER TABLE `rendezvenyszponzorok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_szponzor_id` (`szponzor_id`),
  ADD KEY `fk_rendezveny_id` (`rendezveny_id`);

--
-- A tábla indexei `rendezvenytipusok`
--
ALTER TABLE `rendezvenytipusok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `resztvevok`
--
ALTER TABLE `resztvevok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rendezveny_id` (`rendezveny_id`),
  ADD KEY `fk_felhasznalo_id` (`felhasznalo_id`);

--
-- A tábla indexei `szolgaltatok`
--
ALTER TABLE `szolgaltatok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_szolgaltato_id` (`szolgaltato_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `helyszinek`
--
ALTER TABLE `helyszinek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `rendezvenyek`
--
ALTER TABLE `rendezvenyek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `rendezvenyszponzorok`
--
ALTER TABLE `rendezvenyszponzorok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `rendezvenytipusok`
--
ALTER TABLE `rendezvenytipusok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `resztvevok`
--
ALTER TABLE `resztvevok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `szolgaltatok`
--
ALTER TABLE `szolgaltatok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `rendezvenyek`
--
ALTER TABLE `rendezvenyek`
  ADD CONSTRAINT `fk_helyszin_id` FOREIGN KEY (`helyszin_id`) REFERENCES `helyszinek` (`id`),
  ADD CONSTRAINT `fk_szervezo_id` FOREIGN KEY (`szervezo_id`) REFERENCES `felhasznalok` (`id`),
  ADD CONSTRAINT `fk_tipus_id` FOREIGN KEY (`tipus_id`) REFERENCES `rendezvenytipusok` (`id`);

--
-- Megkötések a táblához `rendezvenyszponzorok`
--
ALTER TABLE `rendezvenyszponzorok`
  ADD CONSTRAINT `fk_rendezveny_id` FOREIGN KEY (`rendezveny_id`) REFERENCES `rendezvenyek` (`id`),
  ADD CONSTRAINT `fk_szponzor_id` FOREIGN KEY (`szponzor_id`) REFERENCES `felhasznalok` (`id`);

--
-- Megkötések a táblához `resztvevok`
--
ALTER TABLE `resztvevok`
  ADD CONSTRAINT `fk_felhasznalo_id` FOREIGN KEY (`felhasznalo_id`) REFERENCES `felhasznalok` (`id`),
  ADD CONSTRAINT `resztvevok_ibfk_1` FOREIGN KEY (`rendezveny_id`) REFERENCES `rendezvenyek` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `resztvevok_ibfk_2` FOREIGN KEY (`rendezveny_id`) REFERENCES `rendezvenyek` (`id`),
  ADD CONSTRAINT `resztvevok_ibfk_3` FOREIGN KEY (`rendezveny_id`) REFERENCES `rendezvenyek` (`id`),
  ADD CONSTRAINT `resztvevok_ibfk_4` FOREIGN KEY (`rendezveny_id`) REFERENCES `rendezvenyek` (`id`);

--
-- Megkötések a táblához `szolgaltatok`
--
ALTER TABLE `szolgaltatok`
  ADD CONSTRAINT `fk_szolgaltato_id` FOREIGN KEY (`szolgaltato_id`) REFERENCES `felhasznalok` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
