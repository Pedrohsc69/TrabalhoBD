create database Fabrica;

use fabrica;

-- ____________________________________________________________________

-- CRIAÇÃO DAS TABELAS

-- Tabela de Fábrica
CREATE TABLE Fabrica (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    local VARCHAR(100),
    capacidade_producao INT
);
-- ____________________________________________________________________
-- Tabela de Departamento
CREATE TABLE Departamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,  
    chefe VARCHAR(100),
    orcamento DECIMAL(10, 2),
    fabrica_id INT,
    FOREIGN KEY (fabrica_id) REFERENCES Fabrica(id)
);
-- ____________________________________________________________________
-- Tabela de Linha de Produção
CREATE TABLE LinhaProducao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    numero INT,
    turno VARCHAR(50),
    fabrica_id INT,
    FOREIGN KEY (fabrica_id) REFERENCES Fabrica(id)
);
-- ____________________________________________________________________
-- Tabela de Funcionário
CREATE TABLE Funcionario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(50) NOT NULL UNIQUE,
    funcao VARCHAR(100),
    salario DECIMAL(10, 2) CHECK(salario > 0),
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES Departamento(id)
);
-- ____________________________________________________________________
-- Tabela de Peça
CREATE TABLE Peca (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    codigo VARCHAR(50) NOT NULL UNIQUE,
    tipo VARCHAR(100),
    fornecedor_id INT,
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(id)
);

ALTER TABLE Peca
ADD COLUMN linha_producao_id INT,
ADD FOREIGN KEY (linha_producao_id) REFERENCES LinhaProducao(id);

-- ____________________________________________________________________
-- Tabela de Fornecedor
CREATE TABLE Fornecedor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    contato VARCHAR(100)
);
-- ____________________________________________________________________
-- Tabela de Pedido de Peças
CREATE TABLE PedidoPecas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE,
    quantidade INT CHECK(quantidade >= 0),
    status VARCHAR(50),
    peca_id INT,
    FOREIGN KEY (peca_id) REFERENCES Peca(id)
);
-- ____________________________________________________________________
-- Tabela de Cliente
CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    endereco VARCHAR(200)
);
-- ____________________________________________________________________
-- Tabela de Carro
CREATE TABLE Carro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(100) NOT NULL,
    ano INT,
    cor VARCHAR(50),
    chassi VARCHAR(17) NOT NULL UNIQUE,
    linha_producao_id INT,
    FOREIGN KEY (linha_producao_id) REFERENCES LinhaProducao(id)
);
-- ____________________________________________________________________
-- Tabela de Venda
CREATE TABLE Venda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    valor DECIMAL(10, 2),
    forma_pagamento VARCHAR(50),
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);
-- ____________________________________________________________________
-- Tabela de Manutenção
CREATE TABLE Manutencao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE,
    tipo VARCHAR(100),
    valor DECIMAL(10, 2),
    carro_id INT,
    FOREIGN KEY (carro_id) REFERENCES Carro(id)
);
-- ____________________________________________________________________
-- Tabela de Contrato de Venda
CREATE TABLE ContratoVenda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(50) NOT NULL UNIQUE,
    data DATE NOT NULL,
    condicoes VARCHAR(500),
    venda_id INT,
    FOREIGN KEY (venda_id) REFERENCES Venda(id)
);
-- ____________________________________________________________________
-- Tabela de Relacionamento entre Venda e Carro (N:N)
CREATE TABLE VendaCarro (
    venda_id INT,
    carro_id INT,
    PRIMARY KEY (venda_id, carro_id),
    FOREIGN KEY (venda_id) REFERENCES Venda(id),
    FOREIGN KEY (carro_id) REFERENCES Carro(id)
);

-- ____________________________________________________________________

-- INSERINDO DADOS NAS TABELAS

-- Inserindo dados na tabela Fábrica
INSERT INTO Fabrica (nome, local, capacidade_producao) 
VALUES ('Fábrica Central', 'São Paulo', 1000),
       ('Fábrica Norte', 'Manaus', 800),
       ('Fábrica Sul', 'Curitiba', 700),
       ('Fábrica Oeste', 'Rio de Janeiro', 1200);
-- ____________________________________________________________________
-- Inserindo dados corretamente na tabela Departamento
INSERT INTO Departamento (nome, chefe, orcamento, fabrica_id)
VALUES ('Produção', 'João Silva', 500000.00, 1),
       ('Manutenção', 'Maria Souza', 200000.00, 1),
       ('RH', 'Carlos Pereira', 150000.00, 2),
       ('Logística', 'Ana Martins', 300000.00, 2),
       ('Qualidade', 'Pedro Gomes', 250000.00, 3),
       ('Financeiro', 'Luiza Santos', 180000.00, 4);
