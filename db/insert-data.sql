-- Script d'insertion des données OCoffee
-- Basé sur le fichier 04.ocoffee-dataset.md

-- Insertion des cafés dans la table CAFE
INSERT INTO CAFE (code_cafe, nom, description_cafe, reference, prix_kg, disponibilite) VALUES
('CAF001', 'Espresso', 'Café fort et concentré préparé en faisant passer de l''eau chaude à travers du café finement moulu.', '100955890', 20.99, true),
('CAF002', 'Columbian', 'Café moyennement corsé avec une acidité vive et une saveur riche.', '100955894', 18.75, true),
('CAF003', 'Ethiopian Yirgacheffe', 'Réputé pour son arôme floral, son acidité vive et ses notes de saveur citronnée.', '105589090', 22.50, true),
('CAF004', 'Brazilian Santos', 'Café doux et lisse avec un profil de saveur de noisette.', '134009550', 17.80, true),
('CAF005', 'Guatemalan Antigua', 'Café corsé avec des nuances chocolatées et une pointe d''épice.', '256505890', 21.25, true),
('CAF006', 'Kenyan AA', 'Café complexe connu pour son acidité rappelant le vin et ses saveurs fruitées.', '295432730', 23.70, true),
('CAF007', 'Sumatra Mandheling', 'Café profond et terreux avec un corps lourd et une faible acidité.', '302932754', 19.95, true),
('CAF008', 'Costa Rican Tarrazu', 'Café vif et net avec une finition propre et une acidité vive.', '327302954', 24.50, true),
('CAF009', 'Vietnamese Robusta', 'Café audacieux et fort avec une saveur robuste distinctive.', '549549090', 16.75, true),
('CAF010', 'Tanzanian Peaberry', 'Acidité vive avec un profil de saveur rappelant le vin et un corps moyen.', '582954954', 26.80, true),
('CAF011', 'Jamaican Blue Mountain', 'Reconnu pour sa saveur douce, son acidité vive et son absence d''amertume.', '589100954', 39.25, true),
('CAF012', 'Rwandan Bourbon', 'Café avec des notes florales prononcées, une acidité vive et un corps moyen.', '650753915', 21.90, true),
('CAF013', 'Panamanian Geisha', 'Café rare aux arômes floraux complexes, une acidité brillante et un profil de saveur distinctif.', '795501340', 42.00, true),
('CAF014', 'Peruvian Arabica', 'Café équilibré avec des notes de chocolat, une acidité modérée et un corps velouté.', '954589100', 19.40, false),
('CAF015', 'Hawaiian Kona', 'Café rare au goût riche, une acidité douce et des nuances subtiles.', '958090105', 55.75, false),
('CAF016', 'Nicaraguan Maragogipe', 'Café avec des notes de fruits, une acidité vive et un corps plein.', '691550753', 28.60, false);

-- Insertion des pays/origines dans la table PAYS
INSERT INTO PAYS (code_pays, origine, code_cafe) VALUES
('PAY001', 'Italie', 'CAF001'),
('PAY002', 'Colombie', 'CAF002'),
('PAY003', 'Éthiopie', 'CAF003'),
('PAY004', 'Brésil', 'CAF004'),
('PAY005', 'Guatemala', 'CAF005'),
('PAY006', 'Kenya', 'CAF006'),
('PAY007', 'Indonésie', 'CAF007'),
('PAY008', 'Costa Rica', 'CAF008'),
('PAY009', 'Vietnam', 'CAF009'),
('PAY010', 'Tanzanie', 'CAF010'),
('PAY011', 'Jamaïque', 'CAF011'),
('PAY012', 'Rwanda', 'CAF012'),
('PAY013', 'Panama', 'CAF013'),
('PAY014', 'Pérou', 'CAF014'),
('PAY015', 'Hawaï', 'CAF015'),
('PAY016', 'Nicaragua', 'CAF016');

-- Insertion des caractéristiques dans la table CARACTERISTIQUES
INSERT INTO CARACTERISTIQUES (code_caracteristique, description_cafe, code_cafe) VALUES
('CAR001', 'Corsé, Épicé', 'CAF001'),
('CAR002', 'Acide', 'CAF002'),
('CAR003', 'Doux, Fruité', 'CAF003'),
('CAR004', 'Doux', 'CAF004'),
('CAR005', 'Corsé', 'CAF005'),
('CAR006', 'Doux, Acide', 'CAF006'),
('CAR007', 'Corsé', 'CAF007'),
('CAR008', 'Acide', 'CAF008'),
('CAR009', 'Épicé', 'CAF009'),
('CAR010', 'Fruité, Corsé', 'CAF010'),
('CAR011', 'Doux', 'CAF011'),
('CAR012', 'Fruité', 'CAF012'),
('CAR013', 'Fruité', 'CAF013'),
('CAR014', 'Corsé, Chocolaté', 'CAF014'),
('CAR015', 'Doux', 'CAF015'),
('CAR016', 'Corsé, Fruité', 'CAF016');

-- Vérification des données insérées
SELECT 'CAFÉS INSÉRÉS' as info, COUNT(*) as total FROM CAFE;
SELECT 'PAYS INSÉRÉS' as info, COUNT(*) as total FROM PAYS;
SELECT 'CARACTÉRISTIQUES INSÉRÉES' as info, COUNT(*) as total FROM CARACTERISTIQUES;

-- Statistiques par disponibilité
SELECT 'CAFÉS DISPONIBLES' as info, COUNT(*) as total FROM CAFE WHERE disponibilite = true;
SELECT 'CAFÉS NON DISPONIBLES' as info, COUNT(*) as total FROM CAFE WHERE disponibilite = false;

-- Affichage d'un échantillon des données
SELECT 
    c.nom,
    c.prix_kg,
    p.origine,
    car.description_cafe as caracteristiques,
    c.disponibilite
FROM CAFE c
JOIN PAYS p ON c.code_cafe = p.code_cafe
JOIN CARACTERISTIQUES car ON c.code_cafe = car.code_cafe
ORDER BY c.prix_kg DESC
LIMIT 5;
