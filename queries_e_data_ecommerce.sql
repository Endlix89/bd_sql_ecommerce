show tables;

-- idClient, Fname, Minit, Lname, CPF, Address

insert into Clients (Fname, Minit, Lname, CPF, Address)
   values('Maria', 'M', 'Silva', 12346578, 'Rua Silva de Prata, 29 - Cidade das Flores'),
         ('Matheus', 'O', 'Pimentel', 987654321, 'Rua Alameda 289, Centro - Cidade das Flores'),
         ('Ricardo', 'F', 'Silva', 45678913, 'Avenida Alameda Vinho 1009, Centro - Cidade das Flores'),
         ('Roberta', 'G', 'Assis', 98745631, 'Avenida Koller 19, Centro - Cidade das Flores');
         

-- idProduct, Pname, classification_kids boolean, category("Eletronico", "Vestuario", "Brinquedo", "Alimento", "Moveis"), avaliação, size

insert into products (Pname, classification_kids, category, avaliação, size) 
       values ('Fone de Ouvido', false, 'Eletronico', '4', null),
              ('Hot Wheels', true, 'Brinquedo', '3', null),
              ('Body Carters', true, 'Vestuario', '5', null);
              
select * from clients;
select * from product;


-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash

insert into orders (idOrderClient, orderStatus, orderDEscription, sendValue, paymentCash) 
       values('1', null, 'compra via aplicativo', null,1),
             ('2', null, 'compra via aplicativo', 50, 0),
             ('3', 'Confirmado', null, null, 1),
             ('4', 'Compra via web site, 150, 0');

             
-- idPOproduct, idPOorder, poQuantity, poStatus

select * from orders;
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
       values (1,5,2,null),
              (2,5,1,null),
              (3,6,1,null);

              
    -- storageLocation, quantity
    
    insert into productStorage (storageLocation, quantity)
	   values ('Rio de Janeiro', 1000),
              ('Rio de Janeiro', 500),
              ('São Paulo', 10),
              ('São Paulo', 100);

	
-- idLproduct, idLstorage, location

insert into storageLocation (idLproduct, idLstorage, location) 
      values (1,2,'RJ'),
             (2,6,'GO');


-- idSupplier, SocialName,CNPJ, contatct

insert into supplier (SocialName, CNPJ, contact)
       values ('Almeida e filho', 123456789123456, '21985474'),
              ('Eletrônicos Silva', 286543321753890, '21985484'),
              ('Eletrônicos Velma', 934567893934695, '21975474');
              
select * from supplier;


-- idPsSupplier, idPsProduct, quantity

insert into productSupplier (idPsSupplier, idPsProduct, quantity)
       values (1,1,50),
              (1,2,400),
              (2,4,633),
              (3,3,5),
              (2,5,10);

              
-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact

insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact)
	values ('Tech Eletronicos', null, 123456789456123, null, 'Rio de Janeiro', 219946287),
		   ('Botique Durgas', null, null, 123456782, 'Rio de Janeiro', 219567895),
           ('Kid World', null, 456789123445624, null, 'São Paulo', 1198657484);
           
select * from  seller;

-- idPseller, idPproduct, proQuantity
      
insert into productSeller (idPseller, idPproduct, prodQuantity)
       values (1,6,80),
              (2,7,10);

-- TESTES

select count(*) from clients;

select * from clients c, orders o where c.idClient = idOrderClient; 

select concat(Fname,'  ', Lname) as Client, idOrder as Request, orderStatus as Status from cliente c, orders o where c.idClient = idOrderClient;

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash)
       values (2, default, 'compra via aplicativo', null, 1);
       
select count(*) from clients c, orders o
	   where c.idClient = idOrderClient;

-- Recuperação de pedido com produto associado

select * from cliente c
	inner join orders o ON c.idClient = o.idOrderClient
	inner join productOrder p ON p.idPOorder = o.idOrder
group by idClient;

-- Recupera quantos pedidos fora realizados pelos clientes

select c.idClient Fname, count(*) as Number_of_orders from clients c
    inner join orders o ON c.idClient = o.idOrderClient
group by idClient;


-- Refinamento do Script SQL

