-- ===============================================
-- POVOAMENTO DA BASE DE DADOS DE VAREJO
-- ===============================================

USE VarejoBase;

-- ===============================================
-- INSERINDO CATEGORIAS
-- ===============================================
INSERT INTO categoria (nome_categoria, descricao) VALUES
('Eletrônicos', 'Produtos eletrônicos, tecnologia e informática'),
('Alimentos e Bebidas', 'Produtos alimentícios, bebidas e snacks'),
('Vestuário', 'Roupas, calçados e acessórios'),
('Casa e Decoração', 'Móveis, decoração e utilidades domésticas'),
('Esportes e Lazer', 'Produtos esportivos e equipamentos de lazer'),
('Beleza e Cuidados', 'Cosméticos, perfumaria e cuidados pessoais'),
('Livros e Papelaria', 'Livros, material escolar e escritório'),
('Brinquedos', 'Brinquedos e jogos infantis');

-- ===============================================
-- INSERINDO PRODUTOS
-- ===============================================
INSERT INTO produto (codigo_produto, nome_produto, descricao, id_categoria, marca, preco_atual, unidade_medida) VALUES
-- Eletrônicos
('ELET001', 'Smartphone Galaxy S22', 'Smartphone Samsung Galaxy S22 128GB', 1, 'Samsung', 3499.00, 'UN'),
('ELET002', 'Notebook Dell Inspiron 15', 'Notebook Dell i5 8GB RAM 512GB SSD', 1, 'Dell', 2899.00, 'UN'),
('ELET003', 'TV Smart 50" 4K', 'Smart TV LG 50 polegadas 4K', 1, 'LG', 2199.00, 'UN'),
('ELET004', 'Fone Bluetooth', 'Fone de ouvido bluetooth JBL', 1, 'JBL', 249.90, 'UN'),
('ELET005', 'Mouse Gamer', 'Mouse gamer RGB Logitech', 1, 'Logitech', 199.90, 'UN'),

-- Alimentos e Bebidas
('ALIM001', 'Café Premium 500g', 'Café torrado e moído premium', 2, 'Melitta', 24.90, 'PCT'),
('ALIM002', 'Chocolate ao Leite 200g', 'Chocolate ao leite Nestlé', 2, 'Nestlé', 8.90, 'UN'),
('ALIM003', 'Água Mineral 1,5L', 'Água mineral sem gás', 2, 'Crystal', 2.90, 'UN'),
('ALIM004', 'Biscoito Integral', 'Biscoito integral multigrãos', 2, 'Vitarella', 4.50, 'PCT'),
('ALIM005', 'Suco Natural 1L', 'Suco de laranja natural', 2, 'Del Valle', 7.90, 'UN'),

-- Vestuário
('VEST001', 'Camisa Polo Masculina', 'Camisa polo algodão masculina', 3, 'Lacoste', 189.90, 'UN'),
('VEST002', 'Calça Jeans Feminina', 'Calça jeans feminina skinny', 3, 'Levi\'s', 259.90, 'UN'),
('VEST003', 'Tênis Running', 'Tênis para corrida unissex', 3, 'Nike', 399.90, 'PAR'),
('VEST004', 'Vestido Casual', 'Vestido casual feminino', 3, 'Renner', 119.90, 'UN'),
('VEST005', 'Mochila Escolar', 'Mochila escolar resistente', 3, 'Samsonite', 149.90, 'UN'),

-- Casa e Decoração
('CASA001', 'Jogo de Panelas 5 peças', 'Jogo de panelas antiaderente', 4, 'Tramontina', 299.90, 'JG'),
('CASA002', 'Edredom Casal', 'Edredom casal 100% algodão', 4, 'Santista', 189.90, 'UN'),
('CASA003', 'Conjunto de Toalhas', 'Kit 4 toalhas de banho', 4, 'Karsten', 99.90, 'KIT'),
('CASA004', 'Luminária de Mesa', 'Luminária LED para mesa', 4, 'Philips', 89.90, 'UN'),
('CASA005', 'Organizador Multiuso', 'Organizador plástico com divisórias', 4, 'Ordene', 39.90, 'UN'),

