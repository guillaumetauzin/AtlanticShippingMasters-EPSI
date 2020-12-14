-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 14 déc. 2020 à 14:22
-- Version du serveur :  8.0.22
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projetcas`
--

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `conversionlatlong`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `conversionlatlong` (
`id` int
,`nom` varchar(50)
,`latitude` double
,`longitude` double
);

-- --------------------------------------------------------

--
-- Structure de la table `distance`
--

CREATE TABLE `distance` (
  `id_portDepart` int NOT NULL,
  `id_portArrivee` int NOT NULL,
  `distance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `distance`
--

INSERT INTO `distance` (`id_portDepart`, `id_portArrivee`, `distance`) VALUES
(1, 2, 123),
(1, 3, 20),
(1, 4, 30),
(1, 5, 40),
(2, 3, 50),
(2, 4, 60),
(2, 5, 70),
(3, 4, 80),
(3, 5, 90),
(4, 5, 100);

-- --------------------------------------------------------

--
-- Structure de la table `port`
--

CREATE TABLE `port` (
  `id` int NOT NULL,
  `nom` varchar(50) NOT NULL,
  `coordonneeNord` varchar(15) NOT NULL,
  `coordonneOuest` varchar(15) NOT NULL,
  `diminutif` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `port`
--

INSERT INTO `port` (`id`, `nom`, `coordonneeNord`, `coordonneOuest`, `diminutif`) VALUES
(1, 'Cork', '51°53\'24.0\"N', '8°29\'52.8\"W', 'A'),
(2, 'Plymouth', '50°22\'11.3\"N', '4°08\'52.6\"W', 'B'),
(3, 'Brest', '48°23\'03.0\"N', '4°29\'11.9\"W', 'C'),
(4, 'La Rochelle', '46°09\'26.7\"N', '1°09\'19.2\"W', 'D'),
(5, 'St John\'s', '47°33\'28.1\"N', '52°41\'48.2\"W', 'E'),
(6, 'New York', '40°41\'47.2\"N', '73°59\'33.4\"W', 'F'),
(7, 'Miami', '25°45\'33.4\"N', '80°11\'25.8\"W', 'G'),
(8, 'La Havane', '23°10\'09.1\"N', '82°10\'08.7\"W', 'H'),
(9, 'Dakar', '14°45\'33.9\"N', '17°08\'02.7\"W', 'I'),
(10, 'Cap-Vert', '14°55\'13.0\"N', '23°29\'22.9\"W', 'J'),
(11, 'Açores', '37°48\'22.4\"N', '25°30\'06.5\"W', 'K'),
(12, 'Porto Rico', '18°26\'10.8\"N', '66°08\'34.3\"W', 'L'),
(13, 'Port-au-Prince', '18°37\'41.5\"N', '72°18\'58.3\"W', 'M');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vuepourguillaumeDA`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `vuepourguillaumeDA` (
`id_portDepart` int
,`id_portArrivee` int
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vuepourlouis`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `vuepourlouis` (
`diminutif` varchar(2)
,`distance` float
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vuepourmatthieu`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `vuepourmatthieu` (
`nom` varchar(50)
,`coordonneeNord` varchar(15)
,`coordonneOuest` varchar(15)
);

-- --------------------------------------------------------

--
-- Structure de la vue `conversionlatlong`
--
DROP TABLE IF EXISTS `conversionlatlong`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `conversionlatlong`  AS SELECT `tmp`.`id` AS `id`, `tmp`.`nom` AS `nom`, ((`tmp`.`degreeN` + ((1 / 60) * `tmp`.`minuteN`)) + ((1 / 3600) * `tmp`.`secondeN`)) AS `latitude`, (-(1) * ((`tmp`.`degreeO` + ((1 / 60) * `tmp`.`minuteO`)) + ((1 / 3600) * `tmp`.`secondeO`))) AS `longitude` FROM (select `port`.`id` AS `id`,`port`.`nom` AS `nom`,cast(left(`port`.`coordonneeNord`,(locate('°',`port`.`coordonneeNord`) - 1)) as signed) AS `degreeN`,cast(substr(`port`.`coordonneeNord`,(locate('°',`port`.`coordonneeNord`) + 1),2) as signed) AS `minuteN`,cast(substr(`port`.`coordonneeNord`,(locate('\'',`port`.`coordonneeNord`) + 1),4) as float) AS `secondeN`,cast(left(`port`.`coordonneOuest`,(locate('°',`port`.`coordonneOuest`) - 1)) as signed) AS `degreeO`,cast(substr(`port`.`coordonneOuest`,(locate('°',`port`.`coordonneOuest`) + 1),2) as signed) AS `minuteO`,cast(substr(`port`.`coordonneOuest`,(locate('\'',`port`.`coordonneOuest`) + 1),4) as float) AS `secondeO` from `port`) AS `tmp` ;

-- --------------------------------------------------------

--
-- Structure de la vue `vuepourguillaumeDA`
--
DROP TABLE IF EXISTS `vuepourguillaumeDA`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vuepourguillaumeDA`  AS SELECT `distance`.`id_portDepart` AS `id_portDepart`, `distance`.`id_portArrivee` AS `id_portArrivee` FROM `distance` ;

-- --------------------------------------------------------

--
-- Structure de la vue `vuepourlouis`
--
DROP TABLE IF EXISTS `vuepourlouis`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vuepourlouis`  AS SELECT concat(`portdepart`.`diminutif`,`portarrivee`.`diminutif`) AS `diminutif`, `distance`.`distance` AS `distance` FROM ((`distance` join `port` `portdepart` on((`portdepart`.`id` = `distance`.`id_portDepart`))) join `port` `portarrivee` on((`portarrivee`.`id` = `distance`.`id_portArrivee`))) ;

-- --------------------------------------------------------

--
-- Structure de la vue `vuepourmatthieu`
--
DROP TABLE IF EXISTS `vuepourmatthieu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vuepourmatthieu`  AS SELECT `port`.`nom` AS `nom`, `port`.`coordonneeNord` AS `coordonneeNord`, `port`.`coordonneOuest` AS `coordonneOuest` FROM `port` ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `distance`
--
ALTER TABLE `distance`
  ADD PRIMARY KEY (`id_portDepart`,`id_portArrivee`),
  ADD KEY `FK_distance_port` (`id_portDepart`),
  ADD KEY `INDEX_Inverse` (`id_portArrivee`,`id_portDepart`);

--
-- Index pour la table `port`
--
ALTER TABLE `port`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `port`
--
ALTER TABLE `port`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `distance`
--
ALTER TABLE `distance`
  ADD CONSTRAINT `FK_distance_port` FOREIGN KEY (`id_portDepart`) REFERENCES `port` (`id`),
  ADD CONSTRAINT `FK_distance_port0` FOREIGN KEY (`id_portArrivee`) REFERENCES `port` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
