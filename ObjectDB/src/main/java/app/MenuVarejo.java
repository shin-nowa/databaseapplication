package app;
// talvez tenhga algum erro aq, nao testei tudo ainda
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Scanner;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import modelo.*;

public class MenuVarejo {

    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("lojaPU");
    private static final Scanner scanner = new Scanner(System.in);

    public static void main(String[] args) {
        int opcao;

        do {
            System.out.println("\n=== SISTEMA DE VAREJO ===");
            System.out.println("1. Cadastrar Produto");
            System.out.println("2. Listar Produtos");
            System.out.println("3. Cadastrar Categoria");
            System.out.println("4. Listar Categorias");
            System.out.println("5. Atualizar Preço de Produto");
            System.out.println("6. Atualizar Estoque de Produto");
            System.out.println("7. Registrar Venda");
            System.out.println("8. Consultar Histórico de Preço");
            System.out.println("9. Consultar Histórico de Estoque");
            System.out.println("0. Sair");
            System.out.print("Escolha uma opção: ");
            opcao = Integer.parseInt(scanner.nextLine());

            switch (opcao) {
                case 1:
                    cadastrarProduto();
                    break;
                case 2:
                    listarProdutos();
                    break;
                case 3:
                    cadastrarCategoria();
                    break;
                case 4:
                    listarCategorias();
                    break;
                case 5:
                    atualizarPrecoProduto();
                    break;
                case 6:
                    atualizarEstoque();
                    break;
                case 7:
                    registrarVenda();
                    break;
                case 8:
                    consultarHistoricoPreco();
                    break;
                case 9:
                    consultarHistoricoEstoque();
                    break;
                case 0:
                    System.out.println("Saindo...");
                    break;
                default:
                    System.out.println("❌ Opção inválida!");
            }

        } while (opcao != 0);

        emf.close();
    }

// 1. CADASTRAR PRODUTO
private static void cadastrarProduto() {
    EntityManager em = emf.createEntityManager();
    try {
        em.getTransaction().begin();
        
        Produto produto = new Produto();
        System.out.print("Nome do produto: ");
        produto.setNome_produto(scanner.nextLine());
        System.out.print("Código do produto: ");
        produto.setCodigo_produto(scanner.nextLine());
        System.out.print("Descrição: ");
        produto.setDescricao(scanner.nextLine());
        System.out.print("Marca: ");
        produto.setMarca(scanner.nextLine());
        System.out.print("Preço atual: ");
        produto.setPreco_atual(Double.parseDouble(scanner.nextLine()));
        produto.setUnidade_medida("un");
        
        // Busca categoria
        System.out.print("ID da Categoria: ");
        Integer idCategoria = Integer.parseInt(scanner.nextLine());
        Categoria categoria = em.find(Categoria.class, idCategoria);
        if (categoria == null) {
            System.out.println("❌ Categoria não encontrada.");
            return;
        }
        produto.setCategoria(categoria);
        
        // Criação do estoque inicial
        Estoque estoque = new Estoque();
        System.out.print("Quantidade inicial no estoque: ");
        int quantidadeInicial = Integer.parseInt(scanner.nextLine());
        estoque.setQuantidade_atual(quantidadeInicial);
        
        // Associa o produto ao estoque
        produto.setEstoque(estoque);
        estoque.setProduto(produto);
        
        // Persiste o produto e o estoque
        em.persist(produto);
        em.getTransaction().commit();
        
        System.out.println("✅ Produto cadastrado com estoque inicial!");
    } finally {
        em.close();
    }
}

    // 2. LISTAR PRODUTOS
// 2. LISTAR PRODUTOS (com quantidade em estoque)
private static void listarProdutos() {
    EntityManager em = emf.createEntityManager();
    try {
        TypedQuery<Produto> query = em.createQuery("SELECT p FROM Produto p", Produto.class);
        List<Produto> produtos = query.getResultList();

        System.out.println("\n=== Lista de Produtos ===");
        for (Produto p : produtos) {
            int quantidadeEstoque = 0;

            // Busca a quantidade em estoque
            TypedQuery<Estoque> queryEstoque = em.createQuery(
                    "SELECT e FROM Estoque e WHERE e.produto.id_produto = :idProduto",
                    Estoque.class);
            queryEstoque.setParameter("idProduto", p.getId_produto());

            try {
                Estoque estoque = queryEstoque.getSingleResult();
                quantidadeEstoque = estoque.getQuantidade_atual();
            } catch (Exception ex) {
                // Se não encontrar estoque, mantém 0
            }

            System.out.printf("ID: %d | Nome: %s | Preço: R$%.2f | Marca: %s | Categoria: %s | Estoque: %d\n",
                    p.getId_produto(), p.getNome_produto(), p.getPreco_atual(),
                    p.getMarca(), p.getCategoria().getNome_categoria(), quantidadeEstoque);
        }
    } finally {
        em.close();
    }
}

