-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2023 at 05:32 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumah_sakit_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_dokter`
--

CREATE TABLE `data_dokter` (
  `id_dokter` varchar(25) NOT NULL,
  `kode_pasien` varchar(25) NOT NULL,
  `kode_pemeriksaan` varchar(25) NOT NULL,
  `kode_poliklinik` varchar(25) NOT NULL,
  `kode_perawatan` varchar(25) NOT NULL,
  `Nama_Dokter` varchar(45) NOT NULL,
  `Spesialis` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_jadwal`
--

CREATE TABLE `data_jadwal` (
  `kode_jadwal` varchar(25) NOT NULL,
  `id_dokter` varchar(25) NOT NULL,
  `hari` date NOT NULL,
  `jam_mulai` time(6) NOT NULL,
  `jam_selesai` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_jenis_kamar`
--

CREATE TABLE `data_jenis_kamar` (
  `jenis_kamar` varchar(25) NOT NULL,
  `nama_kamar` varchar(25) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_jenis_perawatan`
--

CREATE TABLE `data_jenis_perawatan` (
  `kode_perawatan` varchar(25) NOT NULL,
  `Nama_perawatan` varchar(25) NOT NULL,
  `Jenis_perawatan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_kamar`
--

CREATE TABLE `data_kamar` (
  `kode_kamar` varchar(25) NOT NULL,
  `jenis_kamar` varchar(25) NOT NULL,
  `Tarif_layanan` int(100) NOT NULL,
  `Fasilitas` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_obat`
--

CREATE TABLE `data_obat` (
  `kode_obat` varchar(25) NOT NULL,
  `Nama_Obat` varchar(25) NOT NULL,
  `harga` int(100) NOT NULL,
  `stock` varchar(25) NOT NULL,
  `Keterangan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_pasien`
--

CREATE TABLE `data_pasien` (
  `kode_pasien` varchar(25) NOT NULL,
  `jenis_kamar` varchar(25) NOT NULL,
  `Nama_pasien` varchar(40) NOT NULL,
  `Alamat_Pasien` varchar(45) NOT NULL,
  `Umur_pasien` varchar(10) NOT NULL,
  `Jenis_kelamin` varchar(25) NOT NULL,
  `gol_darah` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_pegawai`
--

CREATE TABLE `data_pegawai` (
  `id_pegawai` varchar(25) NOT NULL,
  `kode_jadwal` varchar(25) NOT NULL,
  `id_dokter` varchar(25) NOT NULL,
  `nama_pegawai` varchar(25) NOT NULL,
  `Alamat_pegawai` varchar(25) NOT NULL,
  `telp_pegawai` varchar(25) NOT NULL,
  `ttl_pegawai` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_pembayaran`
--

CREATE TABLE `data_pembayaran` (
  `id_pembayaran` varchar(25) NOT NULL,
  `kode_pasien` varchar(25) NOT NULL,
  `kode_obat` varchar(25) NOT NULL,
  `Jumlah_bayar` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_pemeriksaaan`
--

CREATE TABLE `data_pemeriksaaan` (
  `kode_pemeriksaan` varchar(25) NOT NULL,
  `kode_obat` varchar(25) NOT NULL,
  `id_pembayaran` varchar(25) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `Keluhan` text NOT NULL,
  `Keterangan` varchar(25) NOT NULL,
  `Biaya_pemeriksaan` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_pengguna`
--

CREATE TABLE `data_pengguna` (
  `id_pengguna` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` int(11) NOT NULL,
  `id_pegawai` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_poliklinik`
--

CREATE TABLE `data_poliklinik` (
  `kode_poliklinik` varchar(25) NOT NULL,
  `nama_poli` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data_tenaga_medis`
--

CREATE TABLE `data_tenaga_medis` (
  `id_tenagamedis` varchar(25) NOT NULL,
  `kode_kamar` varchar(25) NOT NULL,
  `kode_obat` varchar(25) NOT NULL,
  `Nama_Tenagamedis` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_dokter`
--
ALTER TABLE `data_dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD UNIQUE KEY `kode_pasien` (`kode_pasien`),
  ADD UNIQUE KEY `kode_pemeriksaan` (`kode_pemeriksaan`),
  ADD UNIQUE KEY `kode_poliklinik` (`kode_poliklinik`),
  ADD UNIQUE KEY `kode_perawatan` (`kode_perawatan`);

--
-- Indexes for table `data_jadwal`
--
ALTER TABLE `data_jadwal`
  ADD PRIMARY KEY (`kode_jadwal`),
  ADD UNIQUE KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `data_jenis_kamar`
--
ALTER TABLE `data_jenis_kamar`
  ADD PRIMARY KEY (`jenis_kamar`);

--
-- Indexes for table `data_jenis_perawatan`
--
ALTER TABLE `data_jenis_perawatan`
  ADD PRIMARY KEY (`kode_perawatan`);

--
-- Indexes for table `data_kamar`
--
ALTER TABLE `data_kamar`
  ADD PRIMARY KEY (`kode_kamar`),
  ADD UNIQUE KEY `jenis_kamar` (`jenis_kamar`);

--
-- Indexes for table `data_obat`
--
ALTER TABLE `data_obat`
  ADD PRIMARY KEY (`kode_obat`);

--
-- Indexes for table `data_pasien`
--
ALTER TABLE `data_pasien`
  ADD PRIMARY KEY (`kode_pasien`),
  ADD UNIQUE KEY `kode_kamar` (`jenis_kamar`);

--
-- Indexes for table `data_pegawai`
--
ALTER TABLE `data_pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD UNIQUE KEY `kode_jadwal` (`kode_jadwal`),
  ADD UNIQUE KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `data_pembayaran`
--
ALTER TABLE `data_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD UNIQUE KEY `kode_pasien` (`kode_pasien`),
  ADD UNIQUE KEY `kode_obat` (`kode_obat`);

--
-- Indexes for table `data_pemeriksaaan`
--
ALTER TABLE `data_pemeriksaaan`
  ADD PRIMARY KEY (`kode_pemeriksaan`),
  ADD UNIQUE KEY `kode_obat` (`kode_obat`),
  ADD UNIQUE KEY `id_pembayaran` (`id_pembayaran`);

--
-- Indexes for table `data_pengguna`
--
ALTER TABLE `data_pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD UNIQUE KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `data_poliklinik`
--
ALTER TABLE `data_poliklinik`
  ADD PRIMARY KEY (`kode_poliklinik`);

--
-- Indexes for table `data_tenaga_medis`
--
ALTER TABLE `data_tenaga_medis`
  ADD PRIMARY KEY (`id_tenagamedis`),
  ADD UNIQUE KEY `kode_kamar` (`kode_kamar`),
  ADD UNIQUE KEY `kode_obat` (`kode_obat`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_dokter`
--
ALTER TABLE `data_dokter`
  ADD CONSTRAINT `data_dokter_ibfk_1` FOREIGN KEY (`kode_pemeriksaan`) REFERENCES `data_pemeriksaaan` (`kode_pemeriksaan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_dokter_ibfk_2` FOREIGN KEY (`kode_poliklinik`) REFERENCES `data_poliklinik` (`kode_poliklinik`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_dokter_ibfk_3` FOREIGN KEY (`kode_perawatan`) REFERENCES `data_jenis_perawatan` (`kode_perawatan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_dokter_ibfk_4` FOREIGN KEY (`kode_pasien`) REFERENCES `data_pasien` (`kode_pasien`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_jadwal`
--
ALTER TABLE `data_jadwal`
  ADD CONSTRAINT `data_jadwal_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `data_dokter` (`id_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_kamar`
--
ALTER TABLE `data_kamar`
  ADD CONSTRAINT `data_kamar_ibfk_1` FOREIGN KEY (`jenis_kamar`) REFERENCES `data_jenis_kamar` (`jenis_kamar`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_pasien`
--
ALTER TABLE `data_pasien`
  ADD CONSTRAINT `data_pasien_ibfk_1` FOREIGN KEY (`jenis_kamar`) REFERENCES `data_jenis_kamar` (`jenis_kamar`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_pegawai`
--
ALTER TABLE `data_pegawai`
  ADD CONSTRAINT `data_pegawai_ibfk_1` FOREIGN KEY (`kode_jadwal`) REFERENCES `data_jadwal` (`kode_jadwal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_pegawai_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `data_dokter` (`id_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_pembayaran`
--
ALTER TABLE `data_pembayaran`
  ADD CONSTRAINT `data_pembayaran_ibfk_1` FOREIGN KEY (`kode_obat`) REFERENCES `data_obat` (`kode_obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_pembayaran_ibfk_2` FOREIGN KEY (`kode_pasien`) REFERENCES `data_pasien` (`kode_pasien`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_pemeriksaaan`
--
ALTER TABLE `data_pemeriksaaan`
  ADD CONSTRAINT `data_pemeriksaaan_ibfk_1` FOREIGN KEY (`id_pembayaran`) REFERENCES `data_pembayaran` (`id_pembayaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_pemeriksaaan_ibfk_2` FOREIGN KEY (`kode_obat`) REFERENCES `data_obat` (`kode_obat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_pengguna`
--
ALTER TABLE `data_pengguna`
  ADD CONSTRAINT `data_pengguna_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `data_pegawai` (`id_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `data_tenaga_medis`
--
ALTER TABLE `data_tenaga_medis`
  ADD CONSTRAINT `data_tenaga_medis_ibfk_1` FOREIGN KEY (`kode_kamar`) REFERENCES `data_kamar` (`kode_kamar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `data_tenaga_medis_ibfk_2` FOREIGN KEY (`kode_obat`) REFERENCES `data_obat` (`kode_obat`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
