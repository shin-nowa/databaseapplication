const express = require('express');
const app = express();
const PORT = 3000;

// Usando EJS como motor de template
app.use(express.static('public'));
app.set('view engine', 'ejs');
app.set('views', './views');

// Servir arquivos estáticos (CSS)
app.use(express.static('public'));

// Rotas
app.use('/postgres', require('./routes/postgres.routes'));
app.use('/mysql', require('./routes/mysql.routes'));
app.use('/', require('./routes/home.routes')); // Home route

app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});