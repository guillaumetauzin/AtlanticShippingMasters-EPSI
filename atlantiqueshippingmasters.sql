-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 24 nov. 2020 à 11:51
-- Version du serveur :  10.4.8-MariaDB
-- Version de PHP :  7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `atlantiqueshippingmasters`
--

-- --------------------------------------------------------

--
-- Structure de la table `distance`
--

CREATE TABLE `distance` (
  `id` int(11) NOT NULL,
  `nom` varchar(4) NOT NULL,
  `distance` decimal(8,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `port`
--

CREATE TABLE `port` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `coordonnéeX` varchar(50) DEFAULT NULL,
  `coordonnéeY` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `port`
--

INSERT INTO `port` (`id`, `nom`, `coordonnéeX`, `coordonnéeY`) VALUES
(1, 'Cork', '51°53\'24.0\"N', '8°29\'52.8\"W'),
(2, 'Plymouth', '50°22\'11.3\"N', '4°08\'52.6\"W'),
(3, 'Brest', '48°23\'03.0\"N', '4°29\'11.9\"W'),
(4, 'La Rochelle', '46°09\'26.7\"N', '1°09\'19.2\"W'),
(5, 'St John\'s', '47°33\'28.1\"N', '52°41\'48.2\"W'),
(6, 'New York', '40°41\'47.2\"N', '73°59\'33.4\"W'),
(7, 'Miami', '25°45\'33.4\"N', '80°11\'25.8\"W'),
(8, 'La Havane', '23°10\'09.1\"N', '82°10\'08.7\"W'),
(9, 'Dakar ', '14°45\'33.9\"N', '17°08\'02.7\"W'),
(10, 'Cap-Vert', '14°55\'13.0\"N', '23°29\'22.9\"W'),
(11, 'Açores', '37°48\'22.4\"N', '25°30\'06.5\"W'),
(12, 'Porto Rico ', '18°26\'10.8\"N', '66°08\'34.3\"W'),
(13, 'Port-au-Prince', '18°37\'41.5\"N', '72°18\'58.3\"W');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `distance`
--
ALTER TABLE `distance`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `port`
--
ALTER TABLE `port`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `distance`
--
ALTER TABLE `distance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `port`
--
ALTER TABLE `port`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
