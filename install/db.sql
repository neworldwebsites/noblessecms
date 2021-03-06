-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2015 at 02:40 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `2015_project_noblessev2`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `userid` int(9) NOT NULL,
  `company` varchar(64) CHARACTER SET utf8 NOT NULL,
  `firstname` varchar(32) CHARACTER SET utf8 NOT NULL,
  `lastname` varchar(32) CHARACTER SET utf8 NOT NULL,
  `address_1` varchar(128) CHARACTER SET utf8 NOT NULL,
  `address_2` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8 NOT NULL,
  `state` varchar(64) CHARACTER SET utf8 NOT NULL,
  `postcode` varchar(20) CHARACTER SET utf8 NOT NULL,
  `country` varchar(32) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `fax` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `catid` int(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) CHARACTER SET utf8 NOT NULL,
  `friendly_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `parentid` varchar(128) NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`catid`, `title`, `friendly_url`, `parentid`, `image`, `sort_order`, `date_added`, `status`) VALUES
(15, 'United', 'United', '0', '/uploads/images/2231793638/post_2.jpg', 15, '2015-01-18 07:57:36', 1),
(19, 'Cat 1', 'Cat_1', '0', NULL, 0, '2015-03-31 09:41:40', 1),
(20, 'Cat 2 test', 'Cat-2-test', '0', NULL, 0, '2015-03-31 09:41:42', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `commentid` int(9) NOT NULL AUTO_INCREMENT,
  `postid` varchar(128) NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT 'comment',
  `fullname` varchar(50) CHARACTER SET utf8 NOT NULL,
  `email` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `parentid` int(9) NOT NULL DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `content` longtext CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`commentid`, `postid`, `type`, `fullname`, `email`, `parentid`, `date_added`, `status`, `content`) VALUES
(1, '1', 'post', 'sÄ‘s', 'gdfgfg@gmai.com', 0, '2015-03-16 05:38:40', 1, 'sdgsdsdfsdfsdfsdf'),
(2, '1', 'post', 'james', 'dfsdfdf@gmail.com', 0, '2015-03-16 05:39:31', 1, '1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived'),
(3, '1', 'comment', 'dfdf', 'dfdf@gmail.com', 0, '2015-05-27 12:53:47', 0, 'fdgdfgdfgdfgdfgsdfsdfdf');

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

DROP TABLE IF EXISTS `contactus`;
CREATE TABLE IF NOT EXISTS `contactus` (
  `contactid` int(9) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(64) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `content` longtext CHARACTER SET utf8 NOT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=252 ;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`) VALUES
