CREATE TABLE Plantas
(
	plantaID int NOT NULL UNIQUE AUTO_INCREMENT,
	fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    trasladoID int NOT NULL,
    zonaID int NOT NULL,
    cuentaID int NOT NULL,
    PRIMARY KEY (plantaID),
    FOREIGN KEY (trasladoID ) REFERENCES Traslado (trasladoID ) ON DELETE RESTRICT,
    FOREIGN KEY (zonaID) REFERENCES Zonas (zonaID) ON DELETE CASCADE,
   	FOREIGN KEY (cuentaID) REFERENCES Cuentas (cuentaID) ON DELETE CASCADE
);


CREATE TABLE PlantasMadre
(
    plantaMadreID int NOT NULL UNIQUE AUTO_INCREMENT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    trasladoID int NOT NULL,
    zonaID int NOT NULL,
    cuentaID int NOT NULL,
    PRIMARY KEY (plantaMadreID),
    FOREIGN KEY (trasladoID ) REFERENCES Traslado (trasladoID ) ON DELETE RESTRICT,
    FOREIGN KEY (zonaID) REFERENCES Zonas (zonaID) ON DELETE CASCADE,
    FOREIGN KEY (cuentaID) REFERENCES Cuentas (cuentaID) ON DELETE CASCADE
);

CREATE TABLE LotesPlantula
(
    lotePlantulaID int NOT NULL UNIQUE AUTO_INCREMENT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    trasladoID int NOT NULL,
    zonaID int NOT NULL,
    cuentaID int NOT NULL,
    PRIMARY KEY (lotePlantulaID),
    FOREIGN KEY (trasladoID ) REFERENCES Traslado (trasladoID ) ON DELETE RESTRICT,
    FOREIGN KEY (zonaID) REFERENCES Zonas (zonaID) ON DELETE CASCADE,
    FOREIGN KEY (cuentaID) REFERENCES Cuentas (cuentaID) ON DELETE CASCADE
);

CREATE TABLE LotesSemillas
(
    loteSemillaID int NOT NULL UNIQUE AUTO_INCREMENT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    trasladoID int NOT NULL,
    zonaID int NOT NULL,
    cuentaID int NOT NULL,
    PRIMARY KEY (loteSemillaID),
    FOREIGN KEY (trasladoID ) REFERENCES Traslado (trasladoID ) ON DELETE RESTRICT,
    FOREIGN KEY (zonaID) REFERENCES Zonas (zonaID) ON DELETE CASCADE,
    FOREIGN KEY (cuentaID) REFERENCES Cuentas (cuentaID) ON DELETE CASCADE
);

CREATE TABLE planta_especie
(
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    plantaID int NOT NULL UNIQUE AUTO_INCREMENT,
    EspID int NOT NULL,
    PRIMARY KEY (plantaID, EspID, fecha),
    FOREIGN KEY (plantaID) REFERENCES Plantas(plantaID),
    FOREIGN KEY (EspID) REFERENCES Especie(EspID)
);

CREATE TABLE plantaMadre_especie
(
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    plantaMadreID int NOT NULL UNIQUE AUTO_INCREMENT,
    EspID int NOT NULL,
    PRIMARY KEY (plantaMadreID, EspID, fecha),
    FOREIGN KEY (plantaMadreID) REFERENCES PlantasMadre(plantaMadreID),
    FOREIGN KEY (EspID) REFERENCES Especie(EspID)
);

CREATE TABLE lotePlantula_especie
(
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lotePlantulaID int NOT NULL UNIQUE AUTO_INCREMENT,
    EspID int NOT NULL,
    PRIMARY KEY (lotePlantulaID, EspID, fecha),
    FOREIGN KEY (lotePlantulaID) REFERENCES LotesPlantula(lotePlantulaID),
    FOREIGN KEY (EspID) REFERENCES Especie(EspID)
);

CREATE TABLE loteSemillas_especie
(
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    loteSemillaID int NOT NULL UNIQUE AUTO_INCREMENT,
    EspID int NOT NULL,
    PRIMARY KEY (loteSemillaID, EspID, fecha),
    FOREIGN KEY (loteSemillaID) REFERENCES LotesSemillas(loteSemillaID),
    FOREIGN KEY (EspID) REFERENCES Especie(EspID)
);

# insert de plantas
INSERT into plantas(plantaID, fecha, trasladoID,zonaID,cuentaID) VALUES 
(NULL,NULL,6,1,3),
(NULL,NULL,7,1,3),
(NULL,NULL,6,1,3),
(NULL,NULL,7,1,3),
(NULL,NULL,6,1,3),
(NULL,NULL,7,1,3);

INSERT INTO planta_especie (fecha, plantaID, EspID) VALUES
(current_timestamp(), NULL,1),
(current_timestamp(), NULL,1),
(current_timestamp(), NULL,2),
(current_timestamp(), NULL,2),
(current_timestamp(), NULL,3),
(current_timestamp(), NULL,3);

# insert de plantas madre
INSERT into PlantasMadre(plantaMadreID, fecha, trasladoID,zonaID,cuentaID) VALUES 
(NULL,NULL,6,1,3),
(NULL,NULL,7,1,3),
(NULL,NULL,6,1,3),
(NULL,NULL,7,1,3),
(NULL,NULL,6,1,3),
(NULL,NULL,7,1,3);

INSERT INTO plantaMadre_especie (fecha, plantaMadreID, EspID) VALUES
(current_timestamp(), NULL,1),
(current_timestamp(), NULL,1),
(current_timestamp(), NULL,2),
(current_timestamp(), NULL,2),
(current_timestamp(), NULL,3),
(current_timestamp(), NULL,3);

# insert de lotes de plantula
INSERT into LotesPlantula(lotePlantulaID, fecha, trasladoID, zonaID, cuentaID) VALUES 
(NULL,NULL,6,1,3),
(NULL,NULL,7,1,3),
(NULL,NULL,6,1,3),
(NULL,NULL,7,1,3),
(NULL,NULL,6,1,3),
(NULL,NULL,7,1,3);

INSERT INTO lotePlantula_especie (fecha, lotePlantulaID, EspID) VALUES
(current_timestamp(), NULL,1),
(current_timestamp(), NULL,1),
(current_timestamp(), NULL,2),
(current_timestamp(), NULL,2),
(current_timestamp(), NULL,3),
(current_timestamp(), NULL,3);

# insert de lotes de semillas
INSERT into LotesSemillas(loteSemillaID, fecha, trasladoID, zonaID, cuentaID) VALUES 
(NULL,NULL,6,1,3),
(NULL,NULL,7,1,3),
(NULL,NULL,6,1,3),
(NULL,NULL,7,1,3),
(NULL,NULL,6,1,3),
(NULL,NULL,7,1,3);

INSERT INTO loteSemillas_especie (fecha, loteSemillaID, EspID) VALUES
(current_timestamp(), NULL,1),
(current_timestamp(), NULL,1),
(current_timestamp(), NULL,2),
(current_timestamp(), NULL,2),
(current_timestamp(), NULL,3),
(current_timestamp(), NULL,3);