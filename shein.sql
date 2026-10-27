drop database db_shein;
CREATE DATABASE DB_shein;
USE DB_shein;


CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY,
    nome VARCHAR(100) NULL,
    email VARCHAR(100) NULL
);

INSERT INTO usuarios (id_usuario, nome, email) VALUES
(1, 'Ana Silva', 'ana@email.com'),
(2, 'Carlos Souza', 'carlos@email.com'),
(3, 'Mariana Oliveira', 'mariana@email.com'),
(4, 'Pedro Santos', NULL),
(5, 'Juliana Costa', 'juliana@email.com'),
(6, 'Lucas Pereira', NULL),
(7, 'Beatriz Lima', 'beatriz@email.com'),
(8, 'Rafael Alves', 'rafael@email.com'),
(9, 'Camila Rocha', NULL),
(10, 'Felipe Martins', 'felipe@email.com'),
(11, 'Larissa Gomes', 'larissa@email.com'),
(12, 'Bruno Ferreira', NULL),
(13, 'Amanda Ribeiro', 'amanda@email.com'),
(14, 'Gabriel Carvalho', 'gabriel@email.com');


CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100) NULL,
    preco DECIMAL(10, 2) NULL
);

INSERT INTO produtos (id_produto, nome_produto, preco) VALUES
(101, 'Vestido Floral', 79.90),
(102, 'Camiseta Oversized', 45.00),
(103, 'Bolsa de Ombro', 59.90),
(104, 'Tênis Casual', 129.90),
(105, 'Calça Jeans', 99.90),
(106, 'Jaqueta Jeans', NULL),
(107, 'Boné Esportivo', 35.00),
(108, 'Mochila Urbana', 89.90),
(109, 'Óculos de Sol', NULL),
(110, 'Relógio Digital', 119.90),
(111, 'Blusa de Moletom', 85.00),
(112, NULL, 49.90),
(113, 'Sandália Feminina', 69.90),
(114, 'Carteira Masculina', 39.90);


CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_usuario INT NULL,
    id_produto INT NULL,
    quantidade INT NULL,
    data_compra DATE NULL,

    FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario),

    FOREIGN KEY (id_produto)
        REFERENCES produtos(id_produto)
);

INSERT INTO pedidos
(id_pedido, id_usuario, id_produto, quantidade, data_compra)
VALUES
(1001, 1, 101, 1, '2026-03-01'),
(1002, 1, 103, 2, '2026-03-02'),
(1003, 2, 102, 1, '2026-03-02'),
(1004, 3, 104, 1, '2026-03-03'),
(1005, 5, 105, 2, '2026-03-04'),
(1006, 5, 106, 1, '2026-03-05'),
(1007, 7, 107, 3, '2026-03-06'),
(1008, 8, 108, 1, '2026-03-07'),
(1009, 9, 109, NULL, '2026-03-08'),
(1010, 10, 110, 1, '2026-03-09'),
(1011, 11, 111, 2, '2026-03-10'),
(1012, 2, 112, 1, NULL),
(1013, 13, 113, 2, '2026-03-12'),
(1014, 1, 114, 1, '2026-03-13'),
(1015, 3, 101, 2, '2026-03-14'),
(1016, 5, NULL, 1, '2026-03-15'),
(1017, NULL, 103, 2, '2026-03-16'),
(1018, 7, 105, NULL, NULL);


SELECT * FROM usuarios;
SELECT * FROM produtos;
SELECT * FROM pedidos;

select 
	usuarios.nome, 
	produtos.nome_produto
from usuarios
	inner join pedidos  on usuarios.id_usuario = pedidos.id_usuario
    inner join produtos on pedidos.id_produto = produtos.id_produto
	where usuarios.id_usuario = 1;
    
    select 
	usuarios.nome, 
	produtos.nome_produto
from usuarios
	inner join pedidos  on usuarios.id_usuario = pedidos.id_usuario
    inner join produtos on pedidos.id_produto = produtos.id_produto
	where pedidos.id_produto = 101;


select
	usuarios.nome
from usuarios
	left join pedidos on usuarios.id_usuario = pedidos.id_usuario
where pedidos.id_pedido is null;



select 
	produtos.id_produto, produtos.nome_produto, produtos.preco
from produtos
	left join pedidos
	on produtos.id_produto = pedidos.id_produto
	where pedidos.id_pedido is null;


select*from 
pedidos
	where id_usuario is null or id_produto is null
	or quantidade is null
	or data_compra is null;


