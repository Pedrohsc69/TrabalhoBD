create database Fabrica;

use fabrica;

-- Criação da tabela Departamento
CREATE TABLE Departamento (
    id_departamento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    chefe VARCHAR(100),
    orcamento DECIMAL(15, 2) NOT NULL
);
-- Inserindo dados na tabela Departamento
INSERT INTO Departamento (nome, chefe, orcamento)
VALUES 
('Produção', 'Carlos Lima', 50000.00),
('Vendas', 'Fernanda Costa', 30000.00),
('Manutenção', 'Roberto Souza', 20000.00);

-- Selecionando dados da tabela Departamento
select * from departamento;

-- Criação da tabela Funcionário
CREATE TABLE Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    funcao VARCHAR(50) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL CHECK (salario > 0),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
    ON DELETE SET NULL ON UPDATE CASCADE
);
-- Inserindo dados na tabela Funcionário
INSERT INTO Funcionario (nome, matricula, funcao, salario, id_departamento)
VALUES 
('João Silva', 'EMP001', 'Gerente de Produção', 5500.00, 1),
('Maria Souza', 'EMP002', 'Operadora de Máquinas', 2500.00, 1),
('Lucas Pereira', 'EMP003', 'Técnico de Manutenção', 3200.00, 3),
('Ana Oliveira', 'EMP004', 'Vendedora', 3000.00, 2);
-- Selecionando dados da tabela Funcionário
select * from funcionario;

-- Criação da tabela Cliente
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    endereco VARCHAR(200)
);
-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (nome, cpf, endereco)
VALUES 
('Paulo Andrade', '12345678901', 'Rua A, 100 - Centro'),
('Claudia Ferreira', '98765432100', 'Rua B, 200 - Bairro Novo'),
('Renato Lima', '45678912300', 'Av. Central, 300 - Zona Sul');
-- Selecionando dados da tabela Cliente
select * from cliente;