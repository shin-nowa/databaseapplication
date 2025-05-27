// controllers/mysql.controller.js
const mysqlModel = require('../models/mysql.model');

module.exports = {
  getAllData: async (req, res) => {
    try {
      const tables = await mysqlModel.getAllTables();
      const allData = {};

      for (const table of tables) {
        const data = await mysqlModel.getAllDataFromTable(table);
        allData[table] = data;
      }

      // Renderiza o template EJS reutilizado
      res.render('all-data', {
        title: 'MySQL',
        data: allData
      });

    } catch (error) {
      res.status(500).send('Erro ao carregar dados do MySQL');
    }
  },
};