(1, 'Afghanistan', 'AF', 'AFG'),
(2, 'Albania', 'AL', 'ALB'),
(3, 'Algeria', 'DZ', 'DZA'),
(4, 'American Samoa', 'AS', 'ASM'),
(5, 'Andorra', 'AD', 'AND'),
(6, 'Angola', 'AO', 'AGO'),
(7, 'Anguilla', 'AI', 'AIA'),
(8, 'Antarctica', 'AQ', 'ATA'),
(9, 'Antigua and Barbuda', 'AG', 'ATG'),
(10, 'Argentina', 'AR', 'ARG'),
(11, 'Armenia', 'AM', 'ARM'),
(12, 'Aruba', 'AW', 'ABW'),
(13, 'Australia', 'AU', 'AUS'),
(14, 'Austria', 'AT', 'AUT'),
(15, 'Azerbaijan', 'AZ', 'AZE'),
(16, 'Bahamas', 'BS', 'BHS'),
(17, 'Bahrain', 'BH', 'BHR'),
(18, 'Bangladesh', 'BD', 'BGD'),
(19, 'Barbados', 'BB', 'BRB'),
(20, 'Belarus', 'BY', 'BLR'),
(21, 'Belgium', 'BE', 'BEL'),
(22, 'Belize', 'BZ', 'BLZ'),
(23, 'Benin', 'BJ', 'BEN'),
(24, 'Bermuda', 'BM', 'BMU'),
(25, 'Bhutan', 'BT', 'BTN'),
(26, 'Bolivia', 'BO', 'BOL'),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH'),
(28, 'Botswana', 'BW', 'BWA'),
(29, 'Bouvet Island', 'BV', 'BVT'),
(30, 'Brazil', 'BR', 'BRA'),
(31, 'British Indian Ocean Territory', 'IO', 'IOT'),
(32, 'Brunei Darussalam', 'BN', 'BRN'),
(33, 'Bulgaria', 'BG', 'BGR'),
(34, 'Burkina Faso', 'BF', 'BFA'),
(35, 'Burundi', 'BI', 'BDI'),
(36, 'Cambodia', 'KH', 'KHM'),
(37, 'Cameroon', 'CM', 'CMR'),
(38, 'Canada', 'CA', 'CAN'),
(39, 'Cape Verde', 'CV', 'CPV'),
(40, 'Cayman Islands', 'KY', 'CYM'),
(41, 'Central African Republic', 'CF', 'CAF'),
(42, 'Chad', 'TD', 'TCD'),
(43, 'Chile', 'CL', 'CHL'),
(44, 'China', 'CN', 'CHN'),
(45, 'Christmas Island', 'CX', 'CXR'),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK'),
(47, 'Colombia', 'CO', 'COL'),
(48, 'Comoros', 'KM', 'COM'),
(49, 'Congo', 'CG', 'COG'),
(50, 'Cook Islands', 'CK', 'COK'),
(51, 'Costa Rica', 'CR', 'CRI'),
(52, 'Cote D''Ivoire', 'CI', 'CIV'),
(53, 'Croatia', 'HR', 'HRV'),
(54, 'Cuba', 'CU', 'CUB'),
(55, 'Cyprus', 'CY', 'CYP'),
(56, 'Czech Republic', 'CZ', 'CZE'),
(57, 'Denmark', 'DK', 'DNK'),
(58, 'Djibouti', 'DJ', 'DJI'),
(59, 'Dominica', 'DM', 'DMA'),
(60, 'Dominican Republic', 'DO', 'DOM'),
(61, 'East Timor', 'TL', 'TLS'),
(62, 'Ecuador', 'EC', 'ECU'),
(63, 'Egypt', 'EG', 'EGY'),
(64, 'El Salvador', 'SV', 'SLV'),
(65, 'Equatorial Guinea', 'GQ', 'GNQ'),
(66, 'Eritrea', 'ER', 'ERI'),
(67, 'Estonia', 'EE', 'EST'),
(68, 'Ethiopia', 'ET', 'ETH'),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK'),
(70, 'Faroe Islands', 'FO', 'FRO'),
(71, 'Fiji', 'FJ', 'FJI'),
(72, 'Finland', 'FI', 'FIN'),
(74, 'France, Metropolitan', 'FR', 'FRA'),
(75, 'French Guiana', 'GF', 'GUF'),
(76, 'French Polynesia', 'PF', 'PYF'),
(77, 'French Southern Territories', 'TF', 'ATF'),
(78, 'Gabon', 'GA', 'GAB'),
(79, 'Gambia', 'GM', 'GMB'),
(80, 'Georgia', 'GE', 'GEO'),
(81, 'Germany', 'DE', 'DEU'),
(82, 'Ghana', 'GH', 'GHA'),
(83, 'Gibraltar', 'GI', 'GIB'),
(84, 'Greece', 'GR', 'GRC'),
(85, 'Greenland', 'GL', 'GRL'),
(86, 'Grenada', 'GD', 'GRD'),
(87, 'Guadeloupe', 'GP', 'GLP'),
(88, 'Guam', 'GU', 'GUM'),
(89, 'Guatemala', 'GT', 'GTM'),
(90, 'Guinea', 'GN', 'GIN'),
(91, 'Guinea-Bissau', 'GW', 'GNB'),
(92, 'Guyana', 'GY', 'GUY'),
(93, 'Haiti', 'HT', 'HTI'),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD'),
(95, 'Honduras', 'HN', 'HND'),
(96, 'Hong Kong', 'HK', 'HKG'),
(97, 'Hungary', 'HU', 'HUN'),
(98, 'Iceland', 'IS', 'ISL'),
(99, 'India', 'IN', 'IND'),
(100, 'Indonesia', 'ID', 'IDN'),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN'),
(102, 'Iraq', 'IQ', 'IRQ'),
(103, 'Ireland', 'IE', 'IRL'),
(104, 'Israel', 'IL', 'ISR'),
(105, 'Italy', 'IT', 'ITA'),
(106, 'Jamaica', 'JM', 'JAM'),
(107, 'Japan', 'JP', 'JPN'),
(108, 'Jordan', 'JO', 'JOR'),
(109, 'Kazakhstan', 'KZ', 'KAZ'),
(110, 'Kenya', 'KE', 'KEN'),
(111, 'Kiribati', 'KI', 'KIR'),
(112, 'North Korea', 'KP', 'PRK'),
(113, 'Korea, Republic of', 'KR', 'KOR'),
(114, 'Kuwait', 'KW', 'KWT'),
(115, 'Kyrgyzstan', 'KG', 'KGZ'),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO'),
(117, 'Latvia', 'LV', 'LVA'),
(118, 'Lebanon', 'LB', 'LBN'),
(119, 'Lesotho', 'LS', 'LSO'),
(120, 'Liberia', 'LR', 'LBR'),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY'),
(122, 'Liechtenstein', 'LI', 'LIE'),
(123, 'Lithuania', 'LT', 'LTU'),
(124, 'Luxembourg', 'LU', 'LUX'),
(125, 'Macau', 'MO', 'MAC'),
(126, 'FYROM', 'MK', 'MKD'),
(127, 'Madagascar', 'MG', 'MDG'),
(128, 'Malawi', 'MW', 'MWI'),
(129, 'Malaysia', 'MY', 'MYS'),
(130, 'Maldives', 'MV', 'MDV'),
(131, 'Mali', 'ML', 'MLI'),
(132, 'Malta', 'MT', 'MLT'),
(133, 'Marshall Islands', 'MH', 'MHL'),
(134, 'Martinique', 'MQ', 'MTQ'),
(135, 'Mauritania', 'MR', 'MRT'),
(136, 'Mauritius', 'MU', 'MUS'),
(137, 'Mayotte', 'YT', 'MYT'),
(138, 'Mexico', 'MX', 'MEX'),
(139, 'Micronesia, Federated States of', 'FM', 'FSM'),
(140, 'Moldova, Republic of', 'MD', 'MDA'),
(141, 'Monaco', 'MC', 'MCO'),
(142, 'Mongolia', 'MN', 'MNG'),
(143, 'Montserrat', 'MS', 'MSR'),
(144, 'Morocco', 'MA', 'MAR'),
(145, 'Mozambique', 'MZ', 'MOZ'),
(146, 'Myanmar', 'MM', 'MMR'),
(147, 'Namibia', 'NA', 'NAM'),
(148, 'Nauru', 'NR', 'NRU'),
(149, 'Nepal', 'NP', 'NPL'),
(150, 'Netherlands', 'NL', 'NLD'),
(151, 'Netherlands Antilles', 'AN', 'ANT'),
(152, 'New Caledonia', 'NC', 'NCL'),
(153, 'New Zealand', 'NZ', 'NZL'),
(154, 'Nicaragua', 'NI', 'NIC'),
(155, 'Niger', 'NE', 'NER'),
(156, 'Nigeria', 'NG', 'NGA'),
(157, 'Niue', 'NU', 'NIU'),
(158, 'Norfolk Island', 'NF', 'NFK'),
(159, 'Northern Mariana Islands', 'MP', 'MNP'),
(160, 'Norway', 'NO', 'NOR'),
(161, 'Oman', 'OM', 'OMN'),
(162, 'Pakistan', 'PK', 'PAK'),
(163, 'Palau', 'PW', 'PLW'),
(164, 'Panama', 'PA', 'PAN'),
(165, 'Papua New Guinea', 'PG', 'PNG'),
(166, 'Paraguay', 'PY', 'PRY'),
(167, 'Peru', 'PE', 'PER'),
(168, 'Philippines', 'PH', 'PHL'),
(169, 'Pitcairn', 'PN', 'PCN'),
(170, 'Poland', 'PL', 'POL'),
(171, 'Portugal', 'PT', 'PRT'),
(172, 'Puerto Rico', 'PR', 'PRI'),
(173, 'Qatar', 'QA', 'QAT'),
(174, 'Reunion', 'RE', 'REU'),
(175, 'Romania', 'RO', 'ROM'),
(176, 'Russian Federation', 'RU', 'RUS'),
(177, 'Rwanda', 'RW', 'RWA'),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA'),
(179, 'Saint Lucia', 'LC', 'LCA'),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT'),
(181, 'Samoa', 'WS', 'WSM'),
(182, 'San Marino', 'SM', 'SMR'),
(183, 'Sao Tome and Principe', 'ST', 'STP'),
(184, 'Saudi Arabia', 'SA', 'SAU'),
(185, 'Senegal', 'SN', 'SEN'),
(186, 'Seychelles', 'SC', 'SYC'),
(187, 'Sierra Leone', 'SL', 'SLE'),
(188, 'Singapore', 'SG', 'SGP'),
(189, 'Slovak Republic', 'SK', 'SVK'),
(190, 'Slovenia', 'SI', 'SVN'),
(191, 'Solomon Islands', 'SB', 'SLB'),
(192, 'Somalia', 'SO', 'SOM'),
(193, 'South Africa', 'ZA', 'ZAF'),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS'),
(195, 'Spain', 'ES', 'ESP'),
(196, 'Sri Lanka', 'LK', 'LKA'),
(197, 'St. Helena', 'SH', 'SHN'),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM'),
(199, 'Sudan', 'SD', 'SDN'),
(200, 'Suriname', 'SR', 'SUR'),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM'),
(202, 'Swaziland', 'SZ', 'SWZ'),
(203, 'Sweden', 'SE', 'SWE'),
(204, 'Switzerland', 'CH', 'CHE'),
(205, 'Syrian Arab Republic', 'SY', 'SYR'),
(206, 'Taiwan', 'TW', 'TWN'),
(207, 'Tajikistan', 'TJ', 'TJK'),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA'),
(209, 'Thailand', 'TH', 'THA'),
(210, 'Togo', 'TG', 'TGO'),
(211, 'Tokelau', 'TK', 'TKL'),
(212, 'Tonga', 'TO', 'TON'),
(213, 'Trinidad and Tobago', 'TT', 'TTO'),
(214, 'Tunisia', 'TN', 'TUN'),
(215, 'Turkey', 'TR', 'TUR'),
(216, 'Turkmenistan', 'TM', 'TKM'),
(217, 'Turks and Caicos Islands', 'TC', 'TCA'),
(218, 'Tuvalu', 'TV', 'TUV'),
(219, 'Uganda', 'UG', 'UGA'),
(220, 'Ukraine', 'UA', 'UKR'),
(221, 'United Arab Emirates', 'AE', 'ARE'),
(222, 'United Kingdom', 'GB', 'GBR'),
(223, 'United States', 'US', 'USA'),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI'),
(225, 'Uruguay', 'UY', 'URY'),
(226, 'Uzbekistan', 'UZ', 'UZB'),
(227, 'Vanuatu', 'VU', 'VUT'),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT'),
(229, 'Venezuela', 'VE', 'VEN'),
(230, 'Viet Nam', 'VN', 'VNM'),
(231, 'Virgin Islands (British)', 'VG', 'VGB'),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR'),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF'),
(234, 'Western Sahara', 'EH', 'ESH'),
(235, 'Yemen', 'YE', 'YEM'),
(237, 'Democratic Republic of Congo', 'CD', 'COD'),
(238, 'Zambia', 'ZM', 'ZMB'),
(239, 'Zimbabwe', 'ZW', 'ZWE'),
(240, 'Jersey', 'JE', 'JEY'),
(241, 'Guernsey', 'GG', 'GGY'),
(242, 'Montenegro', 'ME', 'MNE'),
(243, 'Serbia', 'RS', 'SRB'),
(244, 'Aaland Islands', 'AX', 'ALA'),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES'),
(246, 'Curacao', 'CW', 'CUW'),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE'),
(248, 'South Sudan', 'SS', 'SSD'),
(249, 'St. Barthelemy', 'BL', 'BLM'),
(250, 'St. Martin (French part)', 'MF', 'MAF'),
(251, 'Canary Islands', 'IC', 'ICA');

