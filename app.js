import express, { Router } from 'express';
import router from './app/routes/main.route.js';

const app = express();
const PORT = process.env.APP_PORT || 3000;

app.set('view engine', 'ejs');
app.set('views', './app/views');

app.use(express.static('public'));
app.use(express.urlencoded());
app.use(express.json());

// On importe les routes 
app.use('/', router);

// Middleware pour gérer les routes non trouvées (404)
app.use((req, res, next) => {
    res.status(404).render('404', { 
        message: `La page "${req.originalUrl}" n'existe pas.` 
    });
});


app.listen(PORT, () => {
    console.log(`Le serveur à démarrer sur le port : http://localhost:${PORT}`);
})