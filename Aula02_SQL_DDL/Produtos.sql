create table categorias 
(
    id int auto_increment primary key,
    codigo varchar(20) not null unique,
    nome varchar(100) not null
);
create table produtos
(
    id int auto_increment primary key,
    codigo varchar(20) not null unique,
    descricao varchar(50),
    data_cadastro datetime not null,
    valor_unitario int not null,
    id_categoria int not null,
    constraint categorias_fk_produtos
        foreign key (id_categoria) references categoria(id)
);
create table pede
(
    quantidade int primary key,
    valor_unitario int not null,
    datas datetime not null
);
create table fornecedores
(
    id int  auto_increment primary key not null,
    codigo int not null unique,
    nome varchar(100)
);
create table pedido
(
    id int primary key not null,
    id_fornecedor int not null,
    quantidade_pede int not null,
    id_produto int not null,
    constraint fornecedores_fk_pedidos
        foreign key (id_fornecedor) references fornecedores(id),
    constraint quantidade_fk_pedidos
        foreign key (quantidade_pede) references pede(quantidade),
    constraint produtos_fk_pedidos
        foreign key (id_produto) references produtos(id)
);


    -- Comandos DDL
    Alter table fornecedores
    add data_ultima_compra datetime not null;
    
    Alter table pede
    change datas data_pedido datetime not null;

    Alter table produtos drop column data_cadastro;

    Alter table produtos drop foreign key categorias_fk_produtos;
    Alter table produtos drop index categorias_fk_produtos;

    Alter table produtos
    add constraint categorias_fk_produtos
    foreign key (id_categoria)
    references categorias(id)
        on delete cascade
        on update restrict;

    Alter table fornecedores
    modify nome varchar(130) not null;

    Drop table fornecedores;
    -- Não deixou excluir;

    Alter table pede
    add numero_pedido varchar(20) not null;

    alter table produtos
    add nome varchar(100) not null;

    alter table produtos
    add nome varchar(100) not null;

    -- Comandos DML
    insert into categorias(codigo,nome) values(123,'cereais');
    insert into categorias(codigo,nome) values(321,'produto de limpeza');

    insert into produtos(codigo,nome,valor_unitario,id_categoria) values('1a','arroz',10,1);
    insert into produtos(codigo,nome,valor_unitario,id_categoria) values('3c','sabão em pó',5,4);
    insert into produtos(codigo,nome,valor_unitario,id_categoria) values('2a','sucrilhos',15,1);
    insert into produtos(codigo,nome,valor_unitario,id_categoria) values('1c','água sanitária',7,4);

    insert into pede(quantidade,valor_unitario,data_pedido,numero_pedido) values(12,10,'2022-10-17',100);
    insert into pede(quantidade,valor_unitario,data_pedido,numero_pedido) values(15,11,'2022-10-15',99);

    insert into fornecedores(codigo,nome,data_ultima_compra) values(23,'Cássio','2022-10-17');
    insert into fornecedores(codigo,nome,data_ultima_compra) values(23,'Lucas','2022-10-15');

    insert into pedido(id_fornecedor,quantidade_pede,id_produto) values(23,12,7)
    insert into pedido(id_fornecedor,quantidade_pede,id_produto) values(24,15,4)








