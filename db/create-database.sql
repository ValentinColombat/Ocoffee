
-- Création de la table CAFE 
CREATE TABLE CAFE (
code_cafe VARCHAR(20) PRIMARY KEY,
nom VARCHAR (100) NOT NULL,
description_cafe TEXT,
reference VARCHAR(50),
prix_kg DECIMAL(10,2),
disponibilite BOOLEAN DEFAULT TRUE
);

-- Création de la table PAYS 

CREATE TABLE PAYS (
    code_pays VARCHAR(20) PRIMARY KEY,
    origine VARCHAR(100) NOT NULL,
    code_cafe VARCHAR(20) REFERENCES CAFE(code_cafe)

);

-- Création de la table CARACTERISTIQUES
CREATE TABLE CARACTERISTIQUES (
    code_caracteristique VARCHAR(20) PRIMARY KEY,
    description_cafe VARCHAR(255) NOT NULL,
    code_cafe VARCHAR(20) REFERENCES CAFE(code_cafe)
);
