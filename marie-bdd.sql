CREATE TABLE `admin` 
(
	`id_admin` int,
	`login` varchar(255),
	`password` varchar(255),
	primary key(id_admin)
);

CREATE TABLE `conseiller` 
(
	`id_conseiller` int,
	`login` varchar(255),
	`password` varchar(255),
	primary key(id_conseiller)
);

CREATE TABLE `a_conseiller_client` 
(
	`id_conseiller` int,
	`id_client` int,
	`date_debut` date,
	`date_fin` date,
	primary key(id_conseiller, id_client)
);

CREATE TABLE `agence` 
(
	`id_agence` int,
	`adresse` varchar(255),
	`description` varchar(255),
	primary key(id_agence)
);

CREATE TABLE `client` 
(
	`id_client` int,
	`login` varchar(255),
	`password` varchar(255),
	`type` enum(''),
	`nom` varchar(255),
	`prenom` varchar(255),
	`date_naissance` date,
	`email` varchar(255),
	`telephone` varchar(255),
	`adresse` varchar(255),
	`id_agence` int,
	`rib` varchar(255),
	primary key(id_agence)
);

CREATE TABLE `operation` 
(
	`operation_id` int,
	`compte_debit` int,
	`compte_credit` int,
	`type` enum(''),
	`date_execution` date,
	`montant` decimal,
	primary key(operation_id)
);

CREATE TABLE `demande` 
(
	`id_demande` int,
	`id_client` int,
	`date` date,
	`message` varchar(255),
	primary key(id_demande)
);

CREATE TABLE `compte` 
(
	`id_compte` int,
	`type` enum(''),
	`numero` varchar(255),
	`id_client` int,
	`solde` decimal,
	`taux` decimal,
	`decouvert` boolean,
	primary key(id_compte)
);

CREATE TABLE `benificiaire` 
(
	`id_benificiaire` int,
	`id_client` int,
	`libelle` varchar(255),
	primary key(id_benificiaire)
);

CREATE TABLE `carte_bancaire` 
(
	`id_carte` int,
	`id_compte` int,
	`date_debut` date,
	`date_fin` date,
	`active` boolean,
	`code` varchar(255),
	`Cryptocrypto` varchar(255),
	`nom_usage` varchar(255),
	primary key(id_carte)
);

CREATE TABLE `chequier` 
(
	`id_chequier` int,
	`id_compte` int,
	`date_debut` date,
	`date_fin` date,
	primary key(id_chequier)
);

ALTER TABLE `a_conseiller_client` ADD FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

ALTER TABLE `a_conseiller_client` ADD FOREIGN KEY (`id_conseiller`) REFERENCES `conseiller` (`id_conseiller`);

ALTER TABLE `demande` ADD FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

ALTER TABLE `compte` ADD FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

ALTER TABLE `benificiaire` ADD FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

ALTER TABLE `client` ADD FOREIGN KEY (`id_agence`) REFERENCES `agence` (`id_agence`);

ALTER TABLE `operation` ADD FOREIGN KEY (`compte_debit`) REFERENCES `compte` (`id_compte`);

ALTER TABLE `operation` ADD FOREIGN KEY (`compte_credit`) REFERENCES `compte` (`id_compte`);

ALTER TABLE `chequier` ADD FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id_compte`);

ALTER TABLE `carte_bancaire` ADD FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id_compte`);
