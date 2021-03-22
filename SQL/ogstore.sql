-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost
-- Üretim Zamanı: 22 Mar 2021, 18:35:06
-- Sunucu sürümü: 5.7.17-log
-- PHP Sürümü: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `scriptpanel`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `aboneler`
--

CREATE TABLE `aboneler` (
  `abone_id` int(50) NOT NULL,
  `abone_mail` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `abone_ip` varchar(250) NOT NULL,
  `abone_tarih` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `aboneler`
--

INSERT INTO `aboneler` (`abone_id`, `abone_mail`, `abone_ip`, `abone_tarih`) VALUES
(14, 'onur@s', '', '2020-05-12 05:12:53'),
(15, 'deneme@deneme', '', '2020-05-16 03:10:10'),
(16, 'sweet@sw', '', '2020-05-16 03:11:25'),
(17, 'qwe@qwe', '', '2020-05-16 03:11:51'),
(18, 'iptest@test', '45.67.153.107', '2020-05-16 04:46:41'),
(19, 'test2@beybi.com', '176.220.10.110', '2020-06-01 21:21:56'),
(20, 'altingrami.net@domstat.su', '213.217.0.184', '2020-06-01 22:21:20'),
(21, 'k.graewe@link11.com', '109.70.100.33', '2020-09-02 21:40:18'),
(22, 'bbank@foxandbank.com', '104.244.74.169', '2020-09-08 05:19:23'),
(23, 'orders@nfpmail2001.co.uk', '176.10.99.200', '2020-09-09 10:23:10'),
(24, 'office1@fmbcmobile.org', '66.70.228.168', '2020-09-15 12:37:01'),
(25, 'test@test.net', '123.123.123.123', '2020-10-19 23:09:44'),
(26, 'test2@test.com', '123.123.123', '2020-10-19 23:11:55'),
(27, 'test22@test.com', '123.123.123', '2020-10-19 23:13:39'),
(28, 'qweqwe@qwe', '::1', '2020-12-29 23:59:00'),
(29, 'onurgosteris@hotmail.com', '::1', '2020-12-29 23:59:34'),
(30, 'qwe@eqwe.q', '::1', '2020-12-30 00:00:24');

--
-- Tetikleyiciler `aboneler`
--
DELIMITER $$
CREATE TRIGGER `mailmarketing` AFTER INSERT ON `aboneler` FOR EACH ROW BEGIN
	INSERT INTO mailmarketing SET mail = NEW.abone_mail;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admins`
--

CREATE TABLE `admins` (
  `admins_id` int(11) NOT NULL,
  `admins_namesurname` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `admins_file` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `admins_username` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `admins_pass` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `admins_status` enum('0','1') COLLATE utf8_turkish_ci NOT NULL,
  `admins_createDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `admins`
--

INSERT INTO `admins` (`admins_id`, `admins_namesurname`, `admins_file`, `admins_username`, `admins_pass`, `admins_status`, `admins_createDate`) VALUES
(21, 'Onur Gösteriş', 'banner-05-5fce8e888d6ad.jpg', 'onurgosteris', 'fe01ce2a7fbac8fafaed7c982a04e229', '1', '2020-10-10 01:58:09'),
(79, '12', '5e931a0558000.jpg', '123123', '4297f44b13955235245b2497399d7a93', '0', '2020-10-10 01:58:09');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `affiliate`
--

CREATE TABLE `affiliate` (
  `id` int(11) NOT NULL,
  `ad_soyad` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `oran` int(11) NOT NULL,
  `bakiye` int(11) NOT NULL,
  `referans` int(11) NOT NULL,
  `ziyaret` int(11) NOT NULL,
  `durum` enum('0','1') COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `affiliate`
--

INSERT INTO `affiliate` (`id`, `ad_soyad`, `oran`, `bakiye`, `referans`, `ziyaret`, `durum`) VALUES
(1, 'Onur Gösteriş', 15, 7262, 7, 2, '1'),
(2, 'Test 2', 3, 302, 2, 1, '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `anasayfa_banner`
--

CREATE TABLE `anasayfa_banner` (
  `id` int(11) NOT NULL,
  `baslik` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `aciklama` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `buton` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `url` varchar(500) COLLATE utf8_turkish_ci NOT NULL DEFAULT '#',
  `banner_file` varchar(550) COLLATE utf8_turkish_ci NOT NULL,
  `durum` enum('0','1') COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `anasayfa_banner`
--

INSERT INTO `anasayfa_banner` (`id`, `baslik`, `aciklama`, `buton`, `url`, `banner_file`, `durum`) VALUES
(2, 'Kadın', 'En yeni kadın modelleri 2020', 'ürünleri incele', 'http://localhost/scriptpanel/kadin', 'banner-01-5fce7d2215c58.jpg', '1'),
(3, 'Erkek', '2020 Erkek modelleri', 'İNCELE', 'http://localhost/scriptpanel/erkek', 'banner-05-5fcea434e1950.jpg', '1'),
(4, 'Aksesuarlar', 'En yeni aksesuarlar', 'HEMEN SATIN AL', 'http://localhost/scriptpanel/ayakkabi', 'banner-03-5fce9f192f20a.jpg', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `banka`
--

CREATE TABLE `banka` (
  `banka_id` int(11) NOT NULL,
  `banka_ad` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `banka_iban` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `banka_hesapadsoyad` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `banka_durum` enum('0','1') COLLATE utf8_turkish_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `banka`
--

INSERT INTO `banka` (`banka_id`, `banka_ad`, `banka_iban`, `banka_hesapadsoyad`, `banka_durum`) VALUES
(6, 'Ziraat Bankası', 'TR123456', 'Onur Gösteriş', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `blogs`
--

CREATE TABLE `blogs` (
  `blogs_id` int(11) NOT NULL,
  `blogs_title` varchar(120) COLLATE utf8_turkish_ci NOT NULL,
  `blogs_keywords` varchar(140) COLLATE utf8_turkish_ci NOT NULL,
  `blogs_description` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `blogs_makale` text COLLATE utf8_turkish_ci NOT NULL,
  `blogs_file` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `blogs_must` int(2) NOT NULL,
  `blogs_seourl` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `blogs_yazar` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `blogs_kategori` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `blogs_etiket` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `blogs_tarih` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `blogs_onecikar` enum('0','1') COLLATE utf8_turkish_ci NOT NULL,
  `blogs_status` enum('0','1') COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `blogs`
--

INSERT INTO `blogs` (`blogs_id`, `blogs_title`, `blogs_keywords`, `blogs_description`, `blogs_makale`, `blogs_file`, `blogs_must`, `blogs_seourl`, `blogs_yazar`, `blogs_kategori`, `blogs_etiket`, `blogs_tarih`, `blogs_onecikar`, `blogs_status`) VALUES
(43, 'Test blog 1', 'test', '250 Harfi geçmesin.', '<h1>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br />\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br />\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo<br />\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br />\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non<br />\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br />\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br />\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo<br />\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br />\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non<br />\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.</h1>\r\n', 'blog-01-5fd42e014ffab.jpg', 1, 'test-blog-1', 'yazar', 'kategori', 'etiket', '2020-12-12 05:42:09', '1', '1'),
(44, 'Test blog 2', 'Test blog 2', '250 Harfi geçmesin.', '<h2 style=\"font-style:italic;\">H1 başlığı</h2>\r\n\r\n<p>içerik <strong>zart </strong>zurt</p>\r\n\r\n<h2>devam edelim bu dah2</h2>\r\n', 'blog-02-5fd42e5ac4538.jpg', 1, 'test-blog-2', 'Test blog 2', 'Test blog 2', 'Test blog 2', '2020-12-12 05:43:38', '1', '1'),
(45, 'Test blog 3', 'Test blog 3', '250 Harfi geçmesin.', '<h1>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br />\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br />\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo<br />\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br />\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non<br />\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod<br />\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,<br />\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo<br />\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse<br />\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non<br />\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.</h1>\r\n', 'blog-03-5fd42e6e46a2b.jpg', 1, 'test-blog-3', 'Test blog 3', 'Test blog 3', 'Test blog 3', '2020-12-12 05:43:58', '1', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `blog_yorum`
--

CREATE TABLE `blog_yorum` (
  `id` int(11) NOT NULL,
  `yorum` text COLLATE utf8_turkish_ci NOT NULL,
  `ad` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `blogs_id` int(11) NOT NULL,
  `yorum_tarih` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_adresi` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `users_id` int(11) NOT NULL,
  `durum` enum('0','1') COLLATE utf8_turkish_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `blog_yorum`
--

INSERT INTO `blog_yorum` (`id`, `yorum`, `ad`, `email`, `blogs_id`, `yorum_tarih`, `ip_adresi`, `users_id`, `durum`) VALUES
(1, 'qwe', 'qwe', 'onurgosteris@hotmail.com', 43, '2020-12-17 17:47:58', '', 0, '1'),
(3, 'test 2', 'ee', 'qwkerlkqwjks@hotmail.com', 44, '2020-12-18 12:59:44', '', 0, '1'),
(4, 'test 3', 'cxz', 'qwkerlkqwjks@hotmail.com', 44, '2020-12-18 12:59:56', '', 0, '0'),
(5, 'test', 'Onur', 'onurgosteris@hotmail.com', 45, '2021-02-16 23:30:26', '::1', 0, '0'),
(6, 'qweqwe', 'Onur', 'onurgosteris@hotmail.com', 45, '2021-02-16 23:30:49', '::1', 17, '0');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `footer`
--

CREATE TABLE `footer` (
  `id` int(11) NOT NULL,
  `footer_baslik` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `footer_ad` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `footer_url` varchar(500) COLLATE utf8_turkish_ci NOT NULL DEFAULT '#',
  `footer_durum` enum('1','0') COLLATE utf8_turkish_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `footer`
--

INSERT INTO `footer` (`id`, `footer_baslik`, `footer_ad`, `footer_url`, `footer_durum`) VALUES
(13, 'İletişim', 'İletişim sayfamızdaki bilgilerden 7/24 bize ulaşabilirsiniz. OG Yazılım her zaman size en iyi hizmeti vermeyi hedefler!', 'https://www.onurgosteris.com.tr/', '1'),
(14, 'Hakkımızda', 'Biz kimiz?', 'hakkimizda', '1'),
(15, 'Hakkımızda', 'Kariyer', 'kariyer', '1'),
(16, 'Hakkımızda', 'Bize Ulaş', 'iletisim', '1'),
(17, 'Kampanyalar', 'İndirimli Kadın Ürünleri', 'http://localhost/scriptpanel/kadin-ve-indirim', '1'),
(18, 'Kampanyalar', 'İndirimli Erkek Ürünleri', 'http://localhost/scriptpanel/erkek-ve-indirim', '1'),
(19, 'Kampanyalar', 'Tüm İndirimli Ürünler', 'http://localhost/scriptpanel/indirim', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `footerbaslik`
--

CREATE TABLE `footerbaslik` (
  `id` int(11) NOT NULL,
  `footer_baslik` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `footer_durum` enum('1','0') COLLATE utf8_turkish_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `footerbaslik`
--

INSERT INTO `footerbaslik` (`id`, `footer_baslik`, `footer_durum`) VALUES
(1, 'Hakkımızda', '1'),
(2, 'Kampanyalar', '1'),
(3, 'İLETİŞİM', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `footer_abone`
--

CREATE TABLE `footer_abone` (
  `id` int(11) NOT NULL,
  `baslik` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `icerik` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `buton` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `durum` enum('0','1','','') COLLATE utf8_turkish_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `footer_abone`
--

INSERT INTO `footer_abone` (`id`, `baslik`, `icerik`, `buton`, `durum`) VALUES
(1, 'ABONE BÜLTENİ', 'İndirimleri kaçırmayın!', 'ABONE OL!', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hakkimizda`
--

CREATE TABLE `hakkimizda` (
  `id` int(11) NOT NULL,
  `icerik` text COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `hakkimizda`
--

INSERT INTO `hakkimizda` (`id`, `icerik`) VALUES
(1, '<p>Yıllardır Google&#39;da arattığınız haber ve soruların cevapları i&ccedil;in tıkladığınız zaman uğradığınız hayal kırıklığı ve vakit kaybını ortadan kaldırmak isteyen kişileriz.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Hedefimiz</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>İlk hedefimiz sitemize istikrarlı bir bi&ccedil;imde yılmadan ve s&uuml;rekli olarak doğru ve g&uuml;venilir i&ccedil;erik girişi yapmak.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Vizyonumuz</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Boş i&ccedil;eriklerle kullanıcıların vaktini &ccedil;alan ve zihnini bulandıran siteleri geride bırakmak.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Misyonumuz</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Tek amacı para kazanmak olan ve bunun uğruna kullanıcıların zamanını &ccedil;alan siteleri yola getirmek.</p>\r\n'),
(2, '<p><strong>A. Giriş</strong></p>\r\n\r\n<ol>\r\n	<li>İnternet sitesi ziyaret&ccedil;ilerimizin gizliliği bizim i&ccedil;in &ccedil;ok &ouml;nemlidir ve kendimizi onu korumaya adadık. Bu ilke, kişisel bilgileriniz ile ne yapacağımızı a&ccedil;ıklar.</li>\r\n	<li>Sitemizi ilk ziyaretinizde bu ilke kapsamında &ccedil;erezleri kullanmamıza izin vermeniz, internet sitemizi her ziyaret ettiğinizde &ccedil;erezlerin kullanılmasına izin verir.</li>\r\n</ol>\r\n\r\n<p><strong>B. Kaynak</strong></p>\r\n\r\n<p><br />\r\nBu dok&uuml;man Altın Gramı Y&ouml;netimi tarafından oluşturulmuştur.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>C. Kişisel bilgilerin toplanması</strong></p>\r\n\r\n<p>Aşağıdaki t&uuml;rden kişisel bilgiler toplanabilir, saklanabilir ve kullanılabilir:</p>\r\n\r\n<ol>\r\n	<li>IP adresi, coğrafi konum, tarayıcı t&uuml;r&uuml; ve versiyonu ile işletim sistemi dahil bilgisayarınız hakkında bilgiler;</li>\r\n	<li>referans kaynak, ziyaret s&uuml;resi, sayfa g&ouml;r&uuml;nt&uuml;lemeleri ve sitede gezinme yolları dahil siteyi ziyaretiniz ve kullanımınız ile ilgili bilgiler;</li>\r\n	<li>sitemize kayıt olmak i&ccedil;in verdiğiniz e-posta adresiniz gibi bilgiler;</li>\r\n	<li>&ouml;rneğin adınız, profil resminiz, cinsiyetiniz, doğum g&uuml;n&uuml;n&uuml;z, ilişki durumunuz, ilgi alanlarınız ve hobileriniz, eğitim ve &ccedil;alışma durumunuz gibi, sitemizde profil oluştururken verdiğiniz bilgiler;</li>\r\n	<li>e-postalarımız ve/veya b&uuml;ltenlerimize abone olurken verdiğiniz ad ve e-posta adresi gibi bilgiler;</li>\r\n	<li>sitemizdeki hizmetleri kullanırken girdiğiniz bilgiler;</li>\r\n	<li>ne zaman, ne sıklıkta ve hangi koşullarda kullandığınız dahil, sitemizi kullanırken oluşturulan bilgiler;</li>\r\n	<li>adınız, adresiniz, telefon numaranız, e-posta adresiniz ve kredi kartı bilgileriniz dahil, sitemiz &uuml;zerinden satın aldığınız herhangi bir şey, kullandığınız bir hizmet veya ger&ccedil;ekleştirdiğiniz bir aktarım ile ilgili bilgiler;</li>\r\n	<li>kullanıcı adınız, profil resminiz ve g&ouml;nderinizin i&ccedil;eriği dahil, sitemizi kullanarak internette paylaşmak amacıyla sitemize g&ouml;nderdiğiniz bilgiler;</li>\r\n	<li>iletişim i&ccedil;erikleri ve &uuml;st veriler dahil, sitemiz veya e-posta yoluyla g&ouml;nderdiğiniz her t&uuml;rl&uuml; iletişim i&ccedil;erikleri;</li>\r\n	<li>bize g&ouml;nderdiğiniz diğer t&uuml;m kişisel bilgiler.</li>\r\n</ol>\r\n\r\n<p>Bize başka bir kişinin kişisel bilgilerini iletmeden &ouml;nce, o kişinin bilgilerin paylaşılacağına ve bu ilkeye uygun olarak işleneceğine dair onayını almanız gerekir.</p>\r\n\r\n<p><strong>D. Kişisel bilgilerinizin kullanılması</strong></p>\r\n\r\n<p>Sitemiz &uuml;zerinden bize g&ouml;nderilen kişisel bilgiler bu ilkede veya sitenin ilgili sayfalarında belirtilen ama&ccedil;lar i&ccedil;in kullanılacaktır. Kişisel bilgilerinizi şu ama&ccedil;lar i&ccedil;in kullanabiliriz:</p>\r\n\r\n<ol>\r\n	<li>sitemizi ve işletmemizi y&ouml;netmek;</li>\r\n	<li>sitemizi sizin i&ccedil;in kişiselleştirmek;</li>\r\n	<li>sitemizdeki hizmetleri kullanmanızı sağlamak;</li>\r\n	<li>sitemizden satın aldığınız &uuml;r&uuml;nleri size g&ouml;ndermek;</li>\r\n	<li>sitemizden satın alınan hizmetleri temin etmek;</li>\r\n	<li>size bildirim, fatura ve &ouml;deme hatırlatıcıları g&ouml;ndermek ve sizden &ouml;deme almak;</li>\r\n	<li>sizinle pazarlama harici ticari iletişim kurmak;</li>\r\n	<li>size &ouml;zellikle talep ettiğiniz e-posta bildirimlerini g&ouml;ndermek;</li>\r\n	<li>talep ettiyseniz size e-posta b&uuml;ltenimizi g&ouml;ndermek (b&uuml;lteni istemiyorsanız bize her an bildirebilirsiniz);</li>\r\n	<li>size işletmemiz veya &ouml;zenle se&ccedil;ilmiş &uuml;&ccedil;&uuml;nc&uuml; taraf işletmeler tarafından, işinize yarayacağını d&uuml;ş&uuml;nd&uuml;ğ&uuml;m&uuml;z pazarlama i&ccedil;eriklerini &ouml;zellikle kabul ettiğiniz takdirde posta, e-posta veya benzer teknolojilerle g&ouml;ndermek (pazarlama i&ccedil;eriklerini istemiyorsanız bize her an bildirebilirsiniz);</li>\r\n	<li>&uuml;&ccedil;&uuml;nc&uuml; taraflara kullanıcılarımız hakkında istatistiksel bilgiler sunmak (ancak bu &uuml;&ccedil;&uuml;nc&uuml; taraflar bu bilgileri kullanarak hi&ccedil;bir kullanıcının kimliğini belirleyemezler);</li>\r\n	<li>sitemizle ilgili sizin tarafınızdan veya sizinle ilgili yapılan şikayetleri ve talepleri &ccedil;&ouml;zmek;</li>\r\n	<li>sitemizi g&uuml;venli tutmak ve dolandırıcılığı &ouml;nlemek;</li>\r\n	<li>internet sitemizin, ilgili şartlar ve koşullara uygun olarak kullanıldığını doğrulamak (sitemizdeki &ouml;zel mesaj hizmeti ile g&ouml;nderilen mesajları izlemek dahil) ve</li>\r\n	<li>diğer ama&ccedil;lar i&ccedil;in.</li>\r\n</ol>\r\n\r\n<p>Sitemizde yayınlanması i&ccedil;in kişisel bilgiler g&ouml;nderirseniz, bu bilgileri yayınlarız veya bize sunduğunuz lisans kapsamında kullanabiliriz.</p>\r\n\r\n<p>Gizlilik ayarlarınız sitemizde bilgilerinizin yayınlanmasını sınırlandırabilir ve sitedeki gizlilik kontrolleri &uuml;zerinden değiştirilebilir.</p>\r\n\r\n<p>A&ccedil;ık&ccedil;a izin vermediğiniz s&uuml;rece kişisel bilgilerinizi hi&ccedil;bir &uuml;&ccedil;&uuml;nc&uuml; tarafa veya diğer &uuml;&ccedil;&uuml;nc&uuml; tarafların doğrudan pazarlama b&ouml;l&uuml;mlerine iletmeyeceğiz.</p>\r\n\r\n<p><strong>E. Kişisel bilgilerin paylaşılması</strong></p>\r\n\r\n<p>Kişisel bilgilerinizi &ccedil;alışanlarımıza, g&ouml;revlilerimize, sigortacılarımıza, profesyonel danışmanlarımıza, ajanslarımıza, tedarik&ccedil;ilerimize veya taşeronlarımıza, bu ilkede belirtilen ama&ccedil;lar gerektirdiği s&uuml;rece iletebiliriz.</p>\r\n\r\n<p>Kişisel bilgilerinizi şirketler grubumuzun t&uuml;m &uuml;yelerine (iştiraklerimiz, &uuml;st holding şirketimiz ve onun iştirakleri anlamına gelir), bu ilkede belirtilen ama&ccedil;lar gerektirdiği s&uuml;rece iletebiliriz.</p>\r\n\r\n<p>Kişisel bilgilerinizi şu durumlarda paylaşabiliriz:</p>\r\n\r\n<ol>\r\n	<li>yasal olarak gerektiği durumlarda;</li>\r\n	<li>devam eden veya olası yasal s&uuml;re&ccedil;lerle ilgili olarak;</li>\r\n	<li>kendi yasal haklarımızı korumak, uygulamak ve savunmak i&ccedil;in (dolandırıcılığı &ouml;nleme ve kredi riskini azaltmak amacıyla bilgileri diğerlerine iletmek dahil);</li>\r\n	<li>sattığımız (veya satmayı d&uuml;ş&uuml;nd&uuml;ğ&uuml;m&uuml;z) t&uuml;m işletme ve varlıkların alıcılarına (veya potansiyel alıcılarına) ve</li>\r\n	<li>kişisel bilgilerin a&ccedil;ıklanması i&ccedil;in mahkemeye başvurabileceğine inandığımız bir kişiye, başvurması halinde mahkemenin veya yetkili kişi ve kurumların kişisel bilgilerin a&ccedil;ıklanması y&ouml;n&uuml;nde karar vereceğine dair makul g&ouml;r&uuml;şlerimiz olması halinde.</li>\r\n</ol>\r\n\r\n<p>Bu ilkede belirtilen durumlar haricinde, kişisel bilgilerinizi &uuml;&ccedil;&uuml;nc&uuml; taraflarla paylaşmayız.</p>\r\n\r\n<p><strong>F. Uluslararası veri transferleri</strong></p>\r\n\r\n<ol>\r\n	<li>Topladığımız bilgiler, bu ilkede belirtilen ama&ccedil;lar doğrultusunda kullanılmak &uuml;zere faaliyet g&ouml;sterdiğimiz &uuml;lkeler arasında aktarılabilir, bu &uuml;lkelerde saklanabilir ve işlenebilir.</li>\r\n	<li>Topladığımız bilgiler, Avrupa Ekonomik B&ouml;lgesi&rsquo;ndekine denk veri koruma yasaları olmayan şu &uuml;lkelere aktarılabilir: Amerika Birleşik Devletleri, Rusya, Japonya, &Ccedil;in ve Hindistan.</li>\r\n	<li>İnternet sitemizde paylaştığınız veya paylaşılması i&ccedil;in g&ouml;nderdiğiniz bilgilere internet sitemiz &uuml;zerinden t&uuml;m d&uuml;nyadan erişilebilir. Bu bilgilerin diğerleri tarafından istismar edilmesini &ouml;nleyemeyiz.</li>\r\n	<li>B&ouml;l&uuml;m F&rsquo;de belirtilen kişisel bilgilerin aktarılmasını a&ccedil;ık&ccedil;a kabul etmiş sayılırsınız.</li>\r\n</ol>\r\n\r\n<p><strong>G. Kişisel bilgilerin saklanması</strong></p>\r\n\r\n<ol>\r\n	<li>B&ouml;l&uuml;m G, kişisel bilgilerin saklanması ve silinmesi ile ilgili yasal y&uuml;k&uuml;ml&uuml;l&uuml;klerimizi yerine getirdiğimizden emin olmak i&ccedil;in tasarlanan veri saklama ilkeleri ve prosed&uuml;rlerini belirtir.</li>\r\n	<li>İşlediğimiz kişisel bilgiler, belirtilen ama&ccedil; veya ama&ccedil;ların gerektirdiğinden daha uzun s&uuml;re saklanamaz.</li>\r\n	<li>Madde G-2&rsquo;yi etkilememek &uuml;zere, aşağıda belirtilen kategorilere dahil olan verileri kişisel bilgileri genellikle aşağıda belirtilen tarih/saatte sileriz:\r\n	<ol>\r\n		<li>kişisel veri t&uuml;r&uuml; {TARİH/SAAT GİRİN} tarihinde ve</li>\r\n		<li>{EK TARİH/SAAT GİRİN} silinecektir.</li>\r\n	</ol>\r\n	</li>\r\n	<li>B&ouml;l&uuml;m G&rsquo;deki diğer h&uuml;k&uuml;mlere bağlı olmaksızın kişisel veri i&ccedil;eren dok&uuml;manları (elektronik dok&uuml;manlar dahil) saklarız:\r\n	<ol>\r\n		<li>yasal olarak gerektiği durumlarda;</li>\r\n		<li>dok&uuml;manların s&uuml;ren veya olası yasal s&uuml;re&ccedil;lerle ilgili olduğunu d&uuml;ş&uuml;nd&uuml;ğ&uuml;m&uuml;z hallerde ve</li>\r\n		<li>kendi yasal haklarımızı korumak, uygulamak ve savunmak i&ccedil;in (dolandırıcılığı &ouml;nleme ve kredi riskini azaltmak amacıyla bilgileri diğerlerine iletmek dahil).</li>\r\n	</ol>\r\n	</li>\r\n</ol>\r\n\r\n<p><strong>H. Kişisel bilgilerinizin g&uuml;venliği</strong></p>\r\n\r\n<ol>\r\n	<li>Kişisel verilerinizin kaybolması, istismar edilmesi veya değiştirilmesini &ouml;nlemek i&ccedil;in makul teknik ve organizasyonel &ouml;nlemler alırız.</li>\r\n	<li>T&uuml;m kişisel bilgilerinizi g&uuml;venli (şifre ve g&uuml;venlik duvarı korumalı) sunucularda saklarız.</li>\r\n	<li>Sitemiz &uuml;zerinden ger&ccedil;ekleştirilen t&uuml;m finansal aktarımlar şifreleme teknolojisi ile korunmaktadır.</li>\r\n	<li>İnternet &uuml;zerinden veri aktarımının internetin doğası gereği g&uuml;venli olmadığını ve internet &uuml;zerinden g&ouml;nderilen verilerin g&uuml;venliğini garanti edemeyeceğimizi kabul etmiş sayılırsınız.</li>\r\n	<li>Sitemize erişmek i&ccedil;in kullandığınız şifreyi gizli tutmak sizin sorumluluğunuzdadır, sizden şifrenizi vermenizi istemeyiz (sitemize giriş yapmanız haricinde).</li>\r\n</ol>\r\n\r\n<p><strong>I. Değişiklikler</strong></p>\r\n\r\n<p>Bu ilkeyi zaman zaman değiştirerek yeni versiyonu internet sitemizde yayımlayabiliriz. Bu ilkedeki olası değişiklikleri anladığınızdan emin olmak i&ccedil;in bu sayfayı zaman zaman kontrol etmelisiniz. Bu ilkedeki değişiklikleri size e-posta veya sitemizdeki &ouml;zel mesajlaşma sistemi yoluyla bildirebiliriz.</p>\r\n\r\n<p><strong>J. Haklarınız</strong></p>\r\n\r\n<p>Sizin hakkınızda sakladığımız bilgileri size iletmemizi talep edebilirsiniz; bu bilgileri temin etmek i&ccedil;in aşağıdakiler gereklidir:</p>\r\n\r\n<ol>\r\n	<li>&uuml;cret &ouml;denmesi {GEREKLİYSE &Uuml;CRET GİRİN} ve</li>\r\n	<li>kimliğinizi kanıtlayan belgeler sunmanız ({İLKENİZİ YANSITAN METNİ GİRİN bu ama&ccedil;la genellikle pasaportunuzun noter onaylı bir kopyasını ve mevcut adresinizi g&ouml;steren bir faturayı kabul ederiz}).</li>\r\n</ol>\r\n\r\n<p>Talep ettiğiniz bilgileri yasaların izin verdiği &ouml;l&ccedil;&uuml;de saklayabiliriz.</p>\r\n\r\n<p>Bize, herhangi bir anda kişisel bilgilerinizi pazarlama ama&ccedil;ları ile kullanmamamız talimatını verebilirsiniz.</p>\r\n\r\n<p>Pratikte, kişisel bilgilerinizi pazarlama ama&ccedil;ları ile kullanmamızı &ouml;nceden a&ccedil;ık&ccedil;a kabul etmiş olursunuz ya da biz size kişisel bilgilerinizi pazarlama ama&ccedil;larıyla kullanılmamasını tercih etme se&ccedil;eneği sunarız.</p>\r\n\r\n<p><strong>K. &Uuml;&ccedil;&uuml;nc&uuml; taraf internet siteleri</strong></p>\r\n\r\n<p>Sitemizde &uuml;&ccedil;&uuml;nc&uuml; taraf sitelere bağlantılar ve detaylar bulunur. &Uuml;&ccedil;&uuml;nc&uuml; tarafların gizlilik ilkeleri ve uygulamaları &uuml;zerinde herhangi bir kontrol yetkimiz yoktur ve bunlardan sorumlu tutulamayız.</p>\r\n\r\n<p><strong>L. Bilgilerin g&uuml;ncellenmesi</strong></p>\r\n\r\n<p>Hakkınızdaki kişisel bilgilerin d&uuml;zeltilmesi veya g&uuml;ncellenmesi gerektiğinde l&uuml;tfen bize bildirin.</p>\r\n\r\n<p><strong>M. &Ccedil;erezler</strong></p>\r\n\r\n<p>İnternet sitemiz &ccedil;erezleri kullanır. &Ccedil;erez, ağ sunucusu tarafından sunucuya g&ouml;nderilen ve sunucuda saklanan, tanımlayıcı (harfler ve sayılardan oluşan bir kod dizisi) i&ccedil;eren bir dosyadır. Daha sonra tarayıcı sunucudan her sayfa talep ettiğinde tanımlayıcı sunucuya geri g&ouml;nderilir. &Ccedil;erezler &ldquo;kalıcı&rdquo; veya &ldquo;oturum&rdquo; &ccedil;erezleri olabilir: Kalıcı &ccedil;erez, kullanıcı tarafından son kullanım tarihine kadar silinmediği takdirde tarayıcı tarafından saklanır ve son kullanım tarihinde silinir; oturum &ccedil;erezi ise kullanıcı oturumunun sonunda tarayıcı kapatıldığında silinir. &Ccedil;erezler kullanıcıyı tanımlamakta kullanılabilecek bilgileri i&ccedil;ermezler, ancak sizin hakkınızda sakladığımız bilgiler, &ccedil;erezlerdeki veriler ile ilişkilendirilebilir. {UYGUN İFADEYİ SE&Ccedil;İN İnternet sitemizde sadece oturum &ccedil;erezleri / sadece kalıcı &ccedil;erezleri / hem kalıcı hem oturum &ccedil;erezlerini kullanırız.}</p>\r\n\r\n<ol>\r\n	<li>İnternet sitemizde kullandığımız &ccedil;erezlerin adları ve kullanım ama&ccedil;ları aşağıda belirtilmiştir:\r\n	<ol>\r\n		<li>kullanıcı {SİTENİZDE &Ccedil;EREZLERİN KULLANILDIĞI T&Uuml;M KULLANIMLARI BELİRTİN internet sitesini ziyaret ettiğinde / kullanıcıları sitede gezinirken izleme / internet sitesinde alışveriş sepeti kullanımını sağlama / sitenin kullanılabilirliğini geliştirme / internet sitesinin kullanımını analiz etme / dolandırıcılığı &ouml;nleme ve sitenin g&uuml;venliğini arttırma / internet sitesini her kullanıcıya g&ouml;re &ouml;zelleştirme / belirli kullanıcıların ilgi alanlarına y&ouml;nelik reklamları g&ouml;sterme / ama&ccedil;(lar)ı tanımlama};</li>\r\n	</ol>\r\n	</li>\r\n	<li>&Ccedil;oğu tarayıcı &ccedil;erez kullanımını reddetmenizi sağlar. &Ouml;rneğin:\r\n	<ol>\r\n		<li>Internet Explorer&rsquo;da (s&uuml;r&uuml;m 10), &ldquo;Ara&ccedil;lar&rdquo;, &ldquo;İnternet Se&ccedil;enekleri&rdquo;, &ldquo;Gizlilik&rdquo; ve ardından &ldquo;Gelişmiş&rdquo; &uuml;zerine tıklayarak &ccedil;erez kullanımını ge&ccedil;ersiz kılma &ouml;zelliği ile &ccedil;erezleri engelleyebilirsiniz;</li>\r\n		<li>Firefox&rsquo;ta (s&uuml;r&uuml;m 24), &ldquo;Ara&ccedil;lar&rdquo;, &ldquo;Se&ccedil;enekler&rdquo;, &ldquo;Gizlilik&rdquo; &uuml;zerine tıkladıktan sonra a&ccedil;ılır men&uuml;den &ldquo;Ge&ccedil;miş i&ccedil;in &ouml;zel ayarları kullan&rdquo; se&ccedil;eneğini se&ccedil;tikten sonra &ldquo;Sitelerden &ccedil;erezleri kabul et&rdquo; onay kutucuğundaki işareti kaldırarak t&uuml;m &ccedil;erezleri engelleyebilirsiniz ve</li>\r\n		<li>Chrome&rsquo;da (s&uuml;r&uuml;m 29) &ldquo;&Ouml;zelleştirme ve kontrol&rdquo; men&uuml;s&uuml;ne eriştikten sonra &ldquo;Ayarlar&rdquo;, &ldquo;Gelişmiş ayarları g&ouml;ster&rdquo; ve &ldquo;İ&ccedil;erik ayarları&rdquo; &uuml;zerine tıklayıp, &ldquo;&Ccedil;erezler&rdquo; başlığı altında &ldquo;Sitelerin veri ayarlamasını engelle&rdquo; se&ccedil;eneğini se&ccedil;erek t&uuml;m &ccedil;erezleri engelleyebilirsiniz.</li>\r\n	</ol>\r\n	</li>\r\n</ol>\r\n\r\n<p>T&uuml;m &ccedil;erezleri engellemek, bir&ccedil;ok internet sitesinin kullanılabilirliğini kısıtlayacaktır. &Ccedil;erezleri engellerseniz, sitemizdeki &ouml;zelliklerin t&uuml;m&uuml;n&uuml; kullanamazsınız.</p>\r\n\r\n<ol>\r\n	<li>Bilgisayarınızda saklanan &ccedil;erezleri silebilirsiniz. &Ouml;rneğin:\r\n	<ol>\r\n		<li>Internet Explorer&rsquo;da (s&uuml;r&uuml;m 10) &ccedil;erez dosyalarını manuel olarak silmeniz gerekir (bununla ilgili talimatları&nbsp;<a href=\"http://support.microsoft.com/kb/278835\">http://support.microsoft.com/kb/278835</a>&nbsp;adresinde bulabilirsiniz);</li>\r\n		<li>Firefox&rsquo;ta (s&uuml;r&uuml;m 24) &ldquo;Ara&ccedil;lar&rdquo;, &ldquo;Se&ccedil;enekler&rdquo; ve &ldquo;Gizlilik&rdquo; &uuml;zerine tıkladıktan sonra &ldquo;Ge&ccedil;miş i&ccedil;in &ouml;zel ayarları kullan&rdquo; se&ccedil;eneğini se&ccedil;ip &ldquo;&Ccedil;erezleri g&ouml;ster&rdquo; ve ardından &ldquo;T&uuml;m &ccedil;erezleri sil&rdquo; &uuml;zerine tıklayarak t&uuml;m &ccedil;erezleri silebilirsiniz.</li>\r\n		<li>Chrome&rsquo;da (s&uuml;r&uuml;m 29) &ldquo;&Ouml;zelleştirme ve kontrol&rdquo; men&uuml;s&uuml;ne eriştikten sonra &ldquo;Ayarlar&rdquo;, &ldquo;Gelişmiş ayarları g&ouml;ster&rdquo; ve &ldquo;Tarama verilerini temizle&rdquo; &uuml;zerine tıkladıktan sonra &ldquo;&Ccedil;erezleri ve diğer site eklenti verilerini sil&rdquo; se&ccedil;eneğini se&ccedil;ip &ldquo;Tarama verilerini temizle&rdquo; &uuml;zerine tıklayarak t&uuml;m &ccedil;erezleri silebilirsiniz.</li>\r\n	</ol>\r\n	</li>\r\n	<li>&Ccedil;erezleri silmek, bir&ccedil;ok internet sitesinin kullanılabilirliğini kısıtlayacaktır.</li>\r\n</ol>\r\n'),
(3, '<p>Sitemizin istatistiklerini inceleyebilmek i&ccedil;in &ccedil;erez(cookie) kullanıyoruz. Sitemizi kullanan herkes bu &ccedil;erezleri kabul etmiş varsayılır.</p>\r\n\r\n<p><strong><a href=\"https://www.altingrami.net/\">Altın Gramı</a>&nbsp;</strong>sizlere haber,anlık altın ve d&ouml;viz kurları bilgilerini sağlarken sizden herhangi bir &uuml;cret talep etmez.</p>\r\n');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `icerik_sayilari`
--

CREATE TABLE `icerik_sayilari` (
  `id` int(11) NOT NULL,
  `alan` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `Ad` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `sayi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `icerik_sayilari`
--

INSERT INTO `icerik_sayilari` (`id`, `alan`, `Ad`, `sayi`) VALUES
(1, 'ana_sayfa', 'Ana Sayfada', 18),
(2, 'shop', 'Alışveriş Sayfasında', 36),
(3, 'blog', 'Blog Sayfasında', 2),
(4, 'onerilen_urun', 'Ürün Detay Sayfasında Önerilenler Kısmında', 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `indirim`
--

CREATE TABLE `indirim` (
  `id` int(11) NOT NULL,
  `aciklama` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `sure` datetime NOT NULL,
  `buton_adi` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `buton_link` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `durum` enum('0','1') COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `indirim`
--

INSERT INTO `indirim` (`id`, `aciklama`, `sure`, `buton_adi`, `buton_link`, `durum`) VALUES
(1, '', '0000-00-00 00:00:00', '', '', '0');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_ad` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_urunsayisi` int(11) NOT NULL,
  `kategori_ust` int(2) NOT NULL,
  `kategori_title` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_description` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_keyword` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_seourl` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_sira` int(2) NOT NULL,
  `kategori_durum` enum('0','1') COLLATE utf8_turkish_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori_ad`, `kategori_urunsayisi`, `kategori_ust`, `kategori_title`, `kategori_description`, `kategori_keyword`, `kategori_seourl`, `kategori_sira`, `kategori_durum`) VALUES
(9, 'Nike', 0, 0, '', '', '', 'nike', 1, '1'),
(10, 'Adidas', 0, 0, '', '', '', 'adidas', 2, '1'),
(11, 'Puma', 0, 0, '', '', '', 'puma', 3, '1'),
(12, 'Versace', 0, 0, '', '', '', 'versace', 4, '1'),
(13, 'Guess', 0, 0, '', '', '', 'guess', 5, '1'),
(14, 'Rolex', 0, 0, '', '', '', 'rolex', 5, '1'),
(15, 'Beymen', 0, 0, '', '', '', 'beymen', 6, '1'),
(16, 'Luis Vatson', 0, 0, '', '', '', 'luis-vatson', 8, '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kodekle`
--

CREATE TABLE `kodekle` (
  `id` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `kod` text COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kodekle`
--

INSERT INTO `kodekle` (`id`, `kod`) VALUES
('footer', '<!-- Bu bir yorum satırıdır. Bu alana footer kodlarının altına yazılacak eklenti,javascript kodları vs. ekleyebilirsiniz. Yorum satırı kullanmaya ve kodlamada hata yapmamaya dikkat ediniz. -->'),
('header', '<!-- Bu bir yorum satırıdır. Bu alana HEAD tagları arasına yazılacak olan google analytics, google meta onay kodu, yandex meta onay kodu, sitenize eklemek istediğiniz meta kodları, CDN vb head tagları arasına yazılabilecek tüm kodları yazabilirsiniz. Yorum satırı kullanmaya ve kodlamada hata yapmamaya dikkat ediniz. -->');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kupon_kodu`
--

CREATE TABLE `kupon_kodu` (
  `id` int(11) NOT NULL,
  `kupon_kodu` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `indirim_orani` varchar(10) COLLATE utf8_turkish_ci NOT NULL,
  `indirim_kosulu` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  `indirim_kosulu2` enum('1','0') COLLATE utf8_turkish_ci NOT NULL DEFAULT '0',
  `kupon_sayisi` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  `kupon_tarih` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kupon_sontarih` datetime NOT NULL,
  `kupon_durum` enum('0','1') COLLATE utf8_turkish_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kupon_kodu`
--

INSERT INTO `kupon_kodu` (`id`, `kupon_kodu`, `indirim_orani`, `indirim_kosulu`, `indirim_kosulu2`, `kupon_sayisi`, `kupon_tarih`, `kupon_sontarih`, `kupon_durum`) VALUES
(1, 'test123', '1', '1', '0', '0', '2020-12-03 18:42:35', '2020-12-03 19:11:00', '1'),
(2, 'qweqweqwss', '1', '6', '0', '100', '2020-12-03 18:43:38', '2021-01-02 22:06:00', '1'),
(4, 'testkupon', '50', '200', '0', '32', '2020-12-04 22:07:57', '2020-12-27 03:35:00', '1'),
(5, '12', '1', '1', '1', '1', '2020-12-04 23:06:53', '2020-12-04 23:10:00', '1'),
(6, 'test2', '1', '1', '0', '1', '2020-12-04 23:07:59', '2020-12-04 23:11:00', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mailmarketing`
--

CREATE TABLE `mailmarketing` (
  `id` int(11) NOT NULL,
  `ad_soyad` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `mail` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `durum` enum('0','1') COLLATE utf8_turkish_ci NOT NULL DEFAULT '1',
  `tarih` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `mailmarketing`
--

INSERT INTO `mailmarketing` (`id`, `ad_soyad`, `mail`, `durum`, `tarih`) VALUES
(1, '', 'test@test.net', '0', '2020-10-19 23:33:54'),
(3, '', 'test22@test.com', '1', '2020-10-19 23:33:54'),
(4, 'qwe', 'qweqwe@qwe', '1', '2020-10-19 23:33:54'),
(5, 'Onur Gösteriş', 'asdasd@qwe', '1', '2020-10-19 23:34:04'),
(11, 'Onur Gösteriş', '123@123', '0', '2020-10-19 23:38:28'),
(12, 'Deneme 2', 'testing@test.net', '0', '2020-10-20 17:08:15'),
(14, '', 'onurgosteris@hotmail.com', '1', '2020-12-29 23:59:34'),
(15, '', 'qwe@eqwe.q', '1', '2020-12-30 00:00:24');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mail_ayar`
--

CREATE TABLE `mail_ayar` (
  `id` int(11) NOT NULL,
  `mail_adres` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `mail_adsoyad` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `mail_host` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `mail_pass` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `mail_smtp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `mail_ayar`
--

INSERT INTO `mail_ayar` (`id`, `mail_adres`, `mail_adsoyad`, `mail_host`, `mail_pass`, `mail_smtp`) VALUES
(1, 'mailertest2021@altingrami.net', 'Altın Gramı', 'mail.altingrami.net', '2a2eaonurxde!%', 587);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_ad` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `menu_ust` int(11) NOT NULL,
  `menu_icon` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `menu_url` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `menu_sira` int(11) NOT NULL,
  `menu_durum` enum('0','1') COLLATE utf8_turkish_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_ad`, `menu_ust`, `menu_icon`, `menu_url`, `menu_sira`, `menu_durum`) VALUES
(1, 'Ana Sayfa', 0, '', 'http://localhost/scriptpanel/index.php', 1, '1'),
(2, 'İletişim', 5, '', 'http://localhost/scriptpanel/iletisim.php', 0, '1'),
(5, 'Kurumsal', 0, '', '', 3, '1'),
(6, 'Hakkımızda', 5, '3', 'http://localhost/scriptpanel/hakkimizda.php', 1, '1'),
(7, 'Gizlilik Politikası', 5, '3', 'http://localhost/scriptpanel/gizlilik.php', 2, '1'),
(8, 'Şartlar ve Koşullar', 5, '3', 'http://localhost/scriptpanel/sartlar-ve-kosullar.php', 3, '1'),
(9, 'Erkek', 0, 'İNDİRİM', 'http://localhost/scriptpanel/erkek', 2, '1'),
(10, 'Kadın', 0, 'YENİ', 'http://localhost/scriptpanel/kadin', 2, '1'),
(16, 'Tüm Ürünler', 0, '', 'http://localhost/scriptpanel/shop.php', 1, '1'),
(17, 'Sepet', 0, '', 'http://localhost/scriptpanel/sepet', 5, '1'),
(18, 'Blog', 0, '', 'http://localhost/scriptpanel/blog', 8, '1'),
(19, 'Ayakkabı', 9, '', 'http://localhost/scriptpanel/ayakkabi-ve-erkek', 1, '1'),
(20, 'Saat', 9, '', 'http://localhost/scriptpanel/saat-ve-erkek', 2, '1'),
(21, 'Takım', 9, '', 'http://localhost/scriptpanel/takim-ve-erkek', 3, '1'),
(22, 'Gözlük', 9, '', 'http://localhost/scriptpanel/gozluk-ve-erkek', 4, '1'),
(23, 'Ayakkabı', 10, '', 'http://localhost/scriptpanel/ayakkabi-ve-kadin', 1, '1'),
(24, 'Elbise', 10, '', 'http://localhost/scriptpanel/elbise-ve-kadin', 1, '1'),
(25, 'Gözlük', 10, '', 'http://localhost/scriptpanel/gozluk-ve-kadin', 3, '1'),
(26, 'Çanta', 10, '', 'http://localhost/scriptpanel/canta-ve-kadin', 4, '1'),
(27, 'Saat', 10, '', 'http://localhost/scriptpanel/saat-ve-kadin', 5, '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mesajlar`
--

CREATE TABLE `mesajlar` (
  `mesaj_id` int(11) NOT NULL,
  `mesaj_adsoyad` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `mesaj_email` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `mesaj_telefon` varchar(250) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `mesaj_icerik` text CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `mesaj_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `mesaj_tarih` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mesaj_durum` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `mesajlar`
--

INSERT INTO `mesajlar` (`mesaj_id`, `mesaj_adsoyad`, `mesaj_email`, `mesaj_telefon`, `mesaj_icerik`, `mesaj_ip`, `mesaj_tarih`, `mesaj_durum`) VALUES
(2, 'Onur Gösteriş', 'onurgosteris@hotmail.com', '0553 177 2199', 'MerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalarMerhabalar', '45.67.153.107', '2020-05-16 04:58:11', '0'),
(4, 'test3', 'qweq@q', 'qweqwed', 'Tüm geri bildirim,haber,yorum,istek,reklam ortaklıkları,iş sorguları ve benzeri tüm sorularınız için bize mesaj bırakabilirsiniz. Lütfen aşağıdaki formu doğru bilgiler ile doldurunuz yanlış bilgilerle doldurulan mesajlara dönüş yapılmayacaktır.Tüm geri bildirim,haber,yorum,istek,reklam ortaklıkları,iş sorguları ve benzeri tüm sorularınız için bize mesaj bırakabilirsiniz. Lütfen aşağıdaki formu doğru bilgiler ile doldurunuz yanlış bilgilerle doldurulan mesajlara dönüş yapılmayacaktır.', '45.67.153.107', '2020-05-16 05:01:19', '0'),
(5, 'qweqwe', 'dqwdeqwr@q', 'qwtqwtq', 'Tüm geri bildirim,haber,yorum,istek,reklam ortaklıkları,iş sorguları ve benzeri tüm sorularınız için bize mesaj bırakabilirsiniz. Lütfen aşağıdaki formu doğru bilgiler ile doldurunuz yanlış bilgilerle doldurulan mesajlara dönüş yapılmayacaktır.Tüm geri bildirim,haber,yorum,istek,reklam ortaklıkları,iş sorguları ve benzeri tüm sorularınız için bize mesaj bırakabilirsiniz. Lütfen aşağıdaki formu doğru bilgiler ile doldurunuz yanlış bilgilerle doldurulan mesajlara dönüş yapılmayacaktır.', '45.67.153.107', '2020-05-16 05:05:47', '1'),
(7, 'qweqwe', 'dqwdeqwr@q', 'qwtqwtq', 'Tüm geri bildirim,haber,yorum,istek,reklam ortaklıkları,iş sorguları ve benzeri tüm sorularınız için bize mesaj bırakabilirsiniz. Lütfen aşağıdaki formu doğru bilgiler ile doldurunuz yanlış bilgilerle doldurulan mesajlara dönüş yapılmayacaktır.Tüm geri bildirim,haber,yorum,istek,reklam ortaklıkları,iş sorguları ve benzeri tüm sorularınız için bize mesaj bırakabilirsiniz. Lütfen aşağıdaki formu doğru bilgiler ile doldurunuz yanlış bilgilerle doldurulan mesajlara dönüş yapılmayacaktır.', '45.67.153.107', '2020-05-16 05:09:21', '1'),
(9, 'Onur Gösteriş', 'onurgosteris@hotmail.com', '0553 177 2199', 'Tüm geri bildirim,haber,yorum,istek,reklam ortaklıkları,iş sorguları ve benzeri tüm sorularınız için bize mesaj bırakabilirsiniz. Lütfen aşağıdaki formu doğru bilgiler ile doldurunuz yanlış bilgilerle doldurulan mesajlara dönüş yapılmayacaktır.Tüm geri bildirim,haber,yorum,istek,reklam ortaklıkları,iş sorguları ve benzeri tüm sorularınız için bize mesaj bırakabilirsiniz. Lütfen aşağıdaki formu doğru bilgiler ile doldurunuz yanlış bilgilerle doldurulan mesajlara dönüş yapılmayacaktır.', '45.67.153.107', '2020-05-16 05:10:20', '0'),
(10, 'Onur Gösteriş', 'onurgosteris@hotmail.com', '0553 177 2199', 'Tüm geri bildirim,haber,yorum,istek,reklam ortaklıkları,iş sorguları ve benzeri tüm sorularınız için bize mesaj bırakabilirsiniz. Lütfen aşağıdaki formu doğru bilgiler ile doldurunuz yanlış bilgilerle doldurulan mesajlara dönüş yapılmayacaktır.Tüm geri bildirim,haber,yorum,istek,reklam ortaklıkları,iş sorguları ve benzeri tüm sorularınız için bize mesaj bırakabilirsiniz. Lütfen aşağıdaki formu doğru bilgiler ile doldurunuz yanlış bilgilerle doldurulan mesajlara dönüş yapılmayacaktır.', '45.67.153.107', '2020-05-16 05:13:36', '0'),
(13, 'Onur Gösteriş', 'onurgosteris@hotmail.com', '05531772199', 'qweqwr', '::1', '2020-11-09 08:30:01', '0'),
(20, 'Onur Gösteriş', 'onurgosteris@hotmail.com', '05531772199', 'qweqwr', '::1', '2020-11-09 08:34:08', '0'),
(26, 'qweqwe', 'onurgosteris@hotmail.com', '05531772199', 'qwe', '::1', '2021-01-28 22:08:37', '1'),
(25, 'qwe', 'onurgosteris@hotmail.com', '05531772199', 'qwe', '::1', '2021-01-28 22:03:29', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `referans`
--

CREATE TABLE `referans` (
  `referans_id` int(11) NOT NULL,
  `referans_ad` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `referans_file` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `referans_url` varchar(500) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reset_pw`
--

CREATE TABLE `reset_pw` (
  `id` int(11) NOT NULL,
  `reset_pw` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `users_id` int(11) NOT NULL,
  `sure` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `resimgaleri`
--

CREATE TABLE `resimgaleri` (
  `id` int(11) NOT NULL,
  `resim_ad` varchar(500) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `resimgaleri`
--

INSERT INTO `resimgaleri` (`id`, `resim_ad`) VALUES
(89, '4e7096c7-467b-4366-920e-d5e08d31a01c-360595.jpg'),
(90, '5afa4175-781a-4472-92fb-c7b7b107a3a2-718997.jpg'),
(91, '6af25fdd-7059-47a5-866c-78b114bee268-764123.jpg'),
(93, '6f25adce-2249-4d14-8372-cfb5de38eb41-547280.jpg'),
(110, '3a78a925-1a94-4766-87a0-918ddb6c4824-261279.jpg'),
(111, '3b0eb271-d7c4-4a73-91da-f43500902325-580953.jpg'),
(112, '5afa4175-781a-4472-92fb-c7b7b107a3a2-243508.jpg'),
(113, '4e7096c7-467b-4366-920e-d5e08d31a01c-452111.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sepet`
--

CREATE TABLE `sepet` (
  `id` int(11) NOT NULL,
  `users_id` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `urunler_id` varchar(1000) COLLATE utf8_turkish_ci NOT NULL,
  `sepet_tarih` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sepet_durum` enum('1','0') COLLATE utf8_turkish_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `sepet`
--

INSERT INTO `sepet` (`id`, `users_id`, `urunler_id`, `sepet_tarih`, `sepet_durum`) VALUES
(16, '17', '{\n    &quot;98&quot;: 1,\n    &quot;94&quot;: &quot;1&quot;\n}', '2021-03-05 16:17:32', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings`
--

CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL,
  `settings_description` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `settings_key` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `settings_value` text COLLATE utf8_turkish_ci NOT NULL,
  `settings_type` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `settings_must` int(4) NOT NULL,
  `settings_delete` enum('0','1') COLLATE utf8_turkish_ci NOT NULL,
  `settings_status` enum('0','1') COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `settings`
--

INSERT INTO `settings` (`settings_id`, `settings_description`, `settings_key`, `settings_value`, `settings_type`, `settings_must`, `settings_delete`, `settings_status`) VALUES
(1, 'Site başlığı', 'title', 'Testing123x', 'text', 0, '0', '1'),
(2, 'Site Açıklama', 'description', 'Anlık altın ve altın gramı grafikleri. Döviz fiyatları ve borsa grafikleri. Son dakika haberleri ve daha fazlası için sitemizi ziyaret edin.', 'text', 0, '0', '1'),
(3, 'Site logo', 'logo', 'onurgosteris-601090694d39c.png', 'file', 0, '0', '1'),
(4, 'Fav icon', 'icon', '5ea779038eae3.jpg', 'file', 0, '0', '1'),
(5, 'Site anahtar kelimeler', 'keywords', 'Yazılım,admin panel,panel', 'text', 0, '0', '1'),
(6, 'Telefon numarası', 'phone', '0553 177 2199', 'text', 0, '0', '1'),
(7, 'Mail', 'email', 'onurgosteris@hotmail.com', 'text', 0, '0', '1'),
(8, 'İlçe', 'ilce', 'Merkez', 'text', 0, '0', '1'),
(9, 'İl', 'il', 'Mersin', 'text', 0, '0', '1'),
(10, 'Açık adres', 'adres', 'Mersin/Merkez', 'textarea', 0, '0', '1'),
(11, 'İnstagram hesabı', 'instagram', 'www.instagram.com/onurgosteris', 'text', 0, '0', '1'),
(12, 'Çalışma saatleri', 'work_hours', 'Hafta içi 09:00 - 17:00', 'text', 0, '0', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparisler`
--

CREATE TABLE `siparisler` (
  `id` int(11) NOT NULL,
  `users_id` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `urunler_id` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `siparis_indirim_miktari` int(11) NOT NULL,
  `siparis_toplam` int(11) NOT NULL,
  `siparis_adres` varchar(1000) COLLATE utf8_turkish_ci NOT NULL,
  `siparis_ip` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `siparis_tarih` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `siparis_teslimtarih` datetime DEFAULT NULL,
  `siparis_odeme` enum('0','1') COLLATE utf8_turkish_ci DEFAULT '0',
  `siparis_islem_no` int(15) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `kargo_takip` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `siparis_durum` enum('0','1','2') COLLATE utf8_turkish_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `siparisler`
--

INSERT INTO `siparisler` (`id`, `users_id`, `urunler_id`, `siparis_indirim_miktari`, `siparis_toplam`, `siparis_adres`, `siparis_ip`, `siparis_tarih`, `siparis_teslimtarih`, `siparis_odeme`, `siparis_islem_no`, `affiliate_id`, `kargo_takip`, `siparis_durum`) VALUES
(81, '17', '{\n    &quot;61&quot;: &quot;1&quot;\n}', 1, 94, 'Oba mahallesi 30 sokağı\r\nb/2 blok iç daire no 7', '::1', '2021-02-16 20:42:47', NULL, '0', 0, 0, '', '0'),
(82, '17', '{\n    &quot;61&quot;: &quot;1&quot;\n}', 1, 94, 'Oba mahallesi 30 sokağı\r\nb/2 blok iç daire no 7', '::1', '2021-02-16 20:43:45', NULL, '0', 0, 0, '', '2'),
(83, '17', '{\n    &quot;61&quot;: &quot;1&quot;\n}', 1, 94, 'Oba mahallesi 30 sokağı\r\nb/2 blok iç daire no 7', '::1', '2021-02-16 20:44:05', NULL, '0', 0, 0, '', '2'),
(84, '17', '{\n    &quot;65&quot;: &quot;1&quot;,\n    &quot;64&quot;: &quot;1&quot;,\n    &quot;61&quot;: &quot;1&quot;\n}', 351, 1764, 'Oba mahallesi 30 sokağı\r\nb/2 blok iç daire no 7', '::1', '2021-02-17 10:34:23', NULL, '0', 0, 1, '', '0'),
(85, '30', '{\n    &quot;61&quot;: &quot;1&quot;\n}', 1, 94, 'Oba mahallesi 30 sokağı\r\nb/2 blok iç daire no 7', '::1', '2021-02-17 11:10:18', NULL, '0', 0, 0, '', '0'),
(86, '17', '{\n    &quot;65&quot;: &quot;2&quot;\n}', 700, 700, 'Oba mahallesi 30 sokağı\r\nb/2 blok iç daire no 7', '::1', '2021-02-21 13:53:14', NULL, '0', 0, 0, '', '0'),
(87, '32', '{\n    &quot;97&quot;: &quot;1&quot;\n}', 0, 130, 'Oba mahallesi 30 sokağı\r\nb/2 blok iç daire no 7', '::1', '2021-03-03 13:55:22', NULL, '0', 0, 0, '', '0'),
(88, '33', '{\n    &quot;97&quot;: &quot;1&quot;\n}', 0, 130, 'Oba mahallesi 30 sokağı\r\nb/2 blok iç daire no 7', '::1', '2021-03-03 13:56:12', NULL, '0', 0, 0, '', '0');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `slider`
--

CREATE TABLE `slider` (
  `slider_id` int(11) NOT NULL,
  `slider_ad` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `slider_file` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `slider_yazi` text COLLATE utf8_turkish_ci NOT NULL,
  `slider_sira` int(11) NOT NULL,
  `slider_buton` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `slider_link` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `slider_durum` enum('0','1') COLLATE utf8_turkish_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `slider`
--

INSERT INTO `slider` (`slider_id`, `slider_ad`, `slider_file`, `slider_yazi`, `slider_sira`, `slider_buton`, `slider_link`, `slider_durum`) VALUES
(3, 'AYAKKABILARDAKİ BÜYÜK İNDİRİMİ KAÇIRMAYIN!', 'slide-02-5fd915a468ac6.jpg', '&lt;p&gt;AYAKKABILARDA EFSANE İNDİRİMLER!&lt;/p&gt;\r\n', 2, 'İLETİŞİM', 'http://localhost/scriptpanel/iletisim.php', '1'),
(4, 'AÇILIŞA ÖZEL %10 İNDİRİM!', 'slide-05-5fadb48d8ff41.jpg', '&lt;p&gt;İNDİRİM FIRSATINI KAÇIRMAYIN&lt;/p&gt;\r\n', 1, 'ALIŞVERİŞE BAŞLA', 'http://localhost/scriptpanel/hakkimizda.php', '1'),
(5, 'YENİ SEZONDA EFSANE İNDİRİMLER', 'slide-06-5fadb4b2dcce6.jpg', '&lt;p&gt;İNDİRİMLERİ KAÇIRMA&lt;/p&gt;\r\n', 5, 'FIRSATLARI YAKALA', 'http://localhost/scriptpanel/', '1'),
(7, 'ŞUBAT AYI İNDİRİMLERİ BAŞLADI', 'slide-03-5fcea092f1529.jpg', '&lt;p&gt;ŞUBATA ÖZEL İNDİRİMLERİ KAÇIRMA!&lt;/p&gt;\r\n', 4, 'ALIŞVERİŞE BAŞLA', 'qwe', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sosyalmedya`
--

CREATE TABLE `sosyalmedya` (
  `id` int(11) NOT NULL,
  `ad` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `url` varchar(500) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `sosyalmedya`
--

INSERT INTO `sosyalmedya` (`id`, `ad`, `url`) VALUES
(1, 'facebook', 'https://www.facebook.com/'),
(2, 'instagram', 'https://www.instagram.com/'),
(3, 'youtube', 'https://www.youtube.com/'),
(4, 'googleplus', 'https://www.google.com/'),
(5, 'pinterest', 'https://www.pinterest.com/'),
(6, 'twitter', 'https://www.twitter.com/'),
(7, 'linkedin', 'https://www.linkedin.com/');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sss`
--

CREATE TABLE `sss` (
  `id` int(11) NOT NULL,
  `soru` text COLLATE utf8_turkish_ci NOT NULL,
  `cevap` text COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `sss`
--

INSERT INTO `sss` (`id`, `soru`, `cevap`) VALUES
(1, 'Neden?', '<p>Ne neden?</p>\r\n'),
(2, 'Kim', '<p>Kim kim?</p>\r\n'),
(3, 'Nasıl?', '&lt;p&gt;Ne nasıl?&lt;/p&gt;\r\n');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tema_header_ustu`
--

CREATE TABLE `tema_header_ustu` (
  `id` int(11) NOT NULL,
  `ad` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `baslik` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `url` varchar(500) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `tema_header_ustu`
--

INSERT INTO `tema_header_ustu` (`id`, `ad`, `baslik`, `url`) VALUES
(1, 'sol', '100₺ ve üzeri alışverişlerinizde kargo ücretsiz', ''),
(2, 'sag', 'S.S.S', 'sss'),
(4, 'sag', 'test', '2');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urun`
--

CREATE TABLE `urun` (
  `urun_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `varyant_id` int(11) NOT NULL,
  `urun_tur` int(11) NOT NULL,
  `urun_zaman` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `urun_ad` varchar(400) COLLATE utf8_turkish_ci NOT NULL,
  `urun_seourl` varchar(450) COLLATE utf8_turkish_ci NOT NULL,
  `urun_title` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `urun_description` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `urun_detay` text COLLATE utf8_turkish_ci NOT NULL,
  `urun_cinsiyet` enum('erkek','kadın','unisex','') COLLATE utf8_turkish_ci NOT NULL,
  `urun_fiyat` int(11) NOT NULL,
  `urun_indirim` tinyint(2) NOT NULL,
  `urun_keyword` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `urun_barkod` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `urun_file` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `urun_stok` int(11) NOT NULL,
  `urun_durum` enum('0','1') COLLATE utf8_turkish_ci NOT NULL DEFAULT '1',
  `urun_onecikar` enum('0','1') COLLATE utf8_turkish_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `urun`
--

INSERT INTO `urun` (`urun_id`, `kategori_id`, `varyant_id`, `urun_tur`, `urun_zaman`, `urun_ad`, `urun_seourl`, `urun_title`, `urun_description`, `urun_detay`, `urun_cinsiyet`, `urun_fiyat`, `urun_indirim`, `urun_keyword`, `urun_barkod`, `urun_file`, `urun_stok`, `urun_durum`, `urun_onecikar`) VALUES
(67, 10, 0, 1, '2021-02-23 22:38:24', 'Erkek Siyah Triko Ayakkabı', 'erkek-siyah-triko-ayakkabi-p-1394697966', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'erkek', 240, 4, 'ayakkabı,erkek ayakkabısı, anahtar kelime', '1236123496123', 'erkek-siyah-triko-ayakkabi-603583e01948f.jpg', 4, '1', '1'),
(68, 15, 0, 7, '2021-02-23 22:48:25', 'Erkek Takım Elbise', 'erkek-takim-elbise-p-1124929289', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'erkek', 650, 0, 'anahtar kelimeler', '1236123496123', 'erkek-takim-elbise-6035863961523.jpg', 123, '1', '1'),
(69, 14, 0, 6, '2021-02-23 22:49:13', 'Kadın Saat Modeli', 'kadin-saat-modeli-p-1192556043', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'kadın', 390, 0, 'anahtar kelimeler', '1236123496123', 'kadin-saat-modeli-6035866969a1d.jpg', 22, '1', '1'),
(70, 13, 0, 4, '2021-02-23 22:52:33', 'Kadın Çanta Modeli', 'kadin-canta-modeli-p-66607055', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'kadın', 50, 0, 'anahtar kelimeler', '1236123496123', 'kadin-canta-modeli-60358731cfcc9.jpg', 21, '1', '1'),
(71, 16, 0, 8, '2021-02-23 22:53:55', 'Kadın Elbise Modeli', 'kadin-elbise-modeli-p-1076399210', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'kadın', 650, 10, 'anahtar kelimeler', '1236123496123', 'kadin-elbise-modeli-6035878322ed7.jpg', 5, '1', '1'),
(72, 12, 0, 5, '2021-02-23 22:54:54', 'Erkek Gözlük Modeli', 'erkek-gozluk-modeli-p-1275299954', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'erkek', 400, 0, 'anahtar kelimeler', '1236123496123', 'erkek-gozluk-modeli-603587be3e7f6.jpg', 13, '1', '1'),
(73, 12, 0, 6, '2021-02-23 22:56:05', 'Erkek Saat Modeli', 'erkek-saat-modeli-p-1258881320', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'erkek', 990, 0, 'anahtar kelimeler', '1236123496123', 'erkek-saat-modeli-6035880511e57.jpg', 5, '1', '1'),
(74, 10, 0, 7, '2021-02-23 22:57:09', 'Erkek Takım Elbise', 'erkek-takim-elbise-p-1031898703', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'erkek', 550, 4, 'anahtar kelimeler', '1236123496123', 'erkek-takim-elbise-60358845c075d.jpg', 4, '1', '1'),
(75, 13, 0, 8, '2021-02-23 22:57:59', 'Kadın Tişört', 'kadin-tisort-p-1043586969', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'kadın', 70, 0, 'anahtar kelimeler', '1236123496123', 'kadin-tisort-603588771df3c.jpg', 1, '1', '1'),
(76, 13, 0, 8, '2021-02-23 22:59:09', 'Kadın Pantolon ve Tişört', 'kadin-pantolon-ve-tisort-p-1034526686', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'kadın', 140, 0, 'anahtar kelimeler', '1236123496123', 'kadin-pantolon-ve-tisort-603588bd8de6a.jpg', 4, '1', '1'),
(77, 16, 0, 7, '2021-02-23 23:00:04', 'Erkek Ceketi', 'erkek-ceketi-p-1206334181', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'erkek', 190, 0, 'anahtar kelimeler', '1236123496123', 'erkek-ceketi-603588f4c12ef.jpg', 4, '1', '1'),
(78, 16, 0, 8, '2021-02-23 23:00:50', 'Kadın Kaban Modeli', 'kadin-kaban-modeli-p-1185535575', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'kadın', 250, 0, 'anahtar kelimeler', '1236123496123', 'kadin-kaban-modeli-60358922221b3.jpg', 4, '1', '1'),
(79, 10, 0, 8, '2021-02-23 23:03:49', 'Kadın kaktüs tişört', 'kadin-kaktus-tisort-p-1404183732', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'kadın', 45, 0, 'anahtar kelimeler', '1236123496123', 'kadin-kaktus-tisort-603589d5c202c.jpg', 4, '1', '1'),
(80, 10, 0, 7, '2021-02-23 23:04:40', 'Kadın eşofman takımı', 'kadin-esofman-takimi-p-1132262612', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'kadın', 220, 0, 'anahtar kelimeler', '1236123496123', 'kadin-esofman-takimi-60358a08840ac.jpg', 1, '1', '1'),
(81, 16, 0, 8, '2021-02-23 23:08:15', 'Kadın Siyah Elbise', 'kadin-siyah-elbise-p-1043724625', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'kadın', 830, 0, 'anahtar kelimeler', '1236123496123', 'kadin-siyah-elbise-60358adfe3fb4.jpg', 4, '1', '1'),
(82, 10, 0, 8, '2021-02-23 23:08:54', 'Kadın Siyah Tişört', 'kadin-siyah-tisort-p-1179316016', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'kadın', 110, 0, 'anahtar kelimeler', '1236123496123', 'kadin-siyah-tisort-60358b06c48e4.jpg', 4, '1', '1'),
(83, 10, 0, 8, '2021-02-23 23:09:32', 'Kadın Beyaz Tişört', 'kadin-beyaz-tisort-p-1142036205', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'kadın', 75, 0, 'anahtar kelimeler', '1236123496123', 'kadin-beyaz-tisort-60358b2c55f90.jpg', 4, '1', '1'),
(84, 13, 0, 8, '2021-02-23 23:11:24', 'Kadın Ceketi', 'kadin-ceketi-p-43049621', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'kadın', 300, 10, 'anahtar kelimeler', '1236123496123', 'kadin-ceketi-60358b9ccc713.jpg', 123, '1', '1'),
(85, 10, 0, 1, '2021-02-26 22:43:14', 'Adidas Ayakkabı', 'adidas-ayakkabi-p-1084120473', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'unisex', 380, 0, 'anahtar kelimeler', '1236123496123', 'adidas-ayakkabi-60397982aff5c.jpg', 4, '1', '1'),
(86, 16, 0, 1, '2021-02-26 22:48:58', 'Pantolon', 'pantolon-p-1017907824', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'erkek', 150, 0, 'anahtar kelimeler', '1236123496123', 'pantolon-60397ada89097.jpg', 4, '1', '1'),
(87, 12, 0, 6, '2021-02-26 22:49:42', 'Siyah Saat', 'siyah-saat-p-1131749530', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'unisex', 650, 0, 'anahtar kelimeler', '1236123496123', 'siyah-saat-60397b0622f8a.jpg', 4, '1', '1'),
(88, 13, 0, 8, '2021-02-26 22:50:16', 'Kemer', 'kemer-p-1209012220', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'erkek', 40, 0, 'anahtar kelimeler', '1236123496123', 'kemer-60397b28249cd.jpg', 4, '1', '1'),
(89, 15, 0, 8, '2021-02-26 22:50:59', 'Beyaz Gömlek', 'beyaz-gomlek-p-1321489878', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'kadın', 120, 0, 'anahtar kelimeler', '1236123496123', 'beyaz-gomlek-60397b53d5dbd.jpg', 4, '1', '1'),
(90, 10, 0, 7, '2021-02-26 22:51:52', 'Siyah Ceket', 'siyah-ceket-p-1097335471', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'erkek', 170, 0, 'anahtar kelimeler', '1236123496123', 'siyah-ceket-60397b882f479.jpg', 4, '1', '1'),
(91, 9, 0, 8, '2021-02-26 22:52:38', 'Siyah tişört', 'siyah-tisort-p-1290342026', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'kadın', 70, 0, 'anahtar kelimeler', '1236123496123', 'siyah-tisort-60397bb623c1c.jpg', 4, '1', '1'),
(92, 12, 0, 6, '2021-02-26 22:53:31', 'Quartz siyah saat', 'quartz-siyah-saat-p-1251898394', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'erkek', 220, 0, 'anahtar kelimeler', '1236123496123', 'quartz-siyah-saat-60397beb08fcd.jpg', 4, '1', '1'),
(93, 12, 0, 8, '2021-02-26 22:54:08', 'Beyaz tişört', 'beyaz-tisort-p-1230223794', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'kadın', 40, 0, 'anahtar kelimeler', '1236123496123', 'beyaz-tisort-60397c100db83.jpg', 4, '1', '1'),
(94, 10, 0, 7, '2021-02-26 22:54:55', 'Gri Eşofman', 'gri-esofman-p-1312304453', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'kadın', 90, 0, 'anahtar kelimeler', '1236123496123', 'gri-esofman-60397c3f3a052.jpg', 4, '1', '1'),
(95, 16, 0, 7, '2021-02-26 22:55:37', 'Mavi Gömlek', 'mavi-gomlek-p-1017632512', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'erkek', 80, 0, 'anahtar kelimeler', '1236123496123', 'mavi-gomlek-60397c69e1d27.jpg', 4, '1', '1'),
(96, 14, 0, 5, '2021-02-26 22:56:14', 'Kaktüs Tişört', 'kaktus-tisort-p-1285636686', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'erkek', 40, 0, 'anahtar kelimeler', '1236123496123', 'kaktus-tisort-60397c8e1e421.jpg', 4123, '1', '1'),
(97, 11, 0, 5, '2021-02-26 22:57:12', 'Pantolon ve siyah tişört', 'pantolon-ve-siyah-tisort-p-1385775339', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'kadın', 130, 0, 'anahtar kelimeler', '1236123496123', 'pantolon-ve-siyah-tisort-60397cc8b352e.jpg', 4, '1', '1'),
(98, 16, 0, 8, '2021-02-26 22:58:11', 'Siyah etek', 'siyah-etek-p-1296123588', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'kadın', 70, 0, 'anahtar kelimeler', '1236123496123', 'siyah-etek-60397d032210c.jpg', 4, '1', '1'),
(99, 15, 0, 1, '2021-02-26 22:58:54', 'Kısa kollu mavi gömlek', 'kisa-kollu-mavi-gomlek-p-1041847495', '', '', '&lt;p&gt;Açıklama rastgele kopyalanmıştır.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;&amp;nbsp;&lt;/li&gt;\r\n	&lt;li&gt;15 gün içinde ücretsiz iade.Detaylı bilgi için&lt;/li&gt;\r\n	&lt;li&gt;1.Kalite malzeme terletmez astar türkiye&amp;#39;de üretilmiştir&lt;/li&gt;\r\n	&lt;li&gt;Bu üründen en fazla 10 adet sipariş verilebilir. 10 adetin üzerindeki siparişleri Trendyol iptal etme hakkını saklı tutar.&lt;/li&gt;\r\n	&lt;li&gt;Kampanya fiyatından satılmak üzere 5 adetten az stok bulunmaktadır.&lt;/li&gt;\r\n	&lt;li&gt;İncelemiş olduğunuz ürünün satış fiyatını satıcı belirlemektedir.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'erkek', 85, 0, 'anahtar kelimeler', '1236123496123', 'kisa-kollu-mavi-gomlek-60397d2e76019.jpg', 4, '1', '1'),
(100, 10, 0, 1, '2021-03-07 18:02:56', 'yeni ürün testi', 'yeni-urun-seo-url-testi-p-31673278', 'Yeni ürün testiqweqwe', 'Yeni ürün testiqweqweqwewqqweqwee', '&lt;p&gt;qweqwe&lt;/p&gt;\r\n', 'erkek', 111, 0, 'anahtar kelimeler', '1236123496123', 'yeni-urun-testi-604515501ea09.jpg', 1, '1', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunfoto`
--

CREATE TABLE `urunfoto` (
  `urunfoto_id` int(11) NOT NULL,
  `urun_id` int(11) NOT NULL,
  `urunfoto_resimyol` varchar(255) NOT NULL,
  `urunfoto_sira` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `urunfoto`
--

INSERT INTO `urunfoto` (`urunfoto_id`, `urun_id`, `urunfoto_resimyol`, `urunfoto_sira`) VALUES
(81, 16, 'dimg/urun/296062177124809318143.jpg', 0),
(82, 18, 'dimg/urun/22972253852646020509IMG-20200301-WA0071.jpg', 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urun_seo`
--

CREATE TABLE `urun_seo` (
  `id` int(1) NOT NULL,
  `urun_title` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `urun_description` varchar(250) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `urun_seo`
--

INSERT INTO `urun_seo` (`id`, `urun_title`, `urun_description`) VALUES
(1, 'Fiyatı ve Özellikleri', 'en iyi fiyatla satın alın! Şimdi indirimli fiyatla sipariş verin, ayağınıza gelsin!');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urun_turleri`
--

CREATE TABLE `urun_turleri` (
  `id` int(11) NOT NULL,
  `urun_turu` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `urun_turu_seourl` varchar(500) COLLATE utf8_turkish_ci NOT NULL,
  `urun_turu_durum` enum('1','0') COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `urun_turleri`
--

INSERT INTO `urun_turleri` (`id`, `urun_turu`, `urun_turu_seourl`, `urun_turu_durum`) VALUES
(1, 'Ayakkabı', 'ayakkabi', '1'),
(4, 'Çanta', 'canta', '1'),
(5, 'Gözlük', 'gozluk', '1'),
(6, 'Saat', 'saat', '1'),
(7, 'Takım', 'takim', '1'),
(8, 'Elbise', 'elbise', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urun_yorumlar`
--

CREATE TABLE `urun_yorumlar` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `yorum` varchar(1000) COLLATE utf8_turkish_ci NOT NULL,
  `puan` int(1) NOT NULL,
  `urun_id` int(11) NOT NULL,
  `yorum_tarih` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_adresi` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `yorum_durumu` enum('1','0') COLLATE utf8_turkish_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `urun_yorumlar`
--

INSERT INTO `urun_yorumlar` (`id`, `users_id`, `yorum`, `puan`, `urun_id`, `yorum_tarih`, `ip_adresi`, `yorum_durumu`) VALUES
(6, 17, 'Güzel gömlek.', 5, 99, '2021-03-04 03:10:04', '::1', '1'),
(7, 17, 'Güzek etek, yavaş kargo.', 3, 98, '2021-03-04 03:10:30', '::1', '1'),
(8, 17, 'İdare eder.', 4, 99, '2021-03-04 03:24:35', '::1', '1'),
(9, 17, 'Güzel.', 5, 94, '2021-03-04 03:46:38', '::1', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `users_namesurname` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `users_file` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `users_mail` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `users_phone` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `users_gender` enum('kadin','erkek','unisex') COLLATE utf8_turkish_ci NOT NULL,
  `users_address` varchar(1000) COLLATE utf8_turkish_ci NOT NULL,
  `users_birth` date NOT NULL,
  `users_membership` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `users_pass` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `users_mail_status` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `users_status` enum('0','1') COLLATE utf8_turkish_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`users_id`, `users_namesurname`, `users_file`, `users_mail`, `users_phone`, `users_gender`, `users_address`, `users_birth`, `users_membership`, `users_pass`, `users_mail_status`, `users_status`) VALUES
(17, 'Onur Gösteriş', '', 'onurgosteris@hotmail.com', '0(553)-177-2199', 'unisex', 'test', '2020-01-01', '2020-11-28 15:08:10', '4297f44b13955235245b2497399d7a93', '', '1'),
(19, 'Onur Gösteriş', '', 'qwe@e.q', '0(553)-177-2555', 'erkek', '', '0000-00-00', '2021-02-16 19:36:45', '4297f44b13955235245b2497399d7a93', 'HBIxWvjUVdhGZQa4nqjOZW5iqVs6G6E7Cbwc5JAdLo9SH0fTS2pL1RygmEujD7fHNbBk6ns3vjXMI8dItLzgeZCLqyzGcPyuatst3nagxKQLpl2DgAh7YC10NfkNSUl0lPK5D9FWpFqgAXk7VEnYANMM84cY7bxaxi1e3jQfqdARJrGn2Irt34rGK1XHR9mWTPOrVQBSp2lWFFQtaoHJcDxEYzBMdk0Uysu9JhCXpr2oZ59CswNmR8uOXcV3kiE', '1'),
(25, 'Onur Gösteriş', '', 'test212@gasd.com', '5(555)-555-5555', 'kadin', '', '0000-00-00', '2021-02-16 19:43:48', '4297f44b13955235245b2497399d7a93', '9zxr2vn20dD64MAN0mYkHFrJaBUD0M9s72YCLRcIUmeSlypnJ9jXZYvknI5WPBywfJPKdzRwOqWS8tzTbaOnV6ojqf99AtkGqUa5lu3QXwE8gABiK4Zm13b4NCbINH2oXBTOgZOc6SbGyDjdm1v6iEHf1GpqQFejXR8kFotnQseEhxMVxQvI5mYISaFk0ugTvpQ4c1ML5olZihLUW0BsfWEyZshLei64C7PW3ThryVJsGHVYwKlNfRw3XOugxdN', '1'),
(27, 'Onur Gösteriş', '', 'testX21@gasd.com', '1(111)-111-1111', 'kadin', '', '0000-00-00', '2021-02-16 19:46:51', '4297f44b13955235245b2497399d7a93', 'ANUKtDBE2GMtZ89H2lfeyMuSWKazQODPdLQAwisvxGLYnkY3A2WPO7Xk7IVjJS3ZguXPRQpGoG8qnmMob9VmjrcBTTFuhLzY8hqilKW9IBKADb1FXyrBce3K1eca6PgUnmq3dTfjuMUVFVRTeipEdDvFk5UxNN1Zb4YSI9lNZWQggRm6a5w4hIXSeEObn1hWksIswR4XCHZoz4AHJQrwEtlvmyJ7f8Jxn0qCGp8F0vsxgr1RM04HoyTrOPwtiC5', '1'),
(30, 'Onur Gösteriş', '', 'o@o.o', '0(522)-223-6419', 'erkek', '', '0000-00-00', '2021-02-17 14:08:12', '4297f44b13955235245b2497399d7a93', 'Kvz7DpoCZkXR8LtQuNwdSWNfJyHUV4q46HXN2RIi3ALl6iXbJVhCijOQTvB81INsG1EMQHJy35sxmarloDfnCs13u5xDivDUZlKt5ac9LR2uAjrF7ckZzdxmM8w3O8zjfi7wEhoSRDgETkYPHbaqdRyjs5Fj9dkrC7GhU9185MfunvNyW92pbFGQgcFQaep0Yqhn6VHAyt79JBg6kYzpEMmgbtqVxVLAm3oIb4wKP0tsnXZOKWmSGohSOOfeI40', '1'),
(32, 'Recebi sikim', '', 'tamam@xn--tamamcom-w0a', '2(241)-251-2412', 'kadin', '', '0000-00-00', '2021-03-03 16:54:57', '4297f44b13955235245b2497399d7a93', 'jvj25M2JyNxfK8zmiUhn2XZgEBMNf6TjEBWOTpUdmL7SZwVzVYXA5oethvehckwhZcB2Lc4IQoUavfu4vK18X1OtInuDqnLQU76to8JiJlwYHpPH0RgPrI1s9WrCEeWfTiz0Ifs5PmpsbbZMmBCGq3iLkFpxatkaaHodKUq8bKe9rTlkPjlF50DL2SoG67r4dNSVYC3lOMVax334YY7gF6Fg9GCBrEnDpWgX9H9xwbwXIuGbOqyTzym6uq1ddJQ', '1'),
(33, 'reqwe', '', 'tamam@tamam.com', '5(512)-551-5264', 'kadin', '', '0000-00-00', '2021-03-03 16:55:55', '4297f44b13955235245b2497399d7a93', 'iP9Kbbte5wMOicTv4Exk2TjeVZmDgqfEvBqGpXDx1HoMg9owDuU07T7mUI76F4RRQoI3dgFYZpMCgjGp081Xl8QtKsnSIrLpbf3ZjvkyBUuj9yYaaNX2UdCWzssMmg41nRcrO6SV6CY2CqP3J6mk6QcNJy0fQi8EhV0KiAEdfnbYt32XuYQPA8osIwWBrnelSzPCHhovFjaWN4AM1ZlGbHXPuvkhH5aGxKl4x3rO9IpWHW8FLO2Sk9w5GAJVZJL', '1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `varyant`
--

CREATE TABLE `varyant` (
  `id` int(11) NOT NULL,
  `ad` varchar(250) COLLATE utf8_turkish_ci NOT NULL,
  `deger` longtext COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `videogaleri`
--

CREATE TABLE `videogaleri` (
  `id` int(11) NOT NULL,
  `video_url` varchar(500) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `videogaleri`
--

INSERT INTO `videogaleri` (`id`, `video_url`) VALUES
(12, 'ZxCSTRxfqKc'),
(14, '4s59t9cKT7U'),
(17, 'fttOa_sbvj8');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `aboneler`
--
ALTER TABLE `aboneler`
  ADD PRIMARY KEY (`abone_id`),
  ADD UNIQUE KEY `abone_mail` (`abone_mail`);

--
-- Tablo için indeksler `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admins_id`),
  ADD UNIQUE KEY `admins_username` (`admins_username`);

--
-- Tablo için indeksler `affiliate`
--
ALTER TABLE `affiliate`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `anasayfa_banner`
--
ALTER TABLE `anasayfa_banner`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `banka`
--
ALTER TABLE `banka`
  ADD PRIMARY KEY (`banka_id`);

--
-- Tablo için indeksler `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`blogs_id`);

--
-- Tablo için indeksler `blog_yorum`
--
ALTER TABLE `blog_yorum`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `footer`
--
ALTER TABLE `footer`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `footerbaslik`
--
ALTER TABLE `footerbaslik`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `footer_abone`
--
ALTER TABLE `footer_abone`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `hakkimizda`
--
ALTER TABLE `hakkimizda`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `icerik_sayilari`
--
ALTER TABLE `icerik_sayilari`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `indirim`
--
ALTER TABLE `indirim`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Tablo için indeksler `kodekle`
--
ALTER TABLE `kodekle`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kupon_kodu`
--
ALTER TABLE `kupon_kodu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kupon_kodu` (`kupon_kodu`);

--
-- Tablo için indeksler `mailmarketing`
--
ALTER TABLE `mailmarketing`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- Tablo için indeksler `mail_ayar`
--
ALTER TABLE `mail_ayar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Tablo için indeksler `mesajlar`
--
ALTER TABLE `mesajlar`
  ADD PRIMARY KEY (`mesaj_id`);

--
-- Tablo için indeksler `referans`
--
ALTER TABLE `referans`
  ADD PRIMARY KEY (`referans_id`);

--
-- Tablo için indeksler `reset_pw`
--
ALTER TABLE `reset_pw`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `resimgaleri`
--
ALTER TABLE `resimgaleri`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `sepet`
--
ALTER TABLE `sepet`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settings_id`);

--
-- Tablo için indeksler `siparisler`
--
ALTER TABLE `siparisler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`slider_id`);

--
-- Tablo için indeksler `sosyalmedya`
--
ALTER TABLE `sosyalmedya`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `sss`
--
ALTER TABLE `sss`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tema_header_ustu`
--
ALTER TABLE `tema_header_ustu`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `urun`
--
ALTER TABLE `urun`
  ADD PRIMARY KEY (`urun_id`);

--
-- Tablo için indeksler `urunfoto`
--
ALTER TABLE `urunfoto`
  ADD PRIMARY KEY (`urunfoto_id`);

--
-- Tablo için indeksler `urun_seo`
--
ALTER TABLE `urun_seo`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `urun_turleri`
--
ALTER TABLE `urun_turleri`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `urun_turu_seourl` (`urun_turu_seourl`),
  ADD UNIQUE KEY `urun_turu` (`urun_turu`);

--
-- Tablo için indeksler `urun_yorumlar`
--
ALTER TABLE `urun_yorumlar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`),
  ADD UNIQUE KEY `users_mail` (`users_mail`),
  ADD UNIQUE KEY `users_phone` (`users_phone`);

--
-- Tablo için indeksler `varyant`
--
ALTER TABLE `varyant`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `videogaleri`
--
ALTER TABLE `videogaleri`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `aboneler`
--
ALTER TABLE `aboneler`
  MODIFY `abone_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Tablo için AUTO_INCREMENT değeri `admins`
--
ALTER TABLE `admins`
  MODIFY `admins_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- Tablo için AUTO_INCREMENT değeri `affiliate`
--
ALTER TABLE `affiliate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `anasayfa_banner`
--
ALTER TABLE `anasayfa_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `banka`
--
ALTER TABLE `banka`
  MODIFY `banka_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `blogs`
--
ALTER TABLE `blogs`
  MODIFY `blogs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Tablo için AUTO_INCREMENT değeri `blog_yorum`
--
ALTER TABLE `blog_yorum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `footer`
--
ALTER TABLE `footer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Tablo için AUTO_INCREMENT değeri `footerbaslik`
--
ALTER TABLE `footerbaslik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `hakkimizda`
--
ALTER TABLE `hakkimizda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `icerik_sayilari`
--
ALTER TABLE `icerik_sayilari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Tablo için AUTO_INCREMENT değeri `kupon_kodu`
--
ALTER TABLE `kupon_kodu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `mailmarketing`
--
ALTER TABLE `mailmarketing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `mail_ayar`
--
ALTER TABLE `mail_ayar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Tablo için AUTO_INCREMENT değeri `mesajlar`
--
ALTER TABLE `mesajlar`
  MODIFY `mesaj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Tablo için AUTO_INCREMENT değeri `referans`
--
ALTER TABLE `referans`
  MODIFY `referans_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `reset_pw`
--
ALTER TABLE `reset_pw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `resimgaleri`
--
ALTER TABLE `resimgaleri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- Tablo için AUTO_INCREMENT değeri `sepet`
--
ALTER TABLE `sepet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Tablo için AUTO_INCREMENT değeri `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `siparisler`
--
ALTER TABLE `siparisler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- Tablo için AUTO_INCREMENT değeri `slider`
--
ALTER TABLE `slider`
  MODIFY `slider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `sosyalmedya`
--
ALTER TABLE `sosyalmedya`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `sss`
--
ALTER TABLE `sss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `tema_header_ustu`
--
ALTER TABLE `tema_header_ustu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `urun`
--
ALTER TABLE `urun`
  MODIFY `urun_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Tablo için AUTO_INCREMENT değeri `urunfoto`
--
ALTER TABLE `urunfoto`
  MODIFY `urunfoto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- Tablo için AUTO_INCREMENT değeri `urun_turleri`
--
ALTER TABLE `urun_turleri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `urun_yorumlar`
--
ALTER TABLE `urun_yorumlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Tablo için AUTO_INCREMENT değeri `varyant`
--
ALTER TABLE `varyant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `videogaleri`
--
ALTER TABLE `videogaleri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
