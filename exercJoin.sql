create database exercinnerjoin;
use exercinnerjoin;

create table Cliente(
cpf int,
nome varchar(60),
dtNasc date,
primary key(cpf));

create table Modelo(
codMod int,
Desc_2 varchar(40),
primary key(codMOD));

create table Patio(
num int,
ender varchar(40),
capacidade int,
primary key(num));

create table Veiculo(
placa varchar(8),
codMod int,
cpf int,
cor varchar(20),
primary key(placa),
foreign key(codMod) references Modelo(codMod),
foreign key(cpf) references Cliente(cpf));

create table Estaciona(
cod int,
num int,
placa varchar(8),
dtEntrada varchar(10),
dtSaida varchar(10),
hsEntrada varchar(10),
hsSaida varchar(10),
primary key(cod),
foreign key(num) references Patio(num),
foreign key(placa) references Veiculo(placa));

insert into Cliente(cpf, nome, dtNasc) values
(123456789, 'João', '998-08-20'),
(987654321,'Marcia','1988-05-15'),
(654321987,'Leonardo','2000-01-19'),
(654987321,'Lucas','2002-07-16');

insert into Modelo(codMod, Desc_2) values
(1, 'Mustang'),
(2, 'Ferrari'),
(3, 'Porsche'),
(4, 'Jaguar');

insert into Patio(num, ender, capacidade) values
(1, 'Centro de São Paulo', 15),
(2, 'Jardim Guaçu', 10),
(3, 'Centro de especialidade', 25);

insert into Veiculo(placa, codMod, cpf, cor) values
('ABD-2512',2,123456789, 'Verde'),
('ASD-2323',1,987654321,'Verde'),
('JEG-1010',4,654321987,'Prata'),
('JJJ-2020',3,654987321,'Preto');

insert into Estaciona(cod, num, placa, dtEntrada, dtSaida, hsEntrada, hsSaida) values
(1,1,'ABD-2512','15/08/2020','15/08/2020','12:00AM','07:00PM'),
(3,3,'JEG-1010','12/08/2020','13/08/2020','04:00PM','08:00AM'),
(2,2,'JJJ-2020','12/08/2020','13/08/2020','04:00PM','08:00AM');

--	3-Nomes dos donos dos veiculos e seus respectivos veiculos
select c.nome, v.placa from Cliente c, Veiculo v where 
c.cpf=v.cpf;

-- 4-Cpf e nome do dono do veiculo com placa JJJ-2020
select c.cpf, c.nome from Cliente c, Veiculo v where 
c.cpf= v.cpf and 
v.placa='JJJ-2020';

-- 5- placa e a cor do veículo que possui o código de estacionamento 1
select v.placa, v.cor from Veiculo v, Estaciona e where
v.placa=e.placa and
e.cod = 1;

-- 6-endereço, a data de entrada e de saída dos estacionamentos do veículo de placa “JEG-1010”
select p.ender, e.dtEntrada, e.dtSaida from Patio p, Estaciona e where
p.num=e.num and 
e.placa='JEG-1010';

-- 7- quantidade de vezes os veiculos de cor verde estacionaram
select count(e.cod) from Veiculo v, Estaciona e where
v.placa=e.placa and
v.cor='Verde';

--  8-todos os clientes que possuem carro de modelo 1
select m.codMod, c.nome from Veiculo v, Cliente c, Modelo m where
m.codMod=v.codMod and
c.cpf=v.cpf and
m.codMod=1;

--  9-as placas, os horários de entrada e saída dos veículos de cor verde
select v.placa, e.hsEntrada, e.hsSaida from Veiculo v, Estaciona e where
v.placa=e.placa and
v.cor='Verde';

-- 10-todos os estacionamentos do veículo de placa “JJJ-2020”
select e.cod from  Veiculo v, Estaciona e where
v.placa=e.placa and
v.placa= 'JJJ-2020';

-- 11-o nome do cliente que possui o veículo cujo código do estacionamento é 2
select c.nome from Cliente c, Veiculo v, Estaciona e where
c.cpf=v.cpf and
v.placa=e.placa and
e.cod=2;

-- 12-o CPF do cliente que possui o veículo cujo código do estacionamento é 3
select c.cpf, c.nome from Cliente c, Veiculo v, Estaciona e where
c.cpf=v.cpf and
v.placa=e.placa and
e.cod=3;

-- 13-descrição do modelo do veículo cujo código do estacionamento é 2
select m.Desc_2 from Veiculo v, Modelo m, Estaciona e where
m.codMod=v.codMod and
v.placa=e.placa and
e.cod=2;

-- 14-a placa, o nome dos donos e a descrição dos os modelos de todos os veículos
select v.placa, c.nome, m.Desc_2 from Veiculo v, Modelo m, Cliente c where
c.cpf=v.cpf and
m.codMod=v.codMod ;