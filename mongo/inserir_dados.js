// Carrega módulos
const fs = require("fs");

// Conecta ao banco
const db = connect("mongodb://localhost:27017/VarejoMongo");

// === Função utilitária ===
function carregarJSON(caminho) {
  return JSON.parse(fs.readFileSync(caminho));
}

// === Comentários ===
const comentarios = carregarJSON("comentarios.json");

comentarios.forEach((comentario) => {
  const existe = db.comentarios.findOne({
    cpf_cliente: comentario.cpf_cliente,
    id_produto: comentario.id_produto
  });

  if (!existe) {
    comentario.data_comentario = new Date(comentario.data_comentario.$date);
    db.comentarios.insertOne(comentario);
    print(`✔ Comentário de ${comentario.nome_cliente} inserido.`);
  } else {
    print(`⚠ Comentário já existe: ${comentario.nome_cliente}`);
  }
});

// === Imagens de Produto ===
const imagens = carregarJSON("produto_imagem.json");

imagens.forEach((img) => {
  const existe = db.imagem_produto.findOne({
    id_produto: img.id_produto,
    url: img.url
  });

  if (!existe) {
    db.imagem_produto.insertOne(img);
    print(`🖼️ Imagem inserida para produto ${img.id_produto}`);
  } else {
    print(`⚠ Imagem já existente para produto ${img.id_produto}`);
  }
});

print("✨ Inserção finalizada com sucesso ✨");
