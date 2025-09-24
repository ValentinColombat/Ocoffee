import express from 'express';

const app = express();
const PORT = 3000;

app.set('view engine', 'ejs');
app.set('views', './views');
app.use(express.static('public'));

app.get ('/', (req,res) => {
    res.send('Hello World !');
})

app.listen(PORT, () => {
    console.log(`Le serveur à démarrer sur le port : http://localhost:${PORT}`);
})