-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 07, 2020 at 02:19 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomm`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cat_slug` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `cat_slug`) VALUES
(5, 'Bunga', 'bunga'),
(6, 'Tanaman Obat', 'tanaman-obat'),
(7, 'Tanaman Hias', 'tanaman-hias');

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `sales_id`, `product_id`, `quantity`) VALUES
(14, 9, 11, 2),
(15, 9, 13, 5),
(16, 9, 3, 2),
(17, 9, 1, 3),
(18, 10, 13, 3),
(19, 10, 2, 4),
(20, 10, 19, 5),
(21, 11, 2, 1),
(22, 12, 28, 2),
(23, 13, 27, 1),
(24, 14, 2, 1),
(25, 15, 57, 1),
(26, 16, 51, 1),
(27, 18, 58, 1),
(28, 18, 59, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `photo` varchar(200) NOT NULL,
  `date_view` date DEFAULT NULL,
  `counter` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `slug`, `price`, `photo`, `date_view`, `counter`) VALUES
(17, 3, 'AMAZON Fire 7 Tablet with Alexa (2017) - 8 GB, Black', '<p>The next generation of our best-selling Fire tablet ever - now thinner, lighter, and with longer battery life and an improved display. More durable than the latest iPad</p>\r\n\r\n<p>Beautiful 7&quot; IPS display with higher contrast and sharper text, a 1.3 GHz quad-core processor, and up to 8 hours of battery life. 8 or 16 GB of internal storage and a microSD slot for up to 256 GB of expandable storage.</p>\r\n', 'amazon-fire-7-tablet-alexa-2017-8-gb-black', 7000000, 'amazon-fire-7-tablet-alexa-2017-8-gb-black.jpg', '2018-05-12', 1),
(30, 5, 'Bunga Mawar', '<p>Mawar&nbsp;adalah suatu jenis tanaman semak dari&nbsp;genus&nbsp;Rosa&nbsp;sekaligus nama&nbsp;bunga&nbsp;yang dihasilkan tanaman ini. Mawar liar terdiri dari 100 spesies lebih, kebanyakan tumbuh di belahan bumi utara yang berudara sejuk.</p>\r\n', 'bunga-mawar', 30000, 'bunga-mawar.jpg', '2020-01-07', 1),
(31, 5, 'Bunga Matahari', '<p>Bunga matahari&nbsp;adalah&nbsp;tumbuhan semusim&nbsp;dari suku kenikir-kenikiran (Asteraceae) yang populer, baik sebagai&nbsp;tanaman hias&nbsp;maupun tanaman penghasil&nbsp;minyak.&nbsp;Bunga&nbsp;tumbuhan ini sangat khas: besar, biasanya berwarna kuning terang, dengan kepala bunga yang besar (diameter bisa mencapai 30&nbsp;cm).</p>\r\n', 'bunga-matahari', 60000, 'bunga-matahari_1578382404.jpg', NULL, NULL),
(32, 5, 'Bunga Sakura', '<p>Sakura dapat terlihat di mana-mana di Jepang. Bagi orang Jepang, sakura merupakan&nbsp;simbol&nbsp;penting, yang kerap kali diasosiasikan dengan&nbsp;perempuan, kehidupan, kematian, serta juga merupakan simbol untuk mengeksperesikan ikatan antarmanusia, keberanian, kesedihan, dan kegembiraan.</p>\r\n', 'bunga-sakura', 100000, 'bunga-sakura.jpg', NULL, NULL),
(33, 5, 'Bunga Anggrek', '<p>Anggrek memiliki nama latin&nbsp;Orchidaceae, yaitu merupakan satu suku tumbuhan berbunga yang memiki anggota atau jenis terbanyak. Jenis-jenisnya tersebar luas dari mulai wilayah tropika basah sampai lokasi sirkumpolar, walau beberapa besar anggotanya ditemukan di wilayah tropika. Umumnya anggota suku ini hidup sebagai epifit, terlebih yang datang dari wilayah tropika.&nbsp;</p>\r\n', 'bunga-anggrek', 30000, 'bunga-anggrek.jpg', NULL, NULL),
(34, 5, 'Bunga Melati', '<p>Melati&nbsp;merupakan tanaman bunga hias berupa&nbsp;perdu&nbsp;berbatang tegak yang hidup menahun. Di&nbsp;Indonesia, salah satu jenis melati telah dipilih menjadi &quot;puspa bangsa&quot; atau bunga&nbsp;simbol nasional&nbsp;yaitu melati putih (Jasminum sambac), karena bunga ini melambangkan kesucian dan kemurnian, serta dikaitkan dengan berbagai tradisi dari banyak suku di negara ini.</p>\r\n', 'bunga-melati', 45000, 'bunga-melati.jpg', NULL, NULL),
(35, 5, 'Kembang Sepatu', '<p>Kembang sepatu&nbsp;(Hibiscus rosa-sinensis&nbsp;L.) adalah&nbsp;tanaman semak&nbsp;suku&nbsp;Malvaceae&nbsp;yang berasal dari&nbsp;Asia Timur&nbsp;dan banyak ditanam sebagai&nbsp;tanaman hias&nbsp;di daerah&nbsp;tropis&nbsp;dan&nbsp;subtropis. Bunga besar, berwarna merah dan tidak berbau. Bunga dari berbagai&nbsp;kultivar&nbsp;dan&nbsp;hibrida&nbsp;bisa berupa bunga tunggal (daun mahkota selapis) atau bunga ganda (daun mahkota berlapis) yang berwarna putih hingga kuning, oranye hingga merah tua atau merah jambu.</p>\r\n', 'kembang-sepatu', 35000, 'kembang-sepatu.jpg', NULL, NULL),
(36, 5, 'Bunga Bougenville', '<p>Bunga kertas atau bugenvil adalah tanaman hias populer. Bentuknya berupa pohon kecil yang sukar tumbuh tegak. Keindahannya berasal dari seludang bunganya yang berwarna cerah dan menarik perhatian karena tumbuh dengan rimbunnya.</p>\r\n', 'bunga-bougenville', 50000, 'bunga-bougenville.jpg', NULL, NULL),
(37, 5, 'Bunga Tulip', '<p>Bunga kertas atau bugenvil adalah tanaman hias populer. Bentuknya berupa pohon kecil yang sukar tumbuh tegak. Keindahannya berasal dari seludang bunganya yang berwarna cerah dan menarik perhatian karena tumbuh dengan rimbunnya.</p>\r\n', 'bunga-tulip', 50000, 'bunga-tulip.jpg', NULL, NULL),
(38, 5, 'Bunga Kamboja', '<p>Bunga kamboja adalah sekelompok tumbuhan dalam&nbsp;marga&nbsp;Plumeria. Bentuknya berupa&nbsp;pohon&nbsp;kecil dengan daun jarang namun tebal. Bunganya yang harumnya sangat khas, dengan mahkota berwarna putih hingga merah keunguan, biasanya lima helai. Bunga dengan empat atau enam helai mahkota bunga oleh masyarakat tertentu dianggap memiliki kekuatan gaib. Jenis akarnya serabut dan tekstur bunganya tidak terlalu kasar dan tidak terlalu halus.</p>\r\n', 'bunga-kamboja', 45000, 'bunga-kamboja.jpg', NULL, NULL),
(39, 5, 'Kaktus Hias', '<p>Berasal dari Texas dan Mexico, bentuknya seperti bola bisa diletakkan di luar maupun dalam rumah. Di Indonesia, kaktus ini termasuk yang memiliki penggemar terbanyak.</p>\r\n', 'kaktus-hias', 75000, 'kaktus-hias.jpeg', NULL, NULL),
(40, 7, 'Gymno Two Tone Red & Yellow', '<p>Tanaman Kaktus Gymno Two Tone Red &amp; Yellow merupakan jenis kaktus gymno dengan warna scion yang lebih mencolok, kombinasi dua warna yaitu warna merah dan kuning. Terlihat sangat cantik</p>\r\n', 'gymno-two-tone-red-yellow', 80000, 'gymno-two-tone-red-yellow.jpg', NULL, NULL),
(41, 7, 'Aglaonema', '<p><br />\r\nTanaman Aglaonema merupakan salah satu tanaman hias daun yang juga biasa disebut sebagai ratu tanaman. Bentuknya anggun dan cantik. Biasanya Aglaonema dijadikan tanaman hias dalam ruangan karena sifat tanaman aglaonema sangat tolerir terhadap suhu ruangan.<br />\r\n&nbsp;</p>\r\n', 'aglaonema', 100000, 'aglaonema.jpg', NULL, NULL),
(42, 7, 'Ariocarpus', '<p>Kaktus yang satu ini merupakan salah satu kaktus yang sangat unik dibandingkan dengan jenis lainnya, kenapa ? Karena di sekitar batangnya tidak memiliki duri, selain itu bentuk daun yang prisma,tumpul,runcing dapat menampah nilai ke unikan dari kaktus ini. Kaktus yang berasal dari Meksiko ini sebenarnya memiliki ragam banyak warna bunga, tetapi menurut kebanyakan orang warna pink lah yang sangat di sukai banyak pecinta kaktus hias. Selain warna bunga, warna daunnya juga beragam, Ada yang berwarna hijau, kecoklatan dll.</p>\r\n', 'ariocarpus', 150000, 'ariocarpus.jpeg', NULL, NULL),
(43, 7, 'Pohon Palem', '<p>Pohon palem kuning ini memiliki nama ilmiah Chrysalidocarpus lutescens atau Dypsis lutescens yang merupakan jenis pohon palem dengan cara merumpun. Pohon palem ini merupakan anggota dari arecaceae. di indonesia sudah sangat dikenali sebagai pohon indoor, karena tanaman mampu bertahan hidup dalam kondisi eksterim ber ac. Dikenalinya pohon palem kuning tidak bisa terlepas dari manfaat dan fungsi, sebab pohon ini dapat menyerap racun udara dengan sangat baik, bahkan bisa ditempatkan sebagai komponen taman ataupun tanaman pot. Jadi yang masih bingung memilih maka pohon palem ini merupakan solusi yang tepat</p>\r\n', 'pohon-palem', 200000, 'pohon-palem.jpg', NULL, NULL),
(44, 7, 'Tanaman Calathea', '<p>Tanaman Calathea Black Lipstik&nbsp;garis merah ini merupakan family dari Marantaceae yang berasal dari Amerika tropis. tanaman bergenre daun ini memiliki daya tarik pada helaian daunnya yang melebar dengan corak yang khas.&nbsp;Tanaman ini merupakan varietas baru indonesia yang berasal dari papua . Daun tanaman ini hampir sama dengan calathea jenis rose painted calathea yang perbedaan pada warna daunnya. Tanaman ini agak sulit ditemukan di pedagang-pedagang tanaman hias karena banyak yang belum mengetahuinya. Calathea black lipstik ini sangat cocok dijadikan tanaman indoor dalam pot</p>\r\n', 'tanaman-calathea', 60000, 'tanaman-calathea.jpg', NULL, NULL),
(45, 7, 'Tanaman Walisongo', '<p>Tanaman walisongo daun hijau ini memiliki nama ilmiah Schefflera arboricola yang merupakan jenis tanaman semak perdu berdaun hijau. Di Indonesia tanaman walisongo jenis ini sering digunakan komponen taman dan sering ditempatkan pada suhu panas yang ekstrim seperti trotoar, karena mampu beradaptasi dilingkungan dengan sangat cepat, bahkan tanaman ini diklaim sebagai jenis tanaman walisongo terkuat. Untuk membuktikan benar atau tidaknya asumsi tersebut silahkan beli saja tanamannya di toko online ini</p>\r\n', 'tanaman-walisongo', 20000, 'tanaman-walisongo.jpg', NULL, NULL),
(46, 7, 'Cereus Tetragonus', '<p>Kaktus mini ini berasal dari Amerika dan bisa tumbuh tinggi. Kaktus Cereus tetragonous sangat cocok diletakkan dijendela rumah ataupun meja belajar.</p>\r\n\r\n<p>Kaktus ini adalah salah satu tanaman indoor favorit, banyak sekali yang minat dengan tanaman ini! untuk menjaganya agar tidak busuk, lakukan penyiraman satu kali dalam seminggu dan letakkan kaktus di dalam ruangan yang terkena sinar matahari.</p>\r\n', 'cereus-tetragonus', 35000, 'cereus-tetragonus.jpg', NULL, NULL),
(47, 7, 'Cemara Perak', '<p>Tanaman cemara yang satu ini berdasarkan dari warna daunnya yang benar-benar mirip seperti perak. Bahkan bila terkena sinar matahari daunnya akan memantulkan cahaya</p>\r\n\r\n<p>meskipun label pohon cemara identik dengan ketinggian tapi pohon cemara perak hanya akan tumbuh tinggi maksimal 1 meter, dengan rata-rata bibit yang dijual dipasaran berkisar antara 15 s/d25 cm. jadi bisa dipastikan bahwa pohon cemara perak merupakan tanaman perdu yang berlabel pohon</p>\r\n', 'cemara-perak', 25000, 'cemara-perak.jpg', NULL, NULL),
(48, 7, 'Lili Paris', '<p>Lili paris bernama latin clorophytum comosum adalah nama dari tanamaman hias</p>\r\n\r\n<p>jenis semak yang biasa digunakan sebagai material pembuatan taman dan dalam</p>\r\n\r\n<p>aplikasinya digunakan sebagai tanaman semak, baik untuk tujuan border, maupun</p>\r\n\r\n<p>listing. Tanaman ini sebenarnya sangat mudah utuk perawatannya, dan memiliki</p>\r\n\r\n<p>nilai artistik yang bagus, sehingga banyak digunakan oleh desainer taman maupun</p>\r\n\r\n<p>tukang taman dalam pembuatan taman, cocok digunakan untuk taman minimalis maupun</p>\r\n\r\n<p>tropis.</p>\r\n', 'lili-paris', 25000, 'lili-paris.jpg', NULL, NULL),
(49, 7, 'Tanaman Philodendron', '<p>Tidak banyak yang tahu bahwa philodendron jari ini merupakan jenis tanaman yang bisa digunakan untuk tanaman potong, yang mana bagian daunnya sering dijadikan hiasan dekorasi pelaminan. Akan tetapi dikalangan para penghobi dan tukang taman tanaman ini sering digunakan sebagai tanaman pot ataupun komponen taman, sedangkan dikalangan para pembisnis tanaman potong, tanaman bergenre daun ini sangat diminati, pasalnya helaian daunnya dapat dijual. Namun lain halnya dikalangan jasa pertamanan, sebab tanaman ini dapat digunakan sebagai komponen taman tropis ataupun minimalis, bahkan beberapa caf&eacute; ternama dibandung sering menggunakannya sebagai komponen utama. Cara tumbuhnya sangat mudah yang ternyata tanaman yang mempunyai daun berwarna hijau ini mampu menyerap polusi udara, tentunya sangat cocok bila dijadikan tanaman pot.</p>\r\n', 'tanaman-philodendron', 20000, 'tanaman-philodendron.jpg', NULL, NULL),
(50, 6, 'Lidah Buaya', '<p>Mengkonsumsi jus lidah buaya juga dapat menetralisir sistem pencernaan dan meningkatkan sistem imun tubuh. Bahan yang dibutuhkan hanya daging lidah buaya dan air jeruk&nbsp;</p>\r\n', 'lidah-buaya', 15000, 'lidah-buaya.jpg', NULL, NULL),
(51, 6, 'Kumis Kucing', '<p>Kumis kucing bermanfaat untuk melancarkan saluran kemih bagi penderita penyakit batu ginjal. Tanaman herbal &nbsp;ini juga berkhasiat untuk mengobati rematik, asam urat, batuk, diabetes, dan hipertensi.</p>\r\n', 'kumis-kucing', 20000, 'kumis-kucing.jpg', '2020-01-07', 4),
(52, 6, 'Jeruk Nipis', '<p>Buah dengan kandungan vitamin C dan antioksidan tinggi ini membantu menurunkan demam, memperlancar pencernaan, serta mengontrol tekanan gula darah bagi penderita diabetes.&nbsp;</p>\r\n', 'jeruk-nipis', 20000, 'jeruk-nipis.jpg', NULL, NULL),
(53, 6, 'Kunyit', '<p>&nbsp;Selain berguna sebagai rempah masakan, akar atau bubuk kunyit dengan senyawa kurkumin (menjadikan warna kuning) berkhasiat mengobati diare, anemia, sakit tenggorokan,&nbsp;sampai bengkak.</p>\r\n', 'kunyit', 20000, 'kunyit.jpg', NULL, NULL),
(54, 6, 'Bunga Kenop', '<p>&nbsp;Bunga antibatuk dan antiasma yang memilik bentuk unik ini berkhasiat mengobati radang mata, sakit kepala, demam, disentri, serta menambah nafsu makan.</p>\r\n', 'bunga-kenop', 15000, 'bunga-kenop.jpg', NULL, NULL),
(55, 6, 'Daun Encok', '<p>Daun Encok seperti namanya digunakan untuk mengobati&nbsp;rematik, nyeri sendi, nyeri pinggang, sakit kepala, &nbsp;sampai kanker darah.</p>\r\n', 'daun-encok', 15000, 'daun-encok.jpg', '2020-01-07', 1),
(56, 6, 'Sage', '<p>Tak hanya sebagai bumbu masakan dan teh, tanaman untuk ramuan tradisional di Eropa dan Cina ini berguna menyembuhkan sariawan, melancarkan pencernaan, meningkatkan kesuburan, serta sebagai antibiotik dan diuretik.</p>\r\n', 'sage', 20000, 'sage.jpg', NULL, NULL),
(57, 6, 'Sambiloto', '<p>&ldquo;King of Bitter&rdquo; karena rasa pahitnya merupakan tanaman herbal tradisional yang bermanfaat untuk menurunkan gula darah,&nbsp;tekanan darah serta kontraksi usus, melindungi kerusakan hati dan jantung, dan mengatasi diare.&nbsp;</p>\r\n', 'sambiloto', 20000, 'sambiloto.jpg', '2020-01-07', 1),
(58, 6, 'Jahe', '<p>Menghangatkan diri di tengah udara dingin seperti sekarang ini bisa dilakukan dengan mengonsumsi minuman jahe hangat.</p>\r\n', 'jahe', 15000, 'jahe.jpg', '2020-01-07', 4),
(59, 6, 'Sirih', '<p>Digunakan untuk menjaga area kewatinaan, sakit mata, dan mimisan.</p>\r\n', 'sirih', 15000, 'sirih.jpg', '2020-01-07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pay_id` int(20) NOT NULL,
  `sales_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `pay_id`, `sales_date`) VALUES
(11, 9, 1, '2020-01-05'),
(12, 9, 2, '2020-01-05'),
(13, 9, 3, '2020-01-05'),
(14, 9, 4, '2020-01-06'),
(15, 13, 5, '2020-01-07'),
(16, 16, 6, '2020-01-07'),
(17, 13, 7, '2020-01-07'),
(18, 13, 8, '2020-01-07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` int(1) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text DEFAULT NULL,
  `contact_info` varchar(100) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `type`, `firstname`, `lastname`, `address`, `contact_info`, `photo`, `status`, `created_on`) VALUES
