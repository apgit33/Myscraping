-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 08 fév. 2021 à 12:48
-- Version du serveur :  5.7.26
-- Version de PHP :  7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `web_scraping`
--
CREATE DATABASE IF NOT EXISTS `web_scraping` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `web_scraping`;

-- --------------------------------------------------------

--
-- Structure de la table `ws_categories`
--

DROP TABLE IF EXISTS `ws_categories`;
CREATE TABLE IF NOT EXISTS `ws_categories` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(255) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ws_categories`
--

INSERT INTO `ws_categories` (`c_id`, `c_name`) VALUES
(1, 'Ut eos.'),
(2, 'In eum.'),
(3, 'Deleniti saepe.'),
(4, 'Qui ad.'),
(5, 'Ea officiis.'),
(6, 'Maxime occaecati consectetur.');

-- --------------------------------------------------------

--
-- Structure de la table `ws_datas`
--

DROP TABLE IF EXISTS `ws_datas`;
CREATE TABLE IF NOT EXISTS `ws_datas` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_contenair` varchar(255) DEFAULT NULL,
  `d_path_css` varchar(255) NOT NULL,
  `d_type_id` int(11) NOT NULL,
  `d_scrap_id` int(11) NOT NULL,
  PRIMARY KEY (`d_id`),
  KEY `d_type_id` (`d_type_id`),
  KEY `d_scrap_id` (`d_scrap_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ws_datas`
--

INSERT INTO `ws_datas` (`d_id`, `d_contenair`, `d_path_css`, `d_type_id`, `d_scrap_id`) VALUES
(1, 'NULL', 'Maxime distinctio et eius.', 6, 1),
(2, 'NULL', 'In facilis nihil.', 4, 1),
(3, 'Possimus non eveniet est.', 'Sunt architecto rerum.', 5, 2),
(4, 'NULL', 'Architecto voluptatibus est sed.', 1, 3),
(5, 'NULL', 'Est iusto excepturi.', 2, 3),
(6, 'NULL', 'Dignissimos illum laudantium.', 4, 4),
(7, 'NULL', 'Et consequatur rem.', 2, 4),
(8, 'Sequi illum qui consectetur.', 'Exercitationem sequi sunt exercitationem.', 1, 5),
(9, 'Sequi illum qui consectetur.', 'Dolores et eveniet.', 1, 5),
(10, 'Consequatur vitae consectetur.', 'Consequatur voluptatem.', 5, 6),
(11, 'Consequatur vitae consectetur.', 'Laborum ut doloremque illo.', 1, 6),
(12, 'Aut qui qui.', 'Consequuntur aliquam vel.', 2, 7),
(13, 'Aut qui qui.', 'Vero ex expedita vero.', 4, 7),
(14, 'Tenetur atque itaque.', 'Eveniet eum et voluptas.', 1, 8),
(15, 'Tenetur atque itaque.', 'Non assumenda optio occaecati.', 4, 8),
(16, 'Tenetur atque itaque.', 'Rerum amet in.', 6, 8),
(17, 'Quo neque voluptatum.', 'Sint illum natus dolore.', 2, 9),
(18, 'Quo neque voluptatum.', 'Atque maxime assumenda voluptatibus.', 4, 9),
(19, 'NULL', 'Molestias enim perferendis quas repudiandae.', 1, 10),
(20, 'NULL', 'Impedit alias ut.', 4, 10),
(21, 'NULL', 'Eius vero unde maiores.', 3, 10),
(22, 'NULL', 'Explicabo ad eius.', 4, 11),
(23, 'NULL', 'Esse aut dolorem debitis.', 1, 12),
(24, 'NULL', 'Laborum vel vel ullam.', 2, 13),
(25, 'NULL', 'Mollitia ea alias odit.', 6, 13),
(26, 'NULL', 'Quibusdam ut sed unde.', 2, 14),
(27, 'NULL', 'Aut aut impedit.', 1, 14),
(28, 'NULL', 'Provident est officiis.', 2, 15),
(29, 'Officiis dolores quia aut.', 'Saepe velit cupiditate quia.', 4, 16),
(30, 'Officiis dolores quia aut.', 'Aut perspiciatis tempora.', 3, 16),
(31, 'Doloremque praesentium cumque sed.', 'Explicabo velit omnis in.', 2, 17),
(32, 'Doloremque praesentium cumque sed.', 'Consequatur quis dolor.', 2, 17),
(33, 'NULL', 'Sint amet commodi qui.', 4, 18),
(34, 'Non voluptatem molestiae.', 'Dolorum voluptatum laboriosam voluptas.', 5, 19),
(35, 'Non voluptatem molestiae.', 'Qui consequatur.', 6, 19),
(36, 'Non voluptatem molestiae.', 'Numquam esse ab.', 1, 19),
(37, 'NULL', 'Ea id blanditiis.', 4, 20),
(38, 'NULL', 'Earum ducimus omnis.', 3, 21),
(39, 'Recusandae voluptate vitae rem.', 'Quisquam sed et illo.', 4, 22),
(40, 'Sunt eligendi sapiente consequatur.', 'Aut ea numquam sapiente qui.', 3, 23),
(41, 'Sunt eligendi sapiente consequatur.', 'Dicta qui tenetur earum.', 5, 23),
(42, 'Maiores non itaque.', 'Voluptate velit quibusdam voluptates.', 1, 24),
(43, 'Maiores non itaque.', 'Doloribus fuga amet voluptatem.', 5, 24),
(44, 'Maiores non itaque.', 'Est recusandae unde qui.', 3, 24),
(45, 'Sint necessitatibus quibusdam.', 'Reprehenderit labore ipsam culpa.', 4, 25),
(46, 'Sint necessitatibus quibusdam.', 'Quod autem saepe.', 3, 25),
(47, 'Modi voluptatem aut.', 'Quia officiis quis.', 6, 26),
(48, 'Modi voluptatem aut.', 'Deleniti et consequatur atque.', 3, 26),
(49, 'Aliquid fuga repellat non.', 'Tempora quod.', 6, 27),
(50, 'Aliquid fuga repellat non.', 'Officiis commodi qui voluptatibus illum.', 5, 27),
(51, 'Eveniet sint eligendi.', 'Neque sapiente rerum.', 5, 28),
(52, 'Eveniet sint eligendi.', 'Ut itaque sint omnis.', 4, 28),
(53, 'Eveniet sint eligendi.', 'Autem veritatis ipsum.', 6, 28),
(54, 'Quaerat ipsa laudantium quod pariatur.', 'Molestiae minus et.', 6, 29),
(55, 'Quaerat ipsa laudantium quod pariatur.', 'Est quis tenetur rerum.', 5, 29),
(56, 'Maiores nesciunt accusantium.', 'Voluptatum quia aut.', 4, 30),
(57, 'Maiores nesciunt accusantium.', 'Quas autem atque ratione.', 5, 30),
(58, 'Maiores nesciunt accusantium.', 'Ex id vero.', 6, 30),
(59, 'Est id id voluptatem quaerat.', 'Dolorem quasi aliquid.', 4, 31),
(60, 'Est id id voluptatem quaerat.', 'Omnis saepe odit.', 1, 31),
(61, 'NULL', 'Aperiam provident nemo odit.', 2, 32),
(62, 'Sed assumenda nemo.', 'Nisi quasi.', 2, 33),
(63, 'Natus vitae at.', 'Enim hic et ipsam.', 2, 34),
(64, 'Unde suscipit non voluptatem.', 'Sequi voluptatum quasi consequuntur.', 1, 35),
(65, 'Unde suscipit non voluptatem.', 'Temporibus eligendi sit debitis.', 2, 35),
(66, 'Unde suscipit non voluptatem.', 'Sunt consequatur maxime.', 6, 35),
(67, 'NULL', 'Vel fuga qui.', 6, 36),
(68, 'NULL', 'Qui molestiae consequatur suscipit.', 3, 36),
(69, 'NULL', 'A nulla quas excepturi.', 2, 36),
(70, 'NULL', 'Est molestiae atque.', 1, 37),
(71, 'NULL', 'Iure eaque aut eos.', 3, 38),
(72, 'Aut aspernatur ab.', 'Eum dolor tempora facilis.', 4, 39),
(73, 'Aut aspernatur ab.', 'Sunt consequatur iste est.', 5, 39),
(74, 'Quasi in vero minus.', 'Fugit debitis vitae provident enim.', 2, 40),
(75, 'Ut nemo.', 'Sed molestias animi vel.', 6, 41),
(76, 'Ut nemo.', 'Maxime maiores et sunt voluptatum.', 5, 41),
(77, 'NULL', 'Ea dolorum praesentium asperiores.', 6, 42),
(78, 'NULL', 'Consequatur ea et nisi.', 3, 42),
(79, 'Aut et ut quis.', 'Tenetur autem temporibus quasi.', 3, 43),
(80, 'NULL', 'Amet placeat eaque.', 6, 44),
(81, 'Dicta ut qui.', 'Ut voluptas.', 6, 45),
(82, 'Dicta ut qui.', 'Aspernatur quisquam impedit ea.', 1, 45),
(83, 'Dicta ut qui.', 'Quibusdam sed ut cumque nam.', 1, 45),
(84, 'NULL', 'Quasi voluptas porro.', 3, 46),
(85, 'NULL', 'Quia quod incidunt qui.', 6, 47),
(86, 'NULL', 'Explicabo in porro ut.', 6, 47),
(87, 'NULL', 'Perspiciatis veniam.', 6, 47),
(88, 'NULL', 'Suscipit minus quae.', 1, 48),
(89, 'Rerum doloribus vel.', 'Nobis possimus maxime enim.', 6, 49),
(90, 'Rerum doloribus vel.', 'Et quibusdam voluptatem.', 1, 49),
(91, 'Rerum doloribus vel.', 'Repellendus distinctio mollitia voluptates.', 3, 49),
(92, 'Ipsa repellat aliquam consequuntur.', 'Soluta et sint.', 6, 50),
(93, 'Ipsa repellat aliquam consequuntur.', 'Esse ab et eum.', 6, 50),
(94, 'NULL', 'Sequi error.', 4, 51),
(95, 'NULL', 'Illum quia quam magni.', 5, 52),
(96, 'NULL', 'Illum exercitationem facere.', 5, 52),
(97, 'NULL', 'Quia fugiat voluptatum aspernatur.', 1, 53),
(98, 'NULL', 'Consequuntur perspiciatis consequatur et.', 6, 53),
(99, 'NULL', 'Nesciunt dolore labore.', 4, 54),
(100, 'NULL', 'Ipsum itaque numquam.', 6, 54),
(101, 'NULL', 'Nulla doloremque dolores qui.', 5, 54),
(102, 'At quas quisquam velit.', 'Quam amet rem voluptas.', 1, 55),
(103, 'At quas quisquam velit.', 'Ducimus corporis est et delectus.', 5, 55),
(104, 'At quas quisquam velit.', 'Vel unde harum cum delectus.', 6, 55),
(105, 'Aut molestiae.', 'Aut exercitationem.', 3, 56),
(106, 'NULL', 'Dolorum quidem reiciendis cumque.', 4, 57),
(107, 'Provident voluptatem qui.', 'Possimus et sed.', 2, 58),
(108, 'Provident voluptatem qui.', 'Aut iure voluptas recusandae.', 5, 58),
(109, 'Provident voluptatem qui.', 'Delectus quo voluptas illum.', 6, 58),
(110, 'NULL', 'Praesentium amet quis.', 1, 59),
(111, 'NULL', 'Numquam sunt minus autem.', 2, 59),
(112, 'Non atque aut tenetur unde.', 'Dolor ut quis corporis.', 6, 60);

-- --------------------------------------------------------

--
-- Structure de la table `ws_datas_type`
--

DROP TABLE IF EXISTS `ws_datas_type`;
CREATE TABLE IF NOT EXISTS `ws_datas_type` (
  `dt_id` int(11) NOT NULL AUTO_INCREMENT,
  `dt_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ws_datas_type`
--

INSERT INTO `ws_datas_type` (`dt_id`, `dt_name`) VALUES
(1, 'Quo sit temporibus.'),
(2, 'Et excepturi itaque.'),
(3, 'Qui velit alias.'),
(4, 'Itaque placeat accusantium.'),
(5, 'Sit quaerat.'),
(6, 'Dolores aut.');

-- --------------------------------------------------------

--
-- Structure de la table `ws_history`
--

DROP TABLE IF EXISTS `ws_history`;
CREATE TABLE IF NOT EXISTS `ws_history` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `h_scrap_id` int(11) NOT NULL,
  `h_date` date NOT NULL,
  `h_data` json NOT NULL,
  PRIMARY KEY (`h_id`),
  KEY `h_scrap_id` (`h_scrap_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ws_history`
--

INSERT INTO `ws_history` (`h_id`, `h_scrap_id`, `h_date`, `h_data`) VALUES
(1, 1, '1994-03-14', '{\"type\": \"6\", \"path_css\": \"Maxime distinctio et eius.\", \"contenair\": \"NULL\"}'),
(2, 1, '1980-09-07', '{\"type\": \"4\", \"path_css\": \"In facilis nihil.\", \"contenair\": \"NULL\"}'),
(3, 2, '1994-05-05', '{\"type\": \"5\", \"path_css\": \"Sunt architecto rerum.\", \"contenair\": \"Possimus non eveniet est.\"}'),
(4, 3, '2005-07-13', '{\"type\": \"1\", \"path_css\": \"Architecto voluptatibus est sed.\", \"contenair\": \"NULL\"}'),
(5, 3, '1987-12-14', '{\"type\": \"2\", \"path_css\": \"Est iusto excepturi.\", \"contenair\": \"NULL\"}'),
(6, 4, '2013-11-04', '{\"type\": \"4\", \"path_css\": \"Dignissimos illum laudantium.\", \"contenair\": \"NULL\"}'),
(7, 4, '1974-06-11', '{\"type\": \"2\", \"path_css\": \"Et consequatur rem.\", \"contenair\": \"NULL\"}'),
(8, 5, '1983-05-09', '{\"type\": \"1\", \"path_css\": \"Exercitationem sequi sunt exercitationem.\", \"contenair\": \"Sequi illum qui consectetur.\"}'),
(9, 5, '2000-12-14', '{\"type\": \"1\", \"path_css\": \"Dolores et eveniet.\", \"contenair\": \"Sequi illum qui consectetur.\"}'),
(10, 6, '1985-11-19', '{\"type\": \"5\", \"path_css\": \"Consequatur voluptatem.\", \"contenair\": \"Consequatur vitae consectetur.\"}'),
(11, 6, '1978-10-29', '{\"type\": \"1\", \"path_css\": \"Laborum ut doloremque illo.\", \"contenair\": \"Consequatur vitae consectetur.\"}'),
(12, 7, '1993-11-21', '{\"type\": \"2\", \"path_css\": \"Consequuntur aliquam vel.\", \"contenair\": \"Aut qui qui.\"}'),
(13, 7, '1983-07-25', '{\"type\": \"4\", \"path_css\": \"Vero ex expedita vero.\", \"contenair\": \"Aut qui qui.\"}'),
(14, 8, '1981-08-09', '{\"type\": \"1\", \"path_css\": \"Eveniet eum et voluptas.\", \"contenair\": \"Tenetur atque itaque.\"}'),
(15, 8, '1983-02-04', '{\"type\": \"4\", \"path_css\": \"Non assumenda optio occaecati.\", \"contenair\": \"Tenetur atque itaque.\"}'),
(16, 8, '2001-10-08', '{\"type\": \"6\", \"path_css\": \"Rerum amet in.\", \"contenair\": \"Tenetur atque itaque.\"}'),
(17, 9, '2000-05-06', '{\"type\": \"2\", \"path_css\": \"Sint illum natus dolore.\", \"contenair\": \"Quo neque voluptatum.\"}'),
(18, 9, '1983-08-26', '{\"type\": \"4\", \"path_css\": \"Atque maxime assumenda voluptatibus.\", \"contenair\": \"Quo neque voluptatum.\"}'),
(19, 10, '1977-03-30', '{\"type\": \"1\", \"path_css\": \"Molestias enim perferendis quas repudiandae.\", \"contenair\": \"NULL\"}'),
(20, 10, '1996-03-11', '{\"type\": \"4\", \"path_css\": \"Impedit alias ut.\", \"contenair\": \"NULL\"}'),
(21, 10, '2014-08-23', '{\"type\": \"3\", \"path_css\": \"Eius vero unde maiores.\", \"contenair\": \"NULL\"}'),
(22, 11, '2010-12-13', '{\"type\": \"4\", \"path_css\": \"Explicabo ad eius.\", \"contenair\": \"NULL\"}'),
(23, 12, '1992-08-31', '{\"type\": \"1\", \"path_css\": \"Esse aut dolorem debitis.\", \"contenair\": \"NULL\"}'),
(24, 13, '2015-03-15', '{\"type\": \"2\", \"path_css\": \"Laborum vel vel ullam.\", \"contenair\": \"NULL\"}'),
(25, 13, '2007-03-31', '{\"type\": \"6\", \"path_css\": \"Mollitia ea alias odit.\", \"contenair\": \"NULL\"}'),
(26, 14, '1990-05-12', '{\"type\": \"2\", \"path_css\": \"Quibusdam ut sed unde.\", \"contenair\": \"NULL\"}'),
(27, 14, '1985-08-12', '{\"type\": \"1\", \"path_css\": \"Aut aut impedit.\", \"contenair\": \"NULL\"}'),
(28, 15, '2014-01-18', '{\"type\": \"2\", \"path_css\": \"Provident est officiis.\", \"contenair\": \"NULL\"}'),
(29, 16, '1989-07-10', '{\"type\": \"4\", \"path_css\": \"Saepe velit cupiditate quia.\", \"contenair\": \"Officiis dolores quia aut.\"}'),
(30, 16, '1986-12-25', '{\"type\": \"3\", \"path_css\": \"Aut perspiciatis tempora.\", \"contenair\": \"Officiis dolores quia aut.\"}'),
(31, 17, '1972-09-05', '{\"type\": \"2\", \"path_css\": \"Explicabo velit omnis in.\", \"contenair\": \"Doloremque praesentium cumque sed.\"}'),
(32, 17, '1973-11-29', '{\"type\": \"2\", \"path_css\": \"Consequatur quis dolor.\", \"contenair\": \"Doloremque praesentium cumque sed.\"}'),
(33, 18, '1994-09-23', '{\"type\": \"4\", \"path_css\": \"Sint amet commodi qui.\", \"contenair\": \"NULL\"}'),
(34, 19, '1973-12-06', '{\"type\": \"5\", \"path_css\": \"Dolorum voluptatum laboriosam voluptas.\", \"contenair\": \"Non voluptatem molestiae.\"}'),
(35, 19, '2013-12-10', '{\"type\": \"6\", \"path_css\": \"Qui consequatur.\", \"contenair\": \"Non voluptatem molestiae.\"}'),
(36, 19, '1976-07-17', '{\"type\": \"1\", \"path_css\": \"Numquam esse ab.\", \"contenair\": \"Non voluptatem molestiae.\"}'),
(37, 20, '2016-09-06', '{\"type\": \"4\", \"path_css\": \"Ea id blanditiis.\", \"contenair\": \"NULL\"}'),
(38, 21, '1992-07-01', '{\"type\": \"3\", \"path_css\": \"Earum ducimus omnis.\", \"contenair\": \"NULL\"}'),
(39, 22, '1998-02-28', '{\"type\": \"4\", \"path_css\": \"Quisquam sed et illo.\", \"contenair\": \"Recusandae voluptate vitae rem.\"}'),
(40, 23, '1989-08-09', '{\"type\": \"3\", \"path_css\": \"Aut ea numquam sapiente qui.\", \"contenair\": \"Sunt eligendi sapiente consequatur.\"}'),
(41, 23, '1971-08-27', '{\"type\": \"5\", \"path_css\": \"Dicta qui tenetur earum.\", \"contenair\": \"Sunt eligendi sapiente consequatur.\"}'),
(42, 24, '1982-10-30', '{\"type\": \"1\", \"path_css\": \"Voluptate velit quibusdam voluptates.\", \"contenair\": \"Maiores non itaque.\"}'),
(43, 24, '2012-10-08', '{\"type\": \"5\", \"path_css\": \"Doloribus fuga amet voluptatem.\", \"contenair\": \"Maiores non itaque.\"}'),
(44, 24, '2015-12-01', '{\"type\": \"3\", \"path_css\": \"Est recusandae unde qui.\", \"contenair\": \"Maiores non itaque.\"}'),
(45, 25, '1999-12-05', '{\"type\": \"4\", \"path_css\": \"Reprehenderit labore ipsam culpa.\", \"contenair\": \"Sint necessitatibus quibusdam.\"}'),
(46, 25, '1995-01-16', '{\"type\": \"3\", \"path_css\": \"Quod autem saepe.\", \"contenair\": \"Sint necessitatibus quibusdam.\"}'),
(47, 26, '1984-03-15', '{\"type\": \"6\", \"path_css\": \"Quia officiis quis.\", \"contenair\": \"Modi voluptatem aut.\"}'),
(48, 26, '2011-02-26', '{\"type\": \"3\", \"path_css\": \"Deleniti et consequatur atque.\", \"contenair\": \"Modi voluptatem aut.\"}'),
(49, 27, '2020-10-03', '{\"type\": \"6\", \"path_css\": \"Tempora quod.\", \"contenair\": \"Aliquid fuga repellat non.\"}'),
(50, 27, '1977-05-01', '{\"type\": \"5\", \"path_css\": \"Officiis commodi qui voluptatibus illum.\", \"contenair\": \"Aliquid fuga repellat non.\"}'),
(51, 28, '1986-03-17', '{\"type\": \"5\", \"path_css\": \"Neque sapiente rerum.\", \"contenair\": \"Eveniet sint eligendi.\"}'),
(52, 28, '2006-04-18', '{\"type\": \"4\", \"path_css\": \"Ut itaque sint omnis.\", \"contenair\": \"Eveniet sint eligendi.\"}'),
(53, 28, '1992-10-18', '{\"type\": \"6\", \"path_css\": \"Autem veritatis ipsum.\", \"contenair\": \"Eveniet sint eligendi.\"}'),
(54, 29, '2011-04-06', '{\"type\": \"6\", \"path_css\": \"Molestiae minus et.\", \"contenair\": \"Quaerat ipsa laudantium quod pariatur.\"}'),
(55, 29, '1990-06-09', '{\"type\": \"5\", \"path_css\": \"Est quis tenetur rerum.\", \"contenair\": \"Quaerat ipsa laudantium quod pariatur.\"}'),
(56, 30, '1982-02-13', '{\"type\": \"4\", \"path_css\": \"Voluptatum quia aut.\", \"contenair\": \"Maiores nesciunt accusantium.\"}'),
(57, 30, '1993-02-19', '{\"type\": \"5\", \"path_css\": \"Quas autem atque ratione.\", \"contenair\": \"Maiores nesciunt accusantium.\"}'),
(58, 30, '1975-08-19', '{\"type\": \"6\", \"path_css\": \"Ex id vero.\", \"contenair\": \"Maiores nesciunt accusantium.\"}'),
(59, 31, '1980-10-12', '{\"type\": \"4\", \"path_css\": \"Dolorem quasi aliquid.\", \"contenair\": \"Est id id voluptatem quaerat.\"}'),
(60, 31, '2013-05-21', '{\"type\": \"1\", \"path_css\": \"Omnis saepe odit.\", \"contenair\": \"Est id id voluptatem quaerat.\"}'),
(61, 32, '1996-08-06', '{\"type\": \"2\", \"path_css\": \"Aperiam provident nemo odit.\", \"contenair\": \"NULL\"}'),
(62, 33, '1993-03-31', '{\"type\": \"2\", \"path_css\": \"Nisi quasi.\", \"contenair\": \"Sed assumenda nemo.\"}'),
(63, 34, '2000-05-14', '{\"type\": \"2\", \"path_css\": \"Enim hic et ipsam.\", \"contenair\": \"Natus vitae at.\"}'),
(64, 35, '2018-05-10', '{\"type\": \"1\", \"path_css\": \"Sequi voluptatum quasi consequuntur.\", \"contenair\": \"Unde suscipit non voluptatem.\"}'),
(65, 35, '2019-02-27', '{\"type\": \"2\", \"path_css\": \"Temporibus eligendi sit debitis.\", \"contenair\": \"Unde suscipit non voluptatem.\"}'),
(66, 35, '2019-05-01', '{\"type\": \"6\", \"path_css\": \"Sunt consequatur maxime.\", \"contenair\": \"Unde suscipit non voluptatem.\"}'),
(67, 36, '1975-11-07', '{\"type\": \"6\", \"path_css\": \"Vel fuga qui.\", \"contenair\": \"NULL\"}'),
(68, 36, '2010-06-26', '{\"type\": \"3\", \"path_css\": \"Qui molestiae consequatur suscipit.\", \"contenair\": \"NULL\"}'),
(69, 36, '1985-12-09', '{\"type\": \"2\", \"path_css\": \"A nulla quas excepturi.\", \"contenair\": \"NULL\"}'),
(70, 37, '1972-03-17', '{\"type\": \"1\", \"path_css\": \"Est molestiae atque.\", \"contenair\": \"NULL\"}'),
(71, 38, '1986-03-25', '{\"type\": \"3\", \"path_css\": \"Iure eaque aut eos.\", \"contenair\": \"NULL\"}'),
(72, 39, '2012-03-03', '{\"type\": \"4\", \"path_css\": \"Eum dolor tempora facilis.\", \"contenair\": \"Aut aspernatur ab.\"}'),
(73, 39, '1985-06-21', '{\"type\": \"5\", \"path_css\": \"Sunt consequatur iste est.\", \"contenair\": \"Aut aspernatur ab.\"}'),
(74, 40, '1980-11-27', '{\"type\": \"2\", \"path_css\": \"Fugit debitis vitae provident enim.\", \"contenair\": \"Quasi in vero minus.\"}'),
(75, 41, '2007-09-28', '{\"type\": \"6\", \"path_css\": \"Sed molestias animi vel.\", \"contenair\": \"Ut nemo.\"}'),
(76, 41, '1979-12-23', '{\"type\": \"5\", \"path_css\": \"Maxime maiores et sunt voluptatum.\", \"contenair\": \"Ut nemo.\"}'),
(77, 42, '1986-03-20', '{\"type\": \"6\", \"path_css\": \"Ea dolorum praesentium asperiores.\", \"contenair\": \"NULL\"}'),
(78, 42, '1981-02-12', '{\"type\": \"3\", \"path_css\": \"Consequatur ea et nisi.\", \"contenair\": \"NULL\"}'),
(79, 43, '2011-05-14', '{\"type\": \"3\", \"path_css\": \"Tenetur autem temporibus quasi.\", \"contenair\": \"Aut et ut quis.\"}'),
(80, 44, '1996-12-15', '{\"type\": \"6\", \"path_css\": \"Amet placeat eaque.\", \"contenair\": \"NULL\"}'),
(81, 45, '1991-05-25', '{\"type\": \"6\", \"path_css\": \"Ut voluptas.\", \"contenair\": \"Dicta ut qui.\"}'),
(82, 45, '2004-07-10', '{\"type\": \"1\", \"path_css\": \"Aspernatur quisquam impedit ea.\", \"contenair\": \"Dicta ut qui.\"}'),
(83, 45, '2015-12-28', '{\"type\": \"1\", \"path_css\": \"Quibusdam sed ut cumque nam.\", \"contenair\": \"Dicta ut qui.\"}'),
(84, 46, '2015-01-23', '{\"type\": \"3\", \"path_css\": \"Quasi voluptas porro.\", \"contenair\": \"NULL\"}'),
(85, 47, '2003-09-25', '{\"type\": \"6\", \"path_css\": \"Quia quod incidunt qui.\", \"contenair\": \"NULL\"}'),
(86, 47, '2015-11-11', '{\"type\": \"6\", \"path_css\": \"Explicabo in porro ut.\", \"contenair\": \"NULL\"}'),
(87, 47, '1975-05-01', '{\"type\": \"6\", \"path_css\": \"Perspiciatis veniam.\", \"contenair\": \"NULL\"}'),
(88, 48, '1973-10-04', '{\"type\": \"1\", \"path_css\": \"Suscipit minus quae.\", \"contenair\": \"NULL\"}'),
(89, 49, '1987-02-14', '{\"type\": \"6\", \"path_css\": \"Nobis possimus maxime enim.\", \"contenair\": \"Rerum doloribus vel.\"}'),
(90, 49, '1985-02-23', '{\"type\": \"1\", \"path_css\": \"Et quibusdam voluptatem.\", \"contenair\": \"Rerum doloribus vel.\"}'),
(91, 49, '1972-10-29', '{\"type\": \"3\", \"path_css\": \"Repellendus distinctio mollitia voluptates.\", \"contenair\": \"Rerum doloribus vel.\"}'),
(92, 50, '2005-05-04', '{\"type\": \"6\", \"path_css\": \"Soluta et sint.\", \"contenair\": \"Ipsa repellat aliquam consequuntur.\"}'),
(93, 50, '1990-03-04', '{\"type\": \"6\", \"path_css\": \"Esse ab et eum.\", \"contenair\": \"Ipsa repellat aliquam consequuntur.\"}'),
(94, 51, '1975-06-01', '{\"type\": \"4\", \"path_css\": \"Sequi error.\", \"contenair\": \"NULL\"}'),
(95, 52, '2016-06-04', '{\"type\": \"5\", \"path_css\": \"Illum quia quam magni.\", \"contenair\": \"NULL\"}'),
(96, 52, '2020-09-19', '{\"type\": \"5\", \"path_css\": \"Illum exercitationem facere.\", \"contenair\": \"NULL\"}'),
(97, 53, '1990-11-16', '{\"type\": \"1\", \"path_css\": \"Quia fugiat voluptatum aspernatur.\", \"contenair\": \"NULL\"}'),
(98, 53, '1994-02-04', '{\"type\": \"6\", \"path_css\": \"Consequuntur perspiciatis consequatur et.\", \"contenair\": \"NULL\"}'),
(99, 54, '1988-01-01', '{\"type\": \"4\", \"path_css\": \"Nesciunt dolore labore.\", \"contenair\": \"NULL\"}'),
(100, 54, '1985-10-22', '{\"type\": \"6\", \"path_css\": \"Ipsum itaque numquam.\", \"contenair\": \"NULL\"}'),
(101, 54, '2017-11-29', '{\"type\": \"5\", \"path_css\": \"Nulla doloremque dolores qui.\", \"contenair\": \"NULL\"}'),
(102, 55, '1973-05-13', '{\"type\": \"1\", \"path_css\": \"Quam amet rem voluptas.\", \"contenair\": \"At quas quisquam velit.\"}'),
(103, 55, '1997-11-21', '{\"type\": \"5\", \"path_css\": \"Ducimus corporis est et delectus.\", \"contenair\": \"At quas quisquam velit.\"}'),
(104, 55, '2009-12-24', '{\"type\": \"6\", \"path_css\": \"Vel unde harum cum delectus.\", \"contenair\": \"At quas quisquam velit.\"}'),
(105, 56, '2004-09-21', '{\"type\": \"3\", \"path_css\": \"Aut exercitationem.\", \"contenair\": \"Aut molestiae.\"}'),
(106, 57, '1975-10-01', '{\"type\": \"4\", \"path_css\": \"Dolorum quidem reiciendis cumque.\", \"contenair\": \"NULL\"}'),
(107, 58, '2000-02-09', '{\"type\": \"2\", \"path_css\": \"Possimus et sed.\", \"contenair\": \"Provident voluptatem qui.\"}'),
(108, 58, '1970-11-25', '{\"type\": \"5\", \"path_css\": \"Aut iure voluptas recusandae.\", \"contenair\": \"Provident voluptatem qui.\"}'),
(109, 58, '1976-10-03', '{\"type\": \"6\", \"path_css\": \"Delectus quo voluptas illum.\", \"contenair\": \"Provident voluptatem qui.\"}'),
(110, 59, '2004-09-02', '{\"type\": \"1\", \"path_css\": \"Praesentium amet quis.\", \"contenair\": \"NULL\"}'),
(111, 59, '1985-12-13', '{\"type\": \"2\", \"path_css\": \"Numquam sunt minus autem.\", \"contenair\": \"NULL\"}'),
(112, 60, '2013-02-05', '{\"type\": \"6\", \"path_css\": \"Dolor ut quis corporis.\", \"contenair\": \"Non atque aut tenetur unde.\"}');

-- --------------------------------------------------------

--
-- Structure de la table `ws_scraps`
--

DROP TABLE IF EXISTS `ws_scraps`;
CREATE TABLE IF NOT EXISTS `ws_scraps` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_title` varchar(255) NOT NULL,
  `s_site` text NOT NULL,
  `s_periodicity` varchar(255) NOT NULL,
  `s_date` date NOT NULL,
  `s_dataset` tinyint(1) NOT NULL DEFAULT '0',
  `s_user_id` int(11) NOT NULL,
  `s_category_id` int(11) NOT NULL,
  PRIMARY KEY (`s_id`),
  KEY `s_user` (`s_user_id`),
  KEY `s_category` (`s_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ws_scraps`
--

INSERT INTO `ws_scraps` (`s_id`, `s_title`, `s_site`, `s_periodicity`, `s_date`, `s_dataset`, `s_user_id`, `s_category_id`) VALUES
(1, 'Asperiores velit mollitia.', 'http://www.fadel.com/', 'weekly', '1997-03-25', 0, 1, 1),
(2, 'Esse magni.', 'http://www.mueller.com/', 'daily', '1971-09-03', 1, 1, 1),
(3, 'Voluptatum dolor.', 'http://rippin.com/qui-suscipit-qui-voluptatem-voluptatem-autem-voluptatem-vero', 'weekly', '2019-01-28', 0, 1, 6),
(4, 'Minima aut.', 'http://www.carroll.info/temporibus-porro-dolorem-sit-molestiae', 'monthly', '1976-11-01', 0, 1, 1),
(5, 'Qui adipisci.', 'http://www.kautzer.com/blanditiis-alias-ducimus-non-dolor-inventore', 'weekly', '1979-10-08', 1, 1, 6),
(6, 'Quia numquam et.', 'http://www.pacocha.net/quo-ullam-repudiandae-amet-in-similique-sapiente-nihil', 'daily', '1975-09-03', 1, 1, 2),
(7, 'Placeat voluptatibus ipsam.', 'http://www.wintheiser.com/nesciunt-nihil-autem-sed-quia-ipsa-voluptatem-quas.html', 'daily', '1988-10-26', 1, 1, 2),
(8, 'Sunt laudantium magnam.', 'http://www.walter.com/', 'daily', '2015-12-27', 1, 1, 2),
(9, 'Debitis enim.', 'http://www.champlin.info/ad-porro-voluptas-laborum', 'monthly', '1978-03-29', 1, 1, 5),
(10, 'Voluptas voluptatem.', 'http://www.murazik.com/id-illum-repudiandae-quisquam-consequatur', 'monthly', '1986-03-17', 0, 1, 1),
(11, 'Suscipit consequatur aut.', 'http://www.herzog.org/architecto-architecto-corporis-odit-aspernatur', 'monthly', '2002-04-30', 0, 2, 1),
(12, 'Consequatur qui nobis.', 'http://oberbrunner.info/nihil-non-eum-quaerat-consectetur-ipsum-et-cum.html', 'weekly', '1992-10-02', 0, 2, 5),
(13, 'Qui quia cupiditate.', 'https://www.gusikowski.info/possimus-magnam-dolore-ut-deleniti-aut-repudiandae-a', 'weekly', '1992-02-24', 0, 2, 6),
(14, 'Et perferendis ipsam.', 'http://senger.org/', 'daily', '2000-11-01', 0, 2, 2),
(15, 'Numquam quas.', 'https://hilpert.com/est-qui-quidem-fuga-sint-impedit.html', 'daily', '2012-08-25', 0, 2, 4),
(16, 'Qui soluta quaerat.', 'http://www.rolfson.com/error-sed-pariatur-qui-possimus-id-at-sunt', 'weekly', '2017-09-06', 1, 2, 2),
(17, 'Autem velit et.', 'http://hodkiewicz.com/', 'daily', '2019-01-09', 1, 2, 1),
(18, 'Autem totam.', 'http://bernier.com/', 'weekly', '2009-07-03', 0, 2, 2),
(19, 'Velit accusantium ipsa.', 'http://www.mccullough.com/necessitatibus-aut-aut-dignissimos-reprehenderit-dolore-quia', 'monthly', '2006-06-17', 1, 2, 3),
(20, 'Id nobis.', 'http://www.west.com/fuga-et-ea-quos-tempora-ex-inventore-occaecati-non', 'weekly', '1976-01-22', 0, 2, 5),
(21, 'Id dicta veniam.', 'http://www.leffler.com/', 'daily', '2005-09-11', 0, 3, 5),
(22, 'Deserunt et voluptate.', 'http://www.rosenbaum.com/iure-nobis-est-reiciendis-reprehenderit-explicabo-qui-consequatur.html', 'daily', '1997-04-26', 1, 3, 3),
(23, 'Autem tenetur.', 'http://www.paucek.com/neque-ratione-officiis-voluptatem', 'monthly', '2013-07-19', 1, 3, 1),
(24, 'Omnis veniam.', 'https://www.lehner.net/dolores-nostrum-quibusdam-adipisci-fugiat-sequi-quas', 'daily', '1985-10-20', 1, 3, 6),
(25, 'Neque voluptas quod.', 'http://prosacco.biz/', 'daily', '1992-03-13', 1, 3, 5),
(26, 'Cupiditate a.', 'https://white.net/voluptates-omnis-nam-nostrum-autem-modi.html', 'monthly', '2006-11-17', 1, 3, 6),
(27, 'Dolore delectus omnis.', 'http://www.abshire.info/itaque-totam-deserunt-modi-et-officia', 'weekly', '1978-01-12', 1, 3, 1),
(28, 'Ipsam repellendus aut.', 'http://www.roob.com/atque-quas-earum-rerum-molestiae-architecto', 'daily', '1981-03-03', 1, 3, 1),
(29, 'Qui architecto quos.', 'http://spencer.com/voluptas-non-rem-voluptatum-dolore', 'weekly', '1986-07-14', 1, 3, 4),
(30, 'Suscipit quaerat.', 'https://reichel.com/quis-qui-non-minima-voluptatem-magnam.html', 'weekly', '1985-04-15', 1, 3, 6),
(31, 'Quibusdam tenetur.', 'http://www.robel.info/', 'monthly', '2012-02-19', 1, 4, 1),
(32, 'Ut et commodi.', 'http://www.ortiz.net/', 'monthly', '1983-11-08', 0, 4, 4),
(33, 'Deleniti possimus aspernatur.', 'http://luettgen.com/', 'weekly', '2009-12-27', 1, 4, 2),
(34, 'Quae sed.', 'http://www.konopelski.biz/facere-et-magnam-animi-minus', 'daily', '1981-10-27', 1, 4, 3),
(35, 'Facilis aliquid.', 'http://kub.com/rerum-et-non-enim-iusto-distinctio-omnis.html', 'monthly', '1989-11-17', 1, 4, 3),
(36, 'Ipsa fugiat unde.', 'http://www.simonis.info/repudiandae-molestias-quo-sequi-iste-expedita-officia', 'weekly', '2009-03-07', 0, 4, 4),
(37, 'Molestiae nisi ullam.', 'http://www.jast.com/dolorem-omnis-eligendi-dolore-saepe-quis-labore-aut.html', 'monthly', '1989-05-20', 0, 4, 4),
(38, 'Amet libero non.', 'http://cruickshank.com/a-aperiam-illum-ab-dolore-suscipit-repellendus.html', 'weekly', '1977-08-09', 0, 4, 6),
(39, 'Consectetur vel.', 'http://senger.info/voluptas-dolorem-voluptatem-ut-in-recusandae-aut-explicabo.html', 'daily', '2004-12-18', 1, 4, 4),
(40, 'Eum asperiores.', 'http://jast.org/molestiae-in-quia-delectus-atque-quisquam-aliquid', 'monthly', '2006-01-26', 1, 4, 2),
(41, 'Qui minima et.', 'http://schaefer.com/provident-molestiae-rerum-id-fugit-animi-harum', 'monthly', '2003-12-10', 1, 5, 1),
(42, 'Voluptates sed facere.', 'https://www.hand.com/nulla-ducimus-velit-voluptates-nihil-consequatur', 'daily', '1974-06-27', 0, 5, 6),
(43, 'Exercitationem aut.', 'http://upton.com/labore-et-et-nobis-asperiores-sed-vel-explicabo.html', 'daily', '2015-12-25', 1, 5, 2),
(44, 'Ipsum consequatur.', 'http://www.oconner.com/aut-et-nostrum-voluptatem', 'weekly', '2009-10-28', 0, 5, 1),
(45, 'Aliquid deserunt necessitatibus.', 'http://www.ledner.com/', 'monthly', '1972-08-15', 1, 5, 5),
(46, 'Laboriosam et illo.', 'http://www.kris.com/tenetur-eveniet-perspiciatis-possimus-eos.html', 'monthly', '1978-07-29', 0, 5, 2),
(47, 'Omnis provident ea.', 'https://kuhic.info/voluptate-atque-ullam-ducimus-enim-cum-aspernatur.html', 'monthly', '2017-07-30', 0, 5, 1),
(48, 'Minus facere sint.', 'http://lynch.info/consequuntur-et-voluptas-molestiae-voluptas-vel-accusantium-sint.html', 'monthly', '2009-05-12', 0, 5, 6),
(49, 'Saepe ut.', 'https://www.erdman.com/sed-sunt-non-non-ut-consectetur', 'daily', '2015-02-14', 1, 5, 5),
(50, 'Expedita incidunt repudiandae.', 'http://gulgowski.info/ad-non-sequi-qui-et-soluta-aut-a.html', 'weekly', '1995-03-29', 1, 5, 4),
(51, 'Accusantium hic.', 'http://tillman.info/', 'daily', '1994-11-11', 0, 6, 2),
(52, 'Corporis blanditiis dignissimos.', 'https://hills.org/minima-placeat-et-ut-inventore-placeat-consequatur.html', 'daily', '1975-12-28', 0, 6, 2),
(53, 'Culpa repellat animi.', 'http://emmerich.com/', 'weekly', '2004-04-06', 0, 6, 2),
(54, 'Est voluptas.', 'http://www.gutkowski.info/provident-voluptatem-explicabo-est-et-excepturi-iure', 'daily', '1972-01-09', 0, 6, 5),
(55, 'Id est.', 'https://www.morissette.com/est-voluptas-et-explicabo-ex-fugiat', 'weekly', '2009-04-06', 1, 6, 1),
(56, 'Qui provident nemo.', 'http://dach.com/deserunt-accusamus-quidem-aut-et-cupiditate-voluptatem-eligendi-officia.html', 'weekly', '1994-12-18', 1, 6, 6),
(57, 'Sint reiciendis deserunt.', 'http://bernhard.biz/quia-cupiditate-quia-voluptatem', 'daily', '1998-09-11', 0, 6, 2),
(58, 'Assumenda ullam.', 'http://eichmann.com/ut-odio-sed-id-fugiat-quia-distinctio.html', 'weekly', '1993-03-02', 1, 6, 1),
(59, 'Quo voluptas.', 'http://orn.com/', 'daily', '1976-07-22', 0, 6, 6),
(60, 'Ipsam tempora minus.', 'http://cartwright.com/cum-molestiae-molestiae-doloremque-aliquid-ut-non-sit', 'monthly', '1988-06-18', 1, 6, 4);

-- --------------------------------------------------------

--
-- Structure de la table `ws_users`
--

DROP TABLE IF EXISTS `ws_users`;
CREATE TABLE IF NOT EXISTS `ws_users` (
  `u_id` int(255) NOT NULL AUTO_INCREMENT,
  `u_first_name` varchar(255) NOT NULL,
  `u_last_name` varchar(255) NOT NULL,
  `u_phone` varchar(255) NOT NULL,
  `u_email` varchar(255) NOT NULL,
  `u_password` varchar(255) NOT NULL,
  `u_validate` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ws_users`
--

INSERT INTO `ws_users` (`u_id`, `u_first_name`, `u_last_name`, `u_phone`, `u_email`, `u_password`, `u_validate`) VALUES
(1, 'Colin', 'Friesen', '+6177961247151', 'hdoyle@yahoo.com', '$2y$10$VJuu/89Tm7smmkBT1lvOOeR1R8FTaVZ3uSDENeBZshQ..rEJgcO1S', 0),
(2, 'Amalia', 'Aufderhar', '+9924095845669', 'ogaylord@yost.com', '$2y$10$VJuu/89Tm7smmkBT1lvOOeR1R8FTaVZ3uSDENeBZshQ..rEJgcO1S', 1),
(3, 'Bobby', 'Rolfson', '+2814305813008', 'brakus.maegan@yahoo.com', '$2y$10$VJuu/89Tm7smmkBT1lvOOeR1R8FTaVZ3uSDENeBZshQ..rEJgcO1S', 1),
(4, 'Gregory', 'Okuneva', '+9941214895049', 'gaston28@yahoo.com', '$2y$10$VJuu/89Tm7smmkBT1lvOOeR1R8FTaVZ3uSDENeBZshQ..rEJgcO1S', 1),
(5, 'Pete', 'Hyatt', '+1037438428585', 'vita.hessel@yahoo.com', '$2y$10$VJuu/89Tm7smmkBT1lvOOeR1R8FTaVZ3uSDENeBZshQ..rEJgcO1S', 1),
(6, 'Joel', 'Mraz', '+3150036030051', 'pkuhn@hotmail.com', '$2y$10$VJuu/89Tm7smmkBT1lvOOeR1R8FTaVZ3uSDENeBZshQ..rEJgcO1S', 1),
(7, 'tet', 'jera', '0610074930', 'admin@admin.fr', '$2y$10$ULy3RPY1q6qPApa95RUYJe.xgl4N0aglbl2W5P/xZfJEsFYCeq18K', 0),
(10, 'jean', 'jean', '0610074930', 'test@test.fr', '$2y$10$/vw8uTkHWykXjyNRbjH/7uSEVAdOnuFke9b/l2sET1DBQeiAlVD2C', 0),
(11, 'tet', 'de', '0610074930', 'test@test.fr', '$2y$10$NZGb7.dbGck7MgvkSvgiXebOSOPJF.BDLUvRVolpq3bFdhrlc2lkK', 0),
(12, 'jean', 'jean', '0610074930', 'admin@admin.fr', '$2y$10$TwGSV0xy/Jpr3i7glCfppuMK6FCkmn9CXmNKOTJCKWnhCPHtYzqdK', 0),
(13, 'jean', 'jean', '0610074930', 'admin@admin.fr', '$2y$10$lgEvGc1S8/5uECroQ/v0gOvA69g/4BpVlKfWrM1a5QY3rr9y4yZau', 0),
(14, 'jean', 'jean', '0610074930', 'admin@admin.fr', '$2y$10$JD0zdYaXZRYAtRax2BGhceIHxS2fVYr8wM1rprOXODmoWwuulKliC', 0),
(15, 'jean', 'jean', '0610074930', 'admin@admin.fr', '$2y$10$tJMkl3p6zAZIxDEVVHJZl./JCnwR8o0mkTcDee/te.PKIpqL4DX/O', 0),
(16, 'jean', 'jean', '0610074930', 'admin@admin.fr', '$2y$10$wvfC5aIMDs9moRAXjgnpiOs2frhcg4XqmIjW.Od.WddYyJZL.Hns6', 0),
(17, 'fr', 'fr', '0610074930', 'admin@admin.fr', '$2y$10$of2nodmiwbZZB609sWyhV.eYfPZymvMLCILT5JOBRyAf.XQedeicy', 0),
(18, 'fr', 'fr', '0610074930', 'admin@admin.fr', '$2y$10$BaqANnNWxCv.Z.3gVAMAe.utksu0/4C3q279XU9t7WFPdX8lcte0.', 0),
(19, 'fr', 'fr', '0610074930', 'admin@admin.fr', '$2y$10$MGzdCHvx8tsKTo1eHB0kbuDGFbxQoAo5gqAIIwRfF5jOtw96jfkHO', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ws_datas`
--
ALTER TABLE `ws_datas`
  ADD CONSTRAINT `ws_datas_ibfk_1` FOREIGN KEY (`d_type_id`) REFERENCES `ws_datas_type` (`dt_id`),
  ADD CONSTRAINT `ws_datas_ibfk_2` FOREIGN KEY (`d_scrap_id`) REFERENCES `ws_scraps` (`s_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `ws_history`
--
ALTER TABLE `ws_history`
  ADD CONSTRAINT `ws_history_ibfk_1` FOREIGN KEY (`h_scrap_id`) REFERENCES `ws_scraps` (`s_id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `ws_scraps`
--
ALTER TABLE `ws_scraps`
  ADD CONSTRAINT `ws_scraps_ibfk_1` FOREIGN KEY (`s_user_id`) REFERENCES `ws_users` (`u_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ws_scraps_ibfk_2` FOREIGN KEY (`s_category_id`) REFERENCES `ws_categories` (`c_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
