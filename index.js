//necessari per utilitzar .env
require('dotenv').config();

const express = require('express');
const { Sequelize, DataTypes } = require('sequelize');
const cors = require('cors')

//inicialitzem API 
const app = express();
//utilitzarem JSON
app.use(express.json());
//activem cors per si de cas
app.use(cors());

//el port es pot definir en un arxiu extern .env
const PORT = process.env.PORT || 3000;


// INICIALITZACIO BASE DE DADES

// creem instancia de sequelize, indicant base de dades
// en l'exemple: tipus sqlite, desada en memoria (s'esborra cada vegada)
const sequelize = new Sequelize({
    dialect: 'sqlite',
    storage: ':memory:',
});

// Definim model d'usuari (exemple, no és imprescindible)
const Usuari = sequelize.define('Usuari', {
    nom: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
    },
    email: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
    },
});


// connectem a base de dades i creem un primer usuari
async function iniDB() {
    await sequelize.sync({ force: true });
    await Usuari.create({ nom: "joan daixonses", email: "joan.daixonses@gmail.com" });
    console.log('Base de dades en marxa!');
}

iniDB();

//DEFINICIO DE LES RUTES DE LA API

// GET de tots els usuaris
app.get('/usuaris', async (req, res) => {
    const usuaris = await Usuari.findAll();
    res.json(usuaris);
});

// POST de un usuari (CREAR)
// important! per fer el POST caldrà establir el paràmetre Content-Type=application/json
app.post('/usuaris', async (req, res) => {
    const { nom, email } = req.body;
    //important fer try per si de cas peta la promise "create"
    try {
        // Usuari.create és una promise, amb await ens esperem
        // mètode create ve del model sequelize...
        const newUsuari = await Usuari.create({ nom, email });
        res.json(newUsuari);
    } catch (error) {
        // si dona error, el retornem al "front"
        res.status(400).json({ error: error.message });
    }
});

// GET d'un usuari
app.get('/usuaris/:id', async (req, res) => {
    const id_usuari = req.params.id;

    try {
        //findByPk cerca id d'usuari
        const usuari = await Usuari.findByPk(id_usuari);
        if (usuari) {
            // si el trobem, el tornem
            res.json(usuari);
        } else {
            //si no, tornem un error 
            res.status(404).json({ error: 'Usuari no trobat' });
        }
    } catch (error) {
        // per si hi ha un error de sistema/bdd...
        res.status(400).json({ error: error.message });
    }
});

//PUT d'un usuari, es modifica sencer
app.put('/usuaris/:id', async (req, res) => {
    const id_usuari = req.params.id;
    const { nom, email } = req.body;

    try {
        //cerquem
        const usuari = await Usuari.findByPk(id_usuari);
        if (usuari) {
            //si trobem, actualitzem amb dades rebudes
            await usuari.update({ nom, email });
            res.json(usuari);
        } else {
            res.status(404).json({ error: 'Usuari not found' });
        }
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

//PATCH d'un usuari, modifiquem només si ens arriba el valor
app.patch('/usuaris/:id', async (req, res) => {
    const id_usuari = req.params.id;
    const { nom, email } = req.body;

    try {
        //cerquem...
        const usuari = await Usuari.findByPk(id_usuari);
        if (usuari) {
            //si trobem, actualitzem només si nom, email contenen quelcom; si no ho deixem com estava
            await usuari.update({ nom: nom || usuari.nom, email: email || usuari.email });
            res.json(usuari);
        } else {
            res.status(404).json({ error: 'Usuari not found' });
        }
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

//DELETE: eliminem usuari
app.delete('/usuaris/:id', async (req, res) => {
    const id_usuari = req.params.id;

    try {
        //cerquem...
        const usuari = await Usuari.findByPk(id_usuari);
        if (usuari) {
            //si trobat, l'eliminem
            await usuari.destroy();
            res.json({ message: 'Usuari eliminat' }); //status 200 per defecte!
        } else {
            res.status(404).json({ error: 'Usuari no trobat' });
        }
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

// Start the server
app.listen(PORT, () => {
    console.log(`Servidor funcionant en port ${PORT}`);
});
