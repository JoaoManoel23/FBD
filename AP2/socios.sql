create table socios
(
    id int auto_increment primary key,
    nome varchar(250) not null,
    numero int not null unique,
    endereco varchar(250) not null,
    cod_tipo_socio int not null,
    descricao_tipo_socio varchar(250) not null
);
create table servicos
(
    id int auto_increment primary key,
    cod_servico int not null,
    descricao varchar(200) not null,
    mes_referencia  datetime not null,
    valor_pago decimal not null
);

create table socios_servicos
(
    id int auto_increment primary key,
    id_socio int not null,
    id_servico int not null,

    constraint socios_fk_socios_servicos
        foreign key(id_socio) references socios(id)
        on delete restrict
        on update cascade,

    constraint servicos_fk_socios_servicos
        foreign key(id_servico) references servicos(id)
        on delete  restrict
        on update cascade
);

    -- Comandos DML
    insert into socios(numero,nome,endereco,cod_tipo_socio,descricao_tipo_socio) values(2212,'João Lucas','rua Barão do Rio Branco,1246,Torres',12,'luxo');
    insert into socios(numero,nome,endereco,cod_tipo_socio,descricao_tipo_socio) values(2215,'Diogo Montes','rua Barão do Rio Branco,1245,Torres',13,'vip');
    insert into socios(numero,nome,endereco,cod_tipo_socio,descricao_tipo_socio) values(2216,'Nivea Cantina','rua Linda,1221,Torres',14,'premium');
    insert into socios(numero,nome,endereco,cod_tipo_socio,descricao_tipo_socio) values(2211,'Ana Banana','rua do pão,1246,Torres',20,'plus');

    insert into servicos(cod_servico,descricao,mes_referencia,valor_pago) values(789,'tênis','2020-01-23',250);
    insert into servicos(cod_servico,descricao,mes_referencia,valor_pago) values(987,'piscina','2020-01-30',500);
    insert into servicos(cod_servico,descricao,mes_referencia,valor_pago) values(790,'carro','2022-01-23',700.5);

    insert into socios_servicos(id_socio,id_servico) values(2212,789);
    insert into socios_servicos(id_socio,id_servico) values(2215,987);
    insert into socios_servicos(id_socio,id_servico) values(2216,790);

    -- Listar os servicos maiores que 500
        SELECT * from servicos
        where valor_pago = 500 OR valor_pago > 500; 

    -- Listar os servicos onde o mês de referencia é janeiro de 2020
        SELECT * from servicos
        where mes_referencia like '%2020-01%';

    -- Listar os socios da rua Barão do rio branco
        SELECT * from socios
        where endereco like '%rua barão do rio branco%';