-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Lun 28 Janvier 2019 à 08:52
-- Version du serveur :  10.1.37-MariaDB-0+deb9u1
-- Version de PHP :  7.2.14-1+0~20190113100742.14+stretch~1.gbpd83c69

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `tp_controle`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `author` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id`, `title`, `content`, `author`, `image`) 
VALUES
(9, 'Le tueur qui tue', 'building', 6, ''),
(8, 'Le monde de la science  !', 'New technologie', 5, ''),
(11, 'le big Data', 'le monde des données', 7, ''),
(12, 'extraterrestre life', 'Dinosaure', 8, ''),
(15, 'les westerns', 'Texas', 10, ''),
(14, 'life is good', 'Las vegas', 8, ''),


-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL,
  `username` int(11) NOT NULL,
  `content` text NOT NULL,
  `article_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `username`, `content`, `article_id`) VALUES
(1, 1, 'Excellent Article', 1),
(2, 1, 'Pas mal', 1),
(3, 5, 'bofff', 1),
(4, 5, 'je recommande', 1),
(5, 5, 'sisiii', 2),
(6, 5, 'J\'avoue ! ', 3),

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(6, 'Ibrahim', '$2y$10$ddb9iTUaxSk/fY8mWAPp3enUb5ALm6EwNBbTDTo0aq2Lv5ZOCCu2y'),
(4, 'Albert', '$2y$10$rooKGV6cuVvtVM5uDkpZn.pzaLslnkIVD9nG.oVotyriu5ceAW5tG'),
(5, 'Bob', '$2y$10$MtwHxhWa7lbdJj.SbetI8O/nLE3h2J2Fz0tluC/Lq54BitIuKRi5u'),
(7, 'Laurent', '$2y$10$.AsK3KasmBTGycNy2HaLH.mQJf/1lBGeQEt6W.pYJXWYQvFa./5Ki'),
(8, 'Gael', '$2y$10$9xrBPJ8VuKTrYbpG4JUGH.7phAuSClONf.nFWU9DdAOAFB5A2FlMa'),
(10, 'Hyntienotperfect', 'ToKr5jSZnX2poBqSx6VO/pYTbCanxAO$2y$10$nGvwzUxCJFweZ2kOQhjgZu'),

--
-- Index pour les tables exportées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_author` (`author`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_username` (`username`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
