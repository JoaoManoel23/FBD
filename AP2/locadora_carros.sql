create table clientes
(
    id int auto_increment primary key,
    CPF varchar(14) not null unique,
    nome varchar(100) not null,
    telefone int not null
);
create table enderecos
(
    id int auto_increment primary key,
    logradouro varchar(200) not null,
    bairro varchar(50) not null,
    cidade varchar(100) not null
);
create table clientes_enderecos
(
    id int auto_increment primary key,
    id_cliente int not null,
    id_endereco int not null,

    constraint clientes_fk_clientes_enderecos
        foreign key(id_cliente) references clientes(id)
        on delete restrict
        on update cascade,

    constraint enderecos_fk_clientes_enderecos
        foreign key(id_endereco) references enderecos(id)
        on delete  restrict
        on update cascade
);
create table carros
(
    id int auto_increment primary key,
    placa varchar(7) not null unique,
    modelo varchar(150) not null,
    cod_marca int not null,
    marca varchar(150) not null,
    ano int not null
);
create table aluguel
(
    id int auto_increment primary key,
    registro_aluguel varchar(10) not null,
    data_aluguel datetime not null,
    data_retorno datetime not null,
    valor decimal not null
);
create table aluguel_carros
(
    id int auto_increment primary key,
    id_clientes_enderecos int not null,
    id_carros int not null,
    id_aluguel int not null,

    constraint aluguel_carros_fk_clientes_enderecos
        foreign key(id_clientes_enderecos) references clientes_enderecos(id)
        on delete restrict
        on update cascade,
    constraint aluguel_carros_fk_carros
        foreign key(id_carros) references carros(id)
        on delete restrict
        on update cascade,
    constraint aluguel_carros_fk_aluguel
        foreign key(id_aluguel) references aluguel(id)
        on delete restrict
        on update cascade
);

    -- ComandoS DML
    insert into clientes(CPF,nome,telefone) values(85599700901,'João da Silva',998988976);
    insert into clientes(CPF,nome,telefone) values(55879990010,'Lucas Coutinho',956656556);
    insert into clientes(CPF,nome,telefone) values(00998877669,'Ederson Filho',908756325);

    insert into enderecos(logradouro,bairro,cidade) values('Rua Guilhereme furtado,1343','São Luis','Porto Alegre');
    insert into enderecos(logradouro,bairro,cidade) values('Rua Maranhão,1343','Centro','Curitiba');
    insert into enderecos(logradouro,bairro,cidade) values('Rua Monte Feliz,1343','Longe','Salvador');

    insert into clientes_enderecos(id_cliente,id_endereco) values(1,2);
    insert into clientes_enderecos(id_cliente,id_endereco) values(2,3);
    insert into clientes_enderecos(id_cliente,id_endereco) values(3,2);

    insert into carros(placa,modelo,cod_marca,marca,ano) values('qwq121','kwid',1,'renault',2021);
    insert into carros(placa,modelo,cod_marca,marca,ano) values('liu101','uno',2,'fiat',2019);
    insert into carros(placa,modelo,cod_marca,marca,ano) values('pop401','meriva',4,'chevrolet',2010);
    insert into carros(placa,modelo,cod_marca,marca,ano) values('pul032','toro',2,'fiat',2022);

    insert into aluguel(registro_aluguel,data_aluguel,data_retorno,valor) values('212mmo','2021-12-20','2021-12-30',100);
    insert into aluguel(registro_aluguel,data_aluguel,data_retorno,valor) values('323443mm','2021-09-20','2021-11-20',1000);
    insert into aluguel(registro_aluguel,data_aluguel,data_retorno,valor) values('1234um','2021-12-30','2022-12-30',20000);

    insert into aluguel_carros(id_clientes_enderecos,id_carros,id_aluguel) values(2,3,1);
    insert into aluguel_carros(id_clientes_enderecos,id_carros,id_aluguel) values(3,4,2);
    insert into aluguel_carros(id_clientes_enderecos,id_carros,id_aluguel) values(1,1,3);

    -- Carros alugados no mês de setembro
    SELECT * from aluguel
    select * from aluguel_carros
    where id_aluguel=2;
    SELECT modelo from carros
    WHERE id=4;






