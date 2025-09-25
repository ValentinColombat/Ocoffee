import express, { Router } from 'express';
import client from './db/client.js';
// import dotenv from 'dotenv'
import router from './app/routes/index.route.js';

const app = express();
const PORT = process.env.APP_PORT || 3000;

app.set('view engine', 'ejs');
app.set('views', './app/views');

app.use(express.static('public'));
app.use(express.urlencoded());
app.use(express.json());

// On importe les routes 
app.use('/', router); 
app.use ('/catalogue', router);

app.listen(PORT, () => {
    console.log(`Le serveur à démarrer sur le port : http://localhost:${PORT}`);
})