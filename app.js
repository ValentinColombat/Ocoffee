import express from 'express';
import client from './db/client.js';
import dotenv from 'dotenv';
dotenv.config();

const app = express();
const PORT = process.env.APP_PORT || 3000;

app.set('view engine', 'ejs');
app.set('views', './views');
app.use(express.static('public'));

app.get ('/', (req,res) => {
    res.send('Hello World !');
})

app.listen(PORT, () => {
    console.log(`Le serveur à démarrer sur le port : http://localhost:${PORT}`);
})