create table marcas (
	codigo serial primary key, 
	nome varchar(40) not null, 
	pais varchar(40) not null 
);

insert into marcas (nome, pais) 
values ('Ford', 'Estados Unidos')
returning codigo, nome, pais;

insert into marcas (nome, pais) 
values ('Honda', 'Japão')
returning codigo, nome, pais;

-- criação da tabela salas
create table modelos (
	codigo serial primary key, 
	nome varchar(40) not null, 
	numero_portas integer not null, 
	lugares integer not null, 
	marca integer not null, 
	foreign key (marca) references marcas (codigo)
);


insert into modelos (nome, numero_portas, lugares, marca) 
values ('ford KA',4,4,1), ('Honda Civic',4,5,2)
returning codigo, nome, numero_portas, lugares, marca;

--usuarios
create table usuarios (
	email varchar(50) not null primary key, 
	senha varchar(20) not null, 
	tipo char(1)  not null, 
	check (tipo = 'T' or tipo = 'A' or tipo = 'U'),
	telefone varchar(14)  not null, 
	nome varchar(50) not null
);

insert into usuarios (email, senha, tipo, telefone, nome) 
values ('jorgebavaresco@ifsul.edu.br', '123456', 'A','(54)99984-4348','Jorge Bavaresco'), 
('luizvanzo.bsi@gmail.com', '123456', 'U','(54)44484-4348','Luiz Vanzo');

-- criação da tabela carros
create table carros (
	codigo serial primary key, 
	placa varchar(8) not null, 
	disponivel varchar(1) not null, 
	km integer not null, 
	modelo integer not null, 
	foreign key (modelo) references modelos (codigo)
);

insert into carros (placa, disponivel, km, modelo) 
values ('1234ASJD',1,42,1), ('1324AdsD',0,300,2)
returning codigo, placa, disponivel, km, modelo;