-- Esportes e Lazer
('ESPO001', 'Bola de Futebol', 'Bola de futebol oficial', 5, 'Adidas', 129.90, 'UN'),
('ESPO002', 'Kit Halteres 10kg', 'Par de halteres ajustáveis', 5, 'Kikos', 199.90, 'KIT'),
('ESPO003', 'Tapete Yoga', 'Tapete para yoga antiderrapante', 5, 'Acte Sports', 79.90, 'UN'),
('ESPO004', 'Bicicleta Aro 29', 'Mountain bike aro 29', 5, 'Caloi', 1499.00, 'UN'),
('ESPO005', 'Corda de Pular', 'Corda de pular profissional', 5, 'Speedo', 39.90, 'UN'),

-- Beleza e Cuidados
('BELZ001', 'Shampoo 400ml', 'Shampoo hidratante', 6, 'Pantene', 18.90, 'UN'),
('BELZ002', 'Creme Hidratante 200ml', 'Creme hidratante corporal', 6, 'Nivea', 24.90, 'UN'),
('BELZ003', 'Perfume Masculino 100ml', 'Perfume masculino amadeirado', 6, 'Boticário', 189.90, 'UN'),
('BELZ004', 'Base Líquida', 'Base líquida cobertura média', 6, 'MAC', 249.90, 'UN'),
('BELZ005', 'Kit Maquiagem', 'Kit maquiagem completo', 6, 'Ruby Rose', 89.90, 'KIT'),

-- Livros e Papelaria
('LIVR001', 'Livro Best Seller', 'Romance contemporâneo', 7, 'Intrínseca', 49.90, 'UN'),
('LIVR002', 'Caderno Universitário', 'Caderno 200 folhas', 7, 'Tilibra', 24.90, 'UN'),
('LIVR003', 'Kit Canetas Coloridas', 'Kit 12 canetas coloridas', 7, 'BIC', 19.90, 'KIT'),
('LIVR004', 'Agenda 2024', 'Agenda executiva 2024', 7, 'Foroni', 34.90, 'UN'),
('LIVR005', 'Calculadora Científica', 'Calculadora científica completa', 7, 'Casio', 89.90, 'UN'),

-- Brinquedos
('BRIN001', 'Lego Classic 500 peças', 'Kit Lego construção classic', 8, 'Lego', 299.90, 'CX'),
('BRIN002', 'Boneca Fashion', 'Boneca fashion com acessórios', 8, 'Mattel', 149.90, 'UN'),
('BRIN003', 'Quebra-cabeça 1000 peças', 'Quebra-cabeça paisagem', 8, 'Grow', 59.90, 'CX'),
('BRIN004', 'Carrinho Hot Wheels', 'Carrinho colecionável', 8, 'Hot Wheels', 12.90, 'UN'),
('BRIN005', 'Jogo de Tabuleiro', 'Jogo War clássico', 8, 'Grow', 89.90, 'CX');

-- ===============================================
-- INSERINDO LOJAS
-- ===============================================
INSERT INTO loja (codigo_loja, nome_loja, endereco, cidade, estado, cep, telefone, gerente) VALUES
('LJ001', 'Loja Shopping Center', 'Av. Paulista, 1500', 'São Paulo', 'SP', '01310100', '11-3456-7890', 'Carlos Silva'),
('LJ002', 'Loja Barra Shopping', 'Av. das Américas, 4666', 'Rio de Janeiro', 'RJ', '22640102', '21-2431-8900', 'Ana Santos'),
('LJ003', 'Loja BH Shopping', 'Rod. BR-356, 3049', 'Belo Horizonte', 'MG', '31150900', '31-3456-7890', 'Pedro Oliveira'),
('LJ004', 'Loja Recife Shopping', 'Av. Agamenon Magalhães, 1000', 'Recife', 'PE', '52070000', '81-3456-7890', 'Maria Costa'),
('LJ005', 'Loja Salvador Shopping', 'Av. Tancredo Neves, 2915', 'Salvador', 'BA', '41820021', '71-3456-7890', 'João Pereira'),
('LJ006', 'Loja Porto Alegre', 'Av. Diário de Notícias, 300', 'Porto Alegre', 'RS', '90810000', '51-3456-7890', 'Paula Lima'),
('LJ007', 'Loja Brasília Shopping', 'SCN Q 6 L 2', 'Brasília', 'DF', '70716900', '61-3456-7890', 'Roberto Alves'),
('LJ008', 'Loja Curitiba Shopping', 'Av. das Torres, 1700', 'Curitiba', 'PR', '82840730', '41-3456-7890', 'Juliana Martins');

