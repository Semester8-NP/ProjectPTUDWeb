-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 22, 2018 lúc 08:53 AM
-- Phiên bản máy phục vụ: 10.1.31-MariaDB
-- Phiên bản PHP: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webproduct`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `admin_group_id` int(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `name`, `admin_group_id`) VALUES
(1, 'admin', '96e79218965eb72c92a549dd5a330112', 'admin trùm', 1),
(7, 'admincp', '96e79218965eb72c92a549dd5a330112', 'Mod', 2),
(21, 'nguyentv', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyên Từ', 0),
(22, 'phuvg', 'e10adc3949ba59abbe56e057f20f883e', 'Phú Vương', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_group`
--

CREATE TABLE `admin_group` (
  `id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `sort_order` tinyint(4) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `admin_group`
--

INSERT INTO `admin_group` (`id`, `name`, `sort_order`, `permissions`) VALUES
(1, 'Admin', 1, 'a:14:{s:4:\"tran\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:13:\"product_order\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:3:\"cat\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:7:\"product\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:11:\"admin_group\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:5:\"admin\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:4:\"user\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:4:\"news\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:4:\"info\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:7:\"support\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:7:\"contact\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:7:\"comment\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:5:\"slide\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:5:\"video\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}}'),
(2, 'Mod', 2, 'a:9:{s:3:\"cat\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:7:\"product\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:4:\"news\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:4:\"info\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:7:\"support\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:7:\"contact\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:7:\"comment\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:5:\"slide\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}s:5:\"video\";a:2:{i:0;s:4:\"list\";i:1;s:6:\"change\";}}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `site_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `site_title`, `meta_desc`, `meta_key`, `parent_id`, `sort_order`) VALUES
(1, 'Điện thoại', '', '', '', 0, 0),
(2, 'Máy tính bảng', '', '', '', 0, 1),
(38, 'Apple', '', '', '', 1, 0),
(3, 'Laptop', '', '', '', 0, 2),
(39, 'Asus', '', '', '', 1, 0),
(40, 'Samsung', '', '', '', 1, 0),
(41, 'Apple', '', '', '', 3, 0),
(42, 'Lenovo', '', '', '', 3, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `parent_id` int(255) NOT NULL,
  `user_name` text COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL,
  `count_like` int(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `product_id`, `parent_id`, `user_name`, `user_email`, `user_id`, `user_ip`, `content`, `created`, `count_like`, `status`) VALUES
(1, 7, 0, 'Hoang van tuyen', 'hoangvantuyencnt@gmail.com', 0, '', 'San pham noi con khong admin?                    ', 1408798677, 10, 1),
(2, 7, 1, 'Vu van Anh', 'anh@gmail.com', 0, '', 'San pham nay van con hang', 1408799662, 3, 1),
(3, 7, 0, 'abc', 'hoang@gmail.com', 0, '', 'Test comment             ', 1408800324, 8, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `id` int(128) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `content_static`
--

CREATE TABLE `content_static` (
  `id` int(11) NOT NULL,
  `key` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `content` mediumtext COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `content_static`
--

INSERT INTO `content_static` (`id`, `key`, `content`) VALUES
(3, 'footer', '<p class=\"bold\">\r\n &copy;2013 -2014 Bản quyền thuộc về&nbsp; <strong>C&ocirc;ng ty TNHH Tuấn Thoa media &ndash; Đại l&yacute; VTC Digital</strong></p>\r\n<p>\r\n Lĩnh vực hoạt động của c&ocirc;ng ty: Điện &amp; điện tử , b&aacute;n lẻ &amp; b&aacute;n bu&ocirc;n</p>\r\n<p>\r\n <strong>Cơ sở 1:</strong>: Cẩm La, X&atilde; Thanh Sơn, Huyện Kiến Thụy, Th&agrave;nh Phố Hải Ph&ograve;ng - DT: 0313881505</p>\r\n<p>\r\n <strong>Cơ sở 2:</strong>: Cẩm Xu&acirc;n, N&uacute;i Đối, Huyện Kiến Thụy, Th&agrave;nh Phố Hải Ph&ograve;ng - DT: 0313812682</p>\r\n'),
(18, 'shipping', '<p>\r\n Chi ph&iacute; vận chuyển của Tuấn Thoa Media</p>\r\n');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `info`
--

INSERT INTO `info` (`id`, `title`, `content`, `meta_desc`, `meta_key`, `created`) VALUES
(1, 'Giới thiệu', '<p>\r\n	Giới thiệu</p>\r\n', '', '', 1409044792),
(2, 'Hướng dẫn mua hàng', '<p>\r\n	Hướng dẫn mua h&agrave;ng</p>\r\n', '', '', 1409044950);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `maker`
--

CREATE TABLE `maker` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `site_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `parent_id` int(255) NOT NULL,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(50) COLLATE utf8_bin NOT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `feature` enum('0','1') COLLATE utf8_bin NOT NULL,
  `count_view` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `title`, `intro`, `content`, `meta_desc`, `meta_key`, `image_link`, `created`, `feature`, `count_view`) VALUES
(1, 'Nhà lầu siêu xe hàng mã ế sưng, đồ chơi biển đảo hút khách', '(Dân trí) - Loạt đồ chơi trung thu biển đảo hướng về quê hương mới xuất hiện nhưng đã hút khách, các mặt hàng vàng mã “xa xỉ” không còn được nhiều người mua sắm.', '<p style=\"TEXT-ALIGN: left\">\r\n	Theo b&aacute;c Lan, một chủ cửa h&agrave;ng ở phố H&agrave;ng M&atilde; chia sẻ: &ldquo;Kinh tế kh&oacute; khăn n&ecirc;n người bỏ tiền triệu ra mua đồ c&uacute;ng đắt tiền như nh&agrave; lầu, xe hơi, điện thoại, ti vi c&ograve;n rất &iacute;t. Mọi người chỉ lựa chọn những loại đồ c&oacute; gi&aacute; b&igrave;nh d&acirc;n như quần &aacute;o, gi&agrave;y d&eacute;p v&agrave; mũ để c&uacute;ng. Những mặt h&agrave;ng b&aacute;n chạy nhất l&agrave; tiền &acirc;m phủ, v&agrave;ng, quần &aacute;o hay gi&agrave;y d&eacute;p v&igrave; c&oacute; gi&aacute; kh&aacute; b&igrave;nh d&acirc;n&rdquo;.</p>\r\n<p style=\"TEXT-ALIGN: center\">\r\n	<img alt=\"Mặt hàng đèn lồng biển đảo mới xuất hiện trong dịp Tết Trung Thu năm nay\" src=\"http://dantri4.vcmedia.vn/Urgz3f5tKFdDA0VUUO/Image/2014/08/n1-242e1.jpg\" /><br />\r\n	<span style=\"FONT-FAMILY: Tahoma; FONT-SIZE: 10pt\">Mặt h&agrave;ng đ&egrave;n lồng biển đảo mới xuất hiện trong dịp Tết Trung Thu năm nay</span></p>\r\n<p style=\"TEXT-ALIGN: center\">\r\n	<span style=\"FONT-FAMILY: Tahoma\"><img alt=\"Các thông điệp ý nghĩa yêu quê hương, biển đảo được in lên đèn lồng\" src=\"http://dantri4.vcmedia.vn/Urgz3f5tKFdDA0VUUO/Image/2014/08/n2-242e1.jpg\" /></span><br />\r\n	<span style=\"FONT-FAMILY: Tahoma; FONT-SIZE: 10pt\">C&aacute;c th&ocirc;ng điệp &yacute; nghĩa y&ecirc;u qu&ecirc; hương, biển đảo được in l&ecirc;n đ&egrave;n lồng</span></p>\r\n<p>\r\n	Một mặt h&agrave;ng đặc biệt của m&ugrave;a Vu Lan năm nay đ&oacute; l&agrave; loại đồ chơi &ldquo;biển đảo&rdquo;. Đ&oacute; l&agrave; những chiếc đ&egrave;n lồng được in những th&ocirc;ng điệp hướng về qu&ecirc; hương, biển đảo hết sức &yacute; nghĩa.</p>\r\n<div class=\"article-side-rail\" id=\"article-side-rail\">\r\n	<div class=\"article-video-relation\">\r\n		<div class=\"relative\">\r\n			<img alt=\"Mùa Vu Lan: \" class=\"thumb\" src=\"http://video-thumbs.vcmedia.vn///dantri/7iS0Ym1SbbOoTsWhJi6Q/2014/08/08/vangma-15e63.jpg\" /><img class=\"ico\" src=\"http://dantri3.vcmedia.vn/App_Themes/Default/Images/ico_video_play.png\" /></div>\r\n		<p class=\"caption\">\r\n			M&ugrave;a Vu Lan: &quot;Xe si&ecirc;u sang&quot; đỗ chật phố H&agrave;ng M&atilde;</p>\r\n	</div>\r\n</div>\r\n<p>\r\n	C&aacute;c chủ cửa h&agrave;ng tại đ&acirc;y cho biết, c&aacute;c loại mặt h&agrave;ng l&agrave;m thủ c&ocirc;ng truyền thống đ&egrave;n lồng, đầu l&acirc;n, đ&egrave;n &ocirc;ng sao vẫn được kh&aacute;ch h&agrave;ng ưa chuộng nhất. Ngo&agrave;i ra, mẫu đ&egrave;n lồng in sẵn mang th&ocirc;ng điệp hướng về biển đảo qu&ecirc; hương được nhiều bậc phụ huynh v&agrave; c&aacute;c em học sinh đặc biệt y&ecirc;u th&iacute;ch.</p>\r\n<p style=\"TEXT-ALIGN: center\">\r\n	<img alt=\"Mới xuất hiện nhưng những chiếc đèn lồng này được nhiều phụ huynh và các em nhỏ lựa chọn\" src=\"http://dantri4.vcmedia.vn/Urgz3f5tKFdDA0VUUO/Image/2014/08/n4-242e1.jpg\" /><br />\r\n	<span style=\"FONT-FAMILY: Tahoma; FONT-SIZE: 10pt\">Mới xuất hiện nhưng những chiếc đ&egrave;n lồng n&agrave;y được nhiều phụ huynh v&agrave; c&aacute;c em nhỏ lựa chọn</span><br />\r\n	&nbsp;</p>\r\n<p>\r\n	Chiếc đ&egrave;n lồng mang th&ocirc;ng điệp biển đảo được gh&eacute;p lại bằng 3 mảnh b&igrave;a kh&aacute;c nhau. Chiếc đ&egrave;n c&oacute; thể thắp s&aacute;ng v&agrave; ph&aacute;t nhạc khi được lắp pin ở tay cầm.Tuy nhi&ecirc;n, chi tiết đ&aacute;ng ch&uacute; &yacute; nhất đ&oacute; l&agrave; những th&ocirc;ng điệp hướng về biển đảo in tr&ecirc;n th&acirc;n của chiếc đ&egrave;n lồng như &ldquo;Em y&ecirc;u biển đảo qu&ecirc; hương&rdquo;, &ldquo;B&eacute; hướng về biển đảo&rdquo;, &ldquo;Em y&ecirc;u biển đảo Việt Nam&rdquo;, &ldquo;Em y&ecirc;u ch&uacute; bộ đội hải qu&acirc;n Việt Nam&rdquo;, với những h&igrave;nh ảnh chiến sĩ Hải qu&acirc;n Việt Nam s&uacute;ng kho&aacute;c tr&ecirc;n vai bảo vệ chủ quyền biển đảo Tổ quốc hay những chiếc t&agrave;u mang d&ograve;ng chữ Cảnh s&aacute;t biển Việt Nam&hellip;</p>\r\n', '', '', 'n1-242e1.jpg', 1407553602, '0', 1),
(2, 'Arsenal đồng ý bán Vermaelen cho Barcelona', '(Dân trí) - Theo những thông tin từ báo giới Anh, Arsenal đã quyết định từ chối MU, để bán trung vệ Vermarlen cho Barcelona. Mức giá của trung vệ này vào khoảng 15 triệu bảng.', '<p>\r\n	Như đ&atilde; biết, c&aacute;ch đ&acirc;y v&agrave;i ng&agrave;y, trung vệ Vermaelen đ&atilde; từ chối gia hạn hợp đồng với Arsenal. Điều đ&oacute; khiến cho CLB th&agrave;nh London t&igrave;m c&aacute;ch b&aacute;n cầu thủ n&agrave;y bằng mọi gi&aacute; để &ldquo;gỡ gạc&rdquo; ch&uacute;t &iacute;t ph&iacute; chuyển nhượng thay v&igrave; mất trắng cầu thủ n&agrave;y&nbsp;ở m&ugrave;a H&egrave; sang năm.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<div align=\"center\">\r\n	<span style=\"FONT-FAMILY: Tahoma; FONT-SIZE: 10pt\"><img _fl=\"\" align=\"middle\" alt=\"Vermaelen ở rất gần Barcelona\" src=\"http://dantri4.vcmedia.vn/uajiKupQ6reCuKKDlVlG/Image/2014/08/Vermaelen-d4361.jpg\" style=\"MARGIN: 5px\" width=\"450\" /><br />\r\n	Vermaelen ở rất gần Barcelona</span><br />\r\n	&nbsp;</div>\r\n<p>\r\n	Trong thời gian gần đ&acirc;y, MU v&agrave; Barcelona l&agrave; hai ứng cử vi&ecirc;n s&aacute;ng gi&aacute; trong cuộc đua gi&agrave;nh chữ k&yacute; của hậu vệ người Bỉ. Cuối c&ugrave;ng, HLV Wenger đ&atilde; quyết định từ chối MU để b&aacute;n Vermarlen cho Barcelona. Trước đ&oacute; c&oacute; th&ocirc;ng tin cho rằng Wenger muốn đổi Vermaelen lấy Smalling, tuy nhi&ecirc;n Van Gaal lại từ chối phương &aacute;n n&agrave;y.</p>\r\n<p>\r\n	Trước b&aacute;o giới, HLV Wenger cho biết: &ldquo;Ch&uacute;ng t&ocirc;i đ&atilde; nhận được những lời đề nghị từ nước ngo&agrave;i v&agrave; quyết định để Vermaelen rời khỏi Premier League. Bản th&acirc;n Arsenal cũng đang ở trong thế kh&oacute; trong vụ n&agrave;y&rdquo;.</p>\r\n<p>\r\n	Theo tờ BBC, Arsenal đ&atilde; đồng &yacute; lời đề nghị trị gi&aacute; 15 triệu bảng của Barcelona. Trong thời gian tới, trung vệ người Bỉ sẽ được quyền tự do đ&agrave;m ph&aacute;n với đội b&oacute;ng xứ Catalan.</p>\r\n<p>\r\n	Nhiều khả năng thương vụ n&agrave;y sẽ ho&agrave;n tất trong thời gian tới. Arsenal cũng bắt đầu t&igrave;m người thay thế Vermaelen. L&uacute;c n&agrave;y, ưu ti&ecirc;n số 1 của HLV Wenger l&agrave; trung vệ Nastasic của Man City, người nhiều khả năng sẽ mất vị tr&iacute; nếu như Mangala gia nhập Etihad.</p>\r\n<p align=\"right\">\r\n	<b>H.Long</b></p>\r\n', '', '', 'Vermaelen-d4361.jpg', 1407553674, '0', 2),
(3, 'Hà Nội: CSGT tìm người thân giúp cháu bé 8 tuổi đi lạc', '(Dân trí) - Theo người thân cháu Chi, trong lúc gia đình nghỉ trưa, cháu Chi mải chơi đã đi lạc từ phía phường Ngọc Lâm (quận Long Biên) sang nội thành. Trong lúc đang hoang mang tìm cháu, gia đình nhận được tin báo của lực lượng cảnh sát giao thông.', '<p>\r\n	Khoảng 15h30 ng&agrave;y 8/8, khi đang l&agrave;m nhiệm vụ tại chốt ph&iacute;a nam cầu Chương Dương (địa b&agrave;n quận Ho&agrave;n Kiếm, H&agrave; Nội), Thượng sĩ Phạm Gia Hợp v&agrave; Thượng t&aacute; L&ecirc; Đức Đo&agrave;n(Đội CSGT số 1) ph&aacute;t hiện một ch&aacute;u b&eacute; khoảng 7-8 tuổi đi bộ tr&ecirc;n khu vực cầu Chương Dương với vẻ mặt sợ sệt. Khi Thượng sĩ Hợp v&agrave; Thượng t&aacute; Đ&ograve;an tiến lại hỏi han, ch&aacute;u b&eacute; c&oacute; biểu hiện sợ sệt v&agrave; bật kh&oacute;c n&oacute;i rằng đi lạc đường.</p>\r\n<p>\r\n	Thấy ch&aacute;u b&eacute; lả đi v&igrave; mệt, Thượng sĩ Hợp đ&atilde; đưa ch&aacute;u về chốt trực, mua b&aacute;nh v&agrave; sữa để ch&aacute;u ăn đỡ đ&oacute;i v&agrave; trấn tĩnh lại. Đồng thời, Thượng sĩ Hợp th&ocirc;ng b&aacute;o tr&ecirc;n c&aacute;c phương tiện th&ocirc;ng tin đại ch&uacute;ng về đặc điểm nhận dạng của ch&aacute;u b&eacute;.</p>\r\n<p>\r\n	<img alt=\"Cháu Chi đoàn tụ với gia đình.\" src=\"http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/Image/2014/08/455-549e4.jpg\" /><br />\r\n	Ch&aacute;u Chi đo&agrave;n tụ với gia đ&igrave;nh.</p>\r\n<p>\r\n	Sau khi trấn tĩnh lại, ch&aacute;u b&eacute; cho biết t&ecirc;n l&agrave; Vương Kim Chi (SN 2007), năm nay l&ecirc;n lớp 2 trường tiểu học &Aacute;i Mộ, quận Long Bi&ecirc;n, H&agrave; Nội. Bằng c&aacute;c biện ph&aacute;p nghiệp vụ, Thượng sĩ Hợp v&agrave; Thượng t&aacute; Đo&agrave;n đ&atilde; li&ecirc;n hệ được với c&ocirc; gi&aacute;o chủ nhiệm ch&aacute;u Chi để th&ocirc;ng b&aacute;o với gia đ&igrave;nh ch&aacute;u b&eacute; biết.</p>\r\n<p>\r\n	Gần 2 tiếng đồng hồ sau, mẹ ch&aacute;u Chi l&agrave; chị Đo&agrave;n Thị Khuyến (SN 1983, ở Ngọc L&acirc;m, Long Bi&ecirc;n, H&agrave; Nội) đ&atilde; t&igrave;m đến trụ sở Đội CSGT số 1 nhận lại con. Chị Khuyến cho cho biết, khoảng 14h c&ugrave;ng ng&agrave;y, trong l&uacute;c gia đ&igrave;nh nghỉ trưa, ch&aacute;u Chi mải chơi đ&atilde; đi lạc từ b&ecirc;n n&agrave;y cầu sang b&ecirc;n kia nội th&agrave;nh.</p>\r\n<p>\r\n	Trong l&uacute;c hoang mang kh&ocirc;ng biết t&igrave;m ch&aacute;u ở đ&acirc;u, gia đ&igrave;nh được th&ocirc;ng b&aacute;o ch&aacute;u Chi đ&atilde; được c&aacute;c chiến sĩ CSGT tận t&igrave;nh gi&uacute;p đỡ. Thay mặt gia đ&igrave;nh, chị Khuyến đ&atilde; viết thư cảm ơn c&aacute;c chiến sĩ cảnh s&aacute;t giao th&ocirc;ng.</p>\r\n<p>\r\n	<strong>Tiến Nguy&ecirc;n</strong></p>\r\n', '', '', '455-549e4.jpg', 1407553969, '0', 9),
(4, 'Mỹ tăng cường không kích Iraq', '(Dân trí) - Sau khi Tổng thống Obama phê chuẩn cho không kích các mục tiêu của nhóm phiến quân Hồi giáo IS ở miền bắc Iraq, Lầu Năm Góc đã tiến hành 3 đợt không kích.', '<p>\r\n	C&aacute;c vụ kh&ocirc;ng k&iacute;ch nhằm v&agrave;o nh&oacute;m Nh&agrave; nước Hồi gi&aacute;o (IS) ở miền bắc Iraq l&agrave; những cuộc tấn c&ocirc;ng đầu ti&ecirc;n kể từ khi Mỹ trực tiếp tham gia v&agrave;o hoạt động qu&acirc;n sự ở Iraq v&agrave; sau đ&oacute; r&uacute;t qu&acirc;n v&agrave;o cuối năm 2011.</p>\r\n<p>\r\n	Trong cuộc kh&ocirc;ng k&iacute;ch đầu ti&ecirc;n v&agrave;o ng&agrave;y thứ s&aacute;u, m&aacute;y bay kh&ocirc;ng người l&aacute;i c&ugrave;ng chiến đấu cơ hải qu&acirc;n Mỹ đ&atilde; nhắm v&agrave;o c&aacute;c mục ti&ecirc;u gần th&agrave;nh phố Irbil của người Kurd. Sau đ&oacute; họ tiến h&agrave;nh th&ecirc;m 2 đợt tấn c&ocirc;ng nữa.</p>\r\n<p>\r\n	Nh&oacute;m Hồi gi&aacute;o người Sunni IS đ&atilde; chiếm quyền kiểm so&aacute;t nhiều khu vực của Iraq v&agrave; cả Syria.</p>\r\n<p>\r\n	H&agrave;ng chục ng&agrave;n người thuộc c&aacute;c nh&oacute;m d&acirc;n tộc thiểu số đ&atilde; phải rời bỏ nh&agrave; cửa khi phiến qu&acirc;n tiến v&agrave;o.</p>\r\n<p>\r\n	Nh&oacute;m IS hay c&ograve;n được gọi l&agrave; ISIS cũng đ&atilde; chiếm đập lớn nhất Iraq.</p>\r\n<p>\r\n	Lầu Năm G&oacute;c cho biết trong đợt kh&ocirc;ng k&iacute;ch thứ hai, m&aacute;y bay kh&ocirc;ng người l&aacute;i của Mỹ đ&atilde; ph&aacute; hủy một vị tr&iacute; đặt ph&aacute;o của phiến qu&acirc;n v&agrave; ti&ecirc;u diệt một nh&oacute;m phiến qu&acirc;n.</p>\r\n<p>\r\n	Chỉ hơn một tiếng sau, chiến đấu cơ F/A-18 đ&atilde; d&ugrave;ng bom c&oacute; laser dẫn đường bắn tr&uacute;ng một đo&agrave;n 7 xe của IS.</p>\r\n<p>\r\n	Trước đ&oacute;, v&agrave;o ng&agrave;y thứ s&aacute;u, 2 quả bom đ&atilde; được thả xuống một khẩu ph&aacute;o của IS d&ugrave;ng để chống lại lực lượng đang bảo vệ Irbil, thủ phủ của v&ugrave;ng tự trị của người Kurd.</p>\r\n<p>\r\n	Ph&aacute;t ng&ocirc;n vi&ecirc;n Bộ Ngoại giao Mỹ Marie Harf cho biết mục ti&ecirc;u trước mắt của c&aacute;c cuộc kh&ocirc;ng k&iacute;ch l&agrave; &ldquo;ngăn chặn bước tiến&rdquo; của IS về Irbil.</p>\r\n<p>\r\n	&ldquo;Sau đ&oacute; về l&acirc;u d&agrave;i chung t&ocirc;i muốn phối hợp hỗ trợ th&ecirc;m thời gian v&agrave; kh&ocirc;ng gian cho c&aacute;c lực lượng của người Kurd để xốc lại lực lượng, chiến đấu với đe dọa của ch&iacute;nh họ&rdquo;.</p>\r\n<p>\r\n	B&agrave; cũng khẳng định &ldquo;kh&ocirc;ng c&oacute; giải ph&aacute;p qu&acirc;n sự l&acirc;u d&agrave;i của Mỹ ở đ&oacute;&rdquo;.</p>\r\n<p>\r\n	Mặc d&ugrave; ch&iacute;nh phủ Iraq v&agrave; V&ugrave;ng người Kurd vẫn c&ograve;n đang c&oacute; bất đồng trong những th&aacute;ng qua, nhưng Thủ tướng Nouri Maliki đ&atilde; ph&aacute;i một m&aacute;y bay chở đạn tới Irbil v&agrave; thứ s&aacute;u. Trước đ&oacute; &ocirc;ng đ&atilde; lệnh cho lực lượng kh&ocirc;ng qu&acirc;n hỗ trợ cho c&aacute;c tay s&uacute;ng người Kurd để chiến đấu chống IS.</p>\r\n<p>\r\n	<b>Trung Anh</b></p>\r\n', '', '', '1-7d48c.jpg', 1407554007, '0', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `transaction_id` int(255) NOT NULL,
  `id` int(255) NOT NULL,
  `product_id` int(255) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `data` text COLLATE utf8_bin NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`transaction_id`, `id`, `product_id`, `qty`, `amount`, `data`, `status`) VALUES
(7, 6, 2, 1, '4000000.0000', '', 1),
(8, 7, 2, 1, '4000000.0000', '', 0),
(9, 8, 8, 1, '10000000.0000', '', 0),
(10, 9, 8, 1, '10000000.0000', '', 0),
(11, 10, 8, 1, '10000000.0000', '', 2),
(12, 11, 8, 1, '10000000.0000', '', 0),
(13, 12, 8, 2, '20000000.0000', '', 0),
(14, 13, 8, 1, '10000000.0000', '', 1),
(15, 14, 3, 1, '5000000.0000', '', 0),
(16, 15, 3, 1, '5000000.0000', '', 0),
(17, 16, 3, 1, '5000000.0000', '', 0),
(18, 17, 3, 1, '5000000.0000', '', 0),
(19, 18, 3, 1, '5000000.0000', '', 0),
(20, 19, 3, 1, '5000000.0000', '', 0),
(21, 20, 8, 1, '10000000.0000', '', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `maker_id` int(255) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `discount` int(11) NOT NULL,
  `image_link` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `image_list` text COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `view` int(11) NOT NULL DEFAULT '0',
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `site_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `warranty` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `total` int(255) NOT NULL,
  `buyed` int(255) NOT NULL,
  `rate_total` int(255) NOT NULL,
  `rate_count` int(255) NOT NULL,
  `gifts` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `feature` enum('0','1') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `screen` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `os` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `back_cam` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `front_cam` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cpu` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ram` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `memory` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pin` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sim` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `catalog_id`, `name`, `maker_id`, `price`, `content`, `discount`, `image_link`, `image_list`, `created`, `view`, `meta_key`, `site_title`, `warranty`, `total`, `buyed`, `rate_total`, `rate_count`, `gifts`, `video`, `meta_desc`, `feature`, `screen`, `os`, `back_cam`, `front_cam`, `cpu`, `ram`, `memory`, `pin`, `sim`) VALUES
(20, 38, 'iphone X', 0, '34700000.0000', '<h2 .=\"\" 10=\"\" 9=\"\" a=\"\" c=\"\" cao=\"\" color:=\"\" dejavu=\"\" face=\"\" font-size:=\"\" href=\"https://www.thegioididong.com/dtdd/iphone-x-64gb\" i=\"\" i.=\"\" iphone=\"\" liberation=\"\" m=\"\" mang=\"\" n=\"\" ng=\"\" nh=\"\" nhanh=\"\" outline:=\"\" overflow:=\"\" pin=\"\" ra=\"\" retina=\"\" sau=\"\" span=\"\" strong=\"\" style=\"color: rgb(51, 51, 51); font-family: Helvetica, Arial, \" super=\"\" t=\"\" target=\"_blank\" title=\"điện thoại iPhone X 64GB\" trang=\"\" type=\"điện thoại iPhone X 64GB\" u=\"\" x=\"\" y=\"\" zoom:=\"\">\r\n	Với thiết kế cực sang trọng c&ugrave;ng những t&iacute;nh năng hiện đại, iPhone X - phi&ecirc;n bản iPhone kỷ niệm 10 năm ng&agrave;y ra mắt iPhone nhắm đến ph&acirc;n kh&uacute;c người d&ugrave;ng cực kỳ cao cấp, việc được sỡ hữu si&ecirc;u phẩm iPhone X sẽ l&agrave; niềm tự h&agrave;o với cộng đồng iFan.</h2>\r\n', 300000, 'iphone-x-256gb-h2-400x4601.png', '[]', 1528519509, 0, '', '', '12 tháng', 0, 0, 0, 0, '', '', '', '0', 'OLED, 5.8\", Super Retina', 'iOS 11', '2 camera 12 MP', '7 MP', 'Apple A11 Bionic 6 nhân', '3 GB', '256 GB', '2716 mAh, có sạc nhanh', '1 Nano SIM, Hỗ trợ 4G'),
(21, 38, 'Điện thoại iPhone 8 Plus 256GB', 0, '28790000.0000', '<h2 style=\"margin: 0px 0px 10px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 20px; line-height: 1.3em; font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; color: rgb(51, 51, 51); outline: none; zoom: 1; overflow: hidden;\">\r\n	<a href=\"https://www.thegioididong.com/dtdd-apple-iphone\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 18px; color: rgb(80, 168, 227); outline: none; zoom: 1;\" target=\"_blank\" title=\"Điện thoại iPhone\">iPhone</a>&nbsp;8 Plus l&agrave; bản n&acirc;ng cấp nhẹ của chiếc&nbsp;<a href=\"https://www.thegioididong.com/dtdd/iphone-7-plus-256gb\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 18px; color: rgb(80, 168, 227); outline: none; zoom: 1;\" target=\"_blank\" title=\"Điện thoại iPhone 7 Plus\">iPhone 7 Plus</a>&nbsp;đ&atilde; ra mắt trước đ&oacute; với cấu h&igrave;nh mạnh mẽ c&ugrave;ng camera c&oacute; nhiều cải tiến.</h2>\r\n<h3 style=\"margin: 30px 0px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 20px; line-height: 1.3em; font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; color: rgb(51, 51, 51); outline: none; zoom: 1; overflow: hidden;\">\r\n	<strong style=\"margin: 0px; padding: 0px;\">Thiết kế quen thuộc</strong></h3>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	Về ngoại h&igrave;nh iPhone 8 Plus kh&ocirc;ng c&oacute; qu&aacute; nhiều kh&aacute;c biệt so với người đ&agrave;n anh đi trước.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;\">\r\n	<a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/42/114114/iphone-8-plus-256gb2-1.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"Thiết kế quen thuộc\" class=\"lazy\" data-original=\"https://cdn3.tgdd.vn/Products/Images/42/114114/iphone-8-plus-256gb2-1.jpg\" src=\"https://cdn3.tgdd.vn/Products/Images/42/114114/iphone-8-plus-256gb2-1.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"Thiết kế quen thuộc\" /></a></p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	Thay đổi lớn nhất ch&iacute;nh l&agrave; Apple đ&atilde; chuyển từ thiết kế kim loại nguy&ecirc;n khối sang mặt lưng k&iacute;nh nhằm mang t&iacute;nh năng sạc kh&ocirc;ng d&acirc;y l&ecirc;n 8 Plus.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;\">\r\n	<a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/42/114114/iphone-8-plus-256gb-h1-1.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"Thiết kế quen thuộc\" class=\"lazy\" data-original=\"https://cdn.tgdd.vn/Products/Images/42/114114/iphone-8-plus-256gb-h1-1.jpg\" src=\"https://cdn.tgdd.vn/Products/Images/42/114114/iphone-8-plus-256gb-h1-1.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"Thiết kế quen thuộc\" /></a></p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	Ngo&agrave;i ra khả năng chống nước v&agrave; bụi bẩn ti&ecirc;u chuẩn IP67 vẫn được duy tr&igrave; tr&ecirc;n m&aacute;y.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;\">\r\n	<a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/42/114114/iphone-8-plus-256gb-h8.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"Thiết kế quen thuộc\" class=\"lazy\" data-original=\"https://cdn2.tgdd.vn/Products/Images/42/114114/iphone-8-plus-256gb-h8.jpg\" src=\"https://cdn2.tgdd.vn/Products/Images/42/114114/iphone-8-plus-256gb-h8.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"Thiết kế quen thuộc\" /></a></p>\r\n<h3 style=\"margin: 30px 0px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 20px; line-height: 1.3em; font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; color: rgb(51, 51, 51); outline: none; zoom: 1; overflow: hidden;\">\r\n	<strong style=\"margin: 0px; padding: 0px;\">M&agrave;n h&igrave;nh đẹp</strong></h3>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	iPhone 8 Plus sở hữu m&agrave;n h&igrave;nh k&iacute;ch thước 5.5 inch độ ph&acirc;n giải&nbsp;<a href=\"https://www.thegioididong.com/tin-tuc/do-phan-giai-man-hinh-qhd-hd-fullhd-2k-4k-la-gi--592178#hd\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\" target=\"_blank\" title=\"Tìm hiểu độ phân giải Full HD (1080 x 1920 pixels)\">Full HD (1080 x 1920 pixels)</a>&nbsp;đem lại khả năng hiển thị sắc n&eacute;t.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;\">\r\n	<a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/42/114114/iphone-8-plus-256gb-h3.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"Màn hình đẹp\" class=\"lazy\" data-original=\"https://cdn4.tgdd.vn/Products/Images/42/114114/iphone-8-plus-256gb-h3.jpg\" src=\"https://cdn4.tgdd.vn/Products/Images/42/114114/iphone-8-plus-256gb-h3.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"Màn hình đẹp\" /></a></p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	M&aacute;y vẫn sử dụng tấm nền&nbsp;LED-backlit IPS LCD kết hợp với c&ocirc;ng nghệ True Tone gi&uacute;p bạn dễ d&agrave;ng quan s&aacute;t với nhiều điều kiện kh&aacute;c nhau.</p>\r\n<h3 style=\"margin: 30px 0px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 20px; line-height: 1.3em; font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; color: rgb(51, 51, 51); outline: none; zoom: 1; overflow: hidden;\">\r\n	<strong style=\"margin: 0px; padding: 0px;\">Hiệu năng h&agrave;ng đầu</strong></h3>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	Cung cấp sức mạnh cho iPhone 8 Plus ch&iacute;nh l&agrave; con chip&nbsp;<a href=\"https://www.thegioididong.com/tin-tuc/chi-tiet-a11-bionic-chip-co-nhieu-thanh-phan-apple-tu-trong-nhat-tu-truoc-den-nay-1021653\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\" target=\"_blank\" title=\"Apple A11 Bionic 6 nhân\">Apple A11 Bionic 6 nh&acirc;n</a>&nbsp;c&ugrave;ng với 3 GB RAM v&agrave; 32 GB bộ nhớ trong.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;\">\r\n	<a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/42/114114/iphone-8-plus-256gb-vang-7-1.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"Hiệu năng hàng đầu\" class=\"lazy\" data-original=\"https://cdn1.tgdd.vn/Products/Images/42/114114/iphone-8-plus-256gb-vang-7-1.jpg\" src=\"https://cdn1.tgdd.vn/Products/Images/42/114114/iphone-8-plus-256gb-vang-7-1.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"Hiệu năng hàng đầu\" /></a></p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	M&aacute;y sử dụng mượt m&agrave; với tất cả c&aacute;c game v&agrave; ứng dụng hiện c&oacute; tr&ecirc;n App Store m&agrave; kh&ocirc;ng gặp phải bất cứ độ trễ hay giật lag n&agrave;o trong qu&aacute; tr&igrave;nh sử dụng.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;\">\r\n	<a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/42/114114/iphone-8-plus-256gb3.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"Hiệu năng hàng đầu\" class=\"lazy\" data-original=\"https://cdn3.tgdd.vn/Products/Images/42/114114/iphone-8-plus-256gb3.jpg\" src=\"https://cdn3.tgdd.vn/Products/Images/42/114114/iphone-8-plus-256gb3.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"Hiệu năng hàng đầu\" /></a></p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	Ngo&agrave;i ra m&aacute;y chạy sẵn iOS 11 được Apple nhấn mạnh về khả năng xử l&yacute; c&aacute;c t&aacute;c vụ AR đem lại một trải nghiệm ho&agrave;n to&agrave;n mới mẻ tr&ecirc;n di động.</p>\r\n<h3 style=\"margin: 30px 0px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 20px; line-height: 1.3em; font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; color: rgb(51, 51, 51); outline: none; zoom: 1; overflow: hidden;\">\r\n	<strong style=\"margin: 0px; padding: 0px;\">Camera chất lượng h&agrave;ng đầu</strong></h3>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	So với iPhone 7 Plus th&igrave; iPhone 8 Plus đ&atilde; c&oacute; những cải tiến r&otilde; rệt về chất lượng ảnh chụp. Về phần cứng th&igrave; m&aacute;y vẫn sử dụng bộ đ&ocirc;i camera ch&iacute;nh c&oacute; độ ph&acirc;n giải 12 MP v&agrave; giờ đ&acirc;y Apple đ&atilde; t&iacute;ch hợp th&ecirc;m một con chip&nbsp;xử l&yacute; h&igrave;nh ảnh để n&acirc;ng cao chất lượng ảnh chụp.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;\">\r\n	<a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/42/114114/iphone-8-plus-256gb-vangdong-13-1.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"Camera chất lượng hàng đầu\" class=\"lazy\" data-original=\"https://cdn.tgdd.vn/Products/Images/42/114114/iphone-8-plus-256gb-vangdong-13-1.jpg\" src=\"https://cdn.tgdd.vn/Products/Images/42/114114/iphone-8-plus-256gb-vangdong-13-1.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"Camera chất lượng hàng đầu\" /></a></p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	Khả năng zoom quang 2X kh&ocirc;ng thay đổi chất lượng cũng như x&oacute;a ph&ocirc;ng ch&acirc;n dung vẫn được t&iacute;ch hợp tr&ecirc;n iPhone 8 Plus c&ugrave;ng với&nbsp;<a href=\"https://www.thegioididong.com/tin-tuc/post-1029635\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\" target=\"_blank\" title=\"PORTRAIT LIGHTING\" type=\"PORTRAIT LIGHTING\">Portrait Lighting</a>, t&iacute;nh năng chụp ảnh s&acirc;n khấu ho&agrave;n to&agrave;n mới.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;\">\r\n	<a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/42/114114/iphone-8-plus-256gb4.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"Camera chất lượng hàng đầu\" class=\"lazy\" data-original=\"https://cdn2.tgdd.vn/Products/Images/42/114114/iphone-8-plus-256gb4.jpg\" src=\"https://cdn2.tgdd.vn/Products/Images/42/114114/iphone-8-plus-256gb4.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"Camera chất lượng hàng đầu\" /></a></p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	Camera trước độ ph&acirc;n giải 7 MP hỗ trợ chụp ảnh HDR đủ để l&agrave;m h&agrave;i l&ograve;ng những người d&ugrave;ng kh&oacute; t&iacute;nh năng.</p>\r\n<h3 style=\"margin: 30px 0px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 20px; line-height: 1.3em; font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; color: rgb(51, 51, 51); outline: none; zoom: 1; overflow: hidden;\">\r\n	<strong style=\"margin: 0px; padding: 0px;\">Vẫn c&ograve;n Touch ID</strong></h3>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	Khi m&agrave; Face ID vẫn chưa thực sự khiến người d&ugrave;ng ho&agrave;n to&agrave;n y&ecirc;n t&acirc;m th&igrave; Touch ID tr&ecirc;n iPhone 8 vẫn l&agrave; một c&aacute;i g&igrave; đ&oacute; quen thuộc v&agrave; được nhiều người tin d&ugrave;ng hơn.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; text-align: center;\">\r\n	<a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/42/114114/iphone-8-plus-256gb-vangdong-14-2.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"Vẫn còn Touch ID\" class=\"lazy\" data-original=\"https://cdn4.tgdd.vn/Products/Images/42/114114/iphone-8-plus-256gb-vangdong-14-2.jpg\" src=\"https://cdn4.tgdd.vn/Products/Images/42/114114/iphone-8-plus-256gb-vangdong-14-2.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"Vẫn còn Touch ID\" /></a></p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	Tốc độ nhận diện nhanh ch&oacute;ng gi&uacute;p bạn dễ d&agrave;ng mở kh&oacute;a thiết bị.</p>\r\n', 1000000, 'iphone-8-plus-256gb2-400x460-1-400x460.png', '[\"-iphone-8-plus-256gb-4.jpg\"]', 1528527387, 0, '', '', '6 tháng', 0, 0, 0, 0, '', '', '', '0', '', '', '', '', '', '', '', '', ''),
(22, 38, 'Điện thoại iPhone 6s Plus 32GB', 0, '14000000.0000', '<h2 32=\"\" 6=\"\" 6s=\"\" color:=\"\" dejavu=\"\" gb=\"\" h3=\"\" i=\"\" iphone=\"\" liberation=\"\" n=\"\" ng=\"\" nh=\"\" o=\"\" outline:=\"\" overflow:=\"\" p=\"\" plus=\"\" style=\"margin: 30px 0px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 20px; line-height: 20.8px; font-family: Helvetica, Arial, \" text-align:=\"\" u=\"\" zoom:=\"\">\r\n	<strong style=\"margin: 0px; padding: 0px;\">Camera được cải tiến</strong></h2>\r\n<p 12=\"\" 32=\"\" 6=\"\" 6s=\"\" 8=\"\" a=\"\" c=\"\" camera=\"\" cho=\"\" dejavu=\"\" font-size:=\"\" gb=\"\" href=\"https://www.thegioididong.com/dtdd/iphone-6-plus-16gb\" i=\"\" iphone=\"\" liberation=\"\" line-height:=\"\" m=\"\" mp=\"\" n=\"\" ng=\"\" ng.=\"\" nh=\"\" nhau=\"\" p=\"\" plus=\"\" sau=\"\" style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, \" t=\"\" target=\"_blank\" text-align:=\"\" thao=\"\" thay=\"\" title=\"Thông tin điện thoại iPhone 6 Plus 16 GB\" trong=\"\" u=\"\" y=\"\">\r\n	&nbsp;</p>\r\n<div class=\"twentytwenty-handle\" data-src1=\"https://cdn.tgdd.vn/Products/Images/42/71770/iphone-6s-plus2-1.jpg\" data-src2=\"https://cdn.tgdd.vn/Products/Images/42/71770/iphone-6s-plus1-1.jpg\" dejavu=\"\" div=\"\" font-size:=\"\" id=\"imgCpr_1\" img=\"\" liberation=\"\" p=\"\" src=\"https://cdn.tgdd.vn/Products/Images/42/71770/iphone-6s-plus1-1.jpg\" style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, \">\r\n	&nbsp;\r\n	<p 6=\"\" dejavu=\"\" font-size:=\"\" i=\"\" iphone=\"\" liberation=\"\" line-height:=\"\" n=\"\" ng=\"\" p=\"\" so=\"\" style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, \" text-align:=\"\" u=\"\">\r\n		Camera trước với độ ph&acirc;n giải 5 MP cho h&igrave;nh ảnh với độ chi tiết r&otilde; n&eacute;t, đặc biệt m&aacute;y c&ograve;n c&oacute; t&iacute;nh năng Retina Flash, sẽ gi&uacute;p m&agrave;n h&igrave;nh s&aacute;ng l&ecirc;n như đ&egrave;n Flash để bức ảnh khi bạn chụp trong trời tối được tốt hơn.</p>\r\n	<p a=\"\" alt=\"Để bật tính năng Retina Flash, tại camera trước bạn bật đèn Flash lên\" class=\"lazy\" data-original=\"https://cdn4.tgdd.vn/Products/Images/42/71770/iphone-6s-plus213.gif\" dejavu=\"\" font-size:=\"\" href=\"https://www.thegioididong.com/images/42/71770/iphone-6s-plus213.gif\" img=\"\" liberation=\"\" line-height:=\"\" p=\"\" src=\"https://cdn4.tgdd.vn/Products/Images/42/71770/iphone-6s-plus213.gif\" style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, \" text-align:=\"\" title=\"Để bật tính năng Retina Flash, tại camera trước bạn bật đèn Flash lên\">\r\n		<i style=\"margin: 0px 0px 20px; padding: 0px; display: block; font-size: 14px; color: rgb(102, 102, 102);\">Để bật t&iacute;nh năng Retina Flash, tại camera trước bạn bật đ&egrave;n Flash l&ecirc;n</i></p>\r\n	<p class=\"twentytwenty-wrapper twentytwenty-horizontal\" dejavu=\"\" div=\"\" font-size:=\"\" liberation=\"\" line-height:=\"\" style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, \" text-align:=\"\">\r\n		&nbsp;</p>\r\n	<div class=\"imgCprW twentytwenty-container\" data-src1=\"https://cdn.tgdd.vn/Products/Images/42/71770/iphone-6s-plus1-2.jpg\" data-src2=\"https://cdn.tgdd.vn/Products/Images/42/71770/iphone-6s-plus2-2.jpg\" id=\"imgCpr_2\" style=\"margin: 0px auto; padding: 0px; box-sizing: content-box; z-index: 0; overflow: hidden; position: relative; user-select: none; max-width: 640px; height: 533px;\">\r\n		<img class=\"twentytwenty-before\" src=\"https://cdn.tgdd.vn/Products/Images/42/71770/iphone-6s-plus1-2.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px; box-sizing: content-box; z-index: 20; position: absolute; top: 0px; clip: rect(0px, 228px, 533px, 0px);\" /><img class=\"twentytwenty-after\" src=\"https://cdn.tgdd.vn/Products/Images/42/71770/iphone-6s-plus2-2.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px; box-sizing: content-box; z-index: 10; position: absolute; top: 0px;\" />\r\n		<div class=\"twentytwenty-handle\" style=\"margin: -22px 0px 0px -22px; padding: 0px; box-sizing: content-box; height: 38px; width: 38px; position: absolute; left: 228px; top: 266.5px; border: 3px solid rgb(255, 255, 255); border-radius: 1000px; box-shadow: rgba(51, 51, 51, 0.5) 0px 0px 12px; z-index: 40; cursor: pointer;\">\r\n			&nbsp;</div>\r\n	</div>\r\n</div>\r\n<p dejavu=\"\" font-size:=\"\" liberation=\"\" line-height:=\"\" p=\"\" style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, \" text-align:=\"\">\r\n	<i style=\"margin: 0px 0px 20px; padding: 0px; display: block; font-size: 14px; color: rgb(102, 102, 102); line-height: 20.8px;\">Đ&egrave;n Flash gi&uacute;p ảnh được s&aacute;ng hơn</i></p>\r\n<h3 ch=\"\" color:=\"\" dejavu=\"\" font-size:=\"\" i=\"\" liberation=\"\" line-height:=\"\" n=\"\" nh=\"\" outline:=\"\" overflow:=\"\" p=\"\" strong=\"\" style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, \" text-align:=\"\" zoom:=\"\">\r\n	M&agrave;n h&igrave;nh lớn c&ugrave;ng&nbsp;<span style=\"margin: 0px; padding: 0px; line-height: 20.8px;\">m&agrave;u sắc tươi tắn, độ n&eacute;t cao&nbsp;sẽ mang đến nhiều</span>&nbsp;th&iacute;ch th&uacute; khi lướt web, xem phim hay l&agrave;m việc.</h3>\r\n<p a=\"\" alt=\"Màn hình lớn 5.5 inch thoải mái để làm việc và giải trí\" class=\"lazy\" data-original=\"https://cdn1.tgdd.vn/Products/Images/42/71770/iphone-6s-plus4-1.jpg\" dejavu=\"\" font-size:=\"\" href=\"https://www.thegioididong.com/images/42/71770/iphone-6s-plus4-1.jpg\" img=\"\" liberation=\"\" line-height:=\"\" p=\"\" src=\"https://cdn1.tgdd.vn/Products/Images/42/71770/iphone-6s-plus4-1.jpg\" style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, \" text-align:=\"\" title=\"Màn hình lớn 5.5 inch thoải mái để làm việc và giải trí\">\r\n	<i style=\"margin: 0px 0px 20px; padding: 0px; display: block; font-size: 14px; color: rgb(102, 102, 102);\">M&agrave;n h&igrave;nh lớn 5.5 inch thoải m&aacute;i để l&agrave;m việc v&agrave; giải tr&iacute;</i></p>\r\n<h3 3d=\"\" c=\"\" color:=\"\" dejavu=\"\" font-size:=\"\" liberation=\"\" line-height:=\"\" m=\"\" ng=\"\" outline:=\"\" overflow:=\"\" p=\"\" strong=\"\" style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, \" text-align:=\"\" touch=\"\" zoom:=\"\">\r\n	3D Touch l&agrave; t&iacute;nh năng ho&agrave;n to&agrave;n mới tr&ecirc;n iPhone 6s Plus 32 GB, cho ph&eacute;p người d&ugrave;ng xem trước được c&aacute;c t&ugrave;y chọn nhanh dựa v&agrave;o lực nhấn mạnh hay nhẹ m&agrave; kh&ocirc;ng cần phải nhấp v&agrave;o ứng dụng.</h3>\r\n<p 1=\"\" c=\"\" dejavu=\"\" font-size:=\"\" khi=\"\" liberation=\"\" line-height:=\"\" n=\"\" ng=\"\" nh=\"\" o=\"\" p=\"\" rung=\"\" style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, \" text-align:=\"\" xem=\"\" y=\"\">\r\n	<a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/42/71770/iphone-6s-plus342.gif\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"Chọn nhanh các lựa chọn trên camera của máy\" class=\"lazy\" data-original=\"https://cdn3.tgdd.vn/Products/Images/42/71770/iphone-6s-plus342.gif\" src=\"https://cdn3.tgdd.vn/Products/Images/42/71770/iphone-6s-plus342.gif\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"Chọn nhanh các lựa chọn trên camera của máy\" /></a></p>\r\n<p a=\"\" c=\"\" camera=\"\" dejavu=\"\" font-size:=\"\" i=\"\" liberation=\"\" line-height:=\"\" n=\"\" nhanh=\"\" p=\"\" style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, \" text-align:=\"\">\r\n	Đ&aacute;ng tiếc t&iacute;nh năng 3D Touch n&agrave;y chỉ mới được &aacute;p dụng tr&ecirc;n c&aacute;c&nbsp;<a href=\"https://www.thegioididong.com/game-ung-dung?key=c%E1%BB%A7a+apple\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\" target=\"_blank\" title=\"Các game và ứng dụng cho hệ điều hành Apple\">ứng dụng của Apple</a>&nbsp;như: danh bạ, camera, mail, m&aacute;y ảnh ...&nbsp;</p>\r\n<p 3d=\"\" a=\"\" color:=\"\" dejavu=\"\" font-size:=\"\" h3=\"\" href=\"https://www.thegioididong.com/tin-tuc/tong-hop-tat-ca-nhung-tien-ich-3d-touch-dem-den-cho-nguoi-dung-714800\" liberation=\"\" line-height:=\"\" m=\"\" n=\"\" ng=\"\" nh=\"\" outline:=\"\" overflow:=\"\" strong=\"\" style=\"margin: 30px 0px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 20px; line-height: 20.8px; font-family: Helvetica, Arial, \" target=\"_blank\" text-align:=\"\" title=\"Tìm hiểu thêm các chức năng 3D Touch\" touch=\"\" u=\"\" zoom:=\"\">\r\n	<strong style=\"margin: 0px; padding: 0px;\">Sức mạnh của bộ vi xử l&yacute; A9 mới nhất</strong></p>\r\n<p 1.4=\"\" 1.8=\"\" 11=\"\" 32=\"\" 6=\"\" 6s=\"\" a=\"\" c=\"\" dejavu=\"\" font-size:=\"\" gb=\"\" ghz=\"\" href=\"https://www.thegioididong.com/dtdd/iphone-x-64gb\" i=\"\" ios=\"\" iphone=\"\" liberation=\"\" line-height:=\"\" n=\"\" ng=\"\" p=\"\" plus=\"\" style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, \" t=\"\" target=\"_blank\" text-align:=\"\" title=\"iPhone X\" type=\"iPhone X\" u=\"\" vi=\"\" y=\"\">\r\n	<span style=\"margin: 0px; padding: 0px; line-height: 20.8px;\">Vi&ecirc;n pin chỉ c&oacute; dung lượng 2750 mAh kh&aacute; thấp, tuy nhi&ecirc;n bạn vẫn c&oacute; thể an t&acirc;m sử dụng m&aacute;y trong một ng&agrave;y.</span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&lt;p style=&quot;margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot; dejavu=&quot;&quot; sans&quot;,=&quot;&quot; &quot;liberation=&quot;&quot; freesans,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 16px;=&quot;&quot; line-height:=&quot;&quot; 20.8px;=&quot;&quot; text-align:=&quot;&quot; justify;&quot;=&quot;&quot;&gt; Một chiếc điện thoại vừa thể hiện đẳng cấp của bạn vừa mang lại những n&acirc;ng cấp tốt hơn như camera, hiệu năng hoạt động mạnh mẽ hơn, t&iacute;nh năng 3D Touch độc đ&aacute;o, tất cả sẽ l&agrave; trải nghiệm mới mẻ cho bạn khi chọn mua iPhone 6s Plus 32 GB.</p>\r\n', 10000, 'iphone-6s-plus-32gb-400x450-400x450.png', '[\"6splus-thietke1.jpg\",\"iphone-6s-plus-32gb--21.jpg\"]', 1528527766, 0, '', '', '6 tháng', 0, 0, 0, 0, '', '', '', '0', '', '', '', '', '', '', '', '', ''),
(23, 42, 'Laptop Lenovo Ideapad 320 14ISK i3 6006/4GB/500GB/Win10/(80XG0083VN)', 0, '8990000.0000', '<h2 -=\"\" .=\"\" 14isk=\"\" 320=\"\" 4=\"\" c=\"\" ch=\"\" color:=\"\" core=\"\" dejavu=\"\" gb=\"\" h3=\"\" i=\"\" i3=\"\" ideapad=\"\" intel=\"\" laptop=\"\" lenovo=\"\" liberation=\"\" m=\"\" n=\"\" ng=\"\" nh=\"\" outline:=\"\" overflow:=\"\" p=\"\" ram=\"\" sinh=\"\" strong=\"\" style=\"margin: 30px 0px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 20px; line-height: 1.3em; font-family: Helvetica, Arial, \" t=\"\" trung=\"\" u=\"\" y=\"\" zoom:=\"\">\r\n	<strong style=\"margin: 0px; padding: 0px;\">Thiết kế đơn giản</strong></h2>\r\n<p .=\"\" 14isk=\"\" 2.1=\"\" 22.7=\"\" 320=\"\" a=\"\" c=\"\" dejavu=\"\" en=\"\" font-size:=\"\" i=\"\" ideapad=\"\" lenovo=\"\" liberation=\"\" m=\"\" mang=\"\" n=\"\" ng=\"\" nh=\"\" o=\"\" p=\"\" pin=\"\" strong=\"\" style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, \" t=\"\" u=\"\" y=\"\">\r\n	<a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/44/146928/lenovo-ideapad-320-14isk-i3-6006-80xg0083vn-bv-tgdd-1.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"Thiết kế đơn giản\" class=\"lazy\" data-original=\"https://cdn4.tgdd.vn/Products/Images/44/146928/lenovo-ideapad-320-14isk-i3-6006-80xg0083vn-bv-tgdd-1.jpg\" src=\"https://cdn4.tgdd.vn/Products/Images/44/146928/lenovo-ideapad-320-14isk-i3-6006-80xg0083vn-bv-tgdd-1.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"Thiết kế đơn giản\" /></a></p>\r\n<h3 color:=\"\" dejavu=\"\" font-size:=\"\" i=\"\" liberation=\"\" nh=\"\" outline:=\"\" overflow:=\"\" p=\"\" strong=\"\" style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, \" u=\"\" zoom:=\"\">\r\n	M&aacute;y được trang bị chip&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/intel-core-the-he-thu-6-skylake-774739#i3\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\" target=\"_blank\" title=\"Intel Core i3 Skylake\">Intel Core i3 Skylake</a>&nbsp;với tốc độ&nbsp;<strong style=\"margin: 0px; padding: 0px;\">2.0 GHz</strong>&nbsp;v&agrave; c&ugrave;ng với&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/ram-ddr4-la-gi-882173\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\" target=\"_blank\" title=\"RAM DDR4\">RAM DDR4</a>&nbsp;<strong style=\"margin: 0px; padding: 0px;\">4 GB</strong>&nbsp;gi&uacute;p xử l&yacute; nhiều thao t&aacute;c như mở web nghe nhạc, xem tin tức, l&agrave;m việc file văn ph&ograve;ng kh&aacute; mượt m&agrave;. Ổ cứng k&egrave;m theo m&aacute;y l&agrave; HDD 500 GB th&igrave; kh&aacute; thoải m&aacute;i để lưu trữ dữ liệu.</h3>\r\n<p a=\"\" alt=\"Cấu hình tối ưu về hiệu quả và giá thành\" class=\"lazy\" data-original=\"https://cdn1.tgdd.vn/Products/Images/44/146928/lenovo-ideapad-320-14isk-i3-6006-80xg0083vn-bv-tgdd-2.jpg\" dejavu=\"\" font-size:=\"\" href=\"https://www.thegioididong.com/images/44/146928/lenovo-ideapad-320-14isk-i3-6006-80xg0083vn-bv-tgdd-2.jpg\" img=\"\" liberation=\"\" p=\"\" src=\"https://cdn1.tgdd.vn/Products/Images/44/146928/lenovo-ideapad-320-14isk-i3-6006-80xg0083vn-bv-tgdd-2.jpg\" style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, \" title=\"Cấu hình tối ưu về hiệu quả và giá thành\">\r\n	Đi k&egrave;m với chip&nbsp;<strong style=\"margin: 0px; padding: 0px;\">Intel Skylake thế hệ 6&nbsp;</strong>th&igrave; GPU sẽ l&agrave;&nbsp;<a href=\"https://www.thegioididong.com/hoi-dap/danh-gia-intel-hd-graphics-520-843418\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\" target=\"_blank\" title=\"Intel HD Graphics 520\">Intel HD Graphics 520</a>&nbsp;quen thuộc, mặc d&ugrave; đ&acirc;y kh&ocirc;ng phải l&agrave; loại card t&iacute;ch hợp mới nhất, khủng nhất nhưng đủ để gi&uacute;p m&aacute;y xử l&yacute; c&aacute;c vấn đề về đồ họa căn bản.</p>\r\n<h3 c=\"\" color:=\"\" dejavu=\"\" font-size:=\"\" liberation=\"\" n=\"\" nh=\"\" outline:=\"\" overflow:=\"\" p=\"\" strong=\"\" style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, \" zoom:=\"\">\r\n	Laptop&nbsp;<strong style=\"margin: 0px; padding: 0px;\">Lenovo 320 14ISK&nbsp;</strong>sở hữu m&agrave;n h&igrave;nh&nbsp;<strong style=\"margin: 0px; padding: 0px;\">14 inch</strong>&nbsp;nhỏ gọn v&agrave; c&oacute; độ ph&acirc;n giải vừa đủ HD gi&uacute;p hiển thị h&igrave;nh ảnh r&otilde; r&agrave;ng khi xem film, xem ảnh hoặc l&agrave;m việc.</h3>\r\n<p a=\"\" alt=\"Màn hình sắc nét\" class=\"lazy\" color:=\"\" data-original=\"https://cdn3.tgdd.vn/Products/Images/44/146928/lenovo-ideapad-320-14isk-i3-6006-80xg0083vn-bv-tgdd-3.jpg\" dejavu=\"\" font-size:=\"\" h3=\"\" href=\"https://www.thegioididong.com/images/44/146928/lenovo-ideapad-320-14isk-i3-6006-80xg0083vn-bv-tgdd-3.jpg\" img=\"\" liberation=\"\" outline:=\"\" overflow:=\"\" src=\"https://cdn3.tgdd.vn/Products/Images/44/146928/lenovo-ideapad-320-14isk-i3-6006-80xg0083vn-bv-tgdd-3.jpg\" style=\"margin: 30px 0px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 20px; line-height: 1.3em; font-family: Helvetica, Arial, \" title=\"Màn hình sắc nét\" zoom:=\"\">\r\n	<strong style=\"margin: 0px; padding: 0px;\">B&agrave;n ph&iacute;m chất lượng ho&agrave;n hảo</strong></p>\r\n<p c=\"\" dejavu=\"\" font-size:=\"\" i=\"\" liberation=\"\" m=\"\" n=\"\" ng=\"\" nh=\"\" p=\"\" style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, \" t=\"\" trang=\"\" y=\"\">\r\n	<a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/44/146928/lenovo-ideapad-320-14isk-i3-6006-80xg0083vn-bv-tgdd-4.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"Bàn phím chất lượng hoàn hảo\" class=\"lazy\" data-original=\"https://cdn.tgdd.vn/Products/Images/44/146928/lenovo-ideapad-320-14isk-i3-6006-80xg0083vn-bv-tgdd-4.jpg\" src=\"https://cdn.tgdd.vn/Products/Images/44/146928/lenovo-ideapad-320-14isk-i3-6006-80xg0083vn-bv-tgdd-4.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"Bàn phím chất lượng hoàn hảo\" /></a></p>\r\n<h3 color:=\"\" dejavu=\"\" font-size:=\"\" liberation=\"\" m=\"\" ng=\"\" outline:=\"\" overflow:=\"\" p=\"\" strong=\"\" style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, \" thanh=\"\" zoom:=\"\">\r\n	<strong style=\"margin: 0px; padding: 0px;\">Lenovo Ideapad 320 14ISK i3 6006U</strong>&nbsp;được trang bị loa k&eacute;p n&ecirc;n cho &acirc;m thanh to r&otilde; v&agrave; dễ nghe hơn. &lt;p style=&quot;margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot; dejavu=&quot;&quot; sans&quot;,=&quot;&quot; &quot;liberation=&quot;&quot; freesans,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 16px;&quot;=&quot;&quot;&gt; <a class=\"preventdefault\" href=\"https://www.thegioididong.com/images/44/146928/lenovo-ideapad-320-14isk-i3-6006-80xg0083vn-bv-tgdd-5.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"Âm thanh sống động\" class=\"lazy\" data-original=\"https://cdn2.tgdd.vn/Products/Images/44/146928/lenovo-ideapad-320-14isk-i3-6006-80xg0083vn-bv-tgdd-5.jpg\" src=\"https://cdn2.tgdd.vn/Products/Images/44/146928/lenovo-ideapad-320-14isk-i3-6006-80xg0083vn-bv-tgdd-5.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"Âm thanh sống động\" /></a></h3>\r\n', 0, 'lenovohihi.jpg', '[\"lenovo-ideapad-320-14isk-i3-6006-80xg0083vn-bv-tgdd-4.jpg\",\"vi-vn-lenovo-ideapad-320-14isk-i3-6006-80xg0083vn-slide-1.jpg\",\"vi-vn-lenovo-ideapad-320-14isk-i3-6006-80xg0083vn-slide-2.jpg\"]', 1528528671, 0, '', '', '3 tháng', 0, 0, 0, 0, '', '', '', '0', '', '', '', '', '', '', '', '', '');
INSERT INTO `product` (`id`, `catalog_id`, `name`, `maker_id`, `price`, `content`, `discount`, `image_link`, `image_list`, `created`, `view`, `meta_key`, `site_title`, `warranty`, `total`, `buyed`, `rate_total`, `rate_count`, `gifts`, `video`, `meta_desc`, `feature`, `screen`, `os`, `back_cam`, `front_cam`, `cpu`, `ram`, `memory`, `pin`, `sim`) VALUES
(24, 40, 'Samsung Galaxy Note 8', 0, '22490000.0000', '<h2 style=\"margin: 0px 0px 10px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 20px; line-height: 1.3em; font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; color: rgb(51, 51, 51); outline: none; zoom: 1; overflow: hidden;\">\r\n	<strong style=\"margin: 0px; padding: 0px;\">Galaxy Note 8 l&agrave; niềm hy vọng vực lại d&ograve;ng Note danh tiếng của Samsung với diện mạo nam t&iacute;nh, sang trọng. Trang bị camera k&eacute;p x&oacute;a ph&ocirc;ng thời thượng, m&agrave;n h&igrave;nh v&ocirc; cực như tr&ecirc;n&nbsp;<a href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-s8-plus\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 18px; color: rgb(80, 168, 227); outline: none; zoom: 1;\" target=\"_blank\" title=\"S8 Plus\">S8 Plus</a>, b&uacute;t Spen với nhiều t&iacute;nh năng mới v&agrave; nhiều c&ocirc;ng nghệ được Samsung ưu &aacute;i đem l&ecirc;n Note 8.</strong></h2>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	<a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Files/2017/09/09/1020228/z764741777150_ea3f044fdfc5223e3e5b0c82a4a331f0-_2560x1920-800-resize.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"1\" class=\"lazy\" data-original=\"https://cdn1.tgdd.vn/Files/2017/09/09/1020228/z764741777150_ea3f044fdfc5223e3e5b0c82a4a331f0-_2560x1920-800-resize.jpg\" src=\"https://cdn1.tgdd.vn/Files/2017/09/09/1020228/z764741777150_ea3f044fdfc5223e3e5b0c82a4a331f0-_2560x1920-800-resize.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"1\" /></a></p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	D&ugrave; được giới thiệu l&agrave; m&agrave;n h&igrave;nh l&ecirc;n tới 6.3 inch nhưng thực sự m&aacute;y khi cầm tr&ecirc;n tay rất nhỏ gọn nhờ v&agrave;o c&ocirc;ng nghệ &quot;m&agrave;n h&igrave;nh v&ocirc; cực&quot; ti&ecirc;n tiến nhất hiện nay của Samsung.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	<a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Files/2017/09/09/1020228/z764741903200_347a0ee08cf7acf973047629cf2c29ac-_2560x1920-800-resize.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"2\" class=\"lazy\" data-original=\"https://cdn3.tgdd.vn/Files/2017/09/09/1020228/z764741903200_347a0ee08cf7acf973047629cf2c29ac-_2560x1920-800-resize.jpg\" src=\"https://cdn3.tgdd.vn/Files/2017/09/09/1020228/z764741903200_347a0ee08cf7acf973047629cf2c29ac-_2560x1920-800-resize.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"2\" /></a></p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	C&aacute;c cạnh b&ecirc;n m&aacute;y được l&agrave;m cong đều khiến m&igrave;nh khi cầm c&oacute; cảm gi&aacute;c &ocirc;m tay rất thoải m&aacute;i v&agrave; kh&ocirc;ng hề bị cấn.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	<a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Files/2017/09/09/1020228/z764741534567_c7686e1d5bdbcd1a1a365182240bd1fd-_2560x1920-800-resize.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"3\" class=\"lazy\" data-original=\"https://cdn.tgdd.vn/Files/2017/09/09/1020228/z764741534567_c7686e1d5bdbcd1a1a365182240bd1fd-_2560x1920-800-resize.jpg\" src=\"https://cdn.tgdd.vn/Files/2017/09/09/1020228/z764741534567_c7686e1d5bdbcd1a1a365182240bd1fd-_2560x1920-800-resize.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"3\" /></a></p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	Cả mặt trước v&agrave; mặt sau m&aacute;y đều được phủ k&iacute;n bằng lớp k&iacute;nh phản chiếu rất đẹp như đ&atilde; từng xuất hiện ở bộ đ&ocirc;i S8/S8+.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	<a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Files/2017/09/09/1020228/z764741713755_8ea6cef957ab32285c205ed57a066367-_2560x1920-800-resize.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"4\" class=\"lazy\" data-original=\"https://cdn2.tgdd.vn/Files/2017/09/09/1020228/z764741713755_8ea6cef957ab32285c205ed57a066367-_2560x1920-800-resize.jpg\" src=\"https://cdn2.tgdd.vn/Files/2017/09/09/1020228/z764741713755_8ea6cef957ab32285c205ed57a066367-_2560x1920-800-resize.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"4\" /></a></p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	V&agrave; m&agrave;n h&igrave;nh 2K+ tr&ecirc;n Note 8 hoạt động tốt, g&oacute;c nh&igrave;n sắc n&eacute;t.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	&nbsp;</p>\r\n<div class=\"ratingbox owl-carousel owl-theme\" style=\"margin: 0px; padding: 0px; position: relative; width: 750px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; opacity: 1;\">\r\n	<div class=\"owl-wrapper-outer autoHeight\" style=\"margin: 0px; padding: 0px; overflow: hidden; position: relative; width: 750px; transition: height 500ms ease-in-out; height: 171px;\">\r\n		<div class=\"owl-wrapper\" style=\"margin: 0px; padding: 0px; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; width: 1500px; left: 0px;\">\r\n			<div class=\"owl-item\" style=\"margin: 0px; padding: 0px; float: left; backface-visibility: hidden; transform: translate3d(0px, 0px, 0px); width: 750px;\">\r\n				<div class=\"item\" style=\"margin: 0px auto; padding: 0px; max-width: 550px; text-align: center;\">\r\n					<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; font-style: italic; line-height: 34px;\">\r\n						<b style=\"margin: 0px 5px 0px 0px; padding: 0px; color: rgb(204, 204, 204); font-size: 30px; display: inline-block; vertical-align: top;\">❝</b>Điện thoại kiểu d&aacute;ng nam t&iacute;nh, thiết kế gọn v&agrave; mỏng hơn những d&ograve;ng note trước... cảm thấy rất th&iacute;ch th&uacute; khi sở hữu chiếc galaxy note 8 n&agrave;y lắm... c&aacute;m ơn SAMSUNG rất nhiều.<b style=\"margin: 0px 5px 0px 0px; padding: 0px; color: rgb(204, 204, 204); font-size: 30px; display: inline-block; vertical-align: top;\">❞</b></p>\r\n					<span class=\"info\" style=\"margin: 0px 0px 0px 170.5px; padding: 0px; color: rgb(102, 102, 102); font-size: 12px; font-style: italic; display: block; text-align: left;\"><b style=\"margin: 0px; padding: 0px;\">La Tuấn Huỳnh</b>&nbsp;- Q.5, TP.HCM<label class=\"sttB\" style=\"margin: 0px; padding: 0px; font-style: normal; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 18px; color: rgb(74, 187, 77); outline: none; zoom: 1; display: block;\">Đ&atilde; mua tại Thế giới di động</label></span></div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	&nbsp;</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	<a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Files/2017/09/09/1020228/z764740566215_8c972c312d8bddcc08180c8590a87824-_2560x1920-800-resize.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"5\" class=\"lazy\" data-original=\"https://cdn4.tgdd.vn/Files/2017/09/09/1020228/z764740566215_8c972c312d8bddcc08180c8590a87824-_2560x1920-800-resize.jpg\" src=\"https://cdn4.tgdd.vn/Files/2017/09/09/1020228/z764740566215_8c972c312d8bddcc08180c8590a87824-_2560x1920-800-resize.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"5\" /></a></p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	Galaxy Note 8 được c&agrave;i sẵn hệ điều h&agrave;nh Android Nougat đi k&egrave;m với giao diện Samsung Experience mới nhất. Theo nhiều người d&ugrave;ng đ&aacute;nh gi&aacute; th&igrave; đ&acirc;y c&oacute; thể n&oacute;i l&agrave; bộ giao diện đẹp v&agrave; hiệu quả nhất của Samsung tới tận b&acirc;y giờ.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	<a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Files/2017/09/09/1020228/z764696952365_76c2667ff0451a11b42b27a3f0531a11-_2560x1920-800-resize.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"6\" class=\"lazy\" data-original=\"https://cdn1.tgdd.vn/Files/2017/09/09/1020228/z764696952365_76c2667ff0451a11b42b27a3f0531a11-_2560x1920-800-resize.jpg\" src=\"https://cdn1.tgdd.vn/Files/2017/09/09/1020228/z764696952365_76c2667ff0451a11b42b27a3f0531a11-_2560x1920-800-resize.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"6\" /></a></p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	Với cấu h&igrave;nh khủng long Exynos 8895 8 nh&acirc;n v&agrave; RAM 6 GB, Note 8 hỗ trợ chạy đa nhiệm rất tốt, đ&aacute;p ứng hầu hết c&aacute;c nhu cầu chơi game 3D nặng.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	<a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Files/2017/09/09/1020228/z764696983446_7e0761bbf40b186fa86ff390e04920d4-_2560x1920-800-resize.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"7\" class=\"lazy\" data-original=\"https://cdn3.tgdd.vn/Files/2017/09/09/1020228/z764696983446_7e0761bbf40b186fa86ff390e04920d4-_2560x1920-800-resize.jpg\" src=\"https://cdn3.tgdd.vn/Files/2017/09/09/1020228/z764696983446_7e0761bbf40b186fa86ff390e04920d4-_2560x1920-800-resize.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"7\" /></a></p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	Camera k&eacute;p x&oacute;a ph&ocirc;ng tr&ecirc;n Note 8 c&oacute; thể n&oacute;i l&agrave; ... cảm gi&aacute;c như m&igrave;nh đang sử dụng một chiếc m&aacute;y ảnh thực thụ vậy.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	Xem th&ecirc;m b&agrave;i đ&aacute;nh gi&aacute; chi tiết Camera Note 8&nbsp;<a href=\"https://www.thegioididong.com/tin-tuc/danh-gia-nhanh-camera-galaxy-note-8-1022313\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\" target=\"_blank\" title=\"Đánh giá camera Note 8\">tại đ&acirc;y</a>.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	<a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Files/2017/09/09/1020228/z764695551993_4e53d714ec90efa122e24b691fecde8d_986x620-800-resize.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"8\" class=\"lazy\" data-original=\"https://cdn.tgdd.vn/Files/2017/09/09/1020228/z764695551993_4e53d714ec90efa122e24b691fecde8d_986x620-800-resize.jpg\" src=\"https://cdn.tgdd.vn/Files/2017/09/09/1020228/z764695551993_4e53d714ec90efa122e24b691fecde8d_986x620-800-resize.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"8\" /></a></p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	Su&yacute;t nữa th&igrave; qu&ecirc;n kh&ocirc;ng nhắc tới S-Pen thần th&aacute;nh, chiếc b&uacute;t đ&atilde; l&agrave;m n&ecirc;n thương hiệu của d&ograve;ng Note.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	<a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Files/2017/09/09/1020228/z764742026769_afed1116f4c414a94018ff3fdd8dd0be-_2560x1920-800-resize.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"9\" class=\"lazy\" data-original=\"https://cdn2.tgdd.vn/Files/2017/09/09/1020228/z764742026769_afed1116f4c414a94018ff3fdd8dd0be-_2560x1920-800-resize.jpg\" src=\"https://cdn2.tgdd.vn/Files/2017/09/09/1020228/z764742026769_afed1116f4c414a94018ff3fdd8dd0be-_2560x1920-800-resize.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"9\" /></a></p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	Như thường lệ th&igrave; S-Pen sẽ c&agrave;ng ng&agrave;y c&agrave;ng &quot;kh&ocirc;n&quot; với những t&iacute;nh năng như viết ngay cả khi m&agrave;n h&igrave;nh đ&atilde; tắt, live message,... v&agrave; điều th&uacute; vị nữa l&agrave; S-Pen sẽ c&oacute; c&ugrave;ng với m&agrave;u m&aacute;y lu&ocirc;n. Khỏi sợ đụng h&agrave;ng nha.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	<a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Files/2017/09/09/1020228/z764742155244_49913d91e2b539f95b6ecdb7b67be33b-_2560x1920-800-resize.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"10\" class=\"lazy\" data-original=\"https://cdn4.tgdd.vn/Files/2017/09/09/1020228/z764742155244_49913d91e2b539f95b6ecdb7b67be33b-_2560x1920-800-resize.jpg\" src=\"https://cdn4.tgdd.vn/Files/2017/09/09/1020228/z764742155244_49913d91e2b539f95b6ecdb7b67be33b-_2560x1920-800-resize.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"10\" /></a></p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	Cuối c&ugrave;ng l&agrave; pin 3.300 mAh tr&ecirc;n Note 8 được cho l&agrave; đuối hơn so với S8+ nhưng qua một số b&agrave;i thử nghiệm cho thấy, khả năng trụ vững của Note 8 cũng kh&aacute; đ&aacute;ng nể, khi vượt qua cả iPhone 7 Plus v&agrave; Galaxy S8.</p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	<a class=\"preventdefault\" href=\"https://cdn.tgdd.vn/Files/2017/09/09/1020228/z764695361368_e4c34c2815f6935f37d6b728c6033647-_2560x1920-800-resize.jpg\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(80, 168, 227);\"><img alt=\"11\" class=\"lazy\" data-original=\"https://cdn1.tgdd.vn/Files/2017/09/09/1020228/z764695361368_e4c34c2815f6935f37d6b728c6033647-_2560x1920-800-resize.jpg\" src=\"https://cdn1.tgdd.vn/Files/2017/09/09/1020228/z764695361368_e4c34c2815f6935f37d6b728c6033647-_2560x1920-800-resize.jpg\" style=\"margin: 10px auto; padding: 0px; border: 0px; display: block; max-width: 100%; height: auto; max-height: 533px;\" title=\"11\" /></a></p>\r\n<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px;\">\r\n	&nbsp;</p>\r\n<div class=\"ratingbox owl-carousel owl-theme\" style=\"margin: 0px; padding: 0px; position: relative; width: 750px; color: rgb(51, 51, 51); font-family: Helvetica, Arial, &quot;DejaVu Sans&quot;, &quot;Liberation Sans&quot;, Freesans, sans-serif; font-size: 16px; opacity: 1;\">\r\n	<div class=\"owl-wrapper-outer autoHeight\" style=\"margin: 0px; padding: 0px; overflow: hidden; position: relative; width: 750px; transition: height 500ms ease-in-out; height: 171px;\">\r\n		<div class=\"owl-wrapper\" style=\"margin: 0px; padding: 0px; position: relative; transform: translate3d(0px, 0px, 0px); backface-visibility: hidden; width: 1500px; left: 0px;\">\r\n			<div class=\"owl-item\" style=\"margin: 0px; padding: 0px; float: left; backface-visibility: hidden; transform: translate3d(0px, 0px, 0px); width: 750px;\">\r\n				<div class=\"item\" style=\"margin: 0px auto; padding: 0px; max-width: 550px; text-align: center;\">\r\n					<p style=\"margin: 10px 0px; padding: 0px; -webkit-margin-before: 0px; -webkit-margin-after: 0px; text-rendering: geometricPrecision; font-style: italic; line-height: 34px;\">\r\n						<b style=\"margin: 0px 5px 0px 0px; padding: 0px; color: rgb(204, 204, 204); font-size: 30px; display: inline-block; vertical-align: top;\">❝</b>Sản phẩm tuyệt vời, b&uacute;t S pen qu&aacute; đỉnh, chức năng nhắn tin bằng b&uacute;t l&agrave; ưng &yacute; nhất. M&agrave;n h&igrave;nh infinity đẹp long lanh, l&agrave; chiếc điện thoại ưng &yacute; nhất t&ocirc;i từng mua.<b style=\"margin: 0px 5px 0px 0px; padding: 0px; color: rgb(204, 204, 204); font-size: 30px; display: inline-block; vertical-align: top;\">❞</b></p>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', 0, 'samsung-galaxy-note8-1-400x460.png', '[\"-1--man-hinh-.jpg\",\"-samsung-galaxy-note8-vien-cong.jpg\",\"vi-vn-1-thiet-ke.jpg\"]', 1528530202, 0, '', '', '3 tháng', 0, 0, 0, 0, '', '', '', '0', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `name`, `image_name`, `image_link`, `link`, `info`, `sort_order`) VALUES
(7, 'slide1', '', 'slide1.png', 'https://www.uit.edu.vn/', '', 1),
(8, 'slide2', '', 'slide2.png', 'https://daa.uit.edu.vn/', '', 2),
(9, 'slide4', '', 'slide4.png', 'https://forum.uit.edu.vn/', '', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `support`
--

CREATE TABLE `support` (
  `id` int(255) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `yahoo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `gmail` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `skype` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `support`
--

INSERT INTO `support` (`id`, `name`, `yahoo`, `gmail`, `skype`, `phone`, `sort_order`) VALUES
(1, 'Hoang van tuyen', 'tuyenht90', 'hoangvantuyencnt@gmail.com', 'tuyencnt90', '01686039488', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction`
--

CREATE TABLE `transaction` (
  `id` bigint(20) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(50) COLLATE utf8_bin NOT NULL,
  `user_phone` varchar(20) COLLATE utf8_bin NOT NULL,
  `amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `payment` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `payment_info` text COLLATE utf8_bin NOT NULL,
  `message` varchar(255) COLLATE utf8_bin NOT NULL,
  `security` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `transaction`
--

INSERT INTO `transaction` (`id`, `type`, `status`, `user_id`, `user_name`, `user_email`, `user_phone`, `amount`, `payment`, `payment_info`, `message`, `security`, `created`) VALUES
(7, 0, 1, 15, 'Hoàng văn Tuyền', 'hoangvantuyencnt@gmail.com', '01686039488', '4000000.0000', 'nganluong', '', '', '', 1405548000),
(8, 0, 0, 15, 'Hoàng văn Tuyền', 'hoangvantuyencnt@gmail.com', '01686039488', '4000000.0000', 'nganluong', '', '', '', 1407917785),
(9, 0, 0, 0, 'Hoàng văn Tuyền', 'hoangvantuyencnt@gmail.com', '01686039488', '10000000.0000', 'nganluong', '', '111', '', 1407918071),
(10, 0, 0, 0, 'Hoàng văn Tuyền', 'hoangvantuyencnt@gmail.com', '01686039488', '10000000.0000', 'nganluong', '', '111111', '', 1407918235),
(11, 0, 2, 0, 'Hoàng văn Tuyền', 'hoangvantuyencnt@gmail.com', '111111', '10000000.0000', 'nganluong', '', '111', '', 1407918299),
(12, 0, 1, 0, 'Hoàng văn Tuyền', 'hoangvantuyencnt@gmail.com', '7667676', '10000000.0000', 'nganluong', '', '', '', 1407923211),
(13, 0, 1, 0, 'Hoàng văn Tuyền', 'hoangvantuyencnt@gmail.com', '11', '20000000.0000', 'nganluong', '', '11', '', 1407926712),
(14, 0, 1, 0, 'Hoàng văn Tuyền', 'hoangvantuyencnt@gmail.com', '01686039488', '10000000.0000', 'nganluong', '', '', '', 1407981011),
(15, 0, 0, 19, 'Hoàng văn Tuyền', 'hoangvantuyencnt@gmail.com', '01686039488', '5000000.0000', 'baokim', '', '', '', 1408099561),
(16, 0, 0, 19, 'Hoàng văn Tuyền', 'hoangvantuyencnt@gmail.com', '01686039488', '5000000.0000', 'baokim', '', '', '', 1408099692),
(17, 0, 0, 19, 'Hoàng văn Tuyền', 'hoangvantuyencnt@gmail.com', '01686039488', '5000000.0000', 'baokim', '', '', '', 1408099749),
(18, 0, 0, 19, 'Hoàng văn Tuyền', 'hoangvantuyencnt@gmail.com', '01686039488', '5000000.0000', 'baokim', '', '', '', 1408099776),
(19, 0, 0, 19, 'Hoàng văn Tuyền', 'hoangvantuyencnt@gmail.com', '01686039488', '5000000.0000', 'baokim', '', '', '', 1408099813),
(20, 0, 0, 19, 'Hoàng văn Tuyền', 'hoangvantuyencnt@gmail.com', '01686039488', '5000000.0000', 'baokim', '', '', '', 1408099856),
(21, 0, 0, 0, 'Hoàng văn Tuyền', 'hoangvantuyencnt@gmail.com', '01686039488', '10000000.0000', 'dathang', '', '', '', 1408159002);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `phone`, `address`, `password`, `created`) VALUES
(16, 'Hoàng văn Tuyền', 'tuyenht90@yahoo.com', '01686039488', '111111', '96e79218965eb72c92a549dd5a330112', 1405589118),
(19, 'Hoàng văn Tuyền', 'hoangvantuyencnt@gmail.com', '01686039488', '111', '96e79218965eb72c92a549dd5a330112', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `video`
--

CREATE TABLE `video` (
  `id` int(255) NOT NULL,
  `count_view` int(255) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `images` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `intro` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `feature` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `view` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `video`
--

INSERT INTO `video` (`id`, `count_view`, `name`, `images`, `intro`, `link`, `feature`, `created`, `view`) VALUES
(10, 0, 'Chuyện Tình Trên Facebook - Hồ Việt Trung [Official]', '1386147113843_video.jpg', '', 'http://www.youtube.com/watch?v=3ZlLyU2L4P0', 1386146497, 2013, 4),
(8, 0, 'Chỉ còn trong mơ & Phải không em', '1386147092891_video.jpg', '', 'http://www.youtube.com/watch?v=RfNJ43HBzOM', 1386146505, 2013, 6),
(7, 0, '[HD] Anh Xin Lỗi - Minh Vương M4U', '1386147058495_video.jpg', '', 'http://www.youtube.com/watch?v=OCZ4D9qT8lI', 1386146502, 2013, 17),
(16, 0, 'Nhốt Em Vào Tim - Hồ Việt Trung [Official]', '1386147135763_video.jpg', '', 'http://www.youtube.com/watch?v=fkDSnN_I_Ig', 0, 1386147135, 0),
(17, 0, 'Chỉ Yêu Mình Em - Châu Khải Phong [Official]', '1386147154302_video.jpg', '', 'http://www.youtube.com/watch?v=l2MydtlKra8', 0, 1386147154, 4),
(18, 0, 'Số Nghèo - Châu Khải Phong [Official]', '138614718279_video.jpg', '', 'http://www.youtube.com/watch?v=LJRvv8U6Dos', 1386147576, 1386147182, 1),
(19, 0, 'Trò Chơi Đắng Cay - Châu Khải Phong [Official]', '138614721063_video.jpg', '', 'http://www.youtube.com/watch?v=3J8d8-YgOlU', 1386147575, 1386147210, 0),
(20, 0, 'Sầu Tím Thiệp Hồng - Quang Lê & Lệ Quyên ( Liveshow Quang Lê )', '1386147271236_video.jpg', '', 'http://www.youtube.com/watch?v=Kd5OrV4Y_bs', 0, 1386147271, 0),
(21, 0, 'Gõ cửa trái tim Quang Lê - Mai Thiên Vân', '1386147292776_video.jpg', '', 'http://www.youtube.com/watch?v=9oVxDQsgXIQ', 1386147577, 1386147292, 0),
(22, 0, 'Cô Hàng Xóm - Quang Lê', '1386147310490_video.jpg', '', 'http://www.youtube.com/watch?v=nA9ub4zlel8', 0, 1386147310, 0),
(23, 0, 'Lam Truong - Mai Mai', '1386147353743_video.jpg', '', 'http://www.youtube.com/watch?v=o1igATj9lMw', 0, 1386147353, 0),
(24, 0, 'Lỡ Yêu Em Rồi - Bằng Kiều', '1386147364632_video.jpg', '', 'http://www.youtube.com/watch?v=HYi-5dM_c34', 0, 1386147364, 0),
(25, 0, 'Bản Tình Cuối - Bằng Kiều', '1386147389790_video.jpg', '', 'http://www.youtube.com/watch?v=pNr7jEQ8LT8', 0, 1386147389, 2),
(26, 1, 'Phút cuối - Bằng Kiều', '1386150063515_video.jpg', '', 'http://www.youtube.com/watch?v=sA_gM6_eqXU', 0, 1386150063, 0),
(27, 0, 'Giấc Mơ (Live) - Bùi Anh Tuấn ft Yanbi', '1386150103768_video.jpg', '', 'http://www.youtube.com/watch?v=XLr463dUNgQ', 0, 1386150103, 0),
(28, 4, 'Anh Nhớ Em - Tuấn Hưng', '1386150121482_video.jpg', '', 'http://www.youtube.com/watch?v=ewNQtt1RiSk', 0, 1386150121, 0),
(29, 0, 'LE QUYEN & TUAN HUNG - Nhu Giac Chiem Bao', '1386150141608_video.jpg', '', 'http://www.youtube.com/watch?v=DaMARvh0kms', 0, 1386150141, 0),
(30, 10, 'Dĩ Vãng Cuộc Tình - Duy Mạnh ft Tuấn Hưng', '140905101897_video.jpg', '', 'http://www.youtube.com/watch?v=g8I-LoBIFgQ', 0, 1409051018, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `admin_group`
--
ALTER TABLE `admin_group`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `content_static`
--
ALTER TABLE `content_static`
  ADD PRIMARY KEY (`id`,`key`);

--
-- Chỉ mục cho bảng `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `info` ADD FULLTEXT KEY `title` (`title`);

--
-- Chỉ mục cho bảng `maker`
--
ALTER TABLE `maker`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `news` ADD FULLTEXT KEY `title` (`title`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `product` ADD FULLTEXT KEY `name` (`name`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `admin_group`
--
ALTER TABLE `admin_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `content_static`
--
ALTER TABLE `content_static`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `maker`
--
ALTER TABLE `maker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `support`
--
ALTER TABLE `support`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `video`
--
ALTER TABLE `video`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
