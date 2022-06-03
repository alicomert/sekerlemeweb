-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 13 Nis 2022, 11:11:35
-- Sunucu sürümü: 8.0.17
-- PHP Sürümü: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `sekerleme`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ayarlar`
--

CREATE TABLE `ayarlar` (
  `id` int(11) NOT NULL,
  `kritik_miktar` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin5;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

CREATE TABLE `kategoriler` (
  `kategori_id` int(11) NOT NULL,
  `kategori_adi` varchar(100) CHARACTER SET latin5 COLLATE latin5_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin5;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`kategori_id`, `kategori_adi`) VALUES
(1, 'Baklava'),
(2, 'Çikolata'),
(3, 'Lokum');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparisdurum`
--

CREATE TABLE `siparisdurum` (
  `durum_id` int(11) NOT NULL,
  `durum_bilgi` varchar(30) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `siparisdurum`
--

INSERT INTO `siparisdurum` (`durum_id`, `durum_bilgi`) VALUES
(1, 'Siparis Alındı'),
(2, 'Siparis Hazırlanıyor'),
(3, 'Siparis Kargoda'),
(4, 'Siparis İptal Edildi');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparisler`
--

CREATE TABLE `siparisler` (
  `Siparis_id` int(11) NOT NULL,
  `musteriID` int(11) NOT NULL,
  `durumID` int(11) NOT NULL,
  `urun_id` int(11) NOT NULL,
  `miktar` double NOT NULL,
  `siparis_tarih` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `siparisler`
--

INSERT INTO `siparisler` (`Siparis_id`, `musteriID`, `durumID`, `urun_id`, `miktar`, `siparis_tarih`) VALUES
(1, 1, 3, 1, 3, '2022-04-13 10:12:02'),
(2, 1, 1, 2, 1, '2022-04-13 10:12:02'),
(3, 4, 3, 2, 20, '2022-04-13 10:12:02'),
(4, 1, 1, 1, 12, '2022-04-13 10:46:30'),
(5, 2, 2, 3, 12, '2022-04-13 10:46:56'),
(6, 1, 1, 5, 121212, '2022-04-13 10:47:15'),
(7, 25, 1, 3, 21, '2022-04-13 11:34:29'),
(9, 32, 1, 3, 32, '2022-04-13 11:57:25'),
(10, 32, 2, 3, 32, '2022-04-13 11:57:35'),
(12, 33, 1, 2, 5, '2022-04-13 13:25:25');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `stoklog`
--

CREATE TABLE `stoklog` (
  `stoklog_id` int(11) NOT NULL,
  `urun_adi` varchar(50) NOT NULL,
  `urun_adeti` double NOT NULL,
  `stok_log` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Tablo döküm verisi `stoklog`
--

INSERT INTO `stoklog` (`stoklog_id`, `urun_adi`, `urun_adeti`, `stok_log`) VALUES
(2, 'Güllü Lokum', 12, 'Eklendi'),
(3, 'Antep Fıstıklı Baklava', 23, 'Ürün Kaldırıldı'),
(4, 'Fındıklı Lokum', 4, 'Satıldı'),
(5, 'Triliçe', 23, 'Ürün Kaldırıldı');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunler`
--

CREATE TABLE `urunler` (
  `urun_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `urun_adi` varchar(255) NOT NULL,
  `urun_resmi` varchar(255) NOT NULL,
  `urun_fiyat` double NOT NULL,
  `urun_adet` double NOT NULL,
  `aktifPasif` char(1) NOT NULL DEFAULT '0',
  `tarih` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin5;

--
-- Tablo döküm verisi `urunler`
--

INSERT INTO `urunler` (`urun_id`, `kategori_id`, `urun_adi`, `urun_resmi`, `urun_fiyat`, `urun_adet`, `aktifPasif`, `tarih`) VALUES
(2, 1, 'Sütlü Çikolata', 'dddddd.jpg', 45, 5, '1', '2022-04-13 11:32:44'),
(3, 1, 'Cevizli', 'baklava.png', 100, 23, '1', '2022-04-13 11:32:44'),
(4, 3, 'Fıstıklı Lokum', '1111.jpg', 55, 80, '1', '2022-04-13 11:32:44'),
(5, 3, 'Limonlu Lokum', 'ı05.jpg', 32, 59, '1', '2022-04-13 11:32:44'),
(6, 3, 'Antep Fıstıklı Lokum', 'lokum.jpg', 60, 35, '1', '2022-04-13 11:32:44'),
(8, 1, 'Fıstıklı Lokum', '10.jpg', 65, 9, '1', '2022-04-13 11:32:44'),
(10, 3, 'Fıstıklı Lokum', 'lokum.jpg', 30, 40, '0', '2022-04-13 11:32:44'),
(12, 1, 'Cevizli Baklava', 'ı34.jpg', 100, 20, '1', '2022-04-13 11:32:44'),
(19, 1, 'Antep Fıstıklı Baklava5', 'ì34.jpg', 120, 42, '0', '2022-04-13 13:58:59');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uyetakip`
--

CREATE TABLE `uyetakip` (
  `uyeid` int(11) NOT NULL,
  `adi` varchar(50) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `soyadi` varchar(50) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `yas` int(11) DEFAULT NULL,
  `eposta` varchar(50) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `il` varchar(100) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `ilce` varchar(100) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `sifre` varchar(50) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `adres` text CHARACTER SET utf8 COLLATE utf8_turkish_ci,
  `uye_durumu` varchar(50) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `uyetakip`
--

INSERT INTO `uyetakip` (`uyeid`, `adi`, `soyadi`, `yas`, `eposta`, `il`, `ilce`, `sifre`, `adres`, `uye_durumu`) VALUES
(32, 'Nurhak', 'Keskin', 21, 'nurhak@gmail.com', 'ÇANAKKALE', 'AYVACIK', NULL, 'Tenekeciler          \r\n     ', 'Aktif'),
(33, 'Batuhan', 'Kılıç', 22, 'batuhan@gmail.com', 'HATAY', 'İSKENDERUN', NULL, 'Harbiye\r\n     ', 'Aktif'),
(34, 'Ali', 'Cömert', 22, 'alicmrt648@gmail.com', 'BALIKESİR', 'BURHANİYE', NULL, '      Defne Mahallesi \r\n     ', 'Aktif');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yoneticiler`
--

CREATE TABLE `yoneticiler` (
  `id` int(11) NOT NULL,
  `kullaniciAdi` varchar(100) NOT NULL,
  `sifre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin5;

--
-- Tablo döküm verisi `yoneticiler`
--

INSERT INTO `yoneticiler` (`id`, `kullaniciAdi`, `sifre`) VALUES
(1, 'root', '123');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `ayarlar`
--
ALTER TABLE `ayarlar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Tablo için indeksler `siparisdurum`
--
ALTER TABLE `siparisdurum`
  ADD PRIMARY KEY (`durum_id`);

--
-- Tablo için indeksler `siparisler`
--
ALTER TABLE `siparisler`
  ADD PRIMARY KEY (`Siparis_id`),
  ADD KEY `durumID` (`durumID`),
  ADD KEY `musteriID` (`musteriID`),
  ADD KEY `urun_id` (`urun_id`);

--
-- Tablo için indeksler `stoklog`
--
ALTER TABLE `stoklog`
  ADD PRIMARY KEY (`stoklog_id`),
  ADD KEY `urun_id` (`urun_adi`),
  ADD KEY `urun_adeti` (`urun_adeti`);

--
-- Tablo için indeksler `urunler`
--
ALTER TABLE `urunler`
  ADD PRIMARY KEY (`urun_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Tablo için indeksler `uyetakip`
--
ALTER TABLE `uyetakip`
  ADD PRIMARY KEY (`uyeid`);

--
-- Tablo için indeksler `yoneticiler`
--
ALTER TABLE `yoneticiler`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `ayarlar`
--
ALTER TABLE `ayarlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `siparisdurum`
--
ALTER TABLE `siparisdurum`
  MODIFY `durum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `siparisler`
--
ALTER TABLE `siparisler`
  MODIFY `Siparis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `urunler`
--
ALTER TABLE `urunler`
  MODIFY `urun_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Tablo için AUTO_INCREMENT değeri `uyetakip`
--
ALTER TABLE `uyetakip`
  MODIFY `uyeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Tablo için AUTO_INCREMENT değeri `yoneticiler`
--
ALTER TABLE `yoneticiler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `urunler`
--
ALTER TABLE `urunler`
  ADD CONSTRAINT `urunler_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategoriler` (`kategori_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
