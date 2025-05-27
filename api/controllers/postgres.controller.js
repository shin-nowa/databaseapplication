// controllers/postgres.controller.js
const postgresModel = require('../models/postgres.model');

module.exports = {
  getAllData: async (req, res) => {
    try {
      const tables = await postgresModel.getAllTables();
      const allData = {};

      for (const table of tables) {
        const data = await postgresModel.getAllDataFromTable(table);
        allData[table] = data;
      }

      res.render('all-data', { title: 'PostgreSQL', data: allData });
    } catch (error) {
      res.status(500).send('Erro ao carregar dados do PostgreSQL');
    }
  },
};