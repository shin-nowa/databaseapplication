module.exports = {
  showHome: (req, res) => {
    res.render('index', {
      title: 'Sistema de Varejo',
      subtitle: 'Escolha o banco de dados que deseja visualizar os dados:',
      links: [
        { name: 'PostgreSQL', url: '/postgres/all-data' },
        { name: 'MySQL', url: '/mysql/all-data' }
      ]
    });
  }
};