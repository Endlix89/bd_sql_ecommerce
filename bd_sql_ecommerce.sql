-- Criação de Banco de dados SQL de E-Commerce

create database ecommerce;
use ecommerce;


-- Criar tabela Cliente

create table cliente(
   idClient int auto_increment primary key,
   Fname varchar(10),
   Minit char(3),
   Lname varchar(20),
   CPF char(11) not null,
   Rua varchar(45),
   Bairro varchar(45),
   Num_casa char(10),
   constraint unique_cpf_client unique (CPF)
);


-- Criar tabela Produto
-- 'Size - dimensão do produto'

create table product(
   idProduct int auto_increment primary key,
   Pname varchar(10) not null,
   classification_kids bool default false,
   category enum("Eletronico", "Vestuario", "Brinquedo", "Alimento", "Moveis") not null,
   avaliação float default 0,
   size varchar(10),
   constraint unique_cpf_client unique (CPF)
);


-- para ser continuado no desafio: Criar Conexão com as tabelas necessarias e fazer a modificação no Diagrama.
-- criar constraints relacionado ao pagamento.

create	table payments(
idClient int,
idPayment int,
typePayment enum("Boleto", "Cartão", "PIX"),
limit_Avaliable float,
primary key (idClient, id_payment)
);


-- Criar tabela Pedido

Create table orders(
idOrder int auto_increment primary key,
idOrderClient int,
orderStatus enum("Cancelado", "Confirmado", "Em Processamento") not null,
orderDescription varchar(255),
sendValue float default 10,
paymentCash bool default false,
constraint fk_client foreign key (idOrderClient) references clients(idClient)
);


-- Criando tabela Estoque

create table productStorage(
   idProdStorage int auto_increment primary key,
   storageLocation varchar(255),
   quantity int default 0
);

-- Criando tabela Fornecedor

create table supplier(
idSupplier int auto_increment primary key,
SocialName char(255) not null,
CNPJ varchar(11) not null,
contact int default 0,
constraint unique_supplier unique (CNPJ)
);


-- Criando Tabela Vendedor

create table seller(
 idSeller int auto_increment primary key,
 SocialName char(255) not null,
 AbstName varchar(255),
 CNPJ varchar(15),
 CPF char(9),
 location varchar (255),
 contact char(11) not null,
 constraint unique_cnpj_seller unique (CNPJ),
 constraint unique_cpf_seller unique (CPF)
);