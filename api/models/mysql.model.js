const mysql = require('mysql');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '128256',
  database: 'VarejoBase',
});

connection.connect((err) => {
  if (err) throw err;
  console.log('Conectado ao MySQL!');
});

module.exports = {
  /**
   * Retorna uma lista com todas as tabelas do banco
   */
  getAllTables: async () => {
    return new Promise((resolve, reject) => {
      connection.query('SHOW TABLES', (error, results) => {
        if (error) return reject(error);
        const tables = results.map(row => Object.values(row)[0]);
        resolve(tables);
      });
    });
  },

  /**
   * Retorna todos os dados de uma tabela específica
   */
  getAllDataFromTable: async (tableName) => {
    return new Promise((resolve, reject) => {
      const query = `SELECT * FROM \`${tableName}\``;
      connection.query(query, (error, results) => {
        if (error) return reject(error);
        resolve(results);
      });
    });
  },
};