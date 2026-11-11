-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table siakad.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.cache: ~0 rows (approximately)

-- Dumping structure for table siakad.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.cache_locks: ~0 rows (approximately)

-- Dumping structure for table siakad.dosen
CREATE TABLE IF NOT EXISTS `dosen` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nidn` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan_fungsional` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dosen_nidn_unique` (`nidn`),
  UNIQUE KEY `dosen_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.dosen: ~10 rows (approximately)
INSERT INTO `dosen` (`id`, `nidn`, `nama`, `jabatan_fungsional`, `email`, `telepon`, `alamat`, `created_at`, `updated_at`) VALUES
	(1, '0087560768', 'Rendy Farida, S.Si., M.Cs.', NULL, 'pangestu.hairyanto@example.com', '088214615012', 'Ds. Raden Saleh No. 276, Tual 76571, Sulut', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(2, '0019532404', 'Suci Mandasari, S.Si., M.Cs.', NULL, 'rahimah.lulut@example.com', '085531438715', 'Psr. Tubagus Ismail No. 175, Subulussalam 83461, Sumbar', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(3, '0017886940', 'Mulyono Tamba, S.T., M.T.', NULL, 'bancar.pradana@example.org', '086954105694', 'Kpg. Sudiarto No. 632, Dumai 64168, Bengkulu', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(4, '0083087136', 'Vicky Puspita, S.Kom., M.Kom.', NULL, 'suwarno.gading@example.net', '083175146658', 'Kpg. Katamso No. 308, Bima 65822, Kalbar', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(5, '0046541480', 'Kamila Permata, S.Kom., M.Kom.', NULL, 'betania50@example.com', '082693505862', 'Kpg. Cihampelas No. 317, Manado 20350, Maluku', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(6, '0013690998', 'Ani Iswahyudi, S.Si., M.Cs.', NULL, 'prabu75@example.org', '085289709210', 'Dk. Bagis Utama No. 198, Metro 17666, Jatim', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(7, '0076255139', 'Kamidin Siregar, S.Si., M.Cs.', NULL, 'iuyainah@example.org', '080379846094', 'Gg. Supono No. 920, Palu 76288, Sulteng', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(8, '0031393892', 'Radika Irawan, S.Si., M.Cs.', NULL, 'msimbolon@example.com', '082961172107', 'Ki. Asia Afrika No. 280, Banjarbaru 71286, Bali', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(9, '0052029484', 'Zaenab Wulandari, S.Si., M.Cs.', NULL, 'rprasasta@example.com', '089567081809', 'Gg. Labu No. 427, Parepare 74384, Babel', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(10, '0017675163', 'Reksa Waskita, S.Si., M.Cs.', NULL, 'widiastuti.aditya@example.net', '089502522399', 'Gg. Bakti No. 493, Bandar Lampung 45458, Bengkulu', '2026-11-11 02:26:22', '2026-11-11 02:26:22');

-- Dumping structure for table siakad.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table siakad.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.jobs: ~0 rows (approximately)

-- Dumping structure for table siakad.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.job_batches: ~0 rows (approximately)

-- Dumping structure for table siakad.krs
CREATE TABLE IF NOT EXISTS `krs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `mahasiswa_id` bigint unsigned NOT NULL,
  `tahun_akademik` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` enum('Ganjil','Genap') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('draft','diajukan','disetujui','ditolak') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `krs_mahasiswa_id_tahun_akademik_semester_unique` (`mahasiswa_id`,`tahun_akademik`,`semester`),
  CONSTRAINT `krs_mahasiswa_id_foreign` FOREIGN KEY (`mahasiswa_id`) REFERENCES `mahasiswa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.krs: ~10 rows (approximately)
INSERT INTO `krs` (`id`, `mahasiswa_id`, `tahun_akademik`, `semester`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, '2026/2027', 'Ganjil', 'draft', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(2, 2, '2026/2027', 'Ganjil', 'draft', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(3, 3, '2026/2027', 'Ganjil', 'draft', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(4, 4, '2026/2027', 'Ganjil', 'draft', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(5, 5, '2026/2027', 'Ganjil', 'draft', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(6, 6, '2026/2027', 'Ganjil', 'draft', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(7, 7, '2026/2027', 'Ganjil', 'draft', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(8, 8, '2026/2027', 'Ganjil', 'draft', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(9, 9, '2026/2027', 'Ganjil', 'draft', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(10, 10, '2026/2027', 'Ganjil', 'draft', '2026-11-11 02:26:22', '2026-11-11 02:26:22');

-- Dumping structure for table siakad.krs_detail
CREATE TABLE IF NOT EXISTS `krs_detail` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `krs_id` bigint unsigned NOT NULL,
  `mata_kuliah_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `krs_detail_krs_id_mata_kuliah_id_unique` (`krs_id`,`mata_kuliah_id`),
  KEY `krs_detail_mata_kuliah_id_foreign` (`mata_kuliah_id`),
  CONSTRAINT `krs_detail_krs_id_foreign` FOREIGN KEY (`krs_id`) REFERENCES `krs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `krs_detail_mata_kuliah_id_foreign` FOREIGN KEY (`mata_kuliah_id`) REFERENCES `mata_kuliah` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.krs_detail: ~50 rows (approximately)
INSERT INTO `krs_detail` (`id`, `krs_id`, `mata_kuliah_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 3, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(2, 1, 10, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(3, 1, 2, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(4, 1, 8, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(5, 1, 9, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(6, 2, 8, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(7, 2, 1, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(8, 2, 9, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(9, 2, 3, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(10, 2, 6, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(11, 3, 10, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(12, 3, 5, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(13, 3, 6, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(14, 3, 4, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(15, 3, 8, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(16, 4, 7, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(17, 4, 3, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(18, 4, 6, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(19, 4, 5, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(20, 4, 2, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(21, 5, 6, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(22, 5, 5, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(23, 5, 2, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(24, 5, 4, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(25, 5, 8, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(26, 6, 2, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(27, 6, 4, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(28, 6, 10, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(29, 6, 7, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(30, 6, 6, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(31, 7, 10, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(32, 7, 6, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(33, 7, 9, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(34, 7, 5, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(35, 7, 3, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(36, 8, 10, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(37, 8, 3, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(38, 8, 2, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(39, 8, 1, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(40, 8, 5, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(41, 9, 8, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(42, 9, 5, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(43, 9, 3, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(44, 9, 2, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(45, 9, 10, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(46, 10, 4, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(47, 10, 9, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(48, 10, 6, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(49, 10, 3, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(50, 10, 8, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(51, 1, 4, '2026-11-11 07:08:52', '2026-11-11 07:08:52'),
	(52, 1, 5, '2026-11-11 07:08:52', '2026-11-11 07:08:52');

-- Dumping structure for table siakad.mahasiswa
CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nim` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `angkatan` smallint unsigned NOT NULL,
  `program_studi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'D3 Teknik Informatika',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mahasiswa_nim_unique` (`nim`),
  UNIQUE KEY `mahasiswa_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.mahasiswa: ~50 rows (approximately)
INSERT INTO `mahasiswa` (`id`, `nim`, `nama`, `jenis_kelamin`, `email`, `angkatan`, `program_studi`, `created_at`, `updated_at`) VALUES
	(1, '2303034447', 'Dina Mulyani', 'P', '2303034447@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(2, '2403036820', 'Vero Lestari', 'L', '2403036820@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(3, '2303038198', 'Nadine Pudjiastuti', 'P', '2303038198@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(4, '2303034823', 'Shania Nashiruddin', 'P', '2303034823@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(5, '2403035118', 'Rahmi Mustofa', 'P', '2403035118@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(6, '2403032630', 'Silvia Simbolon', 'P', '2403032630@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(7, '2303038418', 'Aurora Andriani', 'P', '2303038418@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(8, '2203030438', 'Ratih Susanti', 'P', '2203030438@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(9, '2403037381', 'Kasiran Sudiati', 'L', '2403037381@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(10, '2503033379', 'Ciaobella Budiman', 'P', '2503033379@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(11, '2503039716', 'Tantri Rahmawati', 'P', '2503039716@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(12, '2503036702', 'Wadi Hariyah', 'L', '2503036702@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(13, '2303034710', 'Yunita Budiman', 'P', '2303034710@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(14, '2503030507', 'Empluk Puspita', 'L', '2503030507@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(15, '2303036308', 'Karen Suartini', 'P', '2303036308@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(16, '2203030616', 'Nasim Iswahyudi', 'L', '2203030616@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(17, '2303034432', 'Margana Dongoran', 'L', '2303034432@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(18, '2403039504', 'Yusuf Gunarto', 'L', '2403039504@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(19, '2303036261', 'Kayla Nasyidah', 'P', '2303036261@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(20, '2403033539', 'Baktianto Halimah', 'L', '2403033539@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(21, '2503034462', 'Jefri Astuti', 'L', '2503034462@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(22, '2303034762', 'Yance Zulaika', 'P', '2303034762@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(23, '2203039756', 'Violet Mardhiyah', 'P', '2203039756@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(24, '2203035627', 'Dalima Wibisono', 'P', '2203035627@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(25, '2303035221', 'Ifa Kuswandari', 'P', '2303035221@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(26, '2503031990', 'Amalia Haryanti Andini', 'P', '2503031990@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 07:05:59'),
	(27, '2203033563', 'Prabowo Haryanto', 'L', '2203033563@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(28, '2403039899', 'Tari Susanti', 'P', '2403039899@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(29, '2203032058', 'Tina Hutagalung', 'P', '2203032058@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(30, '2203037113', 'Saadat Nababan', 'L', '2203037113@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(31, '2203037039', 'Diana Latupono', 'P', '2203037039@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(32, '2203039758', 'Halim Wibowo', 'L', '2203039758@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(33, '2503038470', 'Warsa Hasanah', 'L', '2503038470@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(34, '2203032361', 'Vino Nugroho', 'L', '2203032361@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(35, '2203031769', 'Jindra Hutagalung', 'L', '2203031769@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(36, '2203039291', 'Cici Dongoran', 'P', '2203039291@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(37, '2203032510', 'Asmuni Rahimah', 'L', '2203032510@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(38, '2403030656', 'Qori Iswahyudi', 'P', '2403030656@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(39, '2403036284', 'Hari Hartati', 'L', '2403036284@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(40, '2203033216', 'Laksana Prabowo', 'L', '2203033216@mhs.example.com', 2022, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(41, '2403032983', 'Dalima Novitasari', 'P', '2403032983@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(42, '2303036826', 'Darimin Prasasta', 'L', '2303036826@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(43, '2303035511', 'Indah Pranowo', 'P', '2303035511@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(44, '2403032976', 'Jaswadi Mansur', 'L', '2403032976@mhs.example.com', 2024, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(45, '2503038409', 'Ganep Yulianti', 'L', '2503038409@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(47, '2503037221', 'Citra Astuti', 'P', '2503037221@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(48, '2303034372', 'Emin Hidayanto', 'L', '2303034372@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(49, '2303030536', 'Zelaya Uwais', 'P', '2303030536@mhs.example.com', 2023, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(50, '2503036382', 'Lintang Mansur', 'P', '2503036382@mhs.example.com', 2025, 'D3 Teknik Informatika', '2026-11-11 02:26:22', '2026-11-11 02:26:22');

-- Dumping structure for table siakad.mata_kuliah
CREATE TABLE IF NOT EXISTS `mata_kuliah` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kode_mk` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_mk` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sks` tinyint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mata_kuliah_kode_mk_unique` (`kode_mk`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.mata_kuliah: ~10 rows (approximately)
INSERT INTO `mata_kuliah` (`id`, `kode_mk`, `nama_mk`, `sks`, `created_at`, `updated_at`) VALUES
	(1, 'TI101', 'Pengantar Teknologi Informasi', 2, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(2, 'TI102', 'Algoritma Pemgrograman', 3, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(3, 'TI103', 'Matematika Diskrit', 3, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(4, 'TI201', 'Basis Data', 3, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(5, 'TI202', 'Desain Web', 3, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(6, 'TI203', 'Pemrograman Web', 3, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(7, 'TI204', 'Jaringan Komputer', 3, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(8, 'TI301', 'Rekayasa Perangkat Lunak', 3, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(9, 'TI302', 'Pemrograman Berorientasi Objek', 3, '2026-11-11 02:26:22', '2026-11-11 02:26:22'),
	(10, 'TI303', 'Sistem Operasi', 2, '2026-11-11 02:26:22', '2026-11-11 02:26:22');

-- Dumping structure for table siakad.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.migrations: ~5 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2026_10_21_095438_add_role_users_table', 1),
	(5, '2026_10_21_104457_create_dosen_table', 1),
	(6, '2026_10_21_104522_create_mahasiswa_table', 1),
	(7, '2026_10_21_104541_create_mata_kuliah_table', 1),
	(8, '2026_10_21_111218_create_krs_table', 1),
	(9, '2026_10_21_111249_create_krs_detail_table', 1),
	(10, '2026_10_24_172310_add_jabatan_fungsional_to_dosen_table', 1),
	(11, '2026_11_02_211813_add_last_login_at_to_users_table', 1),
	(12, '2026_11_11_090308_create_personal_access_tokens_table', 1);

-- Dumping structure for table siakad.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table siakad.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table siakad.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.sessions: ~1 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('GNg75ktxqcyC21Puqdtj8RRB1hQBaVWV53O8zuDC', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/157.0.0.0 Safari/537.36 Edg/157.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSWJIdmZpS1NPRWJDWDRyaVNPYjU2djFGZmV3aUt1aW5Ua2VNZTBoUCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJuZXciO2E6MDp7fXM6Mzoib2xkIjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO3M6NToicm91dGUiO3M6OToiZGFzaGJvYXJkIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiM2E5YTNkZTczYWVlOGZmZGI3ZmE2MDYxMDdlYWIxMTExODQxMzM4Mzg0NDhiYzk5NjYzMTRmNmVhZGM4MjBmNiI7fQ==', 1794385847);

-- Dumping structure for table siakad.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','dosen','mahasiswa') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'mahasiswa',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table siakad.users: ~3 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `last_login_at`, `created_at`, `updated_at`) VALUES
	(1, 'Administrator SIAKAD', 'admin@siakad.test', NULL, '$2y$12$QEmvCZo/rodFrp9tfoGn3eYhD9BSahpmR96gCzdS8kV8qff2oqAmC', 'admin', NULL, '2026-11-11 07:04:42', '2026-11-11 02:26:21', '2026-11-11 07:04:42'),
	(2, 'Dosen Uji', 'dosen@siakad.test', NULL, '$2y$12$huId92y08J2OFR8j6l6mC.KvizCWFmJ7323sdMPEdkgaBRg5iIjUO', 'dosen', NULL, '2026-11-11 08:30:25', '2026-11-11 02:26:21', '2026-11-11 08:30:25'),
	(3, 'Mahasiswa Uji', 'mahasiswa@siakad.test', NULL, '$2y$12$29xxfFfZ7vzLnQ8Uko5lhuiW5zwSZFjQGAqmfKUlzITYeS/Aiq0oW', 'mahasiswa', NULL, NULL, '2026-11-11 02:26:22', '2026-11-11 02:26:22');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