-- ===============================================
-- INSERINDO FUNCIONÁRIOS
-- ===============================================
INSERT INTO funcionario (codigo_funcionario, nome, cargo, id_loja, salario) VALUES
-- Loja SP
('FUNC001', 'Carlos Silva', 'Gerente', 1, 8000.00),
('FUNC002', 'Mariana Rocha', 'Vendedor', 1, 2500.00),
('FUNC003', 'José Santos', 'Vendedor', 1, 2500.00),
('FUNC004', 'Laura Ferreira', 'Caixa', 1, 2200.00),

-- Loja RJ
('FUNC005', 'Ana Santos', 'Gerente', 2, 8000.00),
('FUNC006', 'Bruno Costa', 'Vendedor', 2, 2500.00),
('FUNC007', 'Carla Almeida', 'Vendedor', 2, 2500.00),
('FUNC008', 'Diego Pereira', 'Caixa', 2, 2200.00),

-- Loja BH
('FUNC009', 'Pedro Oliveira', 'Gerente', 3, 8000.00),
('FUNC010', 'Fernanda Lima', 'Vendedor', 3, 2500.00),
('FUNC011', 'Ricardo Silva', 'Vendedor', 3, 2500.00),
('FUNC012', 'Tatiana Souza', 'Caixa', 3, 2200.00),

-- Loja PE
('FUNC013', 'Maria Costa', 'Gerente', 4, 8000.00),
('FUNC014', 'Anderson Melo', 'Vendedor', 4, 2500.00),
('FUNC015', 'Beatriz Nunes', 'Vendedor', 4, 2500.00),
('FUNC016', 'Cláudio Ribeiro', 'Caixa', 4, 2200.00),

-- Loja BA
('FUNC017', 'João Pereira', 'Gerente', 5, 8000.00),
('FUNC018', 'Sandra Matos', 'Vendedor', 5, 2500.00),
('FUNC019', 'Marcos Dias', 'Vendedor', 5, 2500.00),
('FUNC020', 'Elaine Barros', 'Caixa', 5, 2200.00);

