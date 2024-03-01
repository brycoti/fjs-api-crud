//necessari per utilitzar .env
require('dotenv').config();

const express = require('express');
const cors = require('cors')

//inicialitzem API 
const app = express();
//utilitzarem JSON
app.use(express.json());
//activem cors per si de cas
app.use(cors());

//el port es pot definir en un arxiu extern .env
const PORT = process.env.PORT || 3000;

const usuarisRouter = require('./usuariRouter');

app.use('/api/usuaris', usuarisRouter)


// Start the server
app.listen(PORT, () => {
    console.log(`Servidor funcionant en port ${PORT}`);
});