-- ____________________________________________________________________
-- Inserindo dados na tabela Linha de Produção
INSERT INTO LinhaProducao (nome, numero, turno, fabrica_id) 
VALUES ('Linha A', 1, 'Diurno', 1),
       ('Linha B', 2, 'Noturno', 1),
       ('Linha C', 3, 'Diurno', 2),
       ('Linha D', 4, 'Diurno', 3),
       ('Linha E', 5, 'Noturno', 4),
       ('Linha F', 6, 'Diurno', 4);
-- ____________________________________________________________________
-- Inserindo dados na tabela Fornecedor
INSERT INTO Fornecedor (nome, cnpj, contato)
VALUES ('Auto Peças Ltda', '12.345.678/0001-99', 'autopecas@contato.com'),
       ('Pneus Brasil', '98.765.432/0001-55', 'pneusbr@contato.com'),
       ('Motores Max', '22.333.444/0001-88', 'motoresmax@contato.com'),
       ('Vidros Brasil', '33.444.555/0001-66', 'vidrosbrasil@contato.com');
-- ____________________________________________________________________
-- Inserindo dados na tabela Peça
INSERT INTO Peca (nome, codigo, tipo, fornecedor_id, linha_producao_id)
VALUES ('Motor 2.0', 'M200', 'Motor', 1, 1),
       ('Pneu Aro 16', 'P16A', 'Pneu', 2, 2),
       ('Freio ABS', 'FABS', 'Freio', 1, 3),
       ('Vidro Temperado', 'VT2024', 'Vidro', 4, 4),
       ('Motor 1.6', 'M1600', 'Motor', 3, 5),
       ('Airbag', 'ABG203', 'Segurança', 1, 6);
UPDATE Peca 
SET linha_producao_id = 1 
WHERE tipo = 'Motor'; 

UPDATE Peca 
SET linha_producao_id = 2 
WHERE tipo = 'Freio'; 

UPDATE Peca 
SET linha_producao_id = 3 
WHERE tipo = 'Pneu'; 

UPDATE Peca 
SET linha_producao_id = 4 
WHERE tipo = 'Vidro'; 

UPDATE Peca 
SET linha_producao_id = 6 
WHERE tipo = 'Segurança'; 

-- ____________________________________________________________________
-- Inserindo dados na tabela Pedido de Peças
INSERT INTO PedidoPecas (data, quantidade, status, peca_id)
VALUES ('2024-01-15', 50, 'Entregue', 1),
       ('2024-01-20', 200, 'Pendente', 2),
       ('2024-01-18', 30, 'Entregue', 3),
       ('2024-02-10', 100, 'Pendente', 4),
       ('2024-02-15', 20, 'Entregue', 5),
       ('2024-03-05', 150, 'Entregue', 6);
-- ____________________________________________________________________
-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (nome, cpf, endereco)
VALUES ('Carlos Mendes', '12345678900', 'Rua das Flores, 123, São Paulo'),
       ('Fernanda Lima', '98765432100', 'Av. Paulista, 987, São Paulo'),
       ('Juliana Souza', '23456789100', 'Rua das Palmeiras, 456, Rio de Janeiro'),
       ('Eduardo Pires', '11223344500', 'Av. Santos Dumont, 654, Curitiba');
-- ____________________________________________________________________
-- Inserindo dados na tabela Carro
INSERT INTO Carro (modelo, ano, cor, chassi, linha_producao_id)
VALUES ('Sedan LX', 2024, 'Prata', '9BWZZZ377VT004251', 1),
       ('SUV Turbo', 2023, 'Preto', '8BWZZZ377XT005642', 2),
       ('Hatch Compacto', 2024, 'Branco', '7BWZZZ377QT003456', 3),
       ('SUV Premium', 2023, 'Azul', '6BWZZZ377PT007891', 5),
       ('Coupé Esportivo', 2024, 'Vermelho', '5BWZZZ377TT002134', 4);
-- ____________________________________________________________________
-- Inserindo dados na tabela Funcionario
INSERT INTO Funcionario (nome, matricula, funcao, salario, departamento_id)
VALUES ('Paulo Ribeiro', 'F001', 'Operador', 3500.00, 1),
       ('Mariana Andrade', 'F002', 'Técnica de Manutenção', 4500.00, 2),
       ('Roberto Lima', 'F003', 'Gerente de Produção', 8000.00, 1),
       ('Fernanda Oliveira', 'F004', 'Analista de Qualidade', 5000.00, 2),
       ('Leonardo Araújo', 'F005', 'Supervisor de Logística', 6000.00, 4),
       ('Bruna Coelho', 'F006', 'Analista Financeiro', 4800.00, 5);