-- ===============================================
-- INSERINDO CLIENTES
-- ===============================================
INSERT INTO cliente (cpf, nome, email, telefone, endereco, cidade, estado, cep) VALUES
('12345678901', 'Paulo Henrique Silva', 'paulo.silva@email.com', '11-98765-4321', 'Rua das Flores, 123', 'São Paulo', 'SP', '01234567'),
('23456789012', 'Ana Maria Santos', 'ana.santos@email.com', '11-97654-3210', 'Av. Paulista, 456', 'São Paulo', 'SP', '01310100'),
('34567890123', 'Roberto Carlos Oliveira', 'roberto.oliveira@email.com', '21-96543-2109', 'Rua Copacabana, 789', 'Rio de Janeiro', 'RJ', '22020050'),
('45678901234', 'Juliana Costa Lima', 'juliana.lima@email.com', '31-95432-1098', 'Av. Afonso Pena, 321', 'Belo Horizonte', 'MG', '30130005'),
('56789012345', 'Fernando Alves Costa', 'fernando.costa@email.com', '81-94321-0987', 'Av. Boa Viagem, 654', 'Recife', 'PE', '51020180'),
('67890123456', 'Mariana Ferreira Souza', 'mariana.souza@email.com', '71-93210-9876', 'Av. Oceânica, 987', 'Salvador', 'BA', '40160060'),
('78901234567', 'Alexandre Martins Silva', 'alexandre.silva@email.com', '51-92109-8765', 'Rua da Praia, 147', 'Porto Alegre', 'RS', '90020060'),
('89012345678', 'Camila Rodrigues Santos', 'camila.santos@email.com', '61-91098-7654', 'SQS 308 Bloco C', 'Brasília', 'DF', '70355030'),
('90123456789', 'Ricardo Pereira Lima', 'ricardo.lima@email.com', '41-90987-6543', 'Rua XV de Novembro, 258', 'Curitiba', 'PR', '80020310'),
('01234567890', 'Patricia Almeida Costa', 'patricia.costa@email.com', '11-89876-5432', 'Alameda Santos, 369', 'São Paulo', 'SP', '01419002'),
('11223344556', 'Bruno Carvalho Dias', 'bruno.dias@email.com', '21-88765-4321', 'Av. Rio Branco, 741', 'Rio de Janeiro', 'RJ', '20040008'),
('22334455667', 'Letícia Nunes Oliveira', 'leticia.oliveira@email.com', '31-87654-3210', 'Rua da Bahia, 852', 'Belo Horizonte', 'MG', '30160011'),
('33445566778', 'Carlos Eduardo Santos', 'carlos.santos@email.com', '81-86543-2109', 'Rua do Sol, 963', 'Recife', 'PE', '50030230'),
('44556677889', 'Daniela Sousa Lima', 'daniela.lima@email.com', '71-85432-1098', 'Av. Sete de Setembro, 159', 'Salvador', 'BA', '40060500'),
('55667788990', 'Marcelo Ferreira Costa', 'marcelo.costa@email.com', '51-84321-0987', 'Av. Ipiranga, 753', 'Porto Alegre', 'RS', '90160091');

-- ===============================================
-- INSERINDO FORNECEDORES
-- ===============================================
INSERT INTO fornecedor (cnpj, razao_social, nome_fantasia, telefone, email, endereco, cidade, estado) VALUES
('12345678000100', 'Samsung Eletrônicos do Brasil LTDA', 'Samsung Brasil', '11-5644-2000', 'contato@samsung.com.br', 'Av. Dr. Chucri Zaidan, 1240', 'São Paulo', 'SP'),
('23456789000111', 'Dell Computadores do Brasil LTDA', 'Dell Brasil', '11-5503-5000', 'vendas@dell.com.br', 'Av. Industrial, 700', 'Eldorado do Sul', 'RS'),
('34567890000122', 'Nestlé Brasil LTDA', 'Nestlé', '11-2199-2999', 'faleconosco@nestle.com.br', 'Av. Nações Unidas, 12495', 'São Paulo', 'SP'),
('45678901000133', 'Nike do Brasil Com. e Part. LTDA', 'Nike Brasil', '11-5102-4400', 'atendimento@nike.com.br', 'Av. das Nações Unidas, 14261', 'São Paulo', 'SP'),
('56789012000144', 'Tramontina S.A.', 'Tramontina', '54-3461-8200', 'sac@tramontina.com.br', 'Rod. RS-324 Km 2,5', 'Carlos Barbosa', 'RS'),
('67890123000155', 'Procter & Gamble do Brasil S.A.', 'P&G Brasil', '11-3046-5800', 'atendimento@pg.com.br', 'Av. Brigadeiro Faria Lima, 3900', 'São Paulo', 'SP'),
('78901234000166', 'Mattel do Brasil LTDA', 'Mattel', '11-5090-8500', 'sac@mattel.com.br', 'Av. Tamboré, 1400', 'Barueri', 'SP'),
('89012345000177', 'Editora Intrínseca LTDA', 'Intrínseca', '21-2206-7400', 'contato@intrinseca.com.br', 'Rua Marquês de São Vicente, 99', 'Rio de Janeiro', 'RJ'),
('90123456000188', 'JBL do Brasil', 'JBL', '11-3048-1700', 'suporte@jbl.com.br', 'Rua James Clerk Maxwell, 170', 'Campinas', 'SP'),
('01234567000199', 'Melitta do Brasil', 'Melitta', '47-3801-5000', 'sac@melitta.com.br', 'Rua Dona Francisca, 8300', 'Joinville', 'SC');