-- --------------------------------------------------------

--
-- Table structure for table `cronjobs`
--

DROP TABLE IF EXISTS `cronjobs`;
CREATE TABLE IF NOT EXISTS `cronjobs` (
  `cronid` int(9) NOT NULL AUTO_INCREMENT,
  `timenumber` int(9) NOT NULL DEFAULT '0',
  `timetype` varchar(30) NOT NULL DEFAULT 'min',
  `timeinterval` int(9) NOT NULL DEFAULT '0',
  `last_update` datetime DEFAULT NULL,
  `jobdata` varchar(1000) NOT NULL,
  `date_added` datetime NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cronid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `layouts`
--

DROP TABLE IF EXISTS `layouts`;
CREATE TABLE IF NOT EXISTS `layouts` (
  `layoutid` int(9) NOT NULL AUTO_INCREMENT,
  `nodeid` varchar(128) NOT NULL,
  `layoutname` varchar(64) NOT NULL,
  PRIMARY KEY (`layoutid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `layouts`
--

INSERT INTO `layouts` (`layoutid`, `nodeid`, `layoutname`) VALUES
(1, '', 'Account'),
(2, '', 'Category'),
(3, '', 'Home'),
(4, '', 'Pages'),
(5, '', 'Post'),
(6, '', 'Cart'),
(7, '', 'Search'),
(8, '', 'Shop'),
(9, '', 'Tag'),
(10, '', 'Contactus'),
(11, '', 'News'),
(12, '', 'Product');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
CREATE TABLE IF NOT EXISTS `links` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `parentid` int(9) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `sort_order` int(9) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'published',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `parentid`, `title`, `url`, `sort_order`, `date_added`, `status`) VALUES
(6, 0, 'Home', '/', 0, '2015-07-14 08:12:42', 'published'),
(8, 0, 'Contact Us', '/contactus', 1, '2015-07-14 08:13:13', 'published');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `pageid` int(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `content` longtext CHARACTER SET utf8,
  `image` varchar(500) DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `page_type` varchar(50) NOT NULL DEFAULT 'normal',
  `friendly_url` varchar(255) CHARACTER SET utf8 NOT NULL,
  `date_added` datetime NOT NULL,
  `allowcomment` int(1) NOT NULL DEFAULT '1',
  `views` int(9) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pageid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`pageid`, `title`, `content`, `image`, `keywords`, `page_type`, `friendly_url`, `date_added`, `allowcomment`, `views`, `status`) VALUES
(3, 'test page test', 'Test full page', 'uploads/files/5241876061/10009844_637003356387151_1768897436_n.png', 'test page,page,test,avcvc', 'normal', 'test-page-test', '2015-05-09 04:19:36', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
CREATE TABLE IF NOT EXISTS `plugins` (
  `foldername` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'global',
  `date_added` datetime NOT NULL,
  `installed` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `foldername` (`foldername`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `plugins_meta`
--

DROP TABLE IF EXISTS `plugins_meta`;
CREATE TABLE IF NOT EXISTS `plugins_meta` (
  `metaid` int(9) NOT NULL AUTO_INCREMENT,
  `foldername` varchar(100) NOT NULL,
  `func` varchar(100) NOT NULL,
  `zonename` varchar(255) NOT NULL,
  `layoutname` varchar(30) DEFAULT NULL,
  `layoutposition` int(1) NOT NULL DEFAULT '0',
  `content` longtext,
  `type` varchar(100) NOT NULL DEFAULT 'plugin',
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`metaid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `postid` int(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `catid` int(9) NOT NULL,
  `userid` int(9) NOT NULL,
  `parentid` int(9) NOT NULL DEFAULT '0',
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort_order` int(9) NOT NULL DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  `views` int(9) NOT NULL DEFAULT '0',
  `content` longtext CHARACTER SET utf8,
  `type` varchar(50) NOT NULL DEFAULT 'normal',
  `keywords` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `friendly_url` varchar(255) CHARACTER SET utf8 NOT NULL,
  `is_featured` int(1) NOT NULL DEFAULT '0',
  `date_featured` datetime DEFAULT NULL,
  `expires_date` datetime DEFAULT NULL,
  `rating` int(2) NOT NULL DEFAULT '5',
  `allowcomment` int(1) NOT NULL DEFAULT '1',
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`postid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`postid`, `title`, `catid`, `userid`, `parentid`, `image`, `sort_order`, `date_added`, `views`, `content`, `type`, `keywords`, `friendly_url`, `is_featured`, `date_featured`, `expires_date`, `rating`, `allowcomment`, `status`) VALUES
(1, 'Lorem Ipsum is simply dummy text', 19, 1, 0, 'uploads/files/1542963641/10329165_1009469839063660_5573319220292906496_n.png', 1, '2015-03-16 05:35:00', 188, '[p][p][p][p][b]Lorem Ipsum[/b]ï¿½ is ssimply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.[/p][/p][/p][/p][/p]', 'normal', '', 'Lorem-Ipsum-is-simply-dummy-text', 0, NULL, NULL, 5, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
CREATE TABLE IF NOT EXISTS `post_categories` (
  `postid` int(9) NOT NULL,
  `catid` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `post_images`
--

DROP TABLE IF EXISTS `post_images`;
CREATE TABLE IF NOT EXISTS `post_images` (
  `postid` int(9) NOT NULL,
  `image` varchar(500) NOT NULL,
  `sort_order` int(9) NOT NULL DEFAULT '0',
  `date_added` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
CREATE TABLE IF NOT EXISTS `post_tags` (
  `tagid` int(9) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `postid` int(9) NOT NULL,
  PRIMARY KEY (`tagid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`tagid`, `title`, `postid`) VALUES
(36, 'post', 1),
(37, 'test post', 1);

-- --------------------------------------------------------

--
-- Table structure for table `server_setting`
--

DROP TABLE IF EXISTS `server_setting`;
CREATE TABLE IF NOT EXISTS `server_setting` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `server_setting`
--

INSERT INTO `server_setting` (`id`, `content`) VALUES
(1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
CREATE TABLE IF NOT EXISTS `usergroups` (
  `groupid` int(9) NOT NULL AUTO_INCREMENT,
  `group_title` varchar(255) NOT NULL,
  `groupdata` longtext,
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `usergroups`
--

INSERT INTO `usergroups` (`groupid`, `group_title`, `groupdata`) VALUES
(1, 'Administrator', 'a:30:{s:16:"can_view_admincp";s:3:"yes";s:15:"can_view_usercp";s:3:"yes";s:17:"can_view_homepage";s:3:"yes";s:13:"can_view_post";s:3:"yes";s:18:"can_insert_comment";s:3:"yes";s:15:"can_manage_post";s:3:"yes";s:15:"can_addnew_post";s:3:"yes";s:13:"can_edit_post";s:3:"yes";s:15:"can_remove_post";s:3:"yes";s:19:"can_addnew_category";s:3:"yes";s:17:"can_edit_category";s:3:"yes";s:19:"can_remove_category";s:3:"yes";s:20:"can_manage_contactus";s:3:"yes";s:20:"can_remove_contactus";s:3:"yes";s:15:"can_addnew_page";s:3:"yes";s:13:"can_edit_page";s:3:"yes";s:15:"can_remove_page";s:3:"yes";s:15:"can_addnew_user";s:3:"yes";s:13:"can_edit_user";s:3:"yes";s:15:"can_remove_user";s:3:"yes";s:19:"can_edit_user_group";s:3:"yes";s:20:"can_addnew_usergroup";s:3:"yes";s:18:"can_edit_usergroup";s:3:"yes";s:20:"can_remove_usergroup";s:3:"yes";s:18:"can_setting_system";s:3:"yes";s:18:"can_manage_plugins";s:3:"yes";s:17:"can_manage_themes";s:3:"yes";s:19:"can_manage_category";s:3:"yes";s:15:"can_manage_user";s:3:"yes";s:20:"can_manage_usergroup";s:3:"yes";}'),
(2, 'Member', 'a:32:{s:16:"can_view_admincp";s:2:"no";s:15:"can_view_usercp";s:3:"yes";s:17:"can_view_homepage";s:3:"yes";s:13:"can_view_post";s:3:"yes";s:18:"can_insert_comment";s:3:"yes";s:15:"can_manage_post";s:3:"yes";s:15:"can_addnew_post";s:3:"yes";s:13:"can_edit_post";s:3:"yes";s:15:"can_remove_post";s:3:"yes";s:19:"can_addnew_category";s:2:"no";s:17:"can_edit_category";s:2:"no";s:19:"can_remove_category";s:2:"no";s:20:"can_manage_contactus";s:2:"no";s:20:"can_remove_contactus";s:2:"no";s:15:"can_addnew_page";s:2:"no";s:13:"can_edit_page";s:2:"no";s:15:"can_remove_page";s:2:"no";s:15:"can_addnew_user";s:2:"no";s:13:"can_edit_user";s:2:"no";s:15:"can_remove_user";s:2:"no";s:19:"can_edit_user_group";s:2:"no";s:20:"can_addnew_usergroup";s:2:"no";s:18:"can_edit_usergroup";s:2:"no";s:20:"can_remove_usergroup";s:2:"no";s:18:"can_setting_system";s:2:"no";s:18:"can_manage_plugins";s:2:"no";s:17:"can_manage_themes";s:2:"no";s:19:"can_manage_category";s:2:"no";s:15:"can_manage_user";s:2:"no";s:20:"can_manage_usergroup";s:2:"no";s:20:"can_login_to_admincp";s:2:"no";s:19:"can_login_to_usercp";s:3:"yes";}'),
(5, 'Banned Member', 'a:32:{s:16:"can_view_admincp";s:2:"no";s:15:"can_view_usercp";s:2:"no";s:17:"can_view_homepage";s:3:"yes";s:13:"can_view_post";s:3:"yes";s:18:"can_insert_comment";s:2:"no";s:15:"can_manage_post";s:2:"no";s:15:"can_addnew_post";s:2:"no";s:13:"can_edit_post";s:2:"no";s:15:"can_remove_post";s:2:"no";s:19:"can_addnew_category";s:2:"no";s:17:"can_edit_category";s:2:"no";s:19:"can_remove_category";s:2:"no";s:20:"can_manage_contactus";s:2:"no";s:20:"can_remove_contactus";s:2:"no";s:15:"can_addnew_page";s:2:"no";s:13:"can_edit_page";s:2:"no";s:15:"can_remove_page";s:2:"no";s:15:"can_addnew_user";s:2:"no";s:13:"can_edit_user";s:2:"no";s:15:"can_remove_user";s:2:"no";s:19:"can_edit_user_group";s:2:"no";s:20:"can_addnew_usergroup";s:2:"no";s:18:"can_edit_usergroup";s:2:"no";s:20:"can_remove_usergroup";s:2:"no";s:18:"can_setting_system";s:2:"no";s:18:"can_manage_plugins";s:2:"no";s:17:"can_manage_themes";s:2:"no";s:19:"can_manage_category";s:2:"no";s:15:"can_manage_user";s:2:"no";s:20:"can_manage_usergroup";s:2:"no";s:20:"can_login_to_admincp";s:2:"no";s:19:"can_login_to_usercp";s:2:"no";}'),
(6, 'Plugins & Theme Manager', ''),
(8, 'Pending Member', 'a:32:{s:16:"can_view_admincp";s:2:"no";s:15:"can_view_usercp";s:3:"yes";s:17:"can_view_homepage";s:3:"yes";s:13:"can_view_post";s:3:"yes";s:18:"can_insert_comment";s:2:"no";s:15:"can_manage_post";s:2:"no";s:15:"can_addnew_post";s:2:"no";s:13:"can_edit_post";s:2:"no";s:15:"can_remove_post";s:2:"no";s:19:"can_addnew_category";s:2:"no";s:17:"can_edit_category";s:2:"no";s:19:"can_remove_category";s:2:"no";s:20:"can_manage_contactus";s:2:"no";s:20:"can_remove_contactus";s:2:"no";s:15:"can_addnew_page";s:2:"no";s:13:"can_edit_page";s:2:"no";s:15:"can_remove_page";s:2:"no";s:15:"can_addnew_user";s:2:"no";s:13:"can_edit_user";s:2:"no";s:15:"can_remove_user";s:2:"no";s:19:"can_edit_user_group";s:2:"no";s:20:"can_addnew_usergroup";s:2:"no";s:18:"can_edit_usergroup";s:2:"no";s:20:"can_remove_usergroup";s:2:"no";s:18:"can_setting_system";s:2:"no";s:18:"can_manage_plugins";s:2:"no";s:17:"can_manage_themes";s:2:"no";s:19:"can_manage_category";s:2:"no";s:15:"can_manage_user";s:2:"no";s:20:"can_manage_usergroup";s:2:"no";s:20:"can_login_to_admincp";s:2:"no";s:19:"can_login_to_usercp";s:2:"no";}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userid` int(9) NOT NULL AUTO_INCREMENT,
  `groupid` int(9) NOT NULL DEFAULT '0',
  `username` varchar(150) DEFAULT NULL,
  `firstname` varchar(32) CHARACTER SET utf8 NOT NULL,
  `lastname` varchar(32) CHARACTER SET utf8 NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(256) NOT NULL,
  `userdata` longtext,
  `ip` varchar(64) NOT NULL,
  `verify_code` varchar(255) DEFAULT NULL,
  `forgot_code` varchar(255) DEFAULT NULL,
  `forgot_date` datetime DEFAULT NULL,
  `parentid` int(9) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
