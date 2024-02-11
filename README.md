Descrição do Projeto
Este projeto envolve a criação e manipulação de um banco de dados para uma empresa fictícia. O banco de dados inclui várias tabelas que armazenam informações sobre funcionários,
departamentos, localizações de departamentos, projetos e dependentes de funcionários.

Tabelas do Banco de Dados
As tabelas criadas no banco de dados são as seguintes:
1.	employee: Armazena informações sobre os funcionários.
2.	departament: Armazena informações sobre os departamentos.
3.	dept_locations: Armazena informações sobre as localizações dos departamentos.
4.	project: Armazena informações sobre os projetos.
5.	works_on: Armazena informações sobre quais funcionários trabalham em quais projetos.
6.	dependent: Armazena informações sobre os dependentes dos funcionários.

Consultas SQL
Foram criadas várias consultas SQL para responder a perguntas específicas sobre os dados armazenados no banco de dados. As perguntas incluem:
1.	Qual o departamento com maior número de pessoas?
2.	Quais são os departamentos por cidade?
3.	Relação de empregados por departamento.

Índices
Os índices foram criados para otimizar as consultas SQL acima. São úteis para acelerar as consultas ao reduzir o número de páginas que precisam ser visitadas.
Os índices B-tree foram usados, que são o tipo padrão de índice no MySQL e são bons para uma ampla gama de consultas.
Os índices foram criados para as seguintes colunas:
1.	Dno na tabela employee
2.	Dnumber na tabela departament
3.	Dnumber na tabela dept_locations

Estas colunas foram escolhidas porque são frequentemente usadas nas cláusulas JOIN e WHERE das consultas SQL.

Inserção de Dados
Foram inseridos até 5 registros em cada tabela para fins de teste.

