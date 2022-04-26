/* Création de la base de donnes theater */
CREATE DATABASE IF NOT EXISTS theater CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

/**********************************************************************************************/

/* Création de toutes les tables avec les contraintes */
CREATE TABLE IF NOT EXISTS Users (
    id_user CHAR(36) PRIMARY KEY NOT NULL,
    email VARCHAR(254) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    firstname VARCHAR(50) NOT NULL
) engine=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Roles (
    id_role INT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    content VARCHAR(50) NOT NULL
) engine=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS UsersRoles (
    id_user CHAR(36) NOT NULL,
    id_role INT(3) NOT NULL,
    PRIMARY KEY(id_user, id_role),
    FOREIGN KEY(id_user) REFERENCES Users(id_user),
    FOREIGN KEY(id_role) REFERENCES Roles(id_role)
) engine=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS PricesList (
    id_pricelist INT(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    content VARCHAR(50) NOT NULL,
    price DECIMAL(5,2) NOT NULL
) engine=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Theaters (
    id_theater CHAR(36) PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    address TEXT
) engine=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS UsersTheaters (
    id_user CHAR(36) NOT NULL,
    id_theater CHAR(36) NOT NULL,
    PRIMARY KEY(id_user, id_theater),
    FOREIGN KEY(id_user) REFERENCES Users(id_user),
    FOREIGN KEY(id_theater) REFERENCES Theaters(id_theater)
) engine=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Rooms (
    id_room CHAR(36) PRIMARY KEY NOT NULL,
    room_nb INTEGER(3) NOT NULL,
    seats_nb INTEGER(3),
    id_theater CHAR(36) NOT NULL,
    FOREIGN KEY(id_theater) REFERENCES Theaters(id_theater)
) engine=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Movies (
    id_movie CHAR(36) PRIMARY KEY NOT NULL,
    title VARCHAR(50) NOT NULL,
    synopsis TEXT,
    duration TIME,
    actors TEXT,
    release_date DATETIME,
    genre VARCHAR(50)
) engine=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Shows (
    id_show CHAR(36) PRIMARY KEY NOT NULL,
    date DATETIME NOT NULL,
    id_movie CHAR(36) NOT NULL,
    FOREIGN KEY(id_movie) REFERENCES Movies(id_movie)
) engine=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS ShowsRooms (
    id_show CHAR(36) NOT NULL,
    id_room CHAR(36) NOT NULL,
    PRIMARY KEY(id_show, id_room),
    FOREIGN KEY(id_show) REFERENCES Shows(id_show),
    FOREIGN KEY(id_room) REFERENCES Rooms(id_room)
) engine=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Payments (
    id_payment CHAR(36) PRIMARY KEY NOT NULL,
    purchase_date VARCHAR(50) NOT NULL,
    id_user CHAR(36) NOT NULL,
    id_show CHAR(36) NOT NULL,
    FOREIGN KEY(id_user) REFERENCES Users(id_user),
    FOREIGN KEY(id_show) REFERENCES Shows(id_show)
) engine=INNODB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS Tickets (
    id_ticket CHAR(36) PRIMARY KEY NOT NULL,
    quantity INTEGER(3) NOT NULL,
    id_payment CHAR(36) NOT NULL,
    id_pricelist INT(3) NOT NULL,
    id_theater CHAR(36) NOT NULL,
    FOREIGN KEY(id_payment) REFERENCES Payments(id_payment),
    FOREIGN KEY(id_pricelist) REFERENCES PricesList(id_pricelist),
    FOREIGN KEY(id_theater) REFERENCES Theaters(id_theater)
) engine=INNODB DEFAULT CHARSET=utf8mb4;

/**********************************************************************************************/

/* Insertion de valeurs exemples dans l'ensemble des tables */
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('46f84e6e-441a-4104-aca4-9b3e6cb38c61', 'ehutchinson0@seesaa.net', '$2y$10$kcHm7BTOrQ6aNgNTzVFGc.LSxqZnurQ.GRBw6Aau6TNVHBhMhJkM2', 'Hutchinson', 'Ebonee');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('a011bf90-b77c-4c9f-87dd-27597b9cccf9', 'dmalacrida1@zdnet.com', '$2y$10$InTOEOUBHDtLcTBffcPhNujh9iPt1thSGCb.x69ccFCh1epq/Rh5S', 'Malacrida', 'Delila');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('a2ac8360-aecf-4e6a-a67b-7196ac9e1bcc', 'jcornew2@blogs.com', '$2y$10$qDxwxDNpqlasUpbh9rrPhOEiP3oXsaZqsCgoniLPhKQKjOn.AM4cC', 'Cornew', 'Joellyn');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('383776cd-9bf8-40b2-82c8-9671667b6d85', 'rcummungs3@ed.gov', '$2y$10$2etsXz6vmHJ3zQ9ZEzmBve0EvTJs1JDbT37BcGum5rcmAROsvEX5.', 'Cummungs', 'Ralf');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('65ce3628-48c4-41c1-8fad-2cdd622c143d', 'cdockreay4@ftc.gov', '$2y$10$hukK5KIv3aMuq8w6DT3f7OnuHyVrc/udXbk0KWVStSK2f39WzMKRK', 'Dockreay', 'Camilla');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('e9f52147-0b7c-43f8-bea1-d856b7e24dac', 'opetican5@nasa.gov', '$2y$10$o.LReXVnP1nQh/aokY1UNOR1oLLYUB3Y5Pbd/.QylJDAlLcvw6USi', 'Petican', 'Osgood');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('0a5facfd-87c7-4138-933b-7be3eb6648a0', 'clabbett6@nsw.gov.au', '$2y$10$kUI8micAE409mJkJYzmp5uTwr/3.Z/I.anRFCJCORAjswONRpQWm.', 'Labbett', 'Charin');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('2dad4ded-0c9a-4a08-af87-6a008804327f', 'agabrieli7@clickbank.net', '$2y$10$iUpa2SWl.VGb5qX0jX/.3.QC8tquWctrO0gy1urwupoiioTsa3HM.', 'Gabrieli', 'Averil');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('afd1984c-2dbf-4b7d-83b1-170d182933fe', 'etrue8@webmd.com', '$2y$10$7E31MmmWac0xMSOaVA/fuepibObAWpNOmZvoHTtCQuMYlzCyfxlSm', 'True', 'Elke');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('79ed3469-0c45-44e7-96bc-c2f6cbd66990', 'fderby9@mail.ru', '$2y$10$SU.JPiVLlvF0aRFHthG7BuGhjHJAd9NINKFqqyrNrHk.1yl7mOqAq', 'Derby', 'Fayette');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('b58a7779-d10a-4b96-9408-f4fb19433e66', 'rtoweya@smugmug.com', '$2y$10$o5Aq5P1E77R0oDf/7pU.VuKTA.FjlaY3KYUXiq32G0TEwczl0D6z2', 'Towey', 'Royal');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('96d7e247-85d0-4c08-b761-a3587a0efc72', 'sjeaycockb@nbcnews.com', '$2y$10$X5eBy5WsimNVRYXwD3t9DOPBMnXP41l1Q6Mm3GawzNDI40UIb8KLa', 'Jeaycock', 'Sansone');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('6a2e50ee-5f89-4687-9a7f-27f82b938db3', 'mgiovanic@feedburner.com', '$2y$10$eVqHPAo3zUiD3Dc1s7MKHe6gcdV79oUu8lPIYABkRpTXanC3MJiGS', 'Giovani', 'Mag');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('e6322911-5cec-4ce6-94e5-44194a864080', 'mheimannd@unc.edu', '$2y$10$0F5x27B6bv75JEr8Trb6fu99pUnyhDDKlS/QMA/ShwK.L0JHaRiSe', 'Heimann', 'Minda');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('817953f4-af80-42a3-83bc-1f7adf142205', 'mboodlee@addtoany.com', '$2y$10$CHAWCu7PFRzv48dgWkMBNOBW4hWkH.nD1tp.VGV/3WGPVsS4xSMDi', 'Boodle', 'Madelyn');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('f824a605-24e2-453c-a5ea-1858662d02ad', 'cbabbf@quantcast.com', '$2y$10$ErXbLfPah.g7J8NiW.ckF.Jx5uTQY80197jhqiX.An/PRT.UX513W', 'Babb', 'Cassi');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('483289d2-a6a6-4fc6-8af3-6a5ce6abaad6', 'cgasking@rakuten.co.jp', '$2y$10$klI7pGYnnAHVN0T8PTc1jOGLNVqazeA0KrOdOaftA6MvzzgBVsum2', 'Gaskin', 'Carey');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('2f1ede26-ff73-42f4-8bc0-516d74c4de31', 'sdemetrh@ucoz.ru', '$2y$10$qAgfsc7pdUIUFanBpXlo1eCUW0eaT.sVXgnciFWaKi/1u2j8wr1Iy', 'Demetr', 'Sherrie');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('b6a9bd3d-b79d-4c5e-aa7f-f796afeb244b', 'mbickersi@hostgator.com', '$2y$10$kwM6oZ4DmKA9HVm8jm0U0.2gQvyD4DTy/Y.d35lqVKlfOATUHmnMm', 'Bickers', 'Mada');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('84a96db6-6308-4723-8762-522bb5d6fff6', 'dmattenj@mysql.com', '$2y$10$0aZPO1V1zM1BxViW8ihxSuj6knIri5Yat/wS/gPZEwyn3G/pKUYEW', 'Matten', 'Dory');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('a2c489ac-eed4-4fce-812a-54a71d5e918f', 'drickfordk@tiny.cc', '$2y$10$5RhLM8rmOGc5k.5mMX5pSOruZM1EmqhK7b7lzqFXmTQVvRXuglKRO', 'Rickford', 'Delbert');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('2ce014ae-d659-493b-956a-132fc9624196', 'tollivierl@china.com.cn', '$2y$10$QpGaQs//8OcEh8Z6jHiSSuW/HLQawUwk54TIBJ1CFPVuVLq4HTFH.', 'Ollivier', 'Trenna');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('8fac16cb-a47c-4d2b-9c68-b315c817c5fd', 'oreddihoughm@about.com', '$2y$10$UdN8.fc26sZx4Nb.OX794.TV5BpAy7k1Zz1jvnrY34t9key0JCrea', 'Reddihough', 'Odella');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('f20f72f6-a6d3-458b-b6c0-f5d93f0e2e6b', 'prochen@stanford.edu', '$2y$10$WfyrkWa2jpMu7vs/vj2H0e9jBg1I2yB5dBt0nAjJ9bYqpOIEa0EAe', 'Roche', 'Pauly');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('f1cb266f-2582-4a86-84bf-7321e90e42e2', 'coloughaneo@gov.uk', '$2y$10$MDKMqfzZGliAhu6OMDCY5.1Hle/F1Gk24WucxZffm/QOhEAokaR8q', 'O''Loughane', 'Colline');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('5817c6ae-7c74-42c1-a18a-014734a31182', 'gweatherhoggp@cdbaby.com', '$2y$10$wConvYIe0oYH8WaCUk6iJe9Rqv3UXQUyyB.6cBEwTORYUlwnJZy52', 'Weatherhogg', 'Gerrie');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('e079efb7-df64-45fd-b2ab-914105f24121', 'krussoq@adobe.com', '$2y$10$dqZpZR/7DdNphHOd5PvgH.cEqf3YUZTNDTyf5E5DEtgBGxLgxg2uW', 'Russo', 'Kristopher');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('c60c343c-efca-41ba-a611-85b85c3ad499', 'aworsfieldr@irs.gov', '$2y$10$h38aQVsa2WAvIwD7LMqKQ.PwuxJvHbkMfJgZEQ5ZQ9mzEMuxwb4.W', 'Worsfield', 'Abby');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('cf75ab1f-5814-4eb4-9092-182d1164c09a', 'couldcotts@ovh.net', '$2y$10$zMkMeBzSK4L59xmAk4BHaeJLdvVDhF7CbkJMFl.1Ddy7D2L7ce2Ay', 'Ouldcott', 'Cross');
INSERT INTO Users (id_user, email, password, lastname, firstname) VALUES ('ce90ca42-f64f-4b87-af48-4df4d8b177ad', 'ckisbeyt@barnesandnoble.com', '$2y$10$qjPypxb99dOn9avmJnfYOe7paKr0Xwcu4RxaNhtPoJqd.0oOXEL1K', 'Kisbey', 'Chance');

INSERT INTO Roles (content) VALUES ('Administrator');
INSERT INTO Roles (content) VALUES ('Theater Manager');
INSERT INTO Roles (content) VALUES ('Customer');

INSERT INTO UsersRoles (id_user, id_role) VALUES ('46f84e6e-441a-4104-aca4-9b3e6cb38c61', 1);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('a011bf90-b77c-4c9f-87dd-27597b9cccf9', 2);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('a2ac8360-aecf-4e6a-a67b-7196ac9e1bcc', 1);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('383776cd-9bf8-40b2-82c8-9671667b6d85', 2);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('65ce3628-48c4-41c1-8fad-2cdd622c143d', 1);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('e9f52147-0b7c-43f8-bea1-d856b7e24dac', 2);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('0a5facfd-87c7-4138-933b-7be3eb6648a0', 2);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('2dad4ded-0c9a-4a08-af87-6a008804327f', 2);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('afd1984c-2dbf-4b7d-83b1-170d182933fe', 2);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('79ed3469-0c45-44e7-96bc-c2f6cbd66990', 2);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('b58a7779-d10a-4b96-9408-f4fb19433e66', 2);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('96d7e247-85d0-4c08-b761-a3587a0efc72', 2);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('6a2e50ee-5f89-4687-9a7f-27f82b938db3', 2);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('e6322911-5cec-4ce6-94e5-44194a864080', 3);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('817953f4-af80-42a3-83bc-1f7adf142205', 3);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('f824a605-24e2-453c-a5ea-1858662d02ad', 3);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('483289d2-a6a6-4fc6-8af3-6a5ce6abaad6', 3);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('2f1ede26-ff73-42f4-8bc0-516d74c4de31', 3);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('b6a9bd3d-b79d-4c5e-aa7f-f796afeb244b', 3);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('84a96db6-6308-4723-8762-522bb5d6fff6', 3);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('a2c489ac-eed4-4fce-812a-54a71d5e918f', 3);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('2ce014ae-d659-493b-956a-132fc9624196', 3);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('8fac16cb-a47c-4d2b-9c68-b315c817c5fd', 3);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('f20f72f6-a6d3-458b-b6c0-f5d93f0e2e6b', 3);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('f1cb266f-2582-4a86-84bf-7321e90e42e2', 3);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('5817c6ae-7c74-42c1-a18a-014734a31182', 3);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('e079efb7-df64-45fd-b2ab-914105f24121', 3);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('c60c343c-efca-41ba-a611-85b85c3ad499', 3);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('cf75ab1f-5814-4eb4-9092-182d1164c09a', 3);
INSERT INTO UsersRoles (id_user, id_role) VALUES ('ce90ca42-f64f-4b87-af48-4df4d8b177ad', 3);

INSERT INTO PricesList (content, price) VALUES ('Plein tarif', 9.20);
INSERT INTO PricesList (content, price) VALUES ('Étudiant', 7.60);
INSERT INTO PricesList (content, price) VALUES ('Moins de 14 ans', 5.90);

INSERT INTO Theaters (id_theater, name, address) VALUES ('0ab83364-9fb7-4565-8228-17a8a8f5d6d5', 'Projector Lille', '15 Rue de labas 59000 LILLE');
INSERT INTO Theaters (id_theater, name, address) VALUES ('9c32ed57-b344-452d-a3c2-c801568c14f7', 'Projector Paris', '32 Route dici 75000 PARIS');
INSERT INTO Theaters (id_theater, name, address) VALUES ('b325c851-19c5-4825-a489-f425401d56bd', 'Projector Bordeaux', '26 Rue du cinema 33000 BORDEAUX');
INSERT INTO Theaters (id_theater, name, address) VALUES ('9b2a2bb6-ca10-449b-a0d0-8f1acecdea13', 'Projector Lyon', '3 Avenue du projectionniste 69000 LYON');
INSERT INTO Theaters (id_theater, name, address) VALUES ('1f02dbca-6d38-4334-bdad-591e778d0099', 'Projector Marseille', '102 Route de la bobine 13000 MARSEILLE');
INSERT INTO Theaters (id_theater, name, address) VALUES ('b377053a-8a25-4f05-b9c8-654ac40c7e35', 'Projector Toulouse', '23 Rue du film 31000 TOULOUSE');
INSERT INTO Theaters (id_theater, name, address) VALUES ('5bd92a7d-41a7-48b6-bd37-3a883e9c2c8f', 'Projector Strasbourg', '56 Avenue des comédiens 67000 STRASBOURG');
INSERT INTO Theaters (id_theater, name, address) VALUES ('6c19b5db-4ab7-4f05-89c3-134ac27ef7bc', 'Projector Rennes', '13 Rue des scénaristes 35000 RENNES');
INSERT INTO Theaters (id_theater, name, address) VALUES ('2d951054-85be-4ebe-bb86-dbfbefabf61a', 'Projector Nice', '78 Route des producteurs 06000 NICE');
INSERT INTO Theaters (id_theater, name, address) VALUES ('9b94391c-8da7-4788-8dc4-2da81376499f', 'Projector Montpellier', '233 Route des réalisateurs 34000 MONTPELLIER');

INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('a011bf90-b77c-4c9f-87dd-27597b9cccf9', '0ab83364-9fb7-4565-8228-17a8a8f5d6d5');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('383776cd-9bf8-40b2-82c8-9671667b6d85', '9c32ed57-b344-452d-a3c2-c801568c14f7');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('e9f52147-0b7c-43f8-bea1-d856b7e24dac', 'b325c851-19c5-4825-a489-f425401d56bd');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('0a5facfd-87c7-4138-933b-7be3eb6648a0', '9b2a2bb6-ca10-449b-a0d0-8f1acecdea13');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('2dad4ded-0c9a-4a08-af87-6a008804327f', '1f02dbca-6d38-4334-bdad-591e778d0099');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('afd1984c-2dbf-4b7d-83b1-170d182933fe', 'b377053a-8a25-4f05-b9c8-654ac40c7e35');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('79ed3469-0c45-44e7-96bc-c2f6cbd66990', '5bd92a7d-41a7-48b6-bd37-3a883e9c2c8f');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('b58a7779-d10a-4b96-9408-f4fb19433e66', '6c19b5db-4ab7-4f05-89c3-134ac27ef7bc');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('96d7e247-85d0-4c08-b761-a3587a0efc72', '2d951054-85be-4ebe-bb86-dbfbefabf61a');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('6a2e50ee-5f89-4687-9a7f-27f82b938db3', '9b94391c-8da7-4788-8dc4-2da81376499f');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('46f84e6e-441a-4104-aca4-9b3e6cb38c61', '0ab83364-9fb7-4565-8228-17a8a8f5d6d5');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('46f84e6e-441a-4104-aca4-9b3e6cb38c61', '9c32ed57-b344-452d-a3c2-c801568c14f7');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('46f84e6e-441a-4104-aca4-9b3e6cb38c61', 'b325c851-19c5-4825-a489-f425401d56bd');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('46f84e6e-441a-4104-aca4-9b3e6cb38c61', '9b2a2bb6-ca10-449b-a0d0-8f1acecdea13');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('46f84e6e-441a-4104-aca4-9b3e6cb38c61', '1f02dbca-6d38-4334-bdad-591e778d0099');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('46f84e6e-441a-4104-aca4-9b3e6cb38c61', 'b377053a-8a25-4f05-b9c8-654ac40c7e35');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('46f84e6e-441a-4104-aca4-9b3e6cb38c61', '5bd92a7d-41a7-48b6-bd37-3a883e9c2c8f');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('46f84e6e-441a-4104-aca4-9b3e6cb38c61', '6c19b5db-4ab7-4f05-89c3-134ac27ef7bc');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('46f84e6e-441a-4104-aca4-9b3e6cb38c61', '2d951054-85be-4ebe-bb86-dbfbefabf61a');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('46f84e6e-441a-4104-aca4-9b3e6cb38c61', '9b94391c-8da7-4788-8dc4-2da81376499f');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('a2ac8360-aecf-4e6a-a67b-7196ac9e1bcc', '0ab83364-9fb7-4565-8228-17a8a8f5d6d5');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('a2ac8360-aecf-4e6a-a67b-7196ac9e1bcc', '9c32ed57-b344-452d-a3c2-c801568c14f7');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('a2ac8360-aecf-4e6a-a67b-7196ac9e1bcc', 'b325c851-19c5-4825-a489-f425401d56bd');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('a2ac8360-aecf-4e6a-a67b-7196ac9e1bcc', '9b2a2bb6-ca10-449b-a0d0-8f1acecdea13');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('a2ac8360-aecf-4e6a-a67b-7196ac9e1bcc', '1f02dbca-6d38-4334-bdad-591e778d0099');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('a2ac8360-aecf-4e6a-a67b-7196ac9e1bcc', 'b377053a-8a25-4f05-b9c8-654ac40c7e35');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('a2ac8360-aecf-4e6a-a67b-7196ac9e1bcc', '5bd92a7d-41a7-48b6-bd37-3a883e9c2c8f');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('a2ac8360-aecf-4e6a-a67b-7196ac9e1bcc', '6c19b5db-4ab7-4f05-89c3-134ac27ef7bc');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('a2ac8360-aecf-4e6a-a67b-7196ac9e1bcc', '2d951054-85be-4ebe-bb86-dbfbefabf61a');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('a2ac8360-aecf-4e6a-a67b-7196ac9e1bcc', '9b94391c-8da7-4788-8dc4-2da81376499f');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('65ce3628-48c4-41c1-8fad-2cdd622c143d', '0ab83364-9fb7-4565-8228-17a8a8f5d6d5');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('65ce3628-48c4-41c1-8fad-2cdd622c143d', '9c32ed57-b344-452d-a3c2-c801568c14f7');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('65ce3628-48c4-41c1-8fad-2cdd622c143d', 'b325c851-19c5-4825-a489-f425401d56bd');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('65ce3628-48c4-41c1-8fad-2cdd622c143d', '9b2a2bb6-ca10-449b-a0d0-8f1acecdea13');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('65ce3628-48c4-41c1-8fad-2cdd622c143d', '1f02dbca-6d38-4334-bdad-591e778d0099');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('65ce3628-48c4-41c1-8fad-2cdd622c143d', 'b377053a-8a25-4f05-b9c8-654ac40c7e35');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('65ce3628-48c4-41c1-8fad-2cdd622c143d', '5bd92a7d-41a7-48b6-bd37-3a883e9c2c8f');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('65ce3628-48c4-41c1-8fad-2cdd622c143d', '6c19b5db-4ab7-4f05-89c3-134ac27ef7bc');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('65ce3628-48c4-41c1-8fad-2cdd622c143d', '2d951054-85be-4ebe-bb86-dbfbefabf61a');
INSERT INTO UsersTheaters (id_user, id_theater) VALUES ('65ce3628-48c4-41c1-8fad-2cdd622c143d', '9b94391c-8da7-4788-8dc4-2da81376499f');

INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('de5fa53e-2ec6-4337-ac23-bdd5b1183688', 1, 500, '0ab83364-9fb7-4565-8228-17a8a8f5d6d5');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('ba283896-910b-40b1-a9cc-c3cd13461dbc', 2, 300, '0ab83364-9fb7-4565-8228-17a8a8f5d6d5');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('34812276-23d6-4d77-bce3-4fe44c58ac38', 3, 300, '0ab83364-9fb7-4565-8228-17a8a8f5d6d5');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('7a5539b1-1dd1-4db7-be90-941596bba2f5', 4, 150, '0ab83364-9fb7-4565-8228-17a8a8f5d6d5');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('677c83c0-29bc-4f40-8a8e-5ddfa2cd8a7e', 1, 600, '9c32ed57-b344-452d-a3c2-c801568c14f7');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('32bba7df-62bc-432b-a73b-0a03012ddffd', 2, 400, '9c32ed57-b344-452d-a3c2-c801568c14f7');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('3e85ed41-30ae-4040-a4e4-a2b11dbcbfc9', 3, 400, '9c32ed57-b344-452d-a3c2-c801568c14f7');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('ae9d8b88-3c25-426b-bc2e-0c17d39fd7c6', 4, 300, '9c32ed57-b344-452d-a3c2-c801568c14f7');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('8405da5b-20ba-45b7-b0a9-54998ff7dc2d', 5, 300, '9c32ed57-b344-452d-a3c2-c801568c14f7');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('cafe8303-b66f-40d9-bef1-23022f534c6e', 6, 200, '9c32ed57-b344-452d-a3c2-c801568c14f7');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('4d801d11-48c4-4f38-9a5e-a111d32b5d8b', 7, 100, '9c32ed57-b344-452d-a3c2-c801568c14f7');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('bd27b1c5-b119-470f-b88d-a13831b44ff1', 1, 400, 'b325c851-19c5-4825-a489-f425401d56bd');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('74235cc3-e808-402c-8b41-dd2c6f4ccca5', 2, 300, 'b325c851-19c5-4825-a489-f425401d56bd');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('011771e7-adb1-4d9b-bced-ffe996bee490', 3, 300, 'b325c851-19c5-4825-a489-f425401d56bd');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('908a3da4-04e9-4b20-9686-c42f64ce5ad6', 4, 200, 'b325c851-19c5-4825-a489-f425401d56bd');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('3e97bc41-9b56-4482-9e27-9732f48d8ba7', 1, 500, '9b2a2bb6-ca10-449b-a0d0-8f1acecdea13');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('53cfa7b9-34c0-4da0-a558-37787b343748', 2, 300, '9b2a2bb6-ca10-449b-a0d0-8f1acecdea13');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('7be904dc-09fa-4070-926c-7acf730e4fee', 3, 200, '9b2a2bb6-ca10-449b-a0d0-8f1acecdea13');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('2760a26c-ed31-4da5-8f22-d37350b64a98', 1, 450, '1f02dbca-6d38-4334-bdad-591e778d0099');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('fffa041d-5214-4bff-b94a-e77a1eab3c1d', 2, 400, '1f02dbca-6d38-4334-bdad-591e778d0099');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('3c6eacb8-85db-46aa-8b88-69e1ab7489ca', 3, 300, '1f02dbca-6d38-4334-bdad-591e778d0099');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('f7ccef40-127b-4d24-8c3e-34452f2ce8f5', 4, 300, '1f02dbca-6d38-4334-bdad-591e778d0099');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('36ca5112-6938-4821-a7e5-797f881a446a', 5, 200, '1f02dbca-6d38-4334-bdad-591e778d0099');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('8a18bcb5-f688-4836-9c3e-0b223e474eef', 1, 300, 'b377053a-8a25-4f05-b9c8-654ac40c7e35');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('fc0d450c-b408-46e7-9815-7310d6eb9287', 2, 300, 'b377053a-8a25-4f05-b9c8-654ac40c7e35');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('c4f7cd33-5add-4fcc-bee6-c9cb590b15d3', 3, 200, 'b377053a-8a25-4f05-b9c8-654ac40c7e35');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('80999a0f-56dc-4df8-90c4-a50084a97b43', 1, 500, '5bd92a7d-41a7-48b6-bd37-3a883e9c2c8f');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('cc297862-4060-43b3-b6e5-49b088f2f6b9', 2, 200, '5bd92a7d-41a7-48b6-bd37-3a883e9c2c8f');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('0fd68fa7-8e8c-4972-bdd6-54e975f9547a', 1, 400, '6c19b5db-4ab7-4f05-89c3-134ac27ef7bc');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('c0df7788-c022-4195-83bc-99a23f4b3eb2', 2, 300, '6c19b5db-4ab7-4f05-89c3-134ac27ef7bc');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('11641371-4188-4e81-9f9d-b86ab110287f', 1, 500, '2d951054-85be-4ebe-bb86-dbfbefabf61a');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('a93a4380-34ed-4cff-ad40-a11419ae6dea', 2, 300, '2d951054-85be-4ebe-bb86-dbfbefabf61a');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('a266879e-ba9a-41b0-b975-04fb56637cb5', 3, 300, '2d951054-85be-4ebe-bb86-dbfbefabf61a');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('da2bc3d8-789f-466c-a6d9-2ca267f95c9d', 4, 200, '2d951054-85be-4ebe-bb86-dbfbefabf61a');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('048c3d45-1a72-4db9-a4c6-ddd93ceb11c2', 1, 500, '9b94391c-8da7-4788-8dc4-2da81376499f');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('7d24239c-60c2-4cee-b307-80f20274298f', 2, 400, '9b94391c-8da7-4788-8dc4-2da81376499f');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('99d3e5fb-085b-44f2-b034-b09c8d836507', 3, 400, '9b94391c-8da7-4788-8dc4-2da81376499f');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('0ffb0d67-c7a3-4c5a-9968-32ea899667a6', 4, 350, '9b94391c-8da7-4788-8dc4-2da81376499f');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('815b5ee7-21d3-4241-9197-2ef5422ad982', 5, 250, '9b94391c-8da7-4788-8dc4-2da81376499f');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('9ecc9d96-ee6e-4631-83c5-6987674f9136', 6, 200, '9b94391c-8da7-4788-8dc4-2da81376499f');
INSERT INTO Rooms (id_room, room_nb, seats_nb, id_theater) VALUES ('c02b509b-97c1-4e58-90b6-94a99e68ad3d', 7, 150, '9b94391c-8da7-4788-8dc4-2da81376499f');

INSERT INTO Movies (id_Movie, title, synopsis, duration, actors, release_date, genre) VALUES ('9095b40d-210e-4bab-b05d-59f0de0f4654', 'Les Animaux Fantastiques 3 : Les secrets de Dumbledore', 'Le professeur Albus Dumbledore sait que le puissant mage noir Gellert Grindelwald cherche à prendre le contrôle du monde des sorciers. Incapable de l''empêcher d''agir seul, il sollicite le magizoologiste Norbert Dragonneau pour qu''il réunisse des sorciers, des sorcières et un boulanger moldu au sein d''une équipe intrépide. Leur mission des plus périlleuses les amènera à affronter des animaux, anciens et nouveaux, et les disciples de plus en plus nombreux de Grindelwald... Pourtant, dès lors que les enjeux sont aussi élevés, Dumbledore pourra-t-il encore rester longtemps dans l''ombre', '02:23:00', 'Eddie Redmayne, Jude Law, Mads Mikkelsen', '2022-04-13', 'Fantastique');
INSERT INTO Movies (id_Movie, title, synopsis, duration, actors, release_date, genre) VALUES ('2922b8ad-3321-4089-85a3-245dbb5d8da5', 'Qu''est ce qu''on a tous fait au bon dieu?', 'Ce sont bientôt les 40 ans de mariage de Claude et Marie Verneuil. Pour cette occasion, leurs quatre filles décident d''organiser une grande fête surprise dans la maison familiale de Chinon et d''y inviter les parents de chacun des gendres, pour quelques jours. Claude et Marie vont devoir accueillir sous leur toit les parents de Rachid, David, Chao et Charles : ce séjour "familial" s''annonce mouvementé..', '01:39:00', 'Christian Clavier, Chantal Lauby, Frédérique Bel', '2022-04-06', 'Comédie');
INSERT INTO Movies (id_Movie, title, synopsis, duration, actors, release_date, genre) VALUES ('32e615be-9c06-4316-b609-03709bea85aa', 'Les Bad Guys', 'Animations, inspirée par la série éponyme de livres pour enfants à succès, met en scène une bande d''animaux, redoutables criminels de haut vol, qui sont sur le point de commettre leur méfait le plus éclatant : devenir des citoyens respectables. Ces cinq compères sont tristement célèbres pour leurs aptitudes respectives au crime :- M. Loup, le fringant pickpocket- M. Serpent, le perceur de coffre forts blasé- M. Requin, l''expert en camouflage au sang très très froid- M. Piranha, le gros bras excessivement soupe au lait de la bande- Mlle Tarentule, la pirate informatique dont les talents de hacker sont aussi aiguisés que sa langue.Mais après des années d''incalculables méfaits, ceux qui sont devenus sans conteste les malfrats les plus recherchés du monde, finissent par se faire arrêter. Mr Loup conclut alors un marché (qu''il n''a évidemment pas l''intention d''honorer) afin de s''éviter ainsi qu''à ses compères, bien des années en prison : les Bad Guys vont devenir honorables.Sous la tutelle de leur nouveau mentor, un cochon d''Inde aussi adorable qu''arrogant, le Professeur Marmelade, les Bad Guys sont bien partis pour rouler leur monde et faire croire à tous qu''ils ont changé. Mais ce faisant, Mr Loup commence à comprendre que faire vraiment le bien pourrait être la clef de ce qui lui a toujours manqué : la reconnaissance. Alors qu''un nouveau méchant s''en prend à la ville, va-t-il pouvoir persuader ses acolytes de le suivre sur le chemin de la rédemption et de devenir enfin des gentils', '01:40:00', 'Pierre Niney, Igor Gotesman, Jean-Pascal Zadi', '2022-04-06', 'Animation');
INSERT INTO Movies (id_Movie, title, synopsis, duration, actors, release_date, genre) VALUES ('af6caf72-8a3d-453a-9746-c9b302116d59', 'Le secret de la cité perdue', 'Loretta Sage, romancière brillante mais solitaire, est connue pour ses livres mêlant romance et aventures dans des décors exotiques. Alan, mannequin, a pour sa part passé la plus grande partie de sa carrière à incarner Dash, le héros à la plastique avantageuse figurant sur les couvertures des livres de Loretta. Alors qu''elle est en pleine promotion de son nouveau roman en compagnie d''Alan, Loretta se retrouve kidnappée par un milliardaire excentrique qui est persuadé qu''elle pourra l''aider à retrouver le trésor d''une cité perdue évoquée dans son dernier ouvrage. Déterminé à prouver qu''il peut être dans la vraie vie à la hauteur du héros qu''il incarne dans les livres, Alan se lance à la rescousse de la romancière. Propulsés dans une grande aventure au coeur d''une jungle hostile, ce duo improbable va devoir faire équipe pour survivre et tenter de mettre la main sur l''ancien trésor avant qu''il ne disparaisse à jamais.', '01:52:00', 'Channing Tatum, Sandra Bullock, Daniel Radcliffe', '2022-04-20', 'Comédie');
INSERT INTO Movies (id_Movie, title, synopsis, duration, actors, release_date, genre) VALUES ('84bf31b5-1352-41b1-bcb2-3f52b83f321d', 'En même temps', 'A la veille d''un vote pour entériner la construction d''un parc de loisirs à la place d''une forêt primaire, un maire de droite décomplexée essaye de corrompre son confrère écologiste. Mais ils se font piéger par un groupe de jeunes activistes féministes qui réussit à les coller ensemble. Une folle nuit commence alors pour les deux hommes, unis contre leur gré...', '01:48:00', 'Jonathan Cohen, Vincent Macaigne, India Hair', '2022-04-06', 'Comédie');
INSERT INTO Movies (id_Movie, title, synopsis, duration, actors, release_date, genre) VALUES ('45238f64-9fb5-44d5-bc29-685d4b714570', 'Un talent en or massif', 'Nicolas Cage est maintenant un acteur endetté qui attend le grand rôle qui relancera sa carrière. Pour rembourser une partie de ses dettes, son agent lui propose de se rendre à l''anniversaire d''un dangereux milliardaire qui se révèle être son plus grand fan. Mais le séjour prend une toute autre tournure, lorsque la CIA le contacte, lui demandant d''enquêter sur les activités criminelles de son hôte. Nicolas Cage va devoir jouer le rôle de sa vie et prouver qu''il est à la hauteur de sa propre légende.', '01:47:00', 'Nicolas Cage, Tiffany Haddish, Pedro Pascal', '2022-04-20', 'Action');
INSERT INTO Movies (id_Movie, title, synopsis, duration, actors, release_date, genre) VALUES ('df2f0a20-fcb7-4ef4-9747-b2cda4c66a0c', 'Morbius', 'Gravement atteint d''une rare maladie sanguine, et déterminé à sauver toutes les victimes de cette pathologie, le Dr Morbius tente un pari désespéré. Mais ce qui semble à première vue être un succès se révèle rapidement comme un remède potentiellement plus grave que la maladie.', '01:48:00', 'Jared Leto, Adria Arjona, Matt Smith (XI)', '2022-03-30', 'Drame');
INSERT INTO Movies (id_Movie, title, synopsis, duration, actors, release_date, genre) VALUES ('928a8df2-06f1-4fe8-b7e3-c209c4fba545', 'Abuela', 'Susana, un jeune mannequin espagnol, est sur le point de percer dans le milieu de la mode parisien. Mais quand sa grand-mère est victime d''un accident la laissant quasi paralysée, Susana doit rentrer à Madrid dans le vieil appartement où elle a grandi afin de veiller sur celle qui constitue son unique famille. Alors qu''approche leur anniversaire commun, de vieux souvenirs resurgissent en parallèle d''événements étranges, et le comportement de sa grand-mère devient de plus en plus inquiétant...', '01:40:00', 'Almudena Amor, Vera Valdez, Karina Kolokolchykova', '2022-04-06', 'Horreur / Epouvante');
INSERT INTO Movies (id_Movie, title, synopsis, duration, actors, release_date, genre) VALUES ('d870dbaf-4b52-4ce0-882b-546ca90f890a', 'Les gagnants', 'Deux gagnants vont passer une semaine à Marseille chez leur idole, filmés en live sur les réseaux. Problème : les deux gagnants sont des boulets...', '01:25:00', 'Alban Ivanov, Joey Starr, AZ .', '2022-04-13', 'Comédie');
INSERT INTO Movies (id_Movie, title, synopsis, duration, actors, release_date, genre) VALUES ('39e50272-014d-4d96-b0f0-3f3fb830e5c2', 'En corps', 'Elise, 26 ans est une grande danseuse classique. Elle se blesse pendant un spectacle et apprend qu''elle ne pourra plus danser. Dès lors sa vie va être bouleversée, Elise va devoir apprendre à se réparer. Entre Paris et la Bretagne, au gré des rencontres et des expériences, des déceptions et des espoirs, Elise va se rapprocher d''une compagnie de danse contemporaine. Cette nouvelle façon de danser va lui permettre de retrouver un nouvel élan et aussi une nouvelle façon de vivre.', '01:58:00', 'Denis Podalydès, Marion Barbeau, Pio Marmaï', '2022-03-30', 'Comédie dramatique');

INSERT INTO Shows (id_show, date, id_movie) VALUES ('32ef7d0f-9117-4126-9342-e4ea61979d91', '2022-04-28 21:00:00', '9095b40d-210e-4bab-b05d-59f0de0f4654');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('eb01c5c0-60d8-482f-a2bf-7e2d9c5fd4c5', '2022-04-28 21:00:00', '2922b8ad-3321-4089-85a3-245dbb5d8da5');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('8b5fc52c-914b-4029-947d-3d945a1b65bc', '2022-04-28 21:00:00', '32e615be-9c06-4316-b609-03709bea85aa');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('7db0f5da-e91f-4c65-ba08-4275ac39bd6d', '2022-04-28 21:00:00', 'af6caf72-8a3d-453a-9746-c9b302116d59');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('15861339-0c62-46df-8acb-b0d6ecb21809', '2022-04-28 21:00:00', '84bf31b5-1352-41b1-bcb2-3f52b83f321d');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('2a115a67-e271-4429-8871-18826d6cd8ff', '2022-04-28 21:00:00', '45238f64-9fb5-44d5-bc29-685d4b714570');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('ce2e7966-a92e-42a3-9a96-57717d3fa621', '2022-04-28 21:00:00', 'df2f0a20-fcb7-4ef4-9747-b2cda4c66a0c');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('79340394-cc2b-43eb-9914-c9b2b69d0bf8', '2022-04-28 21:00:00', '928a8df2-06f1-4fe8-b7e3-c209c4fba545');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('a91093c8-8836-4890-80f5-5d3294670348', '2022-04-28 21:00:00', 'd870dbaf-4b52-4ce0-882b-546ca90f890a');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('f1d7948c-bd79-448c-b832-dff6424eae34', '2022-04-28 21:00:00', '39e50272-014d-4d96-b0f0-3f3fb830e5c2');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('56f5ea54-7c5f-4406-ac45-b462a4d7a47e', '2022-04-28 13:00:00', '9095b40d-210e-4bab-b05d-59f0de0f4654');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('9c789aa3-3c73-4a85-ba8f-b34505c08241', '2022-04-28 13:00:00', '2922b8ad-3321-4089-85a3-245dbb5d8da5');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('4cd097d0-dddb-4a46-849c-1ad5f15a0cf4', '2022-04-28 13:00:00', '32e615be-9c06-4316-b609-03709bea85aa');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('30c094fc-45ba-4458-8e75-af4f0849ffe3', '2022-04-28 13:00:00', 'af6caf72-8a3d-453a-9746-c9b302116d59');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('0e5d8c67-a39e-46bd-8734-f6b1f35f1580', '2022-04-28 13:00:00', '84bf31b5-1352-41b1-bcb2-3f52b83f321d');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('acd3ede4-1265-4c34-9b9a-a9a433f6c659', '2022-04-28 13:00:00', '45238f64-9fb5-44d5-bc29-685d4b714570');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('06b8b3d7-6503-4b34-bfef-9dac513977bc', '2022-04-28 13:00:00', 'df2f0a20-fcb7-4ef4-9747-b2cda4c66a0c');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('9e694908-9eaa-4463-9995-db065f91a231', '2022-04-28 13:00:00', '928a8df2-06f1-4fe8-b7e3-c209c4fba545');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('3e10c240-860e-4254-9ac8-f02e6dd1330e', '2022-04-28 13:00:00', 'd870dbaf-4b52-4ce0-882b-546ca90f890a');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('61dc702b-5f98-4b0d-a9f4-10cd9360a1bd', '2022-04-28 13:00:00', '39e50272-014d-4d96-b0f0-3f3fb830e5c2');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('5b0ced03-8518-4427-984c-79cb58eeeb3d', '2022-04-29 13:00:00', '9095b40d-210e-4bab-b05d-59f0de0f4654');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('44989db9-d74e-4c25-b4be-055564b13eee', '2022-04-29 13:00:00', '2922b8ad-3321-4089-85a3-245dbb5d8da5');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('8783f5db-43e8-4f11-b047-b2e0580922f4', '2022-04-29 13:00:00', '32e615be-9c06-4316-b609-03709bea85aa');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('bc6db869-f8ee-45ef-b3b8-ae126d767d7e', '2022-04-29 13:00:00', 'af6caf72-8a3d-453a-9746-c9b302116d59');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('21aa0f0f-2f53-4ca2-a0b4-90e093e2c9e3', '2022-04-29 13:00:00', '84bf31b5-1352-41b1-bcb2-3f52b83f321d');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('13768425-c4ad-4821-8c43-c3d3ceda8a8f', '2022-04-29 13:00:00', '45238f64-9fb5-44d5-bc29-685d4b714570');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('78b14224-136a-4d52-b01a-d265570f21b9', '2022-04-29 13:00:00', 'df2f0a20-fcb7-4ef4-9747-b2cda4c66a0c');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('080efcdb-9946-4ede-af13-e58e35f3e758', '2022-04-29 13:00:00', '928a8df2-06f1-4fe8-b7e3-c209c4fba545');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('a9cf1714-1cb8-4306-bdd2-a34af5abe929', '2022-04-29 13:00:00', 'd870dbaf-4b52-4ce0-882b-546ca90f890a');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('fc03a5a6-7932-429b-8a46-beec348e1531', '2022-04-29 13:00:00', '39e50272-014d-4d96-b0f0-3f3fb830e5c2');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('1fefecb3-082a-4fba-9cf3-49d8e247a3e9', '2022-04-29 21:00:00', '9095b40d-210e-4bab-b05d-59f0de0f4654');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('b5cd806c-1cc8-4046-9609-5d06cc93a1aa', '2022-04-29 21:00:00', '2922b8ad-3321-4089-85a3-245dbb5d8da5');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('35a481d4-ceaa-4b7f-aea7-6b71d5cb0774', '2022-04-29 21:00:00', '32e615be-9c06-4316-b609-03709bea85aa');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('0225402b-ce96-48a7-993b-569849ba3412', '2022-04-29 21:00:00', 'af6caf72-8a3d-453a-9746-c9b302116d59');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('2cf04d33-7fef-40eb-888d-4f54bc74d2ca', '2022-04-29 21:00:00', '84bf31b5-1352-41b1-bcb2-3f52b83f321d');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('f5fd5d05-d151-46d2-bfed-1bb249e241db', '2022-04-29 21:00:00', '45238f64-9fb5-44d5-bc29-685d4b714570');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('82b89e1b-11d7-4a45-af48-89b1b02750e8', '2022-04-29 21:00:00', 'df2f0a20-fcb7-4ef4-9747-b2cda4c66a0c');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('9c84188f-7c5b-45b4-a96f-b78d01bc1954', '2022-04-29 21:00:00', '928a8df2-06f1-4fe8-b7e3-c209c4fba545');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('7b37f96b-626f-4250-be55-34b85634f6c6', '2022-04-29 21:00:00', 'd870dbaf-4b52-4ce0-882b-546ca90f890a');
INSERT INTO Shows (id_show, date, id_movie) VALUES ('92a0fde7-7cf9-4b83-b074-e049a25b72eb', '2022-04-29 21:00:00', '39e50272-014d-4d96-b0f0-3f3fb830e5c2');

INSERT INTO ShowsRooms (id_show, id_room) VALUES ('32ef7d0f-9117-4126-9342-e4ea61979d91', 'de5fa53e-2ec6-4337-ac23-bdd5b1183688');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('eb01c5c0-60d8-482f-a2bf-7e2d9c5fd4c5', 'ba283896-910b-40b1-a9cc-c3cd13461dbc');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('8b5fc52c-914b-4029-947d-3d945a1b65bc', '34812276-23d6-4d77-bce3-4fe44c58ac38');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('7db0f5da-e91f-4c65-ba08-4275ac39bd6d', '7a5539b1-1dd1-4db7-be90-941596bba2f5');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('32ef7d0f-9117-4126-9342-e4ea61979d91', '677c83c0-29bc-4f40-8a8e-5ddfa2cd8a7e');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('eb01c5c0-60d8-482f-a2bf-7e2d9c5fd4c5', '32bba7df-62bc-432b-a73b-0a03012ddffd');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('8b5fc52c-914b-4029-947d-3d945a1b65bc', '3e85ed41-30ae-4040-a4e4-a2b11dbcbfc9');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('7db0f5da-e91f-4c65-ba08-4275ac39bd6d', 'ae9d8b88-3c25-426b-bc2e-0c17d39fd7c6');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('15861339-0c62-46df-8acb-b0d6ecb21809', '8405da5b-20ba-45b7-b0a9-54998ff7dc2d');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('a91093c8-8836-4890-80f5-5d3294670348', 'cafe8303-b66f-40d9-bef1-23022f534c6e');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('32ef7d0f-9117-4126-9342-e4ea61979d91', '4d801d11-48c4-4f38-9a5e-a111d32b5d8b');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('32ef7d0f-9117-4126-9342-e4ea61979d91', 'bd27b1c5-b119-470f-b88d-a13831b44ff1');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('eb01c5c0-60d8-482f-a2bf-7e2d9c5fd4c5', '74235cc3-e808-402c-8b41-dd2c6f4ccca5');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('8b5fc52c-914b-4029-947d-3d945a1b65bc', '011771e7-adb1-4d9b-bced-ffe996bee490');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('7db0f5da-e91f-4c65-ba08-4275ac39bd6d', '908a3da4-04e9-4b20-9686-c42f64ce5ad6');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('32ef7d0f-9117-4126-9342-e4ea61979d91', '3e97bc41-9b56-4482-9e27-9732f48d8ba7');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('eb01c5c0-60d8-482f-a2bf-7e2d9c5fd4c5', '53cfa7b9-34c0-4da0-a558-37787b343748');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('8b5fc52c-914b-4029-947d-3d945a1b65bc', '7be904dc-09fa-4070-926c-7acf730e4fee');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('32ef7d0f-9117-4126-9342-e4ea61979d91', '2760a26c-ed31-4da5-8f22-d37350b64a98');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('eb01c5c0-60d8-482f-a2bf-7e2d9c5fd4c5', 'fffa041d-5214-4bff-b94a-e77a1eab3c1d');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('8b5fc52c-914b-4029-947d-3d945a1b65bc', '3c6eacb8-85db-46aa-8b88-69e1ab7489ca');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('7db0f5da-e91f-4c65-ba08-4275ac39bd6d', 'f7ccef40-127b-4d24-8c3e-34452f2ce8f5');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('2a115a67-e271-4429-8871-18826d6cd8ff', '36ca5112-6938-4821-a7e5-797f881a446a');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('32ef7d0f-9117-4126-9342-e4ea61979d91', '8a18bcb5-f688-4836-9c3e-0b223e474eef');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('30c094fc-45ba-4458-8e75-af4f0849ffe3', 'fc0d450c-b408-46e7-9815-7310d6eb9287');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('8b5fc52c-914b-4029-947d-3d945a1b65bc', 'c4f7cd33-5add-4fcc-bee6-c9cb590b15d3');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('32ef7d0f-9117-4126-9342-e4ea61979d91', '80999a0f-56dc-4df8-90c4-a50084a97b43');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('eb01c5c0-60d8-482f-a2bf-7e2d9c5fd4c5', 'cc297862-4060-43b3-b6e5-49b088f2f6b9');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('32ef7d0f-9117-4126-9342-e4ea61979d91', '0fd68fa7-8e8c-4972-bdd6-54e975f9547a');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('eb01c5c0-60d8-482f-a2bf-7e2d9c5fd4c5', 'c0df7788-c022-4195-83bc-99a23f4b3eb2');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('32ef7d0f-9117-4126-9342-e4ea61979d91', '11641371-4188-4e81-9f9d-b86ab110287f');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('eb01c5c0-60d8-482f-a2bf-7e2d9c5fd4c5', 'a93a4380-34ed-4cff-ad40-a11419ae6dea');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('8b5fc52c-914b-4029-947d-3d945a1b65bc', 'a266879e-ba9a-41b0-b975-04fb56637cb5');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('a91093c8-8836-4890-80f5-5d3294670348', 'da2bc3d8-789f-466c-a6d9-2ca267f95c9d');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('32ef7d0f-9117-4126-9342-e4ea61979d91', '048c3d45-1a72-4db9-a4c6-ddd93ceb11c2');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('eb01c5c0-60d8-482f-a2bf-7e2d9c5fd4c5', '7d24239c-60c2-4cee-b307-80f20274298f');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('8b5fc52c-914b-4029-947d-3d945a1b65bc', '99d3e5fb-085b-44f2-b034-b09c8d836507');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('15861339-0c62-46df-8acb-b0d6ecb21809', '0ffb0d67-c7a3-4c5a-9968-32ea899667a6');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('ce2e7966-a92e-42a3-9a96-57717d3fa621', '815b5ee7-21d3-4241-9197-2ef5422ad982');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('79340394-cc2b-43eb-9914-c9b2b69d0bf8', '9ecc9d96-ee6e-4631-83c5-6987674f9136');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('32ef7d0f-9117-4126-9342-e4ea61979d91', 'c02b509b-97c1-4e58-90b6-94a99e68ad3d');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('56f5ea54-7c5f-4406-ac45-b462a4d7a47e', 'de5fa53e-2ec6-4337-ac23-bdd5b1183688');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('9c789aa3-3c73-4a85-ba8f-b34505c08241', 'ba283896-910b-40b1-a9cc-c3cd13461dbc');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('7b37f96b-626f-4250-be55-34b85634f6c6', '34812276-23d6-4d77-bce3-4fe44c58ac38');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('0e5d8c67-a39e-46bd-8734-f6b1f35f1580', '7a5539b1-1dd1-4db7-be90-941596bba2f5');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('a9cf1714-1cb8-4306-bdd2-a34af5abe929', '677c83c0-29bc-4f40-8a8e-5ddfa2cd8a7e');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('0225402b-ce96-48a7-993b-569849ba3412', '32bba7df-62bc-432b-a73b-0a03012ddffd');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('78b14224-136a-4d52-b01a-d265570f21b9', '3e85ed41-30ae-4040-a4e4-a2b11dbcbfc9');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('a9cf1714-1cb8-4306-bdd2-a34af5abe929', 'ae9d8b88-3c25-426b-bc2e-0c17d39fd7c6');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('2cf04d33-7fef-40eb-888d-4f54bc74d2ca', '8405da5b-20ba-45b7-b0a9-54998ff7dc2d');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('f5fd5d05-d151-46d2-bfed-1bb249e241db', 'cafe8303-b66f-40d9-bef1-23022f534c6e');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('9c789aa3-3c73-4a85-ba8f-b34505c08241', '4d801d11-48c4-4f38-9a5e-a111d32b5d8b');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('5b0ced03-8518-4427-984c-79cb58eeeb3d', 'bd27b1c5-b119-470f-b88d-a13831b44ff1');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('0225402b-ce96-48a7-993b-569849ba3412', '74235cc3-e808-402c-8b41-dd2c6f4ccca5');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('9e694908-9eaa-4463-9995-db065f91a231', '011771e7-adb1-4d9b-bced-ffe996bee490');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('b5cd806c-1cc8-4046-9609-5d06cc93a1aa', '908a3da4-04e9-4b20-9686-c42f64ce5ad6');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('a9cf1714-1cb8-4306-bdd2-a34af5abe929', '3e97bc41-9b56-4482-9e27-9732f48d8ba7');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('080efcdb-9946-4ede-af13-e58e35f3e758', '53cfa7b9-34c0-4da0-a558-37787b343748');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('f5fd5d05-d151-46d2-bfed-1bb249e241db', '7be904dc-09fa-4070-926c-7acf730e4fee');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('92a0fde7-7cf9-4b83-b074-e049a25b72eb', '2760a26c-ed31-4da5-8f22-d37350b64a98');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('0e5d8c67-a39e-46bd-8734-f6b1f35f1580', 'fffa041d-5214-4bff-b94a-e77a1eab3c1d');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('5b0ced03-8518-4427-984c-79cb58eeeb3d', '3c6eacb8-85db-46aa-8b88-69e1ab7489ca');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('0e5d8c67-a39e-46bd-8734-f6b1f35f1580', 'f7ccef40-127b-4d24-8c3e-34452f2ce8f5');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('82b89e1b-11d7-4a45-af48-89b1b02750e8', '36ca5112-6938-4821-a7e5-797f881a446a');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('06b8b3d7-6503-4b34-bfef-9dac513977bc', '8a18bcb5-f688-4836-9c3e-0b223e474eef');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('9c789aa3-3c73-4a85-ba8f-b34505c08241', 'fc0d450c-b408-46e7-9815-7310d6eb9287');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('f5fd5d05-d151-46d2-bfed-1bb249e241db', 'c4f7cd33-5add-4fcc-bee6-c9cb590b15d3');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('0225402b-ce96-48a7-993b-569849ba3412', '80999a0f-56dc-4df8-90c4-a50084a97b43');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('06b8b3d7-6503-4b34-bfef-9dac513977bc', 'cc297862-4060-43b3-b6e5-49b088f2f6b9');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('5b0ced03-8518-4427-984c-79cb58eeeb3d', '0fd68fa7-8e8c-4972-bdd6-54e975f9547a');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('f5fd5d05-d151-46d2-bfed-1bb249e241db', 'c0df7788-c022-4195-83bc-99a23f4b3eb2');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('1fefecb3-082a-4fba-9cf3-49d8e247a3e9', '11641371-4188-4e81-9f9d-b86ab110287f');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('0225402b-ce96-48a7-993b-569849ba3412', 'a93a4380-34ed-4cff-ad40-a11419ae6dea');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('8783f5db-43e8-4f11-b047-b2e0580922f4', 'a266879e-ba9a-41b0-b975-04fb56637cb5');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('4cd097d0-dddb-4a46-849c-1ad5f15a0cf4', 'da2bc3d8-789f-466c-a6d9-2ca267f95c9d');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('1fefecb3-082a-4fba-9cf3-49d8e247a3e9', '048c3d45-1a72-4db9-a4c6-ddd93ceb11c2');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('2cf04d33-7fef-40eb-888d-4f54bc74d2ca', '7d24239c-60c2-4cee-b307-80f20274298f');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('3e10c240-860e-4254-9ac8-f02e6dd1330e', '99d3e5fb-085b-44f2-b034-b09c8d836507');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('13768425-c4ad-4821-8c43-c3d3ceda8a8f', '0ffb0d67-c7a3-4c5a-9968-32ea899667a6');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('7b37f96b-626f-4250-be55-34b85634f6c6', '815b5ee7-21d3-4241-9197-2ef5422ad982');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('4cd097d0-dddb-4a46-849c-1ad5f15a0cf4', '9ecc9d96-ee6e-4631-83c5-6987674f9136');
INSERT INTO ShowsRooms (id_show, id_room) VALUES ('4cd097d0-dddb-4a46-849c-1ad5f15a0cf4', 'c02b509b-97c1-4e58-90b6-94a99e68ad3d');

INSERT INTO Payments (id_payment, purchase_date, id_user, id_show) VALUES ('39bb71c2-1451-4767-a579-f74d972c9a05', '2022-04-21', 'f824a605-24e2-453c-a5ea-1858662d02ad', '32ef7d0f-9117-4126-9342-e4ea61979d91');
INSERT INTO Payments (id_payment, purchase_date, id_user, id_show) VALUES ('1c0de4b6-bc9d-446d-99ac-3054b26dff3a', '2022-04-21', '483289d2-a6a6-4fc6-8af3-6a5ce6abaad6', '7db0f5da-e91f-4c65-ba08-4275ac39bd6d');
INSERT INTO Payments (id_payment, purchase_date, id_user, id_show) VALUES ('cebdc0e4-4df4-4486-9284-978e7e909cc5', '2022-04-18', '2f1ede26-ff73-42f4-8bc0-516d74c4de31', '56f5ea54-7c5f-4406-ac45-b462a4d7a47e');
INSERT INTO Payments (id_payment, purchase_date, id_user, id_show) VALUES ('34975348-dba8-48be-b83a-51dcf2395d4a', '2022-04-18', 'b6a9bd3d-b79d-4c5e-aa7f-f796afeb244b', '30c094fc-45ba-4458-8e75-af4f0849ffe3');
INSERT INTO Payments (id_payment, purchase_date, id_user, id_show) VALUES ('bfdf0bee-2396-4ab3-9c94-79f44accbca4', '2022-04-20', '84a96db6-6308-4723-8762-522bb5d6fff6', '06b8b3d7-6503-4b34-bfef-9dac513977bc');
INSERT INTO Payments (id_payment, purchase_date, id_user, id_show) VALUES ('ea88b6fb-e166-49f5-8b88-8267a80b5989', '2022-04-21', 'a2c489ac-eed4-4fce-812a-54a71d5e918f', '8783f5db-43e8-4f11-b047-b2e0580922f4');
INSERT INTO Payments (id_payment, purchase_date, id_user, id_show) VALUES ('701f2ecf-5b64-4ff5-9656-2a485fb2099e', '2022-04-20', '2ce014ae-d659-493b-956a-132fc9624196', '13768425-c4ad-4821-8c43-c3d3ceda8a8f');
INSERT INTO Payments (id_payment, purchase_date, id_user, id_show) VALUES ('93f6cf89-312a-401e-b1fe-8604a052e890', '2022-04-19', '8fac16cb-a47c-4d2b-9c68-b315c817c5fd', '32ef7d0f-9117-4126-9342-e4ea61979d91');
INSERT INTO Payments (id_payment, purchase_date, id_user, id_show) VALUES ('0da38005-c9d6-4545-8ce0-5b33e4ae5246', '2022-04-21', 'f20f72f6-a6d3-458b-b6c0-f5d93f0e2e6b', '30c094fc-45ba-4458-8e75-af4f0849ffe3');
INSERT INTO Payments (id_payment, purchase_date, id_user, id_show) VALUES ('7eddbdf0-050a-46ce-964c-58b6ce4b94ee', '2022-04-17', 'f1cb266f-2582-4a86-84bf-7321e90e42e2', '56f5ea54-7c5f-4406-ac45-b462a4d7a47e');

INSERT INTO Tickets (id_ticket, quantity, id_payment, id_pricelist, id_theater) VALUES ('5b1dddd6-f29b-4fd6-9579-4b4bbff90f0c', 1, '39bb71c2-1451-4767-a579-f74d972c9a05', 1, '0ab83364-9fb7-4565-8228-17a8a8f5d6d5');
INSERT INTO Tickets (id_ticket, quantity, id_payment, id_pricelist, id_theater) VALUES ('9f362485-3f06-429a-8607-02cc9891b40c', 5, '1c0de4b6-bc9d-446d-99ac-3054b26dff3a', 2, 'b325c851-19c5-4825-a489-f425401d56bd');
INSERT INTO Tickets (id_ticket, quantity, id_payment, id_pricelist, id_theater) VALUES ('9808d6bb-256c-4c08-8505-1f9ac051bc71', 2, 'cebdc0e4-4df4-4486-9284-978e7e909cc5', 1, '0ab83364-9fb7-4565-8228-17a8a8f5d6d5');
INSERT INTO Tickets (id_ticket, quantity, id_payment, id_pricelist, id_theater) VALUES ('4ea33dca-d9ef-46e2-941c-82440183e782', 2, 'cebdc0e4-4df4-4486-9284-978e7e909cc5', 3, '0ab83364-9fb7-4565-8228-17a8a8f5d6d5');
INSERT INTO Tickets (id_ticket, quantity, id_payment, id_pricelist, id_theater) VALUES ('4644335e-884f-4d7b-86b3-c7bfe95be340', 2, '34975348-dba8-48be-b83a-51dcf2395d4a', 2, 'b377053a-8a25-4f05-b9c8-654ac40c7e35');
INSERT INTO Tickets (id_ticket, quantity, id_payment, id_pricelist, id_theater) VALUES ('229c4707-75d1-4ac8-b544-e898d2699af2', 1, 'bfdf0bee-2396-4ab3-9c94-79f44accbca4', 1, '5bd92a7d-41a7-48b6-bd37-3a883e9c2c8f');
INSERT INTO Tickets (id_ticket, quantity, id_payment, id_pricelist, id_theater) VALUES ('fb5a86c2-f371-4cb8-8db8-a76f782c0f27', 1, 'ea88b6fb-e166-49f5-8b88-8267a80b5989', 1, '2d951054-85be-4ebe-bb86-dbfbefabf61a');
INSERT INTO Tickets (id_ticket, quantity, id_payment, id_pricelist, id_theater) VALUES ('e7755584-66fe-45be-9fc7-fe973491abd9', 1, 'ea88b6fb-e166-49f5-8b88-8267a80b5989', 3, '2d951054-85be-4ebe-bb86-dbfbefabf61a');
INSERT INTO Tickets (id_ticket, quantity, id_payment, id_pricelist, id_theater) VALUES ('c8b2dc7c-fd18-4850-8bf5-9cd27f59bdb8', 3, '701f2ecf-5b64-4ff5-9656-2a485fb2099e', 2, '9b94391c-8da7-4788-8dc4-2da81376499f');
INSERT INTO Tickets (id_ticket, quantity, id_payment, id_pricelist, id_theater) VALUES ('5fbd05fd-2deb-4e6e-8dc1-58b21580c429', 2, '93f6cf89-312a-401e-b1fe-8604a052e890', 1, '5bd92a7d-41a7-48b6-bd37-3a883e9c2c8f');
INSERT INTO Tickets (id_ticket, quantity, id_payment, id_pricelist, id_theater) VALUES ('32794eb4-aeda-48e1-a9d5-afd7a9c1076e', 1, '93f6cf89-312a-401e-b1fe-8604a052e890', 2, '5bd92a7d-41a7-48b6-bd37-3a883e9c2c8f');
INSERT INTO Tickets (id_ticket, quantity, id_payment, id_pricelist, id_theater) VALUES ('d737cecb-6ca1-4b48-8c68-99b9807f8bb9', 1, '0da38005-c9d6-4545-8ce0-5b33e4ae5246', 1, 'b377053a-8a25-4f05-b9c8-654ac40c7e35');
INSERT INTO Tickets (id_ticket, quantity, id_payment, id_pricelist, id_theater) VALUES ('04920409-f864-433a-a0d2-49a929989f71', 3, '0da38005-c9d6-4545-8ce0-5b33e4ae5246', 3, 'b377053a-8a25-4f05-b9c8-654ac40c7e35');
INSERT INTO Tickets (id_ticket, quantity, id_payment, id_pricelist, id_theater) VALUES ('ad13ca43-7f98-4021-a3aa-64e2b2ea4176', 2, '7eddbdf0-050a-46ce-964c-58b6ce4b94ee', 2, '0ab83364-9fb7-4565-8228-17a8a8f5d6d5');

/**********************************************************************************************/

/* Affiche toutes les séances de tous les cinémas */
SELECT name as Theater_name, date, title as Movie_title, room_nb as Room from Shows
INNER JOIN ShowsRooms ON Shows.id_show = ShowsRooms.id_show
INNER JOIN Rooms ON ShowsRooms.id_room = Rooms.id_room
INNER JOIN Theaters ON Rooms.id_theater = Theaters.id_theater
INNER JOIN Movies ON Shows.id_movie = Movies.id_movie
ORDER BY Theaters.name, Shows.date;

/* Affiche les administrateurs et managers */
SELECT firstname, lastname, email, content, name FROM UsersTheaters
INNER JOIN UsersRoles ON UsersTheaters.id_user = UsersRoles.id_user
INNER JOIN Users ON UsersTheaters.id_user = Users.id_user
INNER JOIN Theaters ON UsersTheaters.id_theater = Theaters.id_theater
INNER JOIN Roles ON UsersRoles.id_role = Roles.id_role;

/* Affiche les clients */
SELECT firstname, lastname, email, content FROM Users
INNER JOIN UsersRoles ON Users.id_user = UsersRoles.id_user
INNER JOIN Roles ON UsersRoles.id_role = Roles.id_role
WHERE content = 'Customer';

/* Affiche tous les paiements des clients avec la séance et les tickets achetés */
SELECT lastname, firstname, email, Roles.content as role_content, name as Theater_name, title as Movie_title, 
date as Show_date, purchase_date, PricesList.content as ticket_content, quantity, price, (quantity * price) as Total FROM Payments
INNER JOIN Users ON Payments.id_user = Users.id_user
INNER JOIN UsersRoles ON Users.id_user = UsersRoles.id_user
INNER JOIN Roles ON UsersRoles.id_role = Roles.id_role
INNER JOIN Shows ON Payments.id_show = Shows.id_show
INNER JOIN ShowsRooms ON Shows.id_show = ShowsRooms.id_show
INNER JOIN Rooms ON ShowsRooms.id_room = Rooms.id_room
INNER JOIN Theaters ON Rooms.id_theater = Theaters.id_theater
INNER JOIN Movies ON Shows.id_movie = Movies.id_movie
INNER JOIN Tickets ON Payments.id_payment = Tickets.id_payment AND Theaters.id_theater = Tickets.id_theater
INNER JOIN PricesList ON Tickets.id_pricelist = PricesList.id_pricelist;