(1, 'admin@admin.com', '$2y$10$0SHFfoWzz8WZpdu9Qw//E.tWamILbiNCX7bqhy3od0gvK5.kSJ8N2', 1, 'Admin', 'Utama', '', '', 'thanos1.jpg', 1, '2020-01-05'),
(9, 'harry@den.com', '$2y$10$Oongyx.Rv0Y/vbHGOxywl.qf18bXFiZOcEaI4ZpRRLzFNGKAhObSC', 0, 'Harry', 'Den', 'Silay City, Negros Occidental', '09092735719', 'male2.png', 1, '2018-05-09'),
(12, 'christine@gmail.com', '$2y$10$ozW4c8r313YiBsf7HD7m6egZwpvoE983IHfZsPRxrO1hWXfPRpxHO', 0, 'Christine', 'becker', 'demo', '7542214500', 'female3.jpg', 1, '2018-07-09'),
(13, 'budip.ilham@gmail.com', '$2y$10$0JFlyk2KGbJtbZZbBf28HeIeg7Gpzz0e7UHtyDOImqENpGa43QrWW', 0, 'Ilham', 'Budi Prasetyo', 'Jl. Genuksari Atas RT 07 RW 09 No.17 Kec.Candisari Kel.Tegalsari', '087700152265', NULL, 1, '2020-01-07'),
(15, 'kikisevensky@gmail.com', '$2y$10$1DydQGYhoPGZgcFUpGFYXO5y7ywLPpDNSKY3Vfjp3VWKwDCTsz3Z.', 0, 'Kiki', 'Sevensky', NULL, NULL, NULL, 1, '2020-01-07'),
(16, 'haha@mail.com', '$2y$10$DniWW1EZChRD2b9SF/ZdSePqG8Q2qlkS0qGdFjmIfJD2CqJQhBoqa', 0, 'Haha', 'haha', NULL, NULL, NULL, 1, '2020-01-07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
