const express = require('express');
const mysqlRoutes = require('./routes/mysql.routes');
const pgRoutes = require('./routes/postgres.routes');

// ✅ Criamos a aplicação Express aqui
const app = express();

// Rotas
app.use('/mysql', mysqlRoutes);
app.use('/postgres', pgRoutes);

// ✅ Exportamos a instância do app
module.exports = app;