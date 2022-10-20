create table nome_da_tabela
(
    nome_do_atributo | dominio | vazios | chaves,
    nome_do_atributo | dominio | vazios | chaves,
);

create table clientes
(
    id int not null primary key,
    nome varchar(100) not null,
    CPF char(14) not null unique
);

create table enderecos
(
    id int not null primary key,
    logradouro varchar(100) not null,
    numero char(10),
    bairro varchar(100),
    estado char(2),
    id_cliente int not null,
        constraint fk_clientes_enderecos
            foreign key(id_cliente) references clientes(id)
);

create table aluno
(
    id int auto_increment primary key,
    nome varchar(80) not null
);

create table departamento 
(
    id int not null primary key,
    nome varchar(100) not null
);

create table curso
(
    id int not null primary key,
    nome varchar(100) not null,
    constraint fk_departamento_curso
        foreign key(id_departamento) references departamento(id)
);

create table professor 
(
    id int not null,
    nome varchar(100) not null
);

create table disciplina 
(
    id int not null,
    nome varchar(100) not null,
    constraint fk_disciplina_professor
        foreign key(id_professor) references professor(id)
);

create table matricula
(
    data_matr datetime not null,
    constraint fk_disciplina_matricula
        foreign key(id_disciplina) references disciplina(id),
    constraint fk_aluno_matricula
        foreign key(id_aluno) references aluno(id)
);