    // 3. CADASTRAR CATEGORIA
    private static void cadastrarCategoria() {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            Categoria categoria = new Categoria();

            System.out.print("Nome da categoria: ");
            categoria.setNome_categoria(scanner.nextLine());

            System.out.print("Descrição: ");
            categoria.setDescricao(scanner.nextLine());

            em.persist(categoria);
            em.getTransaction().commit();
            System.out.println("✅ Categoria cadastrada!");

        } finally {
            em.close();
        }
    }

    // 4. LISTAR CATEGORIAS
    private static void listarCategorias() {
        EntityManager em = emf.createEntityManager();
        try {
            TypedQuery<Categoria> query = em.createQuery("SELECT c FROM Categoria c", Categoria.class);
            List<Categoria> categorias = query.getResultList();

            System.out.println("\n=== Lista de Categorias ===");
            for (Categoria c : categorias) {
                System.out.printf("ID: %d | Nome: %s | Descrição: %s\n",
                        c.getId_categoria(), c.getNome_categoria(), c.getDescricao());
            }

        } finally {
            em.close();
        }
    }

    // 5. ATUALIZAR PREÇO DO PRODUTO COM HISTÓRICO
    private static void atualizarPrecoProduto() {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            System.out.print("Digite o ID do produto: ");
            Integer id = Integer.parseInt(scanner.nextLine());

            Produto produto = em.find(Produto.class, id);
            if (produto != null) {
                double precoAntigo = produto.getPreco_atual();

                System.out.print("Novo preço: ");
                double novoPreco = Double.parseDouble(scanner.nextLine());

                produto.setPreco_atual(novoPreco);
                em.merge(produto);

                // Salvar histórico
                HistoricoPreco historico = new HistoricoPreco();
                historico.setProduto(produto);
                historico.setPrecoAnterior(precoAntigo);
                historico.setPrecoAtual(novoPreco);
                historico.setDataAlteracao(LocalDateTime.now());

                em.persist(historico);
                em.getTransaction().commit();

                System.out.println("💰 Preço e histórico salvos!");

            } else {
                System.out.println("❌ Produto não encontrado.");
            }

        } finally {
            em.close();
        }
    }

    // 6. ATUALIZAR ESTOQUE COM HISTÓRICO
    private static void atualizarEstoque() {
    EntityManager em = emf.createEntityManager();
    try {
        em.getTransaction().begin();

        System.out.print("Digite o ID do produto: ");
        Integer idProduto = Integer.parseInt(scanner.nextLine());

        // Busca o estoque pelo produto
        TypedQuery<Estoque> query = em.createQuery(
                "SELECT e FROM Estoque e WHERE e.produto.id_produto = :idProduto",
                Estoque.class);
        query.setParameter("idProduto", idProduto);

        try {
            Estoque estoque = query.getSingleResult();

            System.out.print("Nova quantidade: ");
            int novaQuantidade = Integer.parseInt(scanner.nextLine());

            int antigaQuantidade = estoque.getQuantidade_atual();
            estoque.setQuantidade_atual(novaQuantidade);
            em.merge(estoque);

            // Salva histórico de estoque
            HistoricoEstoque historicoEstoque = new HistoricoEstoque();
            historicoEstoque.setProduto(estoque.getProduto());
            historicoEstoque.setQuantidadeAnterior(antigaQuantidade);
            historicoEstoque.setQuantidadeAtual(novaQuantidade);
            historicoEstoque.setDataAlteracao(LocalDateTime.now());
            em.persist(historicoEstoque);

            em.getTransaction().commit();
            System.out.println("📦 Estoque atualizado e histórico salvo!");

        } catch (Exception ex) {
            System.out.println("❌ Estoque não encontrado para esse produto.");
        }

    } finally {
        em.close();
    }
}

    // 7. REGISTRAR VENDA (COM BAIXA NO ESTOQUE)
    private static void registrarVenda() {
    EntityManager em = emf.createEntityManager();
    try {
        em.getTransaction().begin();

        System.out.print("ID do Produto: ");
        Integer idProduto = Integer.parseInt(scanner.nextLine());

        Produto produto = em.find(Produto.class, idProduto);
        if (produto == null) {
            System.out.println("❌ Produto não encontrado.");
            return;
        }

        // Busca o estoque do produto (sem filtro de loja)
        TypedQuery<Estoque> query = em.createQuery(
                "SELECT e FROM Estoque e WHERE e.produto.id_produto = :idProduto", Estoque.class);
        query.setParameter("idProduto", idProduto);

        try {
            Estoque estoque = query.getSingleResult();

            // Verifica se tem estoque suficiente
            if (estoque.getQuantidade_atual() < 1) {
                System.out.println("⚠️ Estoque insuficiente!");
                return;
            }

            // Reduz 1 unidade do estoque
            int quantidadeAnterior = estoque.getQuantidade_atual();
            estoque.setQuantidade_atual(quantidadeAnterior - 1);
            em.merge(estoque);

            // Registra histórico de estoque
            HistoricoEstoque historico = new HistoricoEstoque();
            historico.setProduto(produto);
            historico.setQuantidadeAnterior(quantidadeAnterior);
            historico.setQuantidadeAtual(estoque.getQuantidade_atual());
            historico.setDataAlteracao(LocalDateTime.now());
            em.persist(historico);

            em.getTransaction().commit();
            System.out.println("✅ Venda registrada e estoque atualizado!");

        } catch (Exception ex) {
            System.out.println("❌ Estoque não configurado para esse produto.");
        }

    } finally {
        em.close();
    }
}

    // 8. CONSULTAR HISTÓRICO DE PREÇO
    private static void consultarHistoricoPreco() {
        EntityManager em = emf.createEntityManager();
        try {
            System.out.print("Digite o ID do produto: ");
            Integer idProduto = Integer.parseInt(scanner.nextLine());

            TypedQuery<HistoricoPreco> query = em.createQuery(
                    "SELECT h FROM HistoricoPreco h WHERE h.produto.id_produto = :idProduto",
                    HistoricoPreco.class);
            query.setParameter("idProduto", idProduto);

            List<HistoricoPreco> historicos = query.getResultList();

            System.out.println("\n=== Histórico de Preço ===");
            for (HistoricoPreco h : historicos) {
                System.out.printf("ID: %d | Anterior: R$%.2f → Atual: R$%.2f | Data: %s\n",
                        h.getId_historico_preco(), h.getPrecoAnterior(), h.getPrecoAtual(), h.getDataAlteracao());
            }

        } finally {
            em.close();
        }
    }