-- ===============================================
-- INSERINDO PRODUTOS X FORNECEDORES
-- ===============================================
INSERT INTO produto_fornecedor (id_produto, id_fornecedor, preco_compra, prazo_entrega) VALUES
-- Samsung
(1, 1, 2800.00, 7),
(3, 1, 1800.00, 10),

-- Dell
(2, 2, 2300.00, 15),

-- Nestlé
(7, 3, 20.00, 5),
(8, 3, 6.50, 5),

-- Nike
(13, 4, 320.00, 10),

-- Tramontina
(16, 5, 240.00, 7),

-- P&G
(21, 6, 14.50, 5),
(22, 6, 19.00, 5),
(25, 6, 69.90, 7),

-- Mattel
(37, 7, 120.00, 10),
(40, 7, 9.90, 5),

-- Intrínseca
(31, 8, 39.00, 7),

-- JBL
(4, 9, 199.00, 5),

-- Melitta
(6, 10, 19.90, 3);

-- ===============================================
-- INSERINDO VENDAS
-- ===============================================
INSERT INTO venda (numero_venda, id_cliente, id_loja, id_funcionario, data_venda, valor_total, desconto_total, forma_pagamento, status_venda) VALUES
('VD202401001', 1, 1, 2, '2024-01-15 10:30:00', 3698.90, 0.00, 'Cartão Crédito', 'Finalizada'),
('VD202401002', 2, 1, 3, '2024-01-15 14:45:00', 449.80, 44.98, 'PIX', 'Finalizada'),
('VD202401003', 3, 2, 6, '2024-01-16 11:00:00', 2199.00, 0.00, 'Cartão Débito', 'Finalizada'),
('VD202401004', 4, 3, 10, '2024-01-17 15:30:00', 279.80, 27.98, 'Dinheiro', 'Finalizada'),
('VD202401005', 5, 4, 14, '2024-01-18 09:15:00', 519.70, 0.00, 'Cartão Crédito', 'Finalizada'),
('VD202401006', 6, 5, 18, '2024-01-19 16:00:00', 89.90, 0.00, 'PIX', 'Finalizada'),
('VD202401007', 7, 6, 2, '2024-01-20 10:45:00', 1499.00, 149.90, 'Cartão Crédito', 'Finalizada'),
('VD202401008', 8, 7, 3, '2024-01-21 13:20:00', 349.70, 0.00, 'Cartão Débito', 'Finalizada'),
('VD202401009', 9, 8, 4, '2024-01-22 11:30:00', 169.80, 16.98, 'PIX', 'Finalizada'),
('VD202401010', 10, 1, 5, '2024-01-23 14:00:00', 787.50, 0.00, 'Cartão Crédito', 'Finalizada'),
('VD202402001', 11, 2, 6, '2024-02-01 09:30:00', 4298.80, 429.88, 'Cartão Crédito', 'Finalizada'),
('VD202402002', 12, 3, 7, '2024-02-02 15:45:00', 199.90, 0.00, 'PIX', 'Finalizada'),
('VD202402003', 13, 4, 8, '2024-02-03 10:15:00', 659.60, 65.96, 'Cartão Débito', 'Finalizada'),
('VD202402004', 14, 5, 9, '2024-02-04 14:30:00', 89.90, 0.00, 'Dinheiro', 'Finalizada'),
('VD202402005', 15, 6, 10, '2024-02-05 11:00:00', 349.80, 34.98, 'PIX', 'Finalizada');

-- ===============================================
-- INSERINDO ITENS DAS VENDAS
-- ===============================================
INSERT INTO item_venda (id_venda, id_produto, quantidade, preco_unitario, desconto, valor_total) VALUES
-- Venda 1
(1, 1, 1, 3499.00, 0.00, 3499.00),
(1, 4, 1, 199.90, 0.00, 199.90),

-- Venda 2
(2, 6, 2, 24.90, 2.49, 47.31),
(2, 8, 3, 8.90, 0.89, 24.87),
(2, 13, 1, 399.90, 39.99, 359.91),

