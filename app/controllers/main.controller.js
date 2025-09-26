import client from '../../db/client.js';

const mainController = {
    async homepage (req,res) {
        try {
            const result = await client.query(`
            SELECT 
                CAFE.nom,
                CAFE.reference,
                CAFE.prix_kg,
                PAYS.origine,
                CARACTERISTIQUES.description_cafe
            FROM CAFE
            LEFT JOIN PAYS ON CAFE.code_cafe = PAYS.code_cafe
            LEFT JOIN CARACTERISTIQUES ON CAFE.code_cafe = CARACTERISTIQUES.code_cafe
            WHERE CAFE.disponibilite = true
            ORDER BY CAFE.prix_kg DESC
            LIMIT 8
            `);
            res.render('home', { coffees: result.rows });
        } catch (error) {
            console.error('Erreur:', error);
            res.status(500).render('404', { message: 'Une erreur est survenue lors du chargement de la page d\'accueil.' });
        }
    },

    async catalog (req,res) {
        try {
            const result = await client.query(`
                SELECT 
                    CAFE.nom,
                    CAFE.reference,
                    CAFE.prix_kg,
                    CAFE.disponibilite,
                    PAYS.origine,
                    CARACTERISTIQUES.description_cafe
                FROM CAFE
                LEFT JOIN PAYS ON CAFE.code_cafe = PAYS.code_cafe
                LEFT JOIN CARACTERISTIQUES ON CAFE.code_cafe = CARACTERISTIQUES.code_cafe
                ORDER BY CAFE.nom
            `);
            res.render('catalog', { coffees: result.rows });
        } catch (error) {
            console.error('Erreur:', error);
            res.status(500).render('404', { message: 'Une erreur est survenue lors du chargement du catalogue.' });
        }
    },

    async product (req, res) {
        try {
            const reference = req.params.reference;
            const result = await client.query(`
                SELECT 
                    CAFE.nom,
                    CAFE.reference,
                    CAFE.prix_kg,
                    CAFE.disponibilite,
                    PAYS.origine,
                    CARACTERISTIQUES.description_cafe
                FROM CAFE
                LEFT JOIN PAYS ON CAFE.code_cafe = PAYS.code_cafe
                LEFT JOIN CARACTERISTIQUES ON CAFE.code_cafe = CARACTERISTIQUES.code_cafe
                WHERE CAFE.reference = $1
            `, [reference]);
            
            if (result.rows.length === 0) {
                return res.status(404).render('404', { message: 'Café non trouvé' });
            }
            
            res.render('product', { coffee: result.rows[0] });
        } catch (error) {
            console.error('Erreur:', error);
            res.status(500).render('404', { message: 'Une erreur est survenue lors du chargement du café.' });
        }
    }
};

export default mainController