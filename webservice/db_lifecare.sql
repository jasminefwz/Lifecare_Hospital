/*
Navicat MySQL Data Transfer

Source Server         : koneksi01
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_lifecare

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2024-06-12 08:36:12
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `artikel`
-- ----------------------------
DROP TABLE IF EXISTS `artikel`;
CREATE TABLE `artikel` (
  `id_artikel` int(11) NOT NULL AUTO_INCREMENT,
  `judul_artikel` varchar(255) NOT NULL,
  `isi_artikel` varchar(5000) NOT NULL,
  `foto_artikel` varchar(255) NOT NULL,
  PRIMARY KEY (`id_artikel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of artikel
-- ----------------------------
INSERT INTO `artikel` VALUES ('1', 'Kunjungi Rumah Singgah YKAKI, Menkes Ingatkan Pentingnya Deteksi Dini', 'Menteri Kesehatan Budi Gunadi Sadikin mengunjungi Rumah Singgah “Rumah Kita” milik Yayasan Kasih Anak Kanker Indonesia (YKAKI) di Jakarta pada Rabu (28/2). Kunjungan ini bertujuan mengetahui jenis penyakit kanker yang paling umum serta kondisi penderita kanker di rumah singgah. Menkes juga memastikan fasilitas di rumah singgah dalam kondisi baik dan berfungsi optimal.\r\n\r\nMenkes Budi mengungkapkan bahwa limfoma dan leukemia adalah jenis kanker yang paling umum diidap anak-anak di rumah singgah dan sering kali terlambat diidentifikasi. Pemerintah akan memperkuat deteksi dini di puskesmas dengan menyediakan alat kesehatan seperti hemato analyzer, blood chemical analyzer, dan oftalmoskop untuk mendeteksi leukemia, limfoma, dan retinoblastoma. Alat-alat ini akan disebar ke 10.000 puskesmas di Indonesia. \"Jika ada gejala kanker, bisa kita deteksi lebih dini dan langsung dirujuk ke rumah sakit di 514 kabupaten/kota yang akan kita bangun layanan kemoterapi,\" ujar Menkes Budi. Pemerintah juga akan mendidik dokter dan perawat untuk deteksi dini kanker.\r\n\r\nPemerintah berkomitmen penuh dalam penanganan kanker, termasuk kanker pada anak, dengan memastikan penderita mendapatkan pengobatan cepat dan tepat. Langkah pertama, pemerintah akan menyediakan fasilitas kemoterapi di seluruh kabupaten/kota dan provinsi, sehingga penderita kanker di wilayah terpencil tidak perlu jauh-jauh ke pusat kota. Langkah kedua, memperbanyak opsi terapi kanker pada anak. RS Kanker Dharmais akan memulai transplantasi sumsum tulang belakang pada anak dan terapi CAR T-cell untuk kanker darah pada anak. Jika berhasil, metode ini akan diterapkan di rumah sakit lain.\r\n\r\nMenkes Budi menyatakan berbagai upaya pemerintah memerlukan dukungan dari berbagai pihak, termasuk YKAKI. Menkes mengapresiasi dedikasi YKAKI dalam menyediakan fasilitas hunian sementara bagi pasien dan pendamping yang sedang menjalani pengobatan kanker di rumah sakit. Pemerintah juga akan membantu rumah singgah mendapatkan donatur untuk meringankan beban operasional.\r\n\r\nRumah Singgah “Rumah Kita” milik YKAKI menyediakan tempat tinggal sementara bagi pasien kanker dan pendamping selama pengobatan. Sejak berdiri pada 2006, “Rumah Kita” memiliki cabang di berbagai daerah seperti Jakarta, Bandung, Jogjakarta, Semarang, Surabaya, Riau, Makassar, dan Manado. Ketua YKAKI Ira Soelistyo menyatakan selama 17 tahun berdiri, “Rumah Kita” telah menampung 3.700 anak penderita kanker yang didampingi oleh 4.600 pendamping. Dari jumlah tersebut, 1.600 anak atau 50 persen meninggal karena keterlambatan penanganan.\r\n\r\nYKAKI juga menyediakan bantuan pendidikan melalui program Sekolahku, yang memberikan pendidikan gratis kepada anak-anak penderita kanker. Sistem pembelajaran disesuaikan dengan kurikulum sekolah formal dan pasien mendapatkan pelajaran sesuai jenjang pendidikan sebelumnya. Program ini tersedia di beberapa rumah sakit seperti RSCM, RSK Dharmais, RSAB Harapan Kita, RS Fatmawati, dan RSPAD Gatot Subroto di Jakarta.', 'images/berita1.jpeg');
INSERT INTO `artikel` VALUES ('2', 'Wajib Tahu, 3 Fase saat Sakit Demam Berdarah dan Cara Menanganinya', 'Jakarta, CNN Indonesia -- Kasus demam berdarah dengue (DBD) di beberapa wilayah di Indonesia kini tengah mengalami kenaikan. Oleh karena itu, penting untuk mengetahui tiga fase yang akan dilalui pasien saat sakit DBD dan cara menanganinya. DBD merupakan jenis penyakit yang memiliki beberapa tingkatan.\r\n\r\nDBD memiliki tiga fase diantaranya fase demam, fase kritis, dan fase pemulihan. Ketiga fase ini perlu diketahui agar dapat dilakukan pemeriksaan serta pengobatan yang lebih optimal.\r\n\r\nDokter Spesialis Penyakit Dalam sekaligus Pengurus PB IDI, Soroy Lardo, mengatakan memahami ciri-ciri atau gejala yang timbul pada setiap fase DBD sangat penting. Pasalnya hal ini akan memengaruhi tindakan apa yang harus dilakukan terhadap pasien.\r\n\r\n\"Pemahaman fase sangat menentukan penanganannya,\" ujar Soroy dalam acara Media Briefing PB IDI yang dilakukan secara daring, Selasa (27/2).\r\n\r\nVirus DBD menginfeksi manusia melalui gigitan nyamuk Aedes Aegypti. Jika tidak ditangani dengan benar akan memperparah penyebaran virus dan berpotensi kematian.\r\n\r\nBerikut adalah fase-fase demam berdarah dan cara tepat menanganinya:\r\n\r\n### Fase demam (febrile phase)\r\nFase pertama ditandai dengan demam tinggi yang tak kunjung mereda hingga 40 derajat Celcius. Fase ini disertai gejala lain seperti mual, muntah, sakit kepala, ruam merah, nyeri otot dan sendi, dan sakit tenggorokan. Pada fase ini terjadi penurunan jumlah trombosit darah dengan cepat hingga kurang dari 100.000 per mikroliter darah.\r\n\r\nFase ini membutuhkan tindakan dokter agar mendapatkan obat dan penanganan yang sesuai.\r\n\r\n### Fase kritis (critical phase)\r\nMenurut Soroy, ini adalah fase DBD yang paling rawan dan membutuhkan perhatian khusus. Pada fase ini, demam akan membaik dan tubuh akan kembali normal, biasanya ditandai dengan suhu tubuh yang menurun. Namun, fase ini paling berbahaya karena dapat menyebabkan pendarahan dan kebocoran plasma darah yang berpotensi kematian. Fase kritis dapat terjadi sejak 3 hingga 7 hari sejak fase pertama timbul. Gejalanya dapat berupa pendarahan pada hidung atau gusi, serta penurunan tekanan darah yang drastis. Fase ini membutuhkan perhatian khusus dari dokter yang ahli.\r\n\r\n### Fase pemulihan (recovery phase)\r\nPada fase ini, cairan yang keluar dari pembuluh darah akan masuk kembali ke dalam pembuluh darah. Trombosit akan meningkat hingga 150.000 mikroliter darah, mendekati kadar normal. \"Setelah trombosit naik, masih ada proses infeksi dan pemulihan. Jadi harus ada pengorganisasian produktivitas kerja agar pekerjaan lebih dibatasi,\" ujar Soroy.\r\n\r\nFase ini tidak membutuhkan banyak perhatian khusus, namun karena kondisi tubuh masih lemah, disarankan untuk lebih banyak istirahat hingga membaik. \"Pada fase perbaikan biasanya disarankan istirahat lima hari. Virus dengue masih ada dalam tubuh sampai waktu 3 minggu,\" lanjut Soroy.', 'images/berita2.jpeg');
INSERT INTO `artikel` VALUES ('3', 'Protein Hewani Cegah Stunting', 'Hari Gizi Nasional yang diperingati setiap 25 Januari merupakan momentum penting untuk meningkatkan kepedulian dan komitmen dalam membangun gizi menuju bangsa sehat berprestasi melalui gizi seimbang dan produksi pangan berkelanjutan. Hal ini diharapkan dapat mendorong pencapaian RPJMN bidang kesehatan. Dengan mempertimbangkan masalah stunting yang belum mencapai target, serta bukti bahwa konsumsi protein hewani dapat mencegah stunting, peringatan Hari Gizi Nasional ke-63 tahun 2023 mengangkat tema “Protein Hewani Cegah Stunting” dengan slogan “Protein Hewani Setiap Makan” dan “Isi Piringku Kaya Protein Hewani.”\n\nAngka stunting di Indonesia masih tinggi yaitu 24,4% (SSGI 2021), walaupun menurun dari 27,7% (SSGI 2019). Namun, upaya masih diperlukan untuk mencapai target penurunan stunting pada tahun 2024 sebesar 14%. Tren data SSGI 2019-2021 menunjukkan stunting terjadi sejak sebelum lahir dan meningkat paling banyak pada rentang usia 6 bulan (13,8%) ke 12 bulan (27,2%) (SSGI 2019). Ini menekankan pentingnya gizi ibu sejak hamil, menyusui, dan gizi pada MP-ASI balita.\n\nGizi ibu hamil penting untuk mencegah stunting sejak lahir, yang saat ini mencapai 23%. Stunting saat lahir dapat terjadi akibat kekurangan gizi dan anemia sejak remaja hingga kehamilan. Oleh karena itu, asupan gizi ibu hamil yang adekuat sangat penting untuk mencegah ibu hamil dari KEK dan anemia, serta untuk mencegah kelahiran bayi stunting.\n\nGizi ibu menyusui penting untuk memastikan kualitas ASI yang menjadi satu-satunya sumber asupan gizi pada 6 bulan pertama melalui ASI eksklusif. Bayi yang mendapat Inisiasi Menyusui Dini (IMD) akan memperoleh kolostrum yang kaya antibodi, penting untuk meningkatkan imunitas dan bonding antara ibu dan bayi.', 'images/berita3.jpeg');

-- ----------------------------
-- Table structure for `dokter`
-- ----------------------------
DROP TABLE IF EXISTS `dokter`;
CREATE TABLE `dokter` (
  `id_dokter` int(11) NOT NULL AUTO_INCREMENT,
  `nama_dokter` varchar(255) NOT NULL,
  `id_spesialis_d` int(11) NOT NULL,
  `deskripsi_dokter` varchar(255) NOT NULL,
  `foto_dokter` varchar(255) NOT NULL,
  PRIMARY KEY (`id_dokter`),
  KEY `fk_spesialis` (`id_spesialis_d`),
  CONSTRAINT `fk_spesialis` FOREIGN KEY (`id_spesialis_d`) REFERENCES `spesialis` (`id_spesialis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of dokter
-- ----------------------------
INSERT INTO `dokter` VALUES ('1', 'Budi Santoso', '1', 'Dokter umum dengan pengalaman lebih dari 5 tahun di berbagai klinik dan rumah sakit.', 'images/profilPutih.png');
INSERT INTO `dokter` VALUES ('2', 'Siti Aminah', '2', 'Spesialis mata dengan fokus pada bedah refraktif dan perawatan katarak.', 'images/profilPutih.png');
INSERT INTO `dokter` VALUES ('3', 'Ahmad Fauzi', '3', 'Dokter Obgyn dengan pengalaman 10 tahun dalam menangani kasus kehamilan risiko tinggi.', 'images/profilPutih.png');
INSERT INTO `dokter` VALUES ('4', 'Dian Sari', '4', 'Dokter THT yang ahli dalam bedah endoskopi dan perawatan gangguan tidur.', 'images/profilPutih.png');
INSERT INTO `dokter` VALUES ('5', 'Eko Prasetyo', '5', 'Dokter anak yang berpengalaman dalam menangani penyakit menular dan imunisasi.', 'images/profilPutih.png');
INSERT INTO `dokter` VALUES ('6', 'Rina Wulandari', '6', 'Dokter gigi dengan spesialisasi dalam ortodontik dan perawatan estetika gigi.', 'images/profilPutih.png');
INSERT INTO `dokter` VALUES ('7', 'Agus Saputra', '7', 'Dokter kulit dan kelamin dengan pengalaman 6 tahun dalam perawatan penyakit kulit kronis.', 'images/profilPutih.png');
INSERT INTO `dokter` VALUES ('8', 'Indra Lesmana', '8', 'Spesialis jantung yang fokus pada intervensi non-bedah dan rehabilitasi kardiovaskular.', 'images/profilPutih.png');
INSERT INTO `dokter` VALUES ('9', 'Tri Handayani', '9', 'Dokter neurologi yang berpengalaman dalam perawatan gangguan saraf dan rehabilitasi pasca stroke.', 'images/profilPutih.png');
INSERT INTO `dokter` VALUES ('10', 'Maya Kartika', '10', 'Spesialis urologi dengan fokus pada bedah minimal invasif untuk penyakit urologi.', 'images/profilPutih.png');
INSERT INTO `dokter` VALUES ('11', 'Putri Pertiwi', '11', 'Dokter gizi yang berpengalaman dalam pengelolaan berat badan dan nutrisi klinis.', 'images/profilPutih.png');
INSERT INTO `dokter` VALUES ('12', 'Bayu Nugroho', '12', 'Spesialis ortopedi yang ahli dalam bedah tulang dan sendi serta rehabilitasi pasca operasi.', 'images/profilPutih.png');
INSERT INTO `dokter` VALUES ('13', 'Dewi Lestari', '13', 'Dokter bedah dengan pengalaman luas dalam berbagai prosedur bedah umum dan darurat.', 'images/profilPutih.png');
INSERT INTO `dokter` VALUES ('14', 'Adi Kurniawan', '14', 'Spesialis bedah onkologi dengan fokus pada bedah kanker payudara dan sistem pencernaan.', 'images/profilPutih.png');
INSERT INTO `dokter` VALUES ('15', 'Wulan Maulida', '15', 'Dokter anestesi dengan pengalaman dalam anestesi umum dan regional untuk berbagai jenis operasi.', 'images/profilPutih.png');
INSERT INTO `dokter` VALUES ('16', 'Nanda Pratama', '16', 'Spesialis bedah vaskular yang berpengalaman dalam perawatan penyakit pembuluh darah.', 'images/profilPutih.png');
INSERT INTO `dokter` VALUES ('17', 'Fajar Rahman', '17', 'Dokter akupuntur yang ahli dalam terapi nyeri dan perawatan kesehatan holistik.', 'images/profilPutih.png');
INSERT INTO `dokter` VALUES ('18', 'Ratna Dewanti', '18', 'Spesialis psikiatri dengan fokus pada perawatan gangguan kecemasan dan depresi.', 'images/profilPutih.png');
INSERT INTO `dokter` VALUES ('19', 'Yoga Prasetya', '19', 'Psikolog klinis yang berpengalaman dalam terapi individu dan keluarga.', 'images/profilPutih.png');
INSERT INTO `dokter` VALUES ('20', 'Dita Saraswati', '20', 'Dokter bedah toraks yang ahli dalam bedah paru-paru dan perawatan pasca operasi.', 'images/profilPutih.png');

-- ----------------------------
-- Table structure for `dokter_hari_waktu`
-- ----------------------------
DROP TABLE IF EXISTS `dokter_hari_waktu`;
CREATE TABLE `dokter_hari_waktu` (
  `id_dokter_hari_waktu` int(11) NOT NULL AUTO_INCREMENT,
  `id_dokter` int(11) NOT NULL,
  `id_hari_d` int(11) NOT NULL,
  `id_waktu_d` int(11) NOT NULL,
  PRIMARY KEY (`id_dokter_hari_waktu`),
  KEY `fk_dokter` (`id_dokter`),
  KEY `fk_hari` (`id_hari_d`),
  KEY `fk_waktu` (`id_waktu_d`),
  CONSTRAINT `fk_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hari` FOREIGN KEY (`id_hari_d`) REFERENCES `hari` (`id_hari`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_waktu` FOREIGN KEY (`id_waktu_d`) REFERENCES `waktu` (`id_waktu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of dokter_hari_waktu
-- ----------------------------
INSERT INTO `dokter_hari_waktu` VALUES ('1', '1', '1', '1');
INSERT INTO `dokter_hari_waktu` VALUES ('2', '1', '3', '3');
INSERT INTO `dokter_hari_waktu` VALUES ('3', '2', '2', '2');
INSERT INTO `dokter_hari_waktu` VALUES ('4', '2', '4', '4');
INSERT INTO `dokter_hari_waktu` VALUES ('5', '3', '3', '1');
INSERT INTO `dokter_hari_waktu` VALUES ('6', '3', '5', '2');
INSERT INTO `dokter_hari_waktu` VALUES ('7', '4', '4', '3');
INSERT INTO `dokter_hari_waktu` VALUES ('8', '4', '6', '4');
INSERT INTO `dokter_hari_waktu` VALUES ('9', '5', '5', '1');
INSERT INTO `dokter_hari_waktu` VALUES ('10', '5', '1', '2');
INSERT INTO `dokter_hari_waktu` VALUES ('11', '6', '6', '3');
INSERT INTO `dokter_hari_waktu` VALUES ('12', '6', '2', '4');
INSERT INTO `dokter_hari_waktu` VALUES ('13', '7', '1', '1');
INSERT INTO `dokter_hari_waktu` VALUES ('14', '7', '3', '2');
INSERT INTO `dokter_hari_waktu` VALUES ('15', '8', '2', '3');
INSERT INTO `dokter_hari_waktu` VALUES ('16', '8', '4', '4');
INSERT INTO `dokter_hari_waktu` VALUES ('17', '9', '3', '1');
INSERT INTO `dokter_hari_waktu` VALUES ('18', '9', '5', '2');
INSERT INTO `dokter_hari_waktu` VALUES ('19', '10', '4', '3');
INSERT INTO `dokter_hari_waktu` VALUES ('20', '10', '6', '4');
INSERT INTO `dokter_hari_waktu` VALUES ('21', '11', '5', '1');
INSERT INTO `dokter_hari_waktu` VALUES ('22', '11', '1', '2');
INSERT INTO `dokter_hari_waktu` VALUES ('23', '12', '6', '3');
INSERT INTO `dokter_hari_waktu` VALUES ('24', '12', '2', '4');
INSERT INTO `dokter_hari_waktu` VALUES ('25', '13', '1', '1');
INSERT INTO `dokter_hari_waktu` VALUES ('26', '13', '3', '2');
INSERT INTO `dokter_hari_waktu` VALUES ('27', '14', '2', '3');
INSERT INTO `dokter_hari_waktu` VALUES ('28', '14', '4', '4');
INSERT INTO `dokter_hari_waktu` VALUES ('29', '15', '3', '1');
INSERT INTO `dokter_hari_waktu` VALUES ('30', '15', '5', '2');
INSERT INTO `dokter_hari_waktu` VALUES ('31', '16', '4', '3');
INSERT INTO `dokter_hari_waktu` VALUES ('32', '16', '6', '4');
INSERT INTO `dokter_hari_waktu` VALUES ('33', '17', '5', '1');
INSERT INTO `dokter_hari_waktu` VALUES ('34', '17', '1', '2');
INSERT INTO `dokter_hari_waktu` VALUES ('35', '18', '6', '3');
INSERT INTO `dokter_hari_waktu` VALUES ('36', '18', '2', '4');
INSERT INTO `dokter_hari_waktu` VALUES ('37', '19', '1', '1');
INSERT INTO `dokter_hari_waktu` VALUES ('38', '19', '3', '2');
INSERT INTO `dokter_hari_waktu` VALUES ('39', '20', '2', '3');
INSERT INTO `dokter_hari_waktu` VALUES ('40', '20', '4', '4');

-- ----------------------------
-- Table structure for `hari`
-- ----------------------------
DROP TABLE IF EXISTS `hari`;
CREATE TABLE `hari` (
  `id_hari` int(11) NOT NULL AUTO_INCREMENT,
  `nama_hari` varchar(255) NOT NULL,
  PRIMARY KEY (`id_hari`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of hari
-- ----------------------------
INSERT INTO `hari` VALUES ('1', 'Senin');
INSERT INTO `hari` VALUES ('2', 'Selasa');
INSERT INTO `hari` VALUES ('3', 'Rabu');
INSERT INTO `hari` VALUES ('4', 'Kamis');
INSERT INTO `hari` VALUES ('5', 'Jumat');
INSERT INTO `hari` VALUES ('6', 'Sabtu');

-- ----------------------------
-- Table structure for `invoice`
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id_invoice` int(11) NOT NULL AUTO_INCREMENT,
  `no_invoice` varchar(255) NOT NULL,
  `no_antrian` int(11) NOT NULL,
  `tgl_invoice` date NOT NULL,
  `waktu_invoice` time NOT NULL,
  `id_dokter_i` int(11) NOT NULL,
  `id_pasien_i` int(11) NOT NULL,
  `pdf_invoice` varchar(255) NOT NULL,
  `id_status_checkin` int(11) NOT NULL,
  PRIMARY KEY (`id_invoice`),
  KEY `fk_dokter_i` (`id_dokter_i`),
  KEY `fk_pasien_i` (`id_pasien_i`),
  KEY `fk_st_check` (`id_status_checkin`),
  CONSTRAINT `fk_dokter_i` FOREIGN KEY (`id_dokter_i`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pasien_i` FOREIGN KEY (`id_pasien_i`) REFERENCES `pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_st_check` FOREIGN KEY (`id_status_checkin`) REFERENCES `status_checkin` (`id_checkin`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of invoice
-- ----------------------------
INSERT INTO `invoice` VALUES ('1', 'INV001', '1', '2024-06-01', '09:00:00', '1', '1', 'path/to/invoice1.pdf', '1');
INSERT INTO `invoice` VALUES ('2', 'INV002', '2', '2024-06-02', '10:00:00', '2', '2', 'path/to/invoice2.pdf', '2');
INSERT INTO `invoice` VALUES ('3', 'INV003', '3', '2024-06-03', '11:00:00', '3', '1', 'path/to/invoice3.pdf', '1');
INSERT INTO `invoice` VALUES ('4', 'INV004', '4', '2024-06-04', '12:00:00', '4', '2', 'path/to/invoice4.pdf', '2');

-- ----------------------------
-- Table structure for `medcek`
-- ----------------------------
DROP TABLE IF EXISTS `medcek`;
CREATE TABLE `medcek` (
  `id_medcek` int(11) NOT NULL AUTO_INCREMENT,
  `paket_medcek` varchar(255) NOT NULL,
  `nama_medcek` varchar(255) NOT NULL,
  `harga_medcek` varchar(255) NOT NULL,
  `detail_singkat_medcek` varchar(255) NOT NULL,
  `detail_medcek` varchar(255) NOT NULL,
  `prosedur_medcek` varchar(255) NOT NULL,
  PRIMARY KEY (`id_medcek`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of medcek
-- ----------------------------
INSERT INTO `medcek` VALUES ('1', 'PAKET A', 'Ibu dan Anak', 'Rp 1.000.000', '', 'Pemeriksaan skrining pelajar untuk mengetahui apakah peserta sehat sesuai dengan usianya', 'Cek berat badan, Cek tekanan darah');
INSERT INTO `medcek` VALUES ('3', 'PAKET C', 'Skrining jantung', 'Rp 1.200.000', '', 'Pemeriksaan skrining jantung', 'Rontgen dada');
INSERT INTO `medcek` VALUES ('5', 'PAKET B', 'Skrining Umum', 'Rp 990.000', '', 'Pemeriksaan skrinin umum', 'Cek tekanan darah');

-- ----------------------------
-- Table structure for `metode_pembayaran`
-- ----------------------------
DROP TABLE IF EXISTS `metode_pembayaran`;
CREATE TABLE `metode_pembayaran` (
  `id_metode_pembayaran` int(11) NOT NULL AUTO_INCREMENT,
  `metode_pembayaran` varchar(255) NOT NULL,
  `kode_metode` varchar(255) NOT NULL,
  PRIMARY KEY (`id_metode_pembayaran`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of metode_pembayaran
-- ----------------------------
INSERT INTO `metode_pembayaran` VALUES ('1', 'BCA', 'BCA');
INSERT INTO `metode_pembayaran` VALUES ('2', 'BNI', 'BNI');
INSERT INTO `metode_pembayaran` VALUES ('3', 'BRI', 'BRI');
INSERT INTO `metode_pembayaran` VALUES ('4', 'Mandiri', 'MANDIRI');
INSERT INTO `metode_pembayaran` VALUES ('5', 'Dana', 'DANA');
INSERT INTO `metode_pembayaran` VALUES ('6', 'Gopay', 'GOPAY');
INSERT INTO `metode_pembayaran` VALUES ('7', 'Shopeepay', 'SHOPEEPAY');
INSERT INTO `metode_pembayaran` VALUES ('8', 'OVO', 'OVO');

-- ----------------------------
-- Table structure for `notifikasi`
-- ----------------------------
DROP TABLE IF EXISTS `notifikasi`;
CREATE TABLE `notifikasi` (
  `id_notifikasi` int(11) NOT NULL AUTO_INCREMENT,
  `judul_notifikasi` varchar(255) NOT NULL,
  `isi_notifikasi` varchar(255) NOT NULL,
  `tgl_notifikasi` date NOT NULL,
  `wkt_notifikasi` time NOT NULL,
  PRIMARY KEY (`id_notifikasi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of notifikasi
-- ----------------------------

-- ----------------------------
-- Table structure for `pasien`
-- ----------------------------
DROP TABLE IF EXISTS `pasien`;
CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pasien` varchar(255) NOT NULL,
  `nik_pasien` varchar(255) NOT NULL,
  `tmpt_lahir_pasien` varchar(255) NOT NULL,
  `tl_pasien` date NOT NULL,
  `jk_pasien` varchar(255) NOT NULL,
  `alamat_pasien` varchar(255) NOT NULL,
  `telp_pasien` varchar(255) NOT NULL,
  `nama_pemesan` varchar(255) NOT NULL,
  `telp_pemesan` varchar(255) NOT NULL,
  PRIMARY KEY (`id_pasien`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of pasien
-- ----------------------------
INSERT INTO `pasien` VALUES ('1', 'ratu', '3217', 'bdg', '2024-06-02', 'Perempuan', 'jl. setbud', '0812', 'ica', '0899');
INSERT INTO `pasien` VALUES ('2', 'faya', '3217', '1bdg', '2024-06-03', 'perempuan', 'jl. setbud', '0898', 'ratu', '0988');

-- ----------------------------
-- Table structure for `pembayaran_akhir`
-- ----------------------------
DROP TABLE IF EXISTS `pembayaran_akhir`;
CREATE TABLE `pembayaran_akhir` (
  `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT,
  `id_rekmedis` int(11) NOT NULL,
  `id_metode_pembayaran` int(11) NOT NULL,
  `total_harga` varchar(255) NOT NULL,
  `id_status_pa` int(11) NOT NULL,
  PRIMARY KEY (`id_pembayaran`),
  KEY `fk_rmedis` (`id_rekmedis`),
  KEY `fk_metode` (`id_metode_pembayaran`),
  KEY `fk_status` (`id_status_pa`),
  CONSTRAINT `fk_metode` FOREIGN KEY (`id_metode_pembayaran`) REFERENCES `metode_pembayaran` (`id_metode_pembayaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rmedis` FOREIGN KEY (`id_rekmedis`) REFERENCES `rekam_medis` (`id_rekammedis`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_status` FOREIGN KEY (`id_status_pa`) REFERENCES `status_bayar_akhir` (`id_bayar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of pembayaran_akhir
-- ----------------------------
INSERT INTO `pembayaran_akhir` VALUES ('5', '1', '1', '500000', '2');
INSERT INTO `pembayaran_akhir` VALUES ('6', '2', '2', '750000', '2');
INSERT INTO `pembayaran_akhir` VALUES ('7', '3', '1', '1000000', '1');
INSERT INTO `pembayaran_akhir` VALUES ('8', '4', '3', '600000', '2');

-- ----------------------------
-- Table structure for `rekam_medis`
-- ----------------------------
DROP TABLE IF EXISTS `rekam_medis`;
CREATE TABLE `rekam_medis` (
  `id_rekammedis` int(11) NOT NULL AUTO_INCREMENT,
  `id_invoice` int(11) NOT NULL,
  `bb_pasien` int(11) NOT NULL,
  `tekanan_darah` varchar(255) NOT NULL,
  `hasil_diagnosa` varchar(255) NOT NULL,
  `resep_obat` varchar(255) NOT NULL,
  `id_status_bayar_akhir` int(11) NOT NULL,
  PRIMARY KEY (`id_rekammedis`),
  KEY `fk_invoice` (`id_invoice`),
  KEY `fk_status_bayar` (`id_status_bayar_akhir`),
  CONSTRAINT `fk_invoice` FOREIGN KEY (`id_invoice`) REFERENCES `invoice` (`id_invoice`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_status_bayar` FOREIGN KEY (`id_status_bayar_akhir`) REFERENCES `status_bayar_akhir` (`id_bayar`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of rekam_medis
-- ----------------------------
INSERT INTO `rekam_medis` VALUES ('1', '1', '70', '120/80', 'Migrain', 'Paracetamol 500mg', '1');
INSERT INTO `rekam_medis` VALUES ('2', '2', '65', '110/70', 'Gastritis', 'Antasida tablet', '2');
INSERT INTO `rekam_medis` VALUES ('3', '3', '80', '130/90', 'Bronkitis', 'Amoxicillin 500mg, Sirup obat batuk', '1');
INSERT INTO `rekam_medis` VALUES ('4', '4', '75', '125/85', 'Artritis', 'Ibuprofen 400mg', '2');

-- ----------------------------
-- Table structure for `spesialis`
-- ----------------------------
DROP TABLE IF EXISTS `spesialis`;
CREATE TABLE `spesialis` (
  `id_spesialis` int(11) NOT NULL AUTO_INCREMENT,
  `nama_spesialis` varchar(255) NOT NULL,
  PRIMARY KEY (`id_spesialis`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of spesialis
-- ----------------------------
INSERT INTO `spesialis` VALUES ('1', 'Dokter Umum');
INSERT INTO `spesialis` VALUES ('2', 'Dokter Mata');
INSERT INTO `spesialis` VALUES ('3', 'Dokter Obgyn');
INSERT INTO `spesialis` VALUES ('4', 'Dokter THT');
INSERT INTO `spesialis` VALUES ('5', 'Dokter Anak');
INSERT INTO `spesialis` VALUES ('6', 'Dokter Gigi');
INSERT INTO `spesialis` VALUES ('7', 'Dokter Kulit dan Kelamin');
INSERT INTO `spesialis` VALUES ('8', 'Dokter Jantung');
INSERT INTO `spesialis` VALUES ('9', 'Dokter Neurologi (Otak dan Saraf)');
INSERT INTO `spesialis` VALUES ('10', 'Dokter Urologi');
INSERT INTO `spesialis` VALUES ('11', 'Dokter Gizi');
INSERT INTO `spesialis` VALUES ('12', 'Dokter Ortopedi');
INSERT INTO `spesialis` VALUES ('13', 'Dokter Bedah');
INSERT INTO `spesialis` VALUES ('14', 'Dokter Bedah Onkologi');
INSERT INTO `spesialis` VALUES ('15', 'Dokter Anestesi');
INSERT INTO `spesialis` VALUES ('16', 'Dokter Bedah Vaskular');
INSERT INTO `spesialis` VALUES ('17', 'Dokter Akupuntur');
INSERT INTO `spesialis` VALUES ('18', 'Psikiatri');
INSERT INTO `spesialis` VALUES ('19', 'Psikologi');
INSERT INTO `spesialis` VALUES ('20', 'Dokter Bedah Toraks');

-- ----------------------------
-- Table structure for `status_bayar_akhir`
-- ----------------------------
DROP TABLE IF EXISTS `status_bayar_akhir`;
CREATE TABLE `status_bayar_akhir` (
  `id_bayar` int(11) NOT NULL AUTO_INCREMENT,
  `lunas_tidak` varchar(255) NOT NULL,
  PRIMARY KEY (`id_bayar`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of status_bayar_akhir
-- ----------------------------
INSERT INTO `status_bayar_akhir` VALUES ('1', 'Lunas');
INSERT INTO `status_bayar_akhir` VALUES ('2', 'Belum Lunas');

-- ----------------------------
-- Table structure for `status_checkin`
-- ----------------------------
DROP TABLE IF EXISTS `status_checkin`;
CREATE TABLE `status_checkin` (
  `id_checkin` int(11) NOT NULL AUTO_INCREMENT,
  `status_checkin` varchar(255) NOT NULL,
  PRIMARY KEY (`id_checkin`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of status_checkin
-- ----------------------------
INSERT INTO `status_checkin` VALUES ('1', 'Check In');
INSERT INTO `status_checkin` VALUES ('2', 'Batal Check In');

-- ----------------------------
-- Table structure for `tahapan`
-- ----------------------------
DROP TABLE IF EXISTS `tahapan`;
CREATE TABLE `tahapan` (
  `id_tahapan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_tahapan` varchar(255) NOT NULL,
  PRIMARY KEY (`id_tahapan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tahapan
-- ----------------------------

-- ----------------------------
-- Table structure for `token`
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `access_token` varchar(450) NOT NULL,
  `refresh_token` varchar(450) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`access_token`),
  KEY `fk_user` (`user_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1Njc2MjUsInN1YiI6IjkifQ.8EzUwUbUu4Olgsjl9mI665eq1Fn-UeYwrcniP8qg8qw', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzA2MjUsInN1YiI6IjkifQ.ygyDibihSVTmOBM7KWEHLapHgc2U3UxuC7URxsRelHs', '1', '2024-06-05 12:37:05');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1Njc3NjgsInN1YiI6IjkifQ.KSN8yRv40KGv2FIDPse-lY6c_R_loylq-_stN2V5dLE', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzA3NjgsInN1YiI6IjkifQ._0SHKbNJSrGO0lknOZl-UMPysbPfKn4bSYf_p6qa-4Q', '1', '2024-06-05 12:39:28');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1Njc4MTIsInN1YiI6IjkifQ.n5AsZ7k9gEynil1GjYpxqwRrNkjfR9pGRyPXtOlrAp4', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzA4MTIsInN1YiI6IjkifQ.v2ZHU6OqCu0XCxbqgMsJKPevn_tQKAQbM9vK_7WL7TE', '1', '2024-06-05 12:40:12');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1Njc4NDQsInN1YiI6IjkifQ._UghEY1MhqP51gIJuj8a3NxDK5HQNyt0byxoih13AqE', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzA4NDQsInN1YiI6IjkifQ.KkF5ZYzDEA5AkBP--qMrFw3M_Ro6YYDKrdfxZqJfXys', '1', '2024-06-05 12:40:44');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1Njg3NzgsInN1YiI6IjkifQ.A0EkHqNcmDTirK83bFEzXPxnCPmAmnId8iqs_Qapyqo', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzE3NzgsInN1YiI6IjkifQ.p74Z-LQ8w66YCUQnYefsVmpgV9E2fpVtt9QQxYHwrPg', '1', '2024-06-05 12:56:18');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1Njg4MTgsInN1YiI6IjkifQ.LGEReiEL8etkxnZwTAjRbISJJohRN_tl7_CRm32VNPw', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzE4MTgsInN1YiI6IjkifQ.oh3d4SqRSnVSJ5EaaVmnGQ7k2-d8Gs8n5-uoe6D9Gzs', '1', '2024-06-05 12:56:58');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NjgxMzYsInN1YiI6IjkifQ.9W192jWqZ2SzXpOglTsutcokh7HEWnFLqssVuxkDkMA', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzExMzYsInN1YiI6IjkifQ.k7rcC5ttSIeur7aghqSqm39S7pMqbcXM2ALpWpl0McI', '1', '2024-06-05 12:45:36');
INSERT INTO `token` VALUES ('1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NjgyNDEsInN1YiI6IjEifQ.o5J0DYAemzDw6vGUAalZqMAHg7q1IYfaqH28k5RXSqk', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzEyNDEsInN1YiI6IjEifQ.CwNpwij-BarCmPv_5oYW9zWQ4olRuk3UPCajZ5eSTW8', '1', '2024-06-05 12:47:21');
INSERT INTO `token` VALUES ('1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NjgyNjIsInN1YiI6IjEifQ.lV5U-zjxJ4XKBG6l4ReebLP2fBLsu1J3to52dSyQeXo', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzEyNjIsInN1YiI6IjEifQ.6Z7nQoGpHaex5fak4uNWkJ8rLzZqplIi-fisgF1hyxI', '1', '2024-06-05 12:47:42');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1Njk0MzIsInN1YiI6IjkifQ.6qgb2ssA9fRff1rqlbN3RzW728CmP32Q1X3KZNmVJmA', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzI0MzIsInN1YiI6IjkifQ.mOxNok3POQMupJscrUJY1Cb4TZ2ydSG3XNXw_ltEuII', '1', '2024-06-05 13:07:12');
INSERT INTO `token` VALUES ('1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NjkzODEsInN1YiI6IjEifQ.W5XYX2dtNsw1C7QGvcIAtBNAJkiuMA697CbaIwuBOFE', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzIzODEsInN1YiI6IjEifQ.w8iIzUfP61JwgwlpAvTlu5RU7ZVRSve7y3KCR7rGsBY', '1', '2024-06-05 13:06:21');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NjM1NTQsInN1YiI6IjIifQ.RtJC1m04oFizAeZUEh3ghqRD6YciAzxxKqUXR2DkMW8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNjY1NTQsInN1YiI6IjIifQ.RpWYOo70psJWHs1jrYjJ2L4X1L7lFtTLjooePe2f6J4', '1', '2024-06-05 11:29:14');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NjM2NzcsInN1YiI6IjIifQ.eqfdTRLuubiW5RUAkMcuXXe0bIgeYOgCaSJHk0PAU5g', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNjY2NzcsInN1YiI6IjIifQ.Fj9WZFI9z_KZkb0nOy0xYMXVvLW00dzMlHFGmpfZhsc', '1', '2024-06-05 11:31:17');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NjM4NzUsInN1YiI6IjIifQ.g1oVzs3Jn5wHTsJyuhn03xgV5fm0GBkG3Wr4nf-dcx8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNjY4NzUsInN1YiI6IjIifQ.txB1aNc_jfN6vr6j_zGomZQXdjH8rHDCF3dC0PQGfD4', '1', '2024-06-05 11:34:35');
INSERT INTO `token` VALUES ('1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NjMzNjksInN1YiI6IjEifQ.yls1zCnEIgKF15XNX-OnWdiBEHxDs4kmnbUhlKE54-w', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNjYzNjksInN1YiI6IjEifQ.NxWyEputQa1RNfpXcas54fpxcpIDAXrMS1nKaI4TMU8', '1', '2024-06-05 11:26:09');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NjU3NzEsInN1YiI6IjkifQ.C0Cv6h1rgkZ3jo-DGTw8iU65W9DYIe33shbu91LT9zI', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNjg3NzEsInN1YiI6IjkifQ.pTIoRiPkm4RhkKZ2_vKuAKSXVb2bsBtDzNNw7xVpfvg', '1', '2024-06-05 12:06:11');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NjUxMzIsInN1YiI6IjkifQ.dIDQhh2BZZIoB5GiLAZW0yAZqvbLs_nhUH_MOnj9mz4', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNjgxMzIsInN1YiI6IjkifQ.6IbD8AF9bPko6yAx81ka3NHN1-Z9IOC4JJ1BvQHVGCU', '1', '2024-06-05 11:55:32');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NjUxOTMsInN1YiI6IjkifQ.iZ2fqi_cqrvSZQIRCwc-iXE_vhgA1N7HL9Ba6U7VDGE', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNjgxOTMsInN1YiI6IjkifQ.RhP1iJ1wHEIQHTYT3I19UgvDNkcpUAn-660ZNJA4wdw', '1', '2024-06-05 11:56:33');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NjYxNjUsInN1YiI6IjkifQ._CJU1Sjr8FSohXHEvNk51T5B6OHrSh_o1RjySw61BwA', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNjkxNjYsInN1YiI6IjkifQ.m7RgGL6r_L2W0YqaN1d8phMMRkQpBHBBZL2BPeL5YjE', '1', '2024-06-05 12:12:46');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NTQ3ODAsInN1YiI6IjIifQ.fnDIJMbV6RIYo9ogUHBhGtbSo8BVC8nbPKl2tHw0wUw', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNTc3ODAsInN1YiI6IjIifQ.Ckbn_cRoicDSRzcHzkzGyJXGbUMvg9pQL6FRmxy9_NA', '1', '2024-06-05 09:03:00');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NTQ5MzYsInN1YiI6IjIifQ.6dQ40_MpbcSQIX250gWbWc12PQM2Z_VGllW5bxdGjAI', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNTc5MzYsInN1YiI6IjIifQ.zdD-wMXt7moSkmq3lZROttuEfLNRNFMELbMP0hHnA0A', '1', '2024-06-05 09:05:36');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NzcwMzUsInN1YiI6IjkifQ.eZ3DxxaQm9zM1yHM-vastt-4hOqMSo9OxLVwtViZ4to', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxODAwMzUsInN1YiI6IjkifQ.BwZX9BgkKqSV_HGW32c-azWHMlQcer_0U6PuA_9Z3S8', '1', '2024-06-05 15:13:55');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NzI3NTYsInN1YiI6IjkifQ.aQ7U3ogr5cd70ptl43QVHVACvlj4I8X-MPDV1ebH7xc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzU3NTYsInN1YiI6IjkifQ.80hdhO9X_N9p_Oh06N16EVdVGvrI1LloAIGkcTjAZUE', '1', '2024-06-05 14:02:36');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NzI4NzQsInN1YiI6IjkifQ.dGwbeY-6EvdQPZdgO7TA7rSYBBX_XRH9QehsTt1ISfI', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzU4NzQsInN1YiI6IjkifQ.5F-em1JZOMDFdv85NMT0s2iFZliFvKPRApfTjIsASWY', '1', '2024-06-05 14:04:34');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NzMwNTksInN1YiI6IjkifQ.E9zWZk7ckeP9uZCut8j4G4OzcmJ_ituZKQRqR6CyfEk', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzYwNTksInN1YiI6IjkifQ.68ZXZLoG8AzOBVcZoEKQf8DBMngt8bfSdiKKfUIIlGU', '1', '2024-06-05 14:07:39');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NzQ2NDYsInN1YiI6IjkifQ.JLVFEYyvL2yjJ_h8pFLDP6ayA2zRZakbs2BWwJ505Yk', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzc2NDYsInN1YiI6IjkifQ.pg9O70mTcG4ukk38wB_Nc6KPlU9vMg5LQ3adchYKH0Y', '1', '2024-06-05 14:34:06');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NzQ2ODIsInN1YiI6IjkifQ.ClJwxlrwNN6xET3K3oApJVzPcLXhIAOkic-3RbMabnc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzc2ODIsInN1YiI6IjkifQ.8b9tTAwh5FQmy_CNesVU--NL28l3l3H0NShknCrzzOQ', '1', '2024-06-05 14:34:42');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NzQ3MjEsInN1YiI6IjkifQ.j0M6L_ixkHtgqp-mOc-qAhgyVNYZ0NLE_6VO63ZSLMc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzc3MjEsInN1YiI6IjkifQ.xlrXggsmvMYbifFuGIQ7jWxEIGg7ucyAs92BIdncySA', '1', '2024-06-05 14:35:21');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NzU0NzIsInN1YiI6IjkifQ.8-i85pev_rfyGNJbazkAYUj6GiGe79-_k_VgswCOimc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzg0NzIsInN1YiI6IjkifQ.lIgtErOfI6nTK629mKsTxw4b5DcXNaRsv9beuTGBDlw', '1', '2024-06-05 14:47:52');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NzU1NjksInN1YiI6IjkifQ.qbT6wphzCP6sfzQ0drGgYcSfxOpM-InJG6wL2quZKlc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzg1NjksInN1YiI6IjkifQ.qZoguhy_vz6l3bHdSKk4d8DqOVDjT-fvuupRkCWbIzw', '1', '2024-06-05 14:49:29');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NzU5NTUsInN1YiI6IjkifQ.ddTWbo6KXnTLN0AVLzeszWrvteS53zbSDQRCjBTYyOs', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzg5NTUsInN1YiI6IjkifQ.Jj22Ag2agNSCZMHfp3M5go5sWc5n8S48b_fClaBfSXs', '1', '2024-06-05 14:55:55');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NzUyNzIsInN1YiI6IjkifQ.eLvKIogDM25Fd2IfrtddK_5UYnpXTRZTv4wF0CHROso', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzgyNzIsInN1YiI6IjkifQ.CvkO6AupUNBSpxYLZhNLb7vm0m1XgefnN3ID2SqzN3k', '1', '2024-06-05 14:44:32');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NzYwMTYsInN1YiI6IjkifQ.-l4oT3AKkr5xuE2Ir-Sv8aqdStlruL7bxSwTH_ZCo6k', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNzkwMTYsInN1YiI6IjkifQ.j9iJbsmf6uh29RWWgiI07imAYDfEU5Sat2Wt8sjB1TE', '1', '2024-06-05 14:56:56');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc3Mjg1NjYsInN1YiI6IjkifQ.NqQfSP_BHuvtVFgFu589iILYsRQtW_3-j5ypNfXe1NA', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgzMzE1NjYsInN1YiI6IjkifQ.Q-LAooEPDIHPOSx0-AtdJsiFTDdQiUnxVLcBfSk0dIg', '1', '2024-06-07 09:19:26');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc3Mjg2NzYsInN1YiI6IjkifQ.ML31nu-sL08X7RuJPtqPhKWUeC1F5-PrCcEwN6BzAb4', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgzMzE2NzYsInN1YiI6IjkifQ.167FYWY6xdWvr8kkicc6qzbyrYhUakWIGuM3gpXvMiE', '1', '2024-06-07 09:21:16');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc3MjgxMzgsInN1YiI6IjkifQ.p3f5iZcnXhGqgEdA_HGclwFzkiT24LWRmHqio1wPyjs', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgzMzExMzgsInN1YiI6IjkifQ.Z69nijsM95f66EAnSYLQZAU5v40m_DKWB6kOl9ZnX2k', '1', '2024-06-07 09:12:18');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc3MjgzOTQsInN1YiI6IjkifQ.RFNas2KiDtl4IOkZjFAGbGmPvEcNsmXmL1z8I2Hb99o', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgzMzEzOTQsInN1YiI6IjkifQ.RUAqymL80iIXaVQxSr38xl1JIt11tFuJnyoDfpPZEJQ', '1', '2024-06-07 09:16:34');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc3Mjk3NzEsInN1YiI6IjkifQ.Se9VZmtX9HnoxoAaweI6nzEJp5dtixsZNMbv-ch8xYs', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgzMzI3NzEsInN1YiI6IjkifQ.ksbD837qra9n_La0wgF83sJjuLyEi4HLO8NJkXMV9Ps', '1', '2024-06-07 09:39:31');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4Mzk4ODEsInN1YiI6IjIifQ.lK-80yN2jTSkdwp_Gx5wc4lpQ8wSXvaHPkr1MGUutmA', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NDI4ODEsInN1YiI6IjIifQ.pc3frZVBxQYoyCxatXCQYSSZL6AtVPUy3CeFHC6G8pg', '1', '2024-06-08 16:14:41');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4Mzk5MjcsInN1YiI6IjIifQ.tIQ1nJhCyp91zn8nA2NJQ0667RHab41sxPf1uLUhROc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NDI5MjcsInN1YiI6IjIifQ.2JXcLXG_hvW4MK6qYnRe4AgBI9ZhgbKwMFSk9HtngvM', '1', '2024-06-08 16:15:27');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4MzQ3NDQsInN1YiI6IjIifQ.9LK-ge-QvuHQQgH_-x7YFhwjRwNCDz69GZO1C5AM2oo', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0Mzc3NDQsInN1YiI6IjIifQ.fUFRSC6qqZWXXUxSRWKokWaA3jqufFytHrT7J-CPJGA', '1', '2024-06-08 14:49:04');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4MzU1MjcsInN1YiI6IjIifQ.vkMc9gcrHhoWRUF_iOgSlakWGQHCX03fOtnssTLd6Z0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0Mzg1MjcsInN1YiI6IjIifQ.KwiLog93ob5dKXVqR1TrjrAPpsSwrkVu3hjqAKrEL8U', '1', '2024-06-08 15:02:07');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4MzU5NDUsInN1YiI6IjIifQ.VKm_cpigZLlol9YAlbPqXaHObPJ-chWWdvELwBzQQ1A', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0Mzg5NDUsInN1YiI6IjIifQ.nFb2ryo4LBJLemjW6ZUOUnHOkTTA1U3Uvga9l9-3HwE', '1', '2024-06-08 15:09:05');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4MzY0MjcsInN1YiI6IjIifQ.Nml_AyFDxSxhti4OBoFfHpe5sewHLSyMWklts9ItU9E', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0Mzk0MjcsInN1YiI6IjIifQ.jhf44vBzTAHUatXfoYOlzdKyzLSGzZMHaCtYQf--4nI', '1', '2024-06-08 15:17:07');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4MzYwNTQsInN1YiI6IjIifQ.jt6PCvoFTie1GRWIEtez9TBgSXGwTtBE8CXezetrhtc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0MzkwNTQsInN1YiI6IjIifQ.P-YPgyQjS043fVciqrCK_KV5fdBX15IBBbifv1xyhe4', '1', '2024-06-08 15:10:54');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4MzYxODcsInN1YiI6IjIifQ.PpiFCtBXBQGGztQa8xL3v5AheWEAUXACL42mEikA4D0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0MzkxODcsInN1YiI6IjIifQ.xjir-3a9PqkFIcRzPP4r90RuFWvx-dJwWursaXbn48M', '1', '2024-06-08 15:13:07');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NDA0NjUsInN1YiI6IjIifQ.17cpLO79zkraL_g695I5GZu-t9J7uaGzen-nwKpFi5Q', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NDM0NjUsInN1YiI6IjIifQ.AqnHh5re2yGRW_TDYTQRHfjqAM2LCaIksoQwUViTRLw', '1', '2024-06-08 16:24:25');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NDA3OTIsInN1YiI6IjIifQ.XqCbFs4tjzbPr1VaaQKUDXS0fdNfZD0GAm1xdkcnxKc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NDM3OTIsInN1YiI6IjIifQ.ozUq1B9a_TphSR8uyC-slE5-BdwgZqpI48PuzVFksgM', '1', '2024-06-08 16:29:52');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NDA4NDUsInN1YiI6IjIifQ.8XV6gfN_pxYeaB8IclovCNOotlCczywgxyuE7GXMRH8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NDM4NDUsInN1YiI6IjIifQ._1cMamPpqL3IdISPhlDuAVtpM1_MvoWsyJABzm_Tm6c', '1', '2024-06-08 16:30:45');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NDAxMDAsInN1YiI6IjIifQ.O3Wue1vL0luDUvCcWH88l3Ddf6ZUkoQN_9-dfo3HfFo', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NDMxMDAsInN1YiI6IjIifQ.FoEejYn4f8zbs2j7w9zW-hEYmEbgNTdo7sf4lUxrkPc', '1', '2024-06-08 16:18:20');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NDg5NzQsInN1YiI6IjIifQ.HosBmDGN-Ty66iwIN_DliFmUSDX8tRg03gGUzSUvdeM', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTE5NzQsInN1YiI6IjIifQ.dKtI2sAu-o1I5-nyJF1z63sXOX75z8uGjwXQkAp0VBI', '1', '2024-06-08 18:46:14');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NDIwNjUsInN1YiI6IjIifQ.NWtDw1t-jedH9Z1cSxwAVcw36QFiYDFPE1QioqMHuPQ', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NDUwNjUsInN1YiI6IjIifQ.rpyKFESSS-Ck9K5EULUHeNODNetKfQ9WW_i_p2sOeQY', '1', '2024-06-08 16:51:05');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NDk1ODQsInN1YiI6IjIifQ.LOCI4l736ejw7lHYfddQfwTHlGbHQlvyPEeOjlFPL6M', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTI1ODQsInN1YiI6IjIifQ.XU29fNlK9tfjuBWtCKc1cvq1L2rb1c7TXhsbenFbmFY', '1', '2024-06-08 18:56:25');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NDkxMTYsInN1YiI6IjIifQ.o0mFsZ0CeGwfC63Ik-v7Pq13_5lomM7FL_mRzKGxAgE', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTIxMTYsInN1YiI6IjIifQ.2I_Yhw3JLH3rMgZIM2Sdrv8L-YFhngl8iDlOgUHL7Po', '1', '2024-06-08 18:48:36');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NDkyMzgsInN1YiI6IjIifQ.QhGa3xhsSM319BDHIzcDjE935vMtHDcg265GVYpbvHo', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTIyMzgsInN1YiI6IjIifQ.g27Apq2TMWV7Vw36kj6YUOBjA0MaDRDZ-U_j2c2Ie0s', '1', '2024-06-08 18:50:38');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NDQ2NzYsInN1YiI6IjIifQ.GQNB9_ZspMyHT8G7OsdeoZ_snqzd5yIZszc4iNyFRbw', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NDc2NzYsInN1YiI6IjIifQ.fEWf2JKVLz2S0fKboK6geVXUThqG2Lz07oTbcNSleso', '1', '2024-06-08 17:34:36');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NDQ3NjksInN1YiI6IjIifQ.GpmynjYsWG1xEXK2pSoBF6iSLa4zhRDIv7w4xNf9wAk', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NDc3NjksInN1YiI6IjIifQ.1b4Sqn4b5wXxNkk-cOiLX9Ezrjm7HbFQdYMBmQAbDh4', '1', '2024-06-08 17:36:09');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NDQ4NzUsInN1YiI6IjIifQ.3bFoupuSc646YFnZeRIRZsAR7oiAQfI1KphcDFsTCOM', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NDc4NzUsInN1YiI6IjIifQ.RDVIx346BQnyZlhUIPU1-mBFCjq0J2p7HZLpQQ8Bvz0', '1', '2024-06-08 17:37:55');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NDQ5NTYsInN1YiI6IjIifQ.AIgtwRokiJ5h7xQ4xrfn5yeDOjheLxsYgRhuk1adm70', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NDc5NTYsInN1YiI6IjIifQ.YZ_5MadubVKSkw2PeoKnmAN4wi9PVKD6k2M88VMbMic', '1', '2024-06-08 17:39:16');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NDQwOTMsInN1YiI6IjIifQ.joLXjW9PrP3zjVCwvptrLlkng1yIyDCeYQaAEGFRVEs', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NDcwOTMsInN1YiI6IjIifQ.ZJ3NwmoGC2Ye0vg84PBlYMBaRymeuyGSvj6i_GyDo7I', '1', '2024-06-08 17:24:53');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NDUwNzIsInN1YiI6IjIifQ.S6bcgjGCuYjp1Vn_2Dikqods0Llp5LlXm4YsKo3sfRA', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NDgwNzIsInN1YiI6IjIifQ.KURDFKDYBk5mSw5USKoj5mpLYEeFEIG4-pD2pIsWUVY', '1', '2024-06-08 17:41:12');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NDUxMTUsInN1YiI6IjIifQ.fjjZuF362m4rIEgmQHAgB41ptI94xy183GBlOjJ4O74', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NDgxMTUsInN1YiI6IjIifQ.OVgGgSpuOIWzs3VR4S-mPFCbRja4baIpNEA_VKN3IHE', '1', '2024-06-08 17:41:55');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NjExMDAsInN1YiI6IjIifQ.83lET2RPge5KDq_XEFVIQ2Wl2p8LsXXa64RQseCjH00', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NjQxMDAsInN1YiI6IjIifQ.akM5iEElf-KQ3QLQ3ILZcU5Z-nNFqVHDwL19RELFSA8', '1', '2024-06-08 22:08:20');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NjEyMjcsInN1YiI6IjIifQ.laxN2oaCSxmXkmH5J2fFp32ZL9plh9rXt9hPz_VarDc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NjQyMjcsInN1YiI6IjIifQ.XpitxrdemvJ__edAw_4QxG4-u97VUZfNmAHuDvugaF8', '1', '2024-06-08 22:10:27');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NjI2MzMsInN1YiI6IjIifQ.t6tWdTosnwcrioYJKgCrLNDfVWJT31DNe9cBB9KNFjo', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NjU2MzMsInN1YiI6IjIifQ.vhAa7GK9YZi1rKSd6AVfILv2oBJAsjSlsQJcZrt_bcg', '1', '2024-06-08 22:33:53');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NjI3MzQsInN1YiI6IjIifQ.T4PWMrnQOvyNTHi-rmmMJ127jxrIL1JNjH6EAnB-fWc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NjU3MzQsInN1YiI6IjIifQ.9fAS9QEB_zLCgtm92FArtJgktVFnRYBl3M-Yn6KiRPc', '1', '2024-06-08 22:35:34');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NjIwNzksInN1YiI6IjIifQ.6WDxc7GuV8HRHexGjWkr1f-MkMdt9N2vxWOHrDiF_ss', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NjUwNzksInN1YiI6IjIifQ.VoVlo82PwD9ohGr7-0w7I9PkdGIiyp4bKek8ZHJOusE', '1', '2024-06-08 22:24:39');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NjIyODcsInN1YiI6IjIifQ.ypj5p2r3h-w17sBpwK1AnwAdck3Yg4SHtG7h6C-hTHQ', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NjUyODcsInN1YiI6IjIifQ.9qeQQlgWzU3y5irRJYuf_0K819A2ZS0lD0WmDzb-aEE', '1', '2024-06-08 22:28:07');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NjM0MTAsInN1YiI6IjIifQ.UNAyCzSVsOoBMgyFkL85XH9RSL-ocAbYd9o3KAa-Ftc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NjY0MTAsInN1YiI6IjIifQ.jMiYAyU66SD6cNHwkcayoYBOwcaxjRx25MWmoK3VxBk', '1', '2024-06-08 22:46:50');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NjM3MTUsInN1YiI6IjIifQ.0zQw-v0weKsZArVnri2MValFOCIHr_O6dXBZ-dpR_fI', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NjY3MTUsInN1YiI6IjIifQ.rC4LYGRWnE2lJqTOGfiurQuM3B4edeBt7OO8YkwSPVk', '1', '2024-06-08 22:51:55');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NjM5ODgsInN1YiI6IjIifQ.vlsNSWphR5Wk-_krOTIdsm_HWYMEEjrfG52Vj8Pe290', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NjY5ODgsInN1YiI6IjIifQ.xtWZd1R-Xpt-ae7ejEsvMYkeKtskATDWXaCFmydbuJE', '1', '2024-06-08 22:56:28');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NjMxMzAsInN1YiI6IjIifQ.Z4KNxHFVXT9NThfyWQzgypYviwGkq0F0dA-fE9LtHFI', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NjYxMzAsInN1YiI6IjIifQ.eApw2xJHNIrY04WCDSPunC-RplkO9PPxk2Az07VKssA', '1', '2024-06-08 22:42:10');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NjQ0NzMsInN1YiI6IjIifQ.qcSC6iXRK4lHW9PvMVvXSHgrDwmG9Zl8InxJxSsIvl8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0Njc0NzMsInN1YiI6IjIifQ.tGwUyNqNJyBlMkJn3sFF2bHRlPSfc6cVER-2gVrv1qE', '1', '2024-06-08 23:04:33');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NjQ1MjYsInN1YiI6IjIifQ.O0L1WwFwXtKEOyX9Gm6TinMHhtBNChdUfL0Puu-TTVg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0Njc1MjYsInN1YiI6IjIifQ.fkqzWkkHsVU9LN6IDeAFaAPgrlp3T7ccrxw_u7XrK7U', '1', '2024-06-08 23:05:26');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NjQ4MTMsInN1YiI6IjIifQ.od7T4OwVl1TCdNUmFliU3iw7lzsBL7c-5Qk6U8pfNbA', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0Njc4MTMsInN1YiI6IjIifQ.b2Mm4T3yFVUfsE-1nton_ep7d-jJwQhkaveEMolXifA', '1', '2024-06-08 23:10:13');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NjQ5MTMsInN1YiI6IjIifQ.ascpNEAsJ052f_HKxgNxrBRbLHhntPgrcJkb-bwBgtw', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0Njc5MTMsInN1YiI6IjIifQ.l_Jl1Ukfvd5e8JKfYoyJGK8sGUSq6zUUpDHtTH7Ayk0', '1', '2024-06-08 23:11:53');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTE0NTUsInN1YiI6IjIifQ.dK-Zyql6imC9b_-MhOo4jIdIkhxHhXbpBkhoed9cFvA', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTQ0NTUsInN1YiI6IjIifQ.l8U81U1smzBpcQojkFeJvnWn5-b0aaUw6oqnZ5J4m0s', '1', '2024-06-08 19:27:35');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTE2MDAsInN1YiI6IjIifQ.MRM0zUVAaIc0R09ZfrVA53q-eFhjJnn14TXUZpnf6as', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTQ2MDAsInN1YiI6IjIifQ.TUZmPc6RScL_f1sSQSMdUiZRc07cfMVIxvldTd7jgpg', '1', '2024-06-08 19:30:00');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTExODUsInN1YiI6IjIifQ.pE2JV23F5_428Z-faLp1tk_UcAH0EdZb2tnDMhQpH-A', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTQxODUsInN1YiI6IjIifQ.cSUku7j64fki9_vXCO4yvKwd3WDAq6BNrFnpKGm8j00', '1', '2024-06-08 19:23:05');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTEyMzYsInN1YiI6IjIifQ.gwygI36iym-IL4VDj8rt-xoM9DG1PZr7_DmS-PNwwck', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTQyMzYsInN1YiI6IjIifQ.XuY80Xb5kKAL0J3mdI13pQydORMGP0SYKrYlpNU6_aM', '1', '2024-06-08 19:23:56');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTEzMDMsInN1YiI6IjIifQ.iOyAJxLO0jlme1jGk4pQcbTZOjAqdF8TWAiZPbmWTAQ', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTQzMDMsInN1YiI6IjIifQ.yq6WBn3Bc0rDDaplDjTEhDDe-_syaDFTx5RH30Se0Uo', '1', '2024-06-08 19:25:03');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTg5ODgsInN1YiI6IjIifQ.luV4gVWf0BrvafEaDz4WFilWHQL-lkDVkAsqlNEliQY', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NjE5ODgsInN1YiI6IjIifQ.yYfv7aOBPKt3d_39OQIi2j21pd1TzwJn9HCgv2zgOKU', '1', '2024-06-08 21:33:08');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTI3MjYsInN1YiI6IjIifQ.TO_HzlS_enZCpUjuN5P4LXzRpQtOINyhsGcSe4_3Fwc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTU3MjYsInN1YiI6IjIifQ.y_c-p73QsHZdJb1mrlWihbWJd38VtCsMMKZzKmekv3M', '1', '2024-06-08 19:48:46');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTI3ODYsInN1YiI6IjIifQ.0D0YJ8LlNrlSPzqw9ZijfV4cHONoAVaAL1WZi4JQ1N0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTU3ODYsInN1YiI6IjIifQ.Tv9GUiKwRFU4F0P9TWoa7SpfCT4Wx2HWJtbDFAMDN0Q', '1', '2024-06-08 19:49:46');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTI5MDYsInN1YiI6IjIifQ.HhgGKSHCGTsFnv5B3SSuAUiVkBGrvNbMoeENwBRCihM', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTU5MDYsInN1YiI6IjIifQ.XEA0T-NUycEI93rjSrUA39XKmGZGRVGzg_sCBVY6QWk', '1', '2024-06-08 19:51:46');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTkxMDYsInN1YiI6IjIifQ.u0vRRZeSQWrbTlwVbmcOkvIwjSmHkH4X1oCwvxP94RE', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NjIxMDYsInN1YiI6IjIifQ.MBFkd3TrNtEH7B1Lak6weRjO52fhRekTtXoRarig2Z0', '1', '2024-06-08 21:35:06');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTM3MDcsInN1YiI6IjIifQ.nS2DnKfLfKPgfiVMwPiS6REp4HDllNkTniAMXehfCh8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTY3MDcsInN1YiI6IjIifQ.zQI-JlqdGEqWLIS3IE1UDX3pnCdUd16ZtZI8PjXQBgA', '1', '2024-06-08 20:05:07');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTMwMTUsInN1YiI6IjIifQ.U6Vx3-mljq_AnUFMCKSDShH9fTSelvqOzc5mmJSNSAk', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTYwMTUsInN1YiI6IjIifQ.jq2n6unpNuCw-fu5Mrdrt85pcEAVYuHTsxgCRz-Sd_4', '1', '2024-06-08 19:53:35');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTMxMjMsInN1YiI6IjIifQ.MwX54s0iUsIAeVVR18ZtggfAc8_eAIEY9mK4aTHKDbU', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTYxMjMsInN1YiI6IjIifQ.8eIWh48wLJ-LeIgoqaqrh1NFMnG1n2JH-VqnOrYMbNQ', '1', '2024-06-08 19:55:23');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTMzMjEsInN1YiI6IjIifQ.F4cbVeOdUnIJ2NCCOFlVHl13YcqkkpiDWBa_4oIyay8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTYzMjEsInN1YiI6IjIifQ.0Tn_6FutJw0ZqadDyF6pBEI3s26yWR70Ym12ui3jdNQ', '1', '2024-06-08 19:58:41');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTQ5NzYsInN1YiI6IjIifQ.5Lto9TIdvleByH52zV7CfXBZ0rIazdTgAwC7Y4JyhFQ', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTc5NzYsInN1YiI6IjIifQ.PIREXh5Ewgi64xwtpKxJtKVnhyPcBo_34_Cuov6tDl0', '1', '2024-06-08 20:26:16');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTQxODQsInN1YiI6IjIifQ.HzgxR5M29p5ITrEzWXybnZ3Lv51PyEFqkwwG-3yduuk', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTcxODQsInN1YiI6IjIifQ.1HFvY3obSH7YdDII_o2vN-tJ1bfJO0GvVFbe6IPS6IM', '1', '2024-06-08 20:13:04');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTQzNTQsInN1YiI6IjIifQ.Y73m_298EdlPHu1GzkC3wJ6xNAXAXW2Ojat8BwA3YUk', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTczNTQsInN1YiI6IjIifQ.ScJFnvTGfOXTDcGkU6ukSP4cEuBbV4Ys2jLP1rCWvhM', '1', '2024-06-08 20:15:54');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTU1NjYsInN1YiI6IjIifQ.ZNJfnhVqSgsns4UaOp2U-K5E4REvykqwd7BXfx-uEAI', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTg1NjYsInN1YiI6IjIifQ.1rc7byLcS4bjowjVNpWI3Yr_sSqLMx9HBIxDGuAJ3EI', '1', '2024-06-08 20:36:06');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTU3MTIsInN1YiI6IjIifQ.oS1S9DkajvJOZhJ7VwgwgADE68IJl-V6SzWAZ60_1zY', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTg3MTIsInN1YiI6IjIifQ.brw8Z8e3H5wZSzxDlSOBeYr3qQEebGkjm2ZTZ--IFJI', '1', '2024-06-08 20:38:32');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTU3ODYsInN1YiI6IjIifQ.Yw7IGSoiGdi-EqR7DGSLii3_Yi_dky_XD3qac0Q45rE', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTg3ODYsInN1YiI6IjIifQ.JM6cJ-rEZU1efJ9bRugsJV_E5WLmvAgSBXIdbn5u0Lc', '1', '2024-06-08 20:39:46');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTU5NjQsInN1YiI6IjIifQ.Z0yjtHILmlKUkk6XXHP4Z6AhVoSAr5r3dpa11k2OCjg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTg5NjQsInN1YiI6IjIifQ.900ihSIdfdQtNhh_JfJQAF2NxuMMpGArAwgDsRyEt1Y', '1', '2024-06-08 20:42:44');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTUxMzksInN1YiI6IjIifQ.6CgCHCt06y3OIB75KUaxPnjql-iiZxumm2Jv3NRwGW0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTgxMzksInN1YiI6IjIifQ.tDFb4iIQ3Vd58u6DG3aJniFIKpv5pLdYcU1D50fHvJ8', '1', '2024-06-08 20:28:59');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTUyODYsInN1YiI6IjIifQ.EwQ6dpz-PBm_NEnVEgh7dYgynhVBuK2Y1czVNthGeGU', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTgyODYsInN1YiI6IjIifQ.ZK2-Qg7J2Jgn8ksZQ-LcGhn2OlpHXM43BcVHVD83VkY', '1', '2024-06-08 20:31:26');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTY0NTgsInN1YiI6IjIifQ.bynFmCD4jGM640xQX7wVjjPeIj0QuyRhp_eJHsHPX8o', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTk0NTgsInN1YiI6IjIifQ.fA00DEKbck2HAK3MBdOnPiRxhiLTJU016Dw6hhHyBcM', '1', '2024-06-08 20:50:58');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4NTY2NTgsInN1YiI6IjIifQ.H-UYB-LhNes7QckuuC5vZK4L76NVVkX3j6sSLokig9o', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg0NTk2NTgsInN1YiI6IjIifQ.7K_Fu0P9PsnmfqD62vq0gxW2kFmhzz0zp9MTUUYemr4', '1', '2024-06-08 20:54:18');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTcyMjYzNTIsInN1YiI6IjIifQ.qLP-y361KX_k4LYe81gfNCukYw5egd8gKi42s0mEISE', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4MjkzNTIsInN1YiI6IjIifQ.yNoa1E7SVzhIFyjJHanW3nnrfivaPqfUJJvh_XAs6W8', '1', '2024-06-01 13:49:12');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTcyMTE1NDcsInN1YiI6IjIifQ.SUyk719ZtPZLq8I5OAdlXTuJ_1BKPfSDpT-vZEtQ1Tk', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4MTQ1NDcsInN1YiI6IjIifQ.TxFUCQFiFdSLqH3mTFXo8k7nBc7xU_FIz-y6eRDvFKw', '1', '2024-06-01 09:42:27');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTcyMTI2NzIsInN1YiI6IjIifQ.ddC0gpT7pSbjLFLeWVoFKvOmq2dS55p_Khhnb6xMKA8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4MTU2NzIsInN1YiI6IjIifQ.jZ6mpTzuVB6TMmRXAGgObLDMKMgmumPCPeuO8HqL5Vk', '1', '2024-06-01 10:01:12');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTcyMTI4MjcsInN1YiI6IjIifQ.YsGgyt3C9B9qBD9gqsaDzyWr34fgl_8GMKfZ19j-x3w', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4MTU4MjcsInN1YiI6IjIifQ.Q6xSQr1u4g6LefU7r2AE2hWrcPu9l3DSsLsJmPvAPmk', '1', '2024-06-01 10:03:47');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTcyMTQ2NjgsInN1YiI6IjIifQ.yawo3B-ORdSG7KX2F8Z5KBlK1joFuIKRYuoRAYx01CU', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4MTc2NjgsInN1YiI6IjIifQ.e74Wh_CPseYXj6e2tP_fHKSX_Ud2WMJXEU-nvxN6q1g', '1', '2024-06-01 10:34:28');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTcyMTQ3MzMsInN1YiI6IjIifQ.wR_WyUcsn5IElq5evp4GWC-_C79P8WEVDhsCFoDVYfA', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4MTc3MzMsInN1YiI6IjIifQ.RhbhvQIL-wfBlozE3x1ipbeEsrbj_5j68xkGxVifs60', '1', '2024-06-01 10:35:33');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTcyMTQ5MDYsInN1YiI6IjIifQ.sCRAd37xWhT0dUSt7agjn2NX5RPT6K_j6EijPSJZZkA', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4MTc5MDYsInN1YiI6IjIifQ.4DD2pWzMQOIE9A4I_lrH_tsqkm4wJXOw-eUM2Mb1de8', '1', '2024-06-01 10:38:26');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTcyMTQ5NjEsInN1YiI6IjIifQ.-FwMG1sz-0l6PWI5jWql6SffcFfSs2XITlMluJNM-7k', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4MTc5NjEsInN1YiI6IjIifQ.WyV_MGA1s0OzNSnoDjDNe4Bb6zziPFWmNpsb9fgvnDY', '1', '2024-06-01 10:39:21');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTcyMTQzMzEsInN1YiI6IjIifQ.fjbI4TIsuJGCBlrg_qej6raY0elCZQxp6ZYwgEyAIHM', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4MTczMzEsInN1YiI6IjIifQ.L9NczRuDCwAEONIqByekNlktk_n5rEutPKS4atOU8Qg', '1', '2024-06-01 10:28:51');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTcyMTY2MDcsInN1YiI6IjIifQ.AbwC5U9JWW7ToKgP5I8o9GvGrWKqAJgPk92bSxPsAxs', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4MTk2MDcsInN1YiI6IjIifQ.8GRs9vjJ_m52mTwZmU28doDATeogDD4NSCSiJDPu3oA', '1', '2024-06-01 11:06:47');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTcyMTY2NzksInN1YiI6IjIifQ.W8CvNHY05BynxtBWLl1Q13KeJP0HMn4X2a8s3BPoYRk', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc4MTk2NzksInN1YiI6IjIifQ.c4wvISplMivXcJNdgaZB5syymG9PV15dMR0GKeAZmoE', '1', '2024-06-01 11:07:59');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTczMjI3MjAsInN1YiI6IjIifQ.vZfnwOT7sFKMAJ3CGy7n6x4PAsRhppQyiYXIMpOOOco', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5MjU3MjAsInN1YiI6IjIifQ.yqHtXAqUl3f79AGEvGqPcNHrqhXQgJRO4X_eNZmkKmU', '1', '2024-06-02 16:35:20');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTczMjI5NTksInN1YiI6IjIifQ.oEUv6oJH-QlGnP7tjekCKO0VgHPyblWlAQdfGy2VfG0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5MjU5NTksInN1YiI6IjIifQ.d2aelPiVBXsGBwczo4-nlI8TW_laDJ-Pwhyv0cZBgKg', '1', '2024-06-02 16:39:19');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTczMzI3OTQsInN1YiI6IjIifQ.qtImIjxVz0cTWC_IhNfKvL17YhI8SMXIQTQ87vJAqyo', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5MzU3OTQsInN1YiI6IjIifQ.j6mp1n7YADzBediilnJ2qjVq2tCqEk1pJzsLby8T2a0', '1', '2024-06-02 19:23:14');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTczMzIwNjMsInN1YiI6IjIifQ.GCHmP3DrUwpNR7-xf-bOZcaEml1kwoFdsbLK_UPvqYg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5MzUwNjMsInN1YiI6IjIifQ.PAZdzozHz_vyUoIQp-YU4uDx33A9JoU2uMgH9bVycoo', '1', '2024-06-02 19:11:03');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTczMzIyNDIsInN1YiI6IjIifQ.bPDwhQmQZiqQSb0qoTYGD7vBoiQRvD5quvUGx-RZ6N8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5MzUyNDIsInN1YiI6IjIifQ.-_Ki6uLkNFTdi8KCUNKiCgJ_qojzQBaWn6b3MZYYEqc', '1', '2024-06-02 19:14:02');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTczMzMwMzEsInN1YiI6IjIifQ.aZ2D-BwOkadHZB20jGzAu2L_qxDEKi93n8Z1hEHcDio', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5MzYwMzEsInN1YiI6IjIifQ.YeZ5St73YzDfhHzVF-Qd_q27HsddNj9zOh_7ePNIhUk', '1', '2024-06-02 19:27:11');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTczODc1MDUsInN1YiI6IjIifQ.48gsiCeEIPft_hmqaycnljweVTzs0S2XHyKL8HTKZ8E', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5OTA1MDUsInN1YiI6IjIifQ.zi4ljrAZgZYRvw_t25-VYLEP5v9XTtPd3nl8IvpsFkg', '1', '2024-06-03 10:35:05');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTczODc2MjUsInN1YiI6IjIifQ.5vkaVtAhKus6glOKl8NJPI_Ja-VAxkRRYNgjOWBtX4A', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5OTA2MjUsInN1YiI6IjIifQ.uFPaS8A4dXBgGmhZocQZiyfVy2_Zc1uMu9m9oVWUP_Y', '1', '2024-06-03 10:37:05');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTczODE0MzksInN1YiI6IjIifQ.0g35Todg8FOaTlPfO9Mt8zHMGauqXFx69LrEVhXzIIM', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5ODQ0MzksInN1YiI6IjIifQ.pgIL_7mJPafR9DRKL-53lfc6MV-FyDv4tRP11uqbTYw', '1', '2024-06-03 08:53:59');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTczODE3ODIsInN1YiI6IjIifQ.E0wqjyZxrF1i8v8kx6P5H7vikYTpKKrPF9PuDSsYBFM', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5ODQ3ODIsInN1YiI6IjIifQ.ig8yET1jvvSQwK5nZuPkGhnK1BGq88a6QslfE-E7Arc', '1', '2024-06-03 08:59:42');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTczODgwMzMsInN1YiI6IjIifQ.bNntZOJlxCffsyBKpuBKTGJZi9-pAfwfCJNMfaEEpi8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5OTEwMzMsInN1YiI6IjIifQ.AG0odaQwiuJhSEAJjZYhXm8GzGlMYcD9arLKSddcmFE', '1', '2024-06-03 10:43:53');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTczODM3MzgsInN1YiI6IjIifQ.O5PTanaxuZWlXTRrfBHmHqOer8P6gE7nGqciBUtLNlA', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5ODY3MzgsInN1YiI6IjIifQ.P_CImaeShSDfqSsXa6MF6-YNPACqkXUrBM_BQqELhWw', '1', '2024-06-03 09:32:18');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTczODQ2MDQsInN1YiI6IjIifQ.WRrJet_QC-Ck7zZUZ42Zbjx8hcj7jkux3hheNL2V3T8', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5ODc2MDQsInN1YiI6IjIifQ.VnK38hptkSEAkBjCSCl3p3thVa43lG-bNIXGYNtJhc8', '1', '2024-06-03 09:46:44');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTczODQ3NjksInN1YiI6IjIifQ.iGUUrm_M9yTfMOb6zX46N2B_n2KMZI4AapUWhj_GOy0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5ODc3NjksInN1YiI6IjIifQ.zrrkusat9skmvHv6rk7ZZM0EeiUg1picoPSUZavTq44', '1', '2024-06-03 09:49:29');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTczODQyMzAsInN1YiI6IjIifQ.cWGbhK1bKytPqoKTC1QdstRpCQPbrlVph_3GAgws4Kw', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5ODcyMzAsInN1YiI6IjIifQ.rwQe2DnnbY64pN_zHcBSEdZpEaMjnrcH5rIY9D1CXSI', '1', '2024-06-03 09:40:30');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTczODU5MTAsInN1YiI6IjIifQ.6_Qsr7X7ATXrPc18cP5kAjHuqLxM9UdST8Jvw8ZFV70', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5ODg5MTAsInN1YiI6IjIifQ.gjiXe24OyDFyr8mFxVnQRUk4Fq2NxL_St27QVUdXChA', '1', '2024-06-03 10:08:30');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTczODY2NDEsInN1YiI6IjIifQ.GQdZ3Ags36gC3Smu372FxVvSpGsbj7FZtTOabzJDmiM', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5ODk2NDEsInN1YiI6IjIifQ.NyAkUMP3ga-j2GUWyWuDCsx_NHAGIvXs0nJt8FzoNaw', '1', '2024-06-03 10:20:41');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTczODY3NjcsInN1YiI6IjIifQ.RzYvfOCBJlBpn7lE--v2N1we1dS8kO0-KGe29-gPvQ0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc5ODk3NjcsInN1YiI6IjIifQ.J8LqByFBWtdLwSkXNwPoNkshx-KEHThvwYZKwEyhfmU', '1', '2024-06-03 10:22:47');
INSERT INTO `token` VALUES ('10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMDc1NTMsInN1YiI6IjEwIn0.4P82UghVVjbXxP0XPaFOPtSonr-i6eRNHlFX9lQQQb0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MTA1NTMsInN1YiI6IjEwIn0.MOFVfL89pVNFAaFrene_KUBVA9Cm6xV5yOWza6yFfCk', '1', '2024-06-10 14:49:13');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMDcxNzksInN1YiI6IjIifQ.u-nPVHtvyrjzQE4ESkKP3NUuJqGIce2ZWyuahWm9mUE', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MTAxNzksInN1YiI6IjIifQ.MhmUAQ7ovNtI2wayrieXccfLHcICfXHRxXx9sfZ34wk', '1', '2024-06-10 14:42:59');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMDE1NjgsInN1YiI6IjIifQ.LUIVglx6Q1AquFdu6_KvXxtfg08qa9QNtJJYwS1HscA', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MDQ1NjgsInN1YiI6IjIifQ.mZwQTWVeH10vRDGr0DC8m8e6sfQ6t07MLt2MNv77_uQ', '1', '2024-06-10 13:09:28');
INSERT INTO `token` VALUES ('10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMDE5NDcsInN1YiI6IjEwIn0.t5uU_DNQcra4tONPPJneY0EJMvhEs357Nyj8Fdrw38U', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MDQ5NDcsInN1YiI6IjEwIn0.YhHJqXCBTY8q1A7Hwiu8Fk654tyXyUJiF-xnF4dRZEo', '1', '2024-06-10 13:15:47');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMDQ0MzAsInN1YiI6IjIifQ.IZqiucES4pAjlWKJA3PLtLcyV4eM1-Opurt42qaMjHc', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MDc0MzAsInN1YiI6IjIifQ.z4vndSpZtA4PPPNVPOyI951Ar8rxOud3a_g9k8yYZQw', '1', '2024-06-10 13:57:10');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMDU1NTAsInN1YiI6IjIifQ.94CKjzlEsPdR62SZYZj4LfdhSgSJuS5dt69L4MWctKk', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MDg1NTAsInN1YiI6IjIifQ.xdTDi-EPQrCjgiNdZggBp41F-FYthGnWPpmpFhOzD1I', '1', '2024-06-10 14:15:50');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMDU2OTEsInN1YiI6IjIifQ.YpXtsaGHYxC3noFZlu3WIHw6QlMg7qqfPPs6-IMx0-A', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MDg2OTEsInN1YiI6IjIifQ.LjAiwk-hMDxfl6VY_ilg5QY8SxmMeCwzPc3IwN0ouMI', '1', '2024-06-10 14:18:11');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMDUzMzgsInN1YiI6IjIifQ.beY0SLr-CGDbgIH9rH1sWbR79UMRwC-EK2dL1aehAtg', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MDgzMzgsInN1YiI6IjIifQ.CcJqo27hr_g28QWeMkFMu3UCq5fInVbjeiSZWKxc9mM', '1', '2024-06-10 14:12:18');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMDY0NTgsInN1YiI6IjIifQ.IFHs0QqZz6cKfXsGdvre4MTcuegwWsEgSWzY2PkE1U0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MDk0NTgsInN1YiI6IjIifQ.u5Yt8ULEjtzqYaWr4fF9EZfDjZU25Ee4yiLv0b9idqk', '1', '2024-06-10 14:30:58');
INSERT INTO `token` VALUES ('10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMDY2MTEsInN1YiI6IjEwIn0.qByxdetSQ-DyULU6h0BYaPyGuI6USDnhvtifvivq_RQ', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MDk2MTEsInN1YiI6IjEwIn0.OkXu7NiSpPWK9YLtS88ve5nwr0-bAQ7SjDbkllMHyXk', '1', '2024-06-10 14:33:31');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMDYwNDAsInN1YiI6IjIifQ.Vc2t8tZNdQWx75yWZu7NLfGguWQ-fjQGrRowoCIaiHY', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MDkwNDAsInN1YiI6IjIifQ.KGSzlgFAdua06-AlXyHoeB1f_y_6JDMRApKyF8eHhjI', '1', '2024-06-10 14:24:00');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMDYyMzEsInN1YiI6IjIifQ.42aJLcYsUl7BbH3KEsFVfDL-x_lnTaqdOZZM60_xHK0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MDkyMzEsInN1YiI6IjIifQ.I6nXW0P46GQPXHsONa1N0kxaXKGBBEwGOwybDX_EF7c', '1', '2024-06-10 14:27:12');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMDYyMzIsInN1YiI6IjIifQ._Afgu0I3pr1qTfdAcA-z00oFRN93wgIg7GuLeGS4iaY', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MDkyMzIsInN1YiI6IjIifQ.vZYq2y0ist8CqiW5oDOKltW3QXiwG1Dy3wDtnC-He_A', '1', '2024-06-10 14:27:12');
INSERT INTO `token` VALUES ('10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMTA1NDcsInN1YiI6IjEwIn0.vSTXvshw2BzwG2Aw6QeL1_pfWOTp4ilKquo1QpSgIhE', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MTM1NDcsInN1YiI6IjEwIn0.hdfi9E6Zqsce5oPxr5XZD7wUMnruddqxyw6n2Pj47Ek', '1', '2024-06-10 15:39:07');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMTA1NDcsInN1YiI6IjIifQ.aFnS2aICfsg9-IsfK4jIq_DCxoHWeXMPZxRlteVcuAA', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MTM1NDcsInN1YiI6IjIifQ.riQxLzp6RTQobyUtiIqC3CRqNDWHU_FSfdY3AHaW-30', '1', '2024-06-10 15:39:07');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMTA1NDgsInN1YiI6IjIifQ.8SHq6SR02Ru9jzHe9pCD265ihbaBX2nuA100Jg0vQos', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MTM1NDgsInN1YiI6IjIifQ.SpHMy1YZ1ginqNdaUG8yJ20PnuKIw50hrLxfG8tatYg', '1', '2024-06-10 15:39:08');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMTA1OTgsInN1YiI6IjIifQ.7dGMPtX7v46XePxzV5x7HmUwl6ZDN14y7vxOA_wd-3s', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MTM1OTgsInN1YiI6IjIifQ.Hh9IELvfNw9RLFlxJ04G6Ih2eVCUXvO0ywEGj8q4H6g', '1', '2024-06-10 15:39:58');
INSERT INTO `token` VALUES ('10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMTc2ODIsInN1YiI6IjEwIn0.-cDGBWYId5j2X0CCPwKCPe9fP4FV7qp6CvbIJ0WGEQE', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MjA2ODIsInN1YiI6IjEwIn0.SCX_foGwww-NiOmgLJkQ0obVu93sgfn395adWLoEJtg', '1', '2024-06-10 17:38:02');
INSERT INTO `token` VALUES ('10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMTc3NDEsInN1YiI6IjEwIn0.Jp53RXn4cRfABE_5NiU007LGOJFq7y770tC7k9NZxLI', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MjA3NDEsInN1YiI6IjEwIn0.zTs0Kmt_MsiopU-mdgiGJwmM-QbL2k_9TcTum2nYu_c', '1', '2024-06-10 17:39:01');
INSERT INTO `token` VALUES ('10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMTc3NzIsInN1YiI6IjEwIn0.B497MRI5JMOAixvTLuupH2ZUiTeHW7jDzqhuciEw5Io', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MjA3NzIsInN1YiI6IjEwIn0.69SyBqb1Fyv3eTS7BD-9tktuuQLV2AiiRi9UzLaxx1I', '1', '2024-06-10 17:39:32');
INSERT INTO `token` VALUES ('10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMTc4ODYsInN1YiI6IjEwIn0.sKozI42hZtHzzUgw8Cmun9GmDbU_MJ8ljXknGHtQrLM', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MjA4ODYsInN1YiI6IjEwIn0.nHGccf24IF_sbhs6MZrvF4In3TEKQCcY4YfnHmjIJUY', '1', '2024-06-10 17:41:26');
INSERT INTO `token` VALUES ('10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMTcxNTgsInN1YiI6IjEwIn0.mxe9yfY46n0552uQA_fG1mIFjjUNePG65QAjvLG_qHU', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MjAxNTgsInN1YiI6IjEwIn0.ueRIUsm9KVjiWSDgvlgeRLXpNdgq9To88gbDhxQSULQ', '1', '2024-06-10 17:29:18');
INSERT INTO `token` VALUES ('10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMTcyNTgsInN1YiI6IjEwIn0.I1NxrVrgB97uybADFqnfZR4u1d6HywaCHfE15TCkU-A', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MjAyNTgsInN1YiI6IjEwIn0.hq9XqpzkJKRJSEcPNNyu2sJfNEbOtu3jPbD2Wq8jdJw', '1', '2024-06-10 17:30:58');
INSERT INTO `token` VALUES ('10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMTE0NjIsInN1YiI6IjEwIn0.qvYZIAiwozZ4Slt61qyq0zV1n0gt5tzq8c6-aD5T2-Q', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MTQ0NjIsInN1YiI6IjEwIn0.5-OdS9NG5R3QXFUuWIw6dASYXXg9IqcTnqBe6JxOpas', '1', '2024-06-10 15:54:22');
INSERT INTO `token` VALUES ('10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMTgwNzksInN1YiI6IjEwIn0.k-2Sau9ZxaFLWZQ6SKL-bDKuDwPKCZB7WSseYlIQAQQ', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MjEwNzksInN1YiI6IjEwIn0.X-k_bs4Tq9XKrG_BqRg8bz0jFlzx3JE9Qf4nURbQYMg', '1', '2024-06-10 17:44:39');
INSERT INTO `token` VALUES ('10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMTMwOTksInN1YiI6IjEwIn0.g3RcI8Ou8Ay7L1OmbSyrqsd4slN3z1S00pu-L39HD1A', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MTYwOTksInN1YiI6IjEwIn0.Hye9WyhLkCQO4JN1cgS-BqeMuVZqXuBj7FJ97ugEkFA', '1', '2024-06-10 16:21:39');
INSERT INTO `token` VALUES ('10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMTQwNzEsInN1YiI6IjEwIn0.Wr_zy-n4Yqu3a6YAnkW9eK7uHQwBBoex9qJZFiiAe5o', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MTcwNzEsInN1YiI6IjEwIn0.c83MmoLLXlXhcaEa1GFIk9zxKhe7TfXfS5zLr3gd4AI', '1', '2024-06-10 16:37:51');
INSERT INTO `token` VALUES ('10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgwMTY3MDEsInN1YiI6IjEwIn0.FowbkepDBUFgNfkZRsPdBv-3YaNvjkRlctTD14mUeto', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg2MTk3MDEsInN1YiI6IjEwIn0.BHvWMVHw5eqgsLYWYD6jOb5A3kALANvRxHizW3PLL7Y', '1', '2024-06-10 17:21:41');
INSERT INTO `token` VALUES ('10', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxMDcyOTgsInN1YiI6IjEwIn0.WwlFO2tEWPR3JUIzaPDhsuPByYKrRck4uQMCwMP7QAQ', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg3MTAyOTgsInN1YiI6IjEwIn0.fKxRcMEwqa0-aVxHAxCjQfo2gdkCZC_hG9Zwgi99k-A', '1', '2024-06-11 18:31:38');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxMTE3NzksInN1YiI6IjkifQ.tPNRkEdQmGlcL-IqAhyb5UgWPkSY2ynyCiXqnp_jHFY', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg3MTQ3NzksInN1YiI6IjkifQ.sGkIkrerFjUMeV7dUqLbVYu0f-1P0vzYLdeJDWx1c2U', '1', '2024-06-11 19:46:19');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxMTQwNTYsInN1YiI6IjIifQ.a5dZX3dCp8aBA9r8wBZZAar97T3WKN0kQ3tk4oyh4Vs', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg3MTcwNTYsInN1YiI6IjIifQ.Ut-lHzAMHnBP47flD_w9SCUst00obVPLod7KVk7LknM', '1', '2024-06-11 20:24:16');
INSERT INTO `token` VALUES ('9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTgxNTc2MDgsInN1YiI6IjkifQ.qoGynAHLebts8uKQW4mYad7Z-f5RFKK25ZwUapYbGik', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTg3NjA2MDgsInN1YiI6IjkifQ.3MisTLx4e3LXrqm4IhXR6GCuGvTKSE-qmjOTLxY7QJE', '1', '2024-06-12 08:30:08');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTY1NjU4MDEsInN1YiI6IjIifQ.S2pyIZLRStVNg1z84wqjwX9uMkV7jvH_PDQkuqi_K9I', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTcxNjg4MDEsInN1YiI6IjIifQ.QbQ4S9I3vmrOL5k7uQ-BWtyyGzA9R2ooUBD2-cL6NYo', '1', '2024-05-24 22:20:01');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTY4MjQwMjksInN1YiI6IjIifQ.1RXNhdy8MdbPhrWe8C0uYikVpYNMKKrynu_IOa-FD6I', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc0MjcwMzAsInN1YiI6IjIifQ.TxCEOtYfNZswR52pE_rQjW335Sk0HBvnNJE80y9ELig', '1', '2024-05-27 22:03:50');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTY5NDg3NDUsInN1YiI6IjIifQ.HU5FKu3_POcUFCLshYItB3NI3h6AltjEMHjZoVEijSI', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NTE3NDUsInN1YiI6IjIifQ.YeqzkrXL5SWuv5TGXo_WPcvVRTVCm0bDEyCkpYIpTsc', '1', '2024-05-29 08:42:25');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTY5NTc0MjMsInN1YiI6IjIifQ.p8wLPlffQDEKx9MY3mUKkv5gSYiKb62Au71fcypUHVI', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NjA0MjMsInN1YiI6IjIifQ.2kjuPjWO_WrTa8RU3abkuAOy5Jf9OIji6UxUI3nG3DE', '1', '2024-05-29 11:07:03');
INSERT INTO `token` VALUES ('2', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTY5NTg0MzgsInN1YiI6IjIifQ.PuPxLOLmfCpg2FLTl-PFflgl09PRtIQRMGb22ZMk9J0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MTc1NjE0MzgsInN1YiI6IjIifQ.7SZUmWgRst8I5FpCAWk6XfUNbKssh9ogagzN0nQWg6M', '1', '2024-05-29 11:23:58');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(255) NOT NULL,
  `nik_user` varchar(255) NOT NULL,
  `tmpt_lahir_user` varchar(255) NOT NULL,
  `tl_user` date NOT NULL,
  `jk_user` varchar(255) NOT NULL,
  `alamat_user` varchar(255) NOT NULL,
  `telp_user` varchar(255) NOT NULL,
  `email_user` varchar(255) NOT NULL,
  `pass_user` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'string', 'string', 'string', '2024-05-24', 'string', 'string', 'string', 'string', '$2b$12$/6ZZyKIIeknqJCuU9KhaMOQ1fqi7AAlXLIPJ1UYPkGBO/fAFhTjIO', 'string');
INSERT INTO `user` VALUES ('2', 'string', 'string', 'string', '0000-00-00', 'string', 'string', 'string', 'string', '$2b$12$mdwt3qtDrP/o5G2jMV37.eWe9SqOL/S4jtz1ksNfhSQcsBeWrE4km', 'ratusyakh');
INSERT INTO `user` VALUES ('3', 'mine', '32171', 'bdg', '2024-05-24', 'p', 'bdg', '0897', 'mine@mail.com', '$2b$12$3rIVdLwmB.3RCJeIjOw.ZObVPsJfkMLNHjzdH1qjngRKukGh8lSFa', 'miineeu');
INSERT INTO `user` VALUES ('4', 'faya', '123', 'bdg', '2024-05-24', 'p', 'bdg', '0232', 'fay@mail.com', '$2b$12$TtPamgSZE84uHl3seJk/CO5N0p/cLuY4uWkB.weyxqBIh8vYZO6O2', 'faayyeeay');
INSERT INTO `user` VALUES ('5', 'lysa', '2341', 'bks', '2024-05-24', 'p', 'bdg', '0854', 'lysa@mail.com', '$2b$12$KeN1GW2BHJVShX8IZEN83ukzUEqN.5c0tbzW1zH.4xFQvIwo3XZB2', 'lysaa');
INSERT INTO `user` VALUES ('6', 'tia', '1', 'jkt', '2024-05-24', 'p', 'halim', '2312', 'tiamaniez2004@gmail.com', '$2b$12$YQD38FvrCE5oarkae470o.2s9UbIwJOVNBRA5Z.yKi9cuPor6UQ1m', 'tiaifanian');
INSERT INTO `user` VALUES ('7', 'faya', '3217867', 'bekasi', '2024-06-05', 'perempuan', 'bekasi', '0812', 'faya@mail.com', '$2b$12$xnuRuZtaqsm/cjnBAIjIoeZ0wLzkPzXuRuroq4J7xnnt10TeAcPEe', 'fayeay');
INSERT INTO `user` VALUES ('8', 'lysa', '43121', 'bekasi', '2024-06-05', 'P', 'bekasi', '098789', 'lysa@mail.com', '$2b$12$.7mYLiroOiAZH4x7PP4nbes8HHHdAv4/kYINGw3Y6EymfT10MmnPW', 'lysa');
INSERT INTO `user` VALUES ('9', 'mine', '567253', 'bdg', '2024-06-05', 'P', 'bdg', '9078', 'mine@gmail.com', '$2b$12$skecl.nDjkQnFyxLrk/mh.cNie9BPPVp0Cz4QI3.7ElUSDf2bFa.O', 'mineu');
INSERT INTO `user` VALUES ('10', 'ratu', '317', 'bdg', '2024-06-10', 'P', 'jl. bdg', '087537', 'ratu@mail', '$2b$12$6jPBYCOIHlynG8NHBsQTO.n4lR2H7b9NQI5R3/sh4IcmkSQPdUMFO', 'ratu2');

-- ----------------------------
-- Table structure for `waktu`
-- ----------------------------
DROP TABLE IF EXISTS `waktu`;
CREATE TABLE `waktu` (
  `id_waktu` int(11) NOT NULL AUTO_INCREMENT,
  `nama_waktu` varchar(255) NOT NULL,
  PRIMARY KEY (`id_waktu`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of waktu
-- ----------------------------
INSERT INTO `waktu` VALUES ('1', '08.00 - 10.00');
INSERT INTO `waktu` VALUES ('2', '13.00 - 15.00');
INSERT INTO `waktu` VALUES ('3', '16.00 - 18.00');
INSERT INTO `waktu` VALUES ('4', '19.00 - 21.00');