-- ____________________________________________________________________
-- Inserindo dados na tabela Venda
INSERT INTO Venda (data, valor, forma_pagamento, cliente_id)
VALUES ('2024-02-05', 85000.00, 'À vista', 1),
       ('2024-03-10', 95000.00, 'Parcelado', 2),
	   ('2024-04-05', 72000.00, 'À vista', 3),
       ('2024-04-20', 120000.00, 'Parcelado', 4),
       ('2024-05-10', 95000.00, 'Cartão de Crédito', 2);
-- ____________________________________________________________________
-- Inserindo dados na tabela Manutenção
INSERT INTO Manutencao (data, tipo, valor, carro_id)
VALUES ('2024-03-01', 'Troca de óleo', 250.00, 1),
       ('2024-04-15', 'Alinhamento', 150.00, 2),
       ('2024-05-01', 'Revisão Geral', 600.00, 3),
       ('2024-06-15', 'Troca de Pneu', 400.00, 4),
       ('2024-07-10', 'Troca de Freios', 300.00, 5);

-- ____________________________________________________________________
-- Inserindo dados na tabela Contrato de Venda
INSERT INTO ContratoVenda (numero, data, condicoes, venda_id)
VALUES ('CV001', '2024-02-05', 'Pagamento à vista com 10% de desconto', 1),
       ('CV002', '2024-03-10', 'Parcelado em 12 vezes', 2),
       ('CV003', '2024-04-05', 'Pagamento à vista com 5% de desconto', 3),
       ('CV004', '2024-04-20', 'Parcelado em 24 vezes', 4),
       ('CV005', '2024-05-10', 'Parcelado em 6 vezes no cartão', 5);
-- ____________________________________________________________________
-- Inserindo dados na tabela VendaCarro (N:N - Venda de vários carros)
INSERT INTO VendaCarro (venda_id, carro_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5);

-- ____________________________________________________________________


-- BUSCANDO VALORES NAS TABELAS

SELECT * FROM Fabrica;
-- ____________________________________________________________________
SELECT nome, salario FROM Funcionario;
-- ____________________________________________________________________
SELECT modelo FROM Carro
WHERE ano = 2023;
-- ____________________________________________________________________
SELECT nome, cpf FROM Cliente;
-- ____________________________________________________________________
SELECT nome, cpf FROM Cliente;
-- ____________________________________________________________________
SELECT * FROM Venda
WHERE YEAR(data) = 2024;
-- ____________________________________________________________________
SELECT * FROM Peca
WHERE tipo = 'motor';
-- ____________________________________________________________________
SELECT nome, capacidade_producao FROM Fabrica;
-- ____________________________________________________________________
SELECT nome, fabrica_id FROM linhaproducao
WHERE turno = 'noturno';
-- ____________________________________________________________________
SELECT nome, salario FROM Funcionario
WHERE salario > 3000;
-- ____________________________________________________________________
SELECT * FROM Venda
WHERE valor > 100000;
-- ____________________________________________________________________
SELECT * FROM Carro
WHERE modelo = 'Civic';
-- ____________________________________________________________________
SELECT * FROM Manutencao
WHERE DAY(data) = 01;
-- ____________________________________________________________________
SELECT * FROM Funcionario
WHERE departamento_id = 1;
-- ____________________________________________________________________
SELECT * FROM PedidoPecas
WHERE status = 'Concluido';
-- ____________________________________________________________________
SELECT * FROM Carro
WHERE ano > 2020;
-- ____________________________________________________________________
SELECT * FROM Venda
WHERE data = '2024-02-05';
-- ____________________________________________________________________
SELECT * FROM PedidoPecas
WHERE id = 5;
-- ____________________________________________________________________
SELECT * FROM Carro
WHERE linha_producao_id = 2;
-- ____________________________________________________________________
SELECT nome, numero FROM LinhaProducao
WHERE fabrica_id = 2;
-- ____________________________________________________________________
SELECT * FROM Venda
WHERE valor > 90000;
-- ____________________________________________________________________
SELECT * FROM Departamento
WHERE orcamento > 200000;
-- ____________________________________________________________________
SELECT * FROM Carro
WHERE cor = 'vermelho' OR cor = 'azul';
-- ____________________________________________________________________
SELECT * FROM Venda
WHERE forma_pagamento = 'A vista';
-- ____________________________________________________________________
SELECT * FROM Carro
WHERE ano < 2018;





