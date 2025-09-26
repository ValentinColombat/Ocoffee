-- Script de vérification des données OCoffee
-- Ce script permet de vérifier que toutes les données ont été correctement insérées

-- 1. Vérification du nombre d'enregistrements par table
SELECT 'CAFÉ' as table_name, COUNT(*) as nb_enregistrements FROM CAFE
UNION ALL
SELECT 'PAYS' as table_name, COUNT(*) as nb_enregistrements FROM PAYS
UNION ALL
SELECT 'CARACTERISTIQUES' as table_name, COUNT(*) as nb_enregistrements FROM CARACTERISTIQUES;

-- 2. Vérification des contraintes de clés étrangères
SELECT 'Vérification des relations PAYS-CAFE' as verification;
SELECT COUNT(*) as relations_correctes 
FROM PAYS p 
JOIN CAFE c ON p.code_cafe = c.code_cafe;

SELECT 'Vérification des relations CARACTERISTIQUES-CAFE' as verification;
SELECT COUNT(*) as relations_correctes 
FROM CARACTERISTIQUES car 
JOIN CAFE c ON car.code_cafe = c.code_cafe;

-- 3. Affichage des données complètes avec jointures
SELECT 
    c.code_cafe,
    c.nom,
    c.reference,
    c.prix_kg,
    c.disponibilite,
    p.origine,
    car.description_cafe as caracteristiques
FROM CAFE c
LEFT JOIN PAYS p ON c.code_cafe = p.code_cafe
LEFT JOIN CARACTERISTIQUES car ON c.code_cafe = car.code_cafe
ORDER BY c.nom;

-- 4. Statistiques par disponibilité
SELECT 
    CASE 
        WHEN disponibilite = true THEN 'Disponible'
        ELSE 'Non disponible'
    END as statut,
    COUNT(*) as nombre,
    ROUND(AVG(prix_kg), 2) as prix_moyen,
    MIN(prix_kg) as prix_min,
    MAX(prix_kg) as prix_max
FROM CAFE
GROUP BY disponibilite;

-- 5. Top 5 des cafés les plus chers
SELECT 
    c.nom,
    p.origine,
    c.prix_kg,
    car.description_cafe
FROM CAFE c
JOIN PAYS p ON c.code_cafe = p.code_cafe
JOIN CARACTERISTIQUES car ON c.code_cafe = car.code_cafe
ORDER BY c.prix_kg DESC
LIMIT 5;