// 9. CONSULTAR HISTÓRICO DE ESTOQUE
private static void consultarHistoricoEstoque() {
    EntityManager em = emf.createEntityManager();
    try {
        System.out.print("Digite o ID do produto: ");
        Integer idProduto = Integer.parseInt(scanner.nextLine());

        TypedQuery<HistoricoEstoque> query = em.createQuery(
                "SELECT h FROM HistoricoEstoque h WHERE h.produto.id_produto = :idProduto",
                HistoricoEstoque.class);
        query.setParameter("idProduto", idProduto);

        List<HistoricoEstoque> historicos = query.getResultList();

        System.out.println("\n=== Histórico de Estoque ===");
        if (historicos.isEmpty()) {
            System.out.println("⚠️ Nenhum histórico encontrado para esse produto.");
        } else {
            for (HistoricoEstoque h : historicos) {
                String nomeLoja = h.getLoja() != null ? h.getLoja().getNome_loja() : "Não informado";
                System.out.printf("ID: %d | De %d → %d | Loja: %s | Data: %s\n",
                        h.getId_historico_estoque(),
                        h.getQuantidadeAnterior(),
                        h.getQuantidadeAtual(),
                        nomeLoja,
                        h.getDataAlteracao()
                );
            }
        }
    } catch (Exception ex) {
        System.out.println("❌ Erro ao buscar histórico de estoque.");
    } finally {
        em.close();
    }
}
}