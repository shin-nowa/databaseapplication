const { Pool } = require('pg');

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'dw_varejo',
  password: '128256',
  port: 5432,
});

module.exports = {
  /**
   * Retorna uma lista com todas as tabelas do esquema 'public'
   */
  getAllTables: async () => {
    try {
      const result = await pool.query(`
        SELECT table_name 
        FROM information_schema.tables 
        WHERE table_schema = 'public'
      `);
      return result.rows.map(row => row.table_name);
    } catch (error) {
      throw new Error(`Erro ao buscar tabelas: ${error.message}`);
    }
  },

  /**
   * Retorna todos os dados de uma tabela específica
   */
  getAllDataFromTable: async (tableName) => {
    try {
      const query = `SELECT * FROM "${tableName}"`;
      const result = await pool.query(query);
      return result.rows;
    } catch (error) {
      throw new Error(`Erro ao buscar dados da tabela ${tableName}: ${error.message}`);
    }
  },
};