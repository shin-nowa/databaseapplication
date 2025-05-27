## MANUAL DE USO DOS SISTEMAS ##

## 1. Criação do banco de dados no MySQL
        1. Instale o MySQL.
        2. Crie um novo servidor.
        3. Execute o script que está em 'estrutura_varejo_basica.txt'.
        4. Popule as tabelas com o script 'inserts_varejo.txt'.

## 2. MongoDB: Inserção de dados não estruturados
        1. Instale o MongoDB (Incluindo shell e compass)
        2. Execute o script 'inserir_dados.js' via terminal usando mongosh
        3. (OPCIONAL) Insira os dados diretamente pelo Mongo Compass.

## 3. Criação Data Warehouse e Visualização do Esquema em Estrela
        1. Instale o PostgreSQL juntamente do PgAdmin4
        2. No pgadmin4, crie um novo banco de dados chamado 'dw_varejo'
        3. Clique com o botão direito no banco de dados criado e clique em restore e selecione o arquivo 'dw_varejoDEF.sql'
        4. Depois disso, aperte botão direito na tablea fato_venda e selecione ERD tools para visualizar o esquema estrela.
        5. Você tem a possibilidade de usar scripts para fazer análises OLAP, como os que estão no 'scriptOLAP.rd'

## 4. Data mining - Clustering de Clientes e Previsões de Venda
        1. Instale o Python 3.13
        2. Vá até o diretório 'dataMining'
        3. Crie um Venv com 'python -m venv env'
        4. Acesse o venv com './env/Scripts/activate'
        5. Instale as dependencias com: 'pip install sqlalchemy pandas prophet matplotlib scikit-learn seaborn psycopg2' ou 'pip install -r /path/to/requirements.txt'
        6. Após isso rode os scripts com 'python clusteringClientes.py' e 'python previsaoVendas.py'

 ## 5. API para integração dos bancos de dados e visualização de dados.
        1. Instale o Node juntamente ao npm
        2. Entre na pasta api com 'cd api'
        3. Instale as dependencias da api com 'npm install'
        4. Inicie o servidor com 'npm start'
        5. Acesse a interface com o link :' localhost:3000 '

## 6. ObjectDB - Banco de dados
        1. Acesse a pasta ObjectDB > src > main > java > app
        2. Compile e rode o MenuVarejo.java
            ## Caso dê erro com esse método, faça:   
                    1. ( OPCIONAL ) Instale o maven no PATH
                    2. ( OPCIONAL ) Rode o Menu com: 'mvn exec:java -Dexec.mainClass="app.MenuVarejo'