-- Venda 3
(3, 3, 1, 2199.00, 0.00, 2199.00),

-- Venda 4
(4, 16, 1, 299.90, 29.99, 269.91),
(4, 21, 1, 18.90, 1.89, 17.01),

-- Venda 5
(5, 11, 1, 189.90, 0.00, 189.90),
(5, 12, 1, 259.90, 0.00, 259.90),
(5, 26, 1, 49.90, 0.00, 49.90),

-- Venda 6
(6, 35, 1, 89.90, 0.00, 89.90),

-- Venda 7
(7, 19, 1, 1499.00, 149.90, 1349.10),

-- Venda 8
(8, 22, 2, 24.90, 0.00, 49.80),
(8, 17, 1, 189.90, 0.00, 189.90),
(8, 33, 1, 59.90, 0.00, 59.90),

-- Venda 9
(9, 9, 2, 4.50, 0.45, 8.55),
(9, 37, 1, 149.90, 14.99, 134.91),

-- Venda 10
(10, 2, 1, 2899.00, 0.00, 2899.00),
(10, 5, 1, 199.90, 0.00, 199.90),

-- Venda 11
(11, 1, 1, 3499.00, 349.90, 3149.10),
(11, 25, 1, 89.90, 8.99, 80.91),

-- Venda 12
(12, 34, 1, 199.90, 0.00, 199.90),

-- Venda 13
(13, 13, 1, 399.90, 39.99, 359.91),
(13, 14, 1, 119.90, 11.99, 107.91),
(13, 15, 1, 149.90, 14.99, 134.91),

-- Venda 14
(14, 38, 1, 89.90, 0.00, 89.90),

-- Venda 15
(15, 18, 2, 39.90, 3.99, 71.82),
(15, 23, 1, 249.90, 24.99, 224.91);

-- ===============================================
-- INSERINDO ESTOQUE
-- ===============================================
INSERT INTO estoque (id_produto, id_loja, quantidade_atual, quantidade_minima, quantidade_maxima) VALUES
-- Loja SP
(1, 1, 25, 5, 50),
(2, 1, 15, 3, 30),
(3, 1, 20, 5, 40),
(4, 1, 50, 10, 100),
(5, 1, 45, 10, 80),
(6, 1, 200, 50, 400),
(7, 1, 150, 30, 300),

-- Loja RJ
(1, 2, 20, 5, 40),
(3, 2, 15, 3, 30),
(8, 2, 180, 40, 350),
(9, 2, 220, 50, 400),
(10, 2, 240, 50, 450),
(11, 2, 30, 10, 60),
(12, 2, 25, 10, 50),

-- Loja BH
(13, 3, 35, 10, 70),
(14, 3, 40, 10, 80),
(15, 3, 30, 10, 60),
(16, 3, 20, 5, 40),
(17, 3, 25, 5, 50),
(18, 3, 15, 5, 30),

-- Loja PE
(19, 4, 8, 2, 15),
(20, 4, 45, 10, 90),
(21, 4, 80, 20, 150),
(22, 4, 90, 20, 180),
(23, 4, 12, 3, 25),
(24, 4, 18, 5, 35),

-- Loja BA
(25, 5, 30, 10, 60),
(26, 5, 35, 10, 70),
(27, 5, 85, 20, 170),
(28, 5, 65, 15, 130),
(29, 5, 50, 10, 100),
(30, 5, 40, 10, 80);

-- ===============================================
-- INSERINDO COMPRAS
-- ===============================================
INSERT INTO compra (numero_compra, id_fornecedor, id_loja, data_compra, valor_total, status_compra) VALUES
('CP202401001', 1, 1, '2024-01-05 09:00:00', 28000.00, 'Recebida'),
('CP202401002', 2, 1, '2024-01-08 10:30:00', 11500.00, 'Recebida'),
('CP202401003', 3, 2, '2024-01-10 14:00:00', 1355.00, 'Recebida'),
('CP202401004', 4, 3, '2024-01-12 11:15:00', 6400.00, 'Recebida'),
('CP202401005', 5, 4, '2024-01-14 15:30:00', 2400.00, 'Recebida'),
('CP202401006', 6, 5, '2024-01-16 09:45:00', 850.00, 'Em Trânsito'),
('CP202401007', 7, 6, '2024-01-18 13:00:00', 3600.00, 'Recebida'),
('CP202401008', 8, 7, '2024-01-20 10:00:00', 390.00, 'Recebida'),
('CP202401009', 9, 8, '2024-01-22 14:30:00', 1990.00, 'Recebida'),
('CP202401010', 10, 1, '2024-01-24 11:00:00', 995.00, 'Em Trânsito');

-- ===============================================
-- INSERINDO ITENS DAS COMPRAS
-- ===============================================
INSERT INTO item_compra (id_compra, id_produto, quantidade, preco_unitario, valor_total) VALUES
-- Compra 1 - Samsung
(1, 1, 10, 2800.00, 28000.00),

-- Compra 2 - Dell
(2, 2, 5, 2300.00, 11500.00),

-- Compra 3 - Nestlé
(3, 7, 50, 20.00, 1000.00),
(3, 8, 50, 6.50, 325.00),
(3, 10, 10, 3.00, 30.00),

-- Compra 4 - Nike
(4, 13, 20, 320.00, 6400.00),

-- Compra 5 - Tramontina
(5, 16, 10, 240.00, 2400.00),

-- Compra 6 - P&G
(6, 21, 30, 14.50, 435.00),
(6, 22, 20, 19.00, 380.00),
(6, 26, 5, 7.00, 35.00),

-- Compra 7 - Mattel
(7, 37, 20, 120.00, 2400.00),
(7, 40, 100, 9.90, 990.00),
(7, 38, 15, 14.00, 210.00),

-- Compra 8 - Intrínseca
(8, 31, 10, 39.00, 390.00),

-- Compra 9 - JBL
(9, 4, 10, 199.00, 1990.00),

-- Compra 10 - Melitta
(10, 6, 50, 19.90, 995.00);

-- ===============================================
-- INSERINDO AVALIAÇÕES
-- ===============================================
INSERT INTO avaliacao (id_produto, id_cliente, data_avaliacao, nota, comentario) VALUES
(1, 1, '2024-01-20 15:00:00', 5, 'Excelente smartphone! Muito rápido e câmera incrível.'),
(1, 11, '2024-02-10 10:30:00', 4, 'Ótimo produto, mas achei o preço um pouco alto.'),
(3, 3, '2024-01-25 14:45:00', 5, 'TV com qualidade de imagem fantástica. Super recomendo!'),
(6, 2, '2024-01-18 09:15:00', 5, 'Café delicioso, aroma incrível. Compro sempre!'),
(13, 13, '2024-02-08 16:20:00', 4, 'Tênis confortável, mas esperava mais pela marca.'),
(11, 5, '2024-01-22 11:00:00', 5, 'Camisa de excelente qualidade. Tecido muito bom.'),
(19, 7, '2024-01-28 13:30:00', 3, 'Bicicleta boa, mas veio com alguns ajustes a fazer.'),
(22, 12, '2024-02-05 10:45:00', 5, 'Hidratante maravilhoso! Deixa a pele super macia.'),
(31, 8, '2024-01-26 15:15:00', 5, 'Livro envolvente, não consegui parar de ler!'),
(37, 14, '2024-02-12 14:00:00', 5, 'Minha filha adorou! Brinquedo de qualidade.'),
(2, 10, '2024-01-30 11:30:00', 4, 'Notebook rápido, mas esquenta um pouco durante uso intenso.'),
(4, 1, '2024-01-19 16:45:00', 5, 'Fone com som excelente, bateria dura bastante.'),
(16, 4, '2024-01-20 09:00:00', 5, 'Panelas antiaderentes de verdade. Muito satisfeita!'),
(26, 6, '2024-01-23 14:30:00', 4, 'Livro bom, mas esperava mais do autor.'),
(35, 9, '2024-02-01 10:15:00', 5, 'Quebra-cabeça desafiador e divertido para toda família.');

