-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 08 août 2024 à 13:07
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `eolia5.4`
--

-- --------------------------------------------------------

--
-- Structure de la table `activity_user`
--

DROP TABLE IF EXISTS `activity_user`;
CREATE TABLE IF NOT EXISTS `activity_user` (
  `activity_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`activity_id`,`user_id`),
  KEY `IDX_8E570DDB81C06096` (`activity_id`),
  KEY `IDX_8E570DDBA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
CREATE TABLE IF NOT EXISTS `calendar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `calendarType` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `stock` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `modified_price` int DEFAULT NULL,
  `annulation` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6EA9A14612469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `calendar`
--


-- --------------------------------------------------------

--
-- Structure de la table `calendar_staff`
--

DROP TABLE IF EXISTS `calendar_staff`;
CREATE TABLE IF NOT EXISTS `calendar_staff` (
  `calendar_id` int NOT NULL,
  `staff_id` int NOT NULL,
  PRIMARY KEY (`calendar_id`,`staff_id`),
  KEY `IDX_2E3AF0FCA40A2C8` (`calendar_id`),
  KEY `IDX_2E3AF0FCD4D57CD` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `calendar_staff`
--


-- --------------------------------------------------------

--
-- Structure de la table `calendar_tide`
--

DROP TABLE IF EXISTS `calendar_tide`;
CREATE TABLE IF NOT EXISTS `calendar_tide` (
  `calendar_id` int NOT NULL,
  `tide_id` int NOT NULL,
  PRIMARY KEY (`calendar_id`,`tide_id`),
  KEY `IDX_ECC0A058A40A2C8` (`calendar_id`),
  KEY `IDX_ECC0A05853FABF4A` (`tide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title_category` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `activity` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `category`
--



-- --------------------------------------------------------

--
-- Structure de la table `category_setting`
--

DROP TABLE IF EXISTS `category_setting`;
CREATE TABLE IF NOT EXISTS `category_setting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `price` int DEFAULT NULL,
  `title_category_setting` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `text_color` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `back_ground_color` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `border_color` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_58ACF8E612469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `category_setting`
--


-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_of_payments_id` int DEFAULT NULL,
  `value` int DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6D28840D6D890E1C` (`type_of_payments_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payment_purchase_item`
--

DROP TABLE IF EXISTS `payment_purchase_item`;
CREATE TABLE IF NOT EXISTS `payment_purchase_item` (
  `payment_id` int NOT NULL,
  `purchase_item_id` int NOT NULL,
  PRIMARY KEY (`payment_id`,`purchase_item_id`),
  KEY `IDX_92ACE4B04C3A3BB` (`payment_id`),
  KEY `IDX_92ACE4B09B59827` (`purchase_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE IF NOT EXISTS `purchase` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `total` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6117D13BA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `purchase`
--


-- --------------------------------------------------------

--
-- Structure de la table `purchase_item`
--

DROP TABLE IF EXISTS `purchase_item`;
CREATE TABLE IF NOT EXISTS `purchase_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_id` int DEFAULT NULL,
  `calendar_id` int DEFAULT NULL,
  `purchase_id` int NOT NULL,
  `activity_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `activity_price` int NOT NULL,
  `activity_category_title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `activity_start` datetime NOT NULL,
  `activity_end` datetime NOT NULL,
  `quantity` int NOT NULL,
  `total` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6FA8ED7D81C06096` (`activity_id`),
  KEY `IDX_6FA8ED7DA40A2C8` (`calendar_id`),
  KEY `IDX_6FA8ED7D558FBEB9` (`purchase_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `purchase_item`
--

-- --------------------------------------------------------

--
-- Structure de la table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `staff`
--

-- --------------------------------------------------------

--
-- Structure de la table `staff_calendar`
--

DROP TABLE IF EXISTS `staff_calendar`;
CREATE TABLE IF NOT EXISTS `staff_calendar` (
  `staff_id` int NOT NULL,
  `calendar_id` int NOT NULL,
  PRIMARY KEY (`staff_id`,`calendar_id`),
  KEY `IDX_4CF701E8D4D57CD` (`staff_id`),
  KEY `IDX_4CF701E8A40A2C8` (`calendar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `staff_calendar`
--



-- --------------------------------------------------------

--
-- Structure de la table `staff_schedule_settings`
--

DROP TABLE IF EXISTS `staff_schedule_settings`;
CREATE TABLE IF NOT EXISTS `staff_schedule_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `staff_schedule_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `text_color` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `border_color` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `back_ground_color` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E60BC1D655397287` (`staff_schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tide`
--

DROP TABLE IF EXISTS `tide`;
CREATE TABLE IF NOT EXISTS `tide` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `heure_basse` time NOT NULL,
  `heure_haute` time NOT NULL,
  `coeff` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_of_payment`
--

DROP TABLE IF EXISTS `type_of_payment`;
CREATE TABLE IF NOT EXISTS `type_of_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `type_of_payment`
--


-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(60) COLLATE utf8mb3_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `full_name` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `reset_token` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `user`
--


--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `activity_user`
--
ALTER TABLE `activity_user`
  ADD CONSTRAINT `FK_8E570DDB81C06096` FOREIGN KEY (`activity_id`) REFERENCES `calendar` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8E570DDBA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `calendar`
--
ALTER TABLE `calendar`
  ADD CONSTRAINT `FK_6EA9A14612469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `calendar_staff`
--
ALTER TABLE `calendar_staff`
  ADD CONSTRAINT `FK_2E3AF0FCA40A2C8` FOREIGN KEY (`calendar_id`) REFERENCES `calendar` (`id`),
  ADD CONSTRAINT `FK_2E3AF0FCD4D57CD` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `calendar_tide`
--
ALTER TABLE `calendar_tide`
  ADD CONSTRAINT `FK_ECC0A05853FABF4A` FOREIGN KEY (`tide_id`) REFERENCES `tide` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_ECC0A058A40A2C8` FOREIGN KEY (`calendar_id`) REFERENCES `calendar` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `category_setting`
--
ALTER TABLE `category_setting`
  ADD CONSTRAINT `FK_58ACF8E612469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_6D28840D6D890E1C` FOREIGN KEY (`type_of_payments_id`) REFERENCES `type_of_payment` (`id`);

--
-- Contraintes pour la table `payment_purchase_item`
--
ALTER TABLE `payment_purchase_item`
  ADD CONSTRAINT `FK_92ACE4B04C3A3BB` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_92ACE4B09B59827` FOREIGN KEY (`purchase_item_id`) REFERENCES `purchase_item` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `FK_6117D13BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD CONSTRAINT `FK_6FA8ED7D558FBEB9` FOREIGN KEY (`purchase_id`) REFERENCES `purchase` (`id`),
  ADD CONSTRAINT `FK_6FA8ED7D81C06096` FOREIGN KEY (`activity_id`) REFERENCES `calendar` (`id`),
  ADD CONSTRAINT `FK_6FA8ED7DA40A2C8` FOREIGN KEY (`calendar_id`) REFERENCES `calendar` (`id`);

--
-- Contraintes pour la table `staff_calendar`
--
ALTER TABLE `staff_calendar`
  ADD CONSTRAINT `FK_4CF701E8A40A2C8` FOREIGN KEY (`calendar_id`) REFERENCES `calendar` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_4CF701E8D4D57CD` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `staff_schedule_settings`
--
ALTER TABLE `staff_schedule_settings`
  ADD CONSTRAINT `FK_E60BC1D655397287` FOREIGN KEY (`staff_schedule_id`) REFERENCES `calendar` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
