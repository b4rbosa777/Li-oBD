DROP TABLE products;

DROP TABLE client CASCADE;

CREATE TABLE clients (
	idclient SERIAL PRIMARY KEY,
	cpf varchar(14),
	firstname text,
	lastname text,
	address text
);

CREATE TABLE products (
	idproduct SERIAL PRIMARY KEY,
	idclient int,
	CONSTRAINT fk_client FOREIGN KEY (idclient) REFERENCES clients (idclient),
	productname varchar(50),
	brand varchar(20),
	category varchar(20),
	discount numeric,
	price numeric
);

INSERT INTO clients (cpf,firstname,lastname,address) VALUES
('000.000.000-00','Rodrigo','Junior','Rua 00, 000, Bairro 0'),
('111.111.111-11','Joao','Silva','Rua 01, 100, Bairro 1'),
('222.222.222-22','Maria','Gomez','Rua 02, 200, Bairro 2'),
('333.333.333-33','José','Andrade','Rua 03, 300, Bairro 3'),
('444.444.444-44','Bruno','Silveira','Rua 04, 400, Bairro 4'),
('555.555.555-55','Ana','Cabral','Rua 05, 500, Bairro 5'),
('666.666.666-66','Lucia','Silva','Rua 06, 600, Bairro 6'),
('777.777.777-77','Antonio','Mange','Rua 07, 700, Bairro 7'),
('888.888.888-88','Nicolas','Silva','Rua 08, 800, Bairro 8'),
('999.999.999-99','Sandra','Fourlan','Rua 09, 900, Bairro 9');

INSERT INTO products (idclient,productname,brand,category,discount,price) VALUES
(2,'Headset','jbl','eletronicos',0.1,195.89),
(1,'notebook','dell','eletronicos',0.12,3500.00),
(10,'cadeira gammer','dragon','imobiliario',0.0,1630.9),
(2,'mesa para computador','dragon','imobiliario',0.0,695.89),
(1,'mouse','dell','eletronicos',0.12,124.79),
(3,'prateleira',null,'imobiliario',0.0,80.9),
(5,'postit','faber castel','papelaria',0.02,5.29),
(8,'lapiseira','pentel','papelaria',0.02,18.9);

---> Comandos DQL (Data Query Lenguage)

--> Vizualizando a tabela clientes
SELECT * FROM clients

--> Selecionando colunas especificas
SELECT firstname,lastname, idclient FROM clients

--> Vizualizando a tabela de produtos
SELECT * FROM products

--> nome do produto, preco e desconto
SELECT productname, price, discount,price*discount AS "Desconto em reais" FROM products

--> Desafio: exiir o nome do produto, preço e preço com desconto
SELECT productname, price, discount,price-price*discount AS "Preço com desconto" FROM products

--> Exibe valores sem repetição
SELECT DISTINCT brand FROM products

--> Calculadora
SELECT 2^3

--> Funções
SELECT random()

--> SELECT com clasula WHERE

--> Operadores de comparação >,<,>=,<=,=,<> ou !=
--> Exibir produtos com valor acima de 100 reais
SELECT productname, price FROM products
WHERE price>=100


--> Operadores lógicos: and, or e not


--> Produtos entre 100 e 800 reais
SELECT productname, price FROM products
WHERE price>=100 AND price<=800
--> alternativa
SELECT productname, price FROM products
WHERE price BETWEEN 100 AND 800

--> Produtos cujo preço esteja abaixo de 100 e acima de 800
SELECT productname,price FROM products
WHERE price<=100 OR price>=800

--> DESAFIO: listar todos os produtos da marca dell
SELECT productname,brand FROM products
WHERE brand = 'dell'

 --> DESAFIO: listar todoa os produtos comprados por João
SELECT productname FROM products
WHERE idclient = '2'

--> Desafio: listar todos os clientes com id bar
SELECT  firstname, idclient FROM clients
WHERE idclient %2=0

--> Count
--> quantos produtos foram vendidos no total?
SELECT COUNT (idproduct) FROM products

--> função avg (média)
--> Qual o preço médio dos produtos vendidos?
SELECT AVG (price) FROM products

--> funçao max (máximo)
--> Qual o maior preço  negociado?
SELECT MAX (price) FROM products

--> funçao min (minimo)
--> Qual o menor preço negociado?
SELECT MIN (price) FROM products

--> funçao sum (soma)
--> Qual valor total vendido?
SELECT SUM (price) FROM products

--> ORDER BY / DESC
SELECT * FROM clients
ORDER BY firstname

-->Lista de exercicios:

--1. Quantos produtos da marca dell foram vendidos?
SELECT COUNT (productname) FROM products
WHERE brand = 'dell'

--2. Quantos produtos João comprou?
SELECT COUNT (productname) FROM products
WHERE idclient  = '2'

--3. Qual o preço médio dos produtos da dell?
SELECT AVG (price) FROM products
WHERE brand = 'dell'

--4. Qual o produto mais caro vendido?
SELECT productname,price FROM products
WHERE price = (SELECT MAX (price) FROM products)
--SELECT MAX (price) FROM products

--5. Qual o produto mais barato vendido?
SELECT productname,price FROM products
WHERE price = (SELECT MIN (price) FROM products)
--SELECT MIN (price) FROM products

--6. Qual o valor total de equipamentos dell vendidos?
SELECT SUM (price) FROM products
WHERE brand = 'dell'

--7. Quanto Rodrigo já gastou no eCommerce?
SELECT SUM (price) FROM products
WHERE idclient =(SELECT idclient FROM clients WHERE firstname='Rodrigo')

--8. Exiba todos os produtos da catergoria eletronicos ordenados do mais barato para o mais caro.
SELECT * FROM products WHERE category = 'eletronicos'
ORDER BY price

--9. Exiba todos os produtos comprados por Rodrigo ordenados do mais caro para o mais barato.
SELECT productname, price FROM products WHERE idclient = '1'
ORDER BY price DESC





 