-- ===============================================
-- INSERINDO PROMOÇÕES
-- ===============================================
INSERT INTO promocao (nome_promocao, descricao, data_inicio, data_fim, percentual_desconto) VALUES
('Black Friday Eletrônicos', 'Desconto especial em eletrônicos selecionados', '2024-11-22', '2024-11-29', 20.00),
('Liquida Verão', 'Promoção de roupas e acessórios de verão', '2024-01-15', '2024-02-15', 30.00),
('Volta às Aulas', 'Desconto em material escolar e papelaria', '2024-01-20', '2024-02-28', 15.00),
('Semana do Consumidor', 'Descontos em todas as categorias', '2024-03-11', '2024-03-17', 10.00),
('Dia das Mães', 'Promoção especial para presentes', '2024-05-06', '2024-05-12', 25.00);

-- ===============================================
-- INSERINDO PRODUTOS EM PROMOÇÃO
-- ===============================================
INSERT INTO produto_promocao (id_promocao, id_produto, preco_promocional) VALUES
-- Black Friday
(1, 1, 2799.20),
(1, 2, 2319.20),
(1, 3, 1759.20),
(1, 4, 199.92),
(1, 5, 159.92),

-- Liquida Verão
(2, 11, 132.93),
(2, 12, 181.93),
(2, 13, 279.93),
(2, 14, 83.93),
(2, 15, 104.93),

-- Volta às Aulas
(3, 31, 42.42),
(3, 32, 21.17),
(3, 33, 16.92),
(3, 34, 29.67),
(3, 35, 76.42),

-- Semana do Consumidor
(4, 6, 22.41),
(4, 16, 269.91),
(4, 21, 17.01),
(4, 26, 44.91),
(4, 31, 44.91),

-- Dia das Mães
(5, 22, 18.68),
(5, 23, 187.43),
(5, 24, 187.43),
(5, 27, 74.93),
(5, 28, 67.43);

-- ===============================================
-- CONSULTAS DE VERIFICAÇÃO
-- ===============================================

-- Total de registros por tabela
SELECT 'Categorias' as Tabela, COUNT(*) as Total FROM categoria
UNION ALL
SELECT 'Produtos', COUNT(*) FROM produto
UNION ALL
SELECT 'Clientes', COUNT(*) FROM cliente
UNION ALL
SELECT 'Lojas', COUNT(*) FROM loja
UNION ALL
SELECT 'Funcionários', COUNT(*) FROM funcionario
UNION ALL
SELECT 'Fornecedores', COUNT(*) FROM fornecedor
UNION ALL
SELECT 'Vendas', COUNT(*) FROM venda
UNION ALL
SELECT 'Itens de Venda', COUNT(*) FROM item_venda
UNION ALL
SELECT 'Estoque', COUNT(*) FROM estoque
UNION ALL
SELECT 'Compras', COUNT(*) FROM compra
UNION ALL
SELECT 'Itens de Compra', COUNT(*) FROM item_compra
UNION ALL
SELECT 'Avaliações', COUNT(*) FROM avaliacao
UNION ALL
SELECT 'Promoções', COUNT(*) FROM promocao
UNION ALL
SELECT 'Produtos em Promoção', COUNT(*) FROM produto_promocao;

-- Vendas por loja
SELECT l.nome_loja, COUNT(v.id_venda) as total_vendas, SUM(v.valor_total) as valor_total
FROM loja l
LEFT JOIN venda v ON l.id_loja = v.id_loja
GROUP BY l.id_loja, l.nome_loja
ORDER BY valor_total DESC;

-- Produtos mais vendidos
SELECT p.nome_produto, SUM(iv.quantidade) as quantidade_vendida, SUM(iv.valor_total) as valor_total
FROM produto p
JOIN item_venda iv ON p.id_produto = iv.id_produto
GROUP BY p.id_produto, p.nome_produto
ORDER BY quantidade_vendida DESC
LIMIT 10;

-- Clientes com maior volume de compras
SELECT c.nome, COUNT(v.id_venda) as total_compras, SUM(v.valor_total) as valor_total
FROM cliente c
JOIN venda v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nome
ORDER BY valor_total DESC
LIMIT 10;