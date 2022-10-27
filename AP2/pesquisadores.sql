create table pesquisadores
(
    id int auto_increment primary key,
    cod_pesquisador int not null unique,
    nome varchar(100)
);
create table artigos
(
    id int auto_increment primary key,
    cod_artigo int not null unique,
    titulo varchar(50) not null,
    pag_inicial int not null,
    pag_final int not null,
    cod_periodico int not null,
    titulo_periodico varchar(50) not null,
    editora varchar(50) not null
);
create table pesquisadores_artigos
(
    id int auto_increment primary key,
    id_pesquisador int not null,
    id_artigo int not null,

    constraint pesquisadores_fk_pesquisadores_artigos
        foreign key(id_pesquisador) references pesquisadores(id)
        on delete restrict
        on update cascade,

    constraint artigos_fk_pesquisadores_artigos
        foreign key(id_artigo) references artigos(id)
        on delete  restrict
        on update cascade
);

    -- Comandos DML
    insert into pesquisadores(cod_pesquisador,nome) values(321,'João Lucas');
    insert into pesquisadores(cod_pesquisador,nome) values(123,'Lucas Lima');
    insert into pesquisadores(cod_pesquisador,nome) values(789,'Lima Duarte');
    insert into pesquisadores(cod_pesquisador,nome) values(987,'Ramon Costa');

    insert into artigos(cod_artigo,titulo,pag_inicial,pag_final,cod_periodico,titulo_periodico,editora)
    values(1234,'O uso dos porques',50,150,244,'Português E Linguagens','Abril');
    insert into artigos(cod_artigo,titulo,pag_inicial,pag_final,cod_periodico,titulo_periodico,editora)
    values(1235,'Linguagens de Programação',150,200,246,'Análise Computacional','Saraiva');
    insert into artigos(cod_artigo,titulo,pag_inicial,pag_final,cod_periodico,titulo_periodico,editora)
    values(1236,'Como Acabar com a preguiça',200,300,247,'Oms','Saraiva');

    insert into pesquisadores_artigos(id_pesquisador,id_artigo) values(1,1);
    insert into pesquisadores_artigos(id_pesquisador,id_artigo) values(2,3);
    insert into pesquisadores_artigos(id_pesquisador,id_artigo) values(4,2);

    -- Listar artigo com código 1234
    SELECT titulo from artigos
    WHERE cod_artigo = 1234;

    -- Listar os artigos da editora saraiva
    SELECT titulo FROM artigos
    WHERE editora LIKE '%saraiva%';

    -- Listar os pesquisadores que começem com João
    SELECT cod_pesquisador,nome FROM pesquisadores
    WHERE nome LIKE '%João%';

