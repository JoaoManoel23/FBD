create table colaborador
(
    id int auto_increment primary key,
    numero_matricula varchar(20) not null unique,
    nome varchar(100) not null,
    email varchar(100) not null,
    senha varchar(20) not null,
    primary key(id,numero_matricula),
    id_coordenador int,
    constraint colaboradores_fk_coordenadores
        foreign key(id_coordenador) references colaboradores(id); 
);
create table comentarios
(
    id int auto_increment primary key,
    descricao varchar(200) not null,
    data_e_hora timestamp not null,
    id_colaborador int not null,
        constraint fk_colaboradores_comentarios
            foreign key(id_colaborador) references colaborador(id)
);
create table projeto
(
    id int auto_increment primary key,
    nome varchar(100) not null,
    descricao varchar(200),
    duracao datetime not null,
    id_colaborador int not null,
        constraint fk_colaboradores_projeto
            foreign key(id_colaborador) references colaborador(id)
);
create table projeto_colaboradores
{
    id int auto_increment,
    id_colaborador int not null,
    id projeto int not null,
    constraint colaboradores_fk_projetos_colaboradores
        foreign key(id_colaborador) references colaboradores(id),
    constraint projetos_fk_projetos_colaboradores
        foreign key(id_projeto) references projeto(id)
}
create table melhoria
(
    id int not null primary key,
    id_projeto int not null,
    resultados_esperados varchar(1000),
    id_departamento int not null,
    constraint projetos_fk_projetos_melhoria_processos
        foreign key(id_projeto) references projeto(id),
    constraint departamentos_fk_projetos_melhoria_processos
        foreign key(id_departamento) references departamento(id)
);
create table projetos_sociais
(
    id int not null primary key,
    publico_beneficiario varchar(100) not null,
    id_projeto int not null,
    constraint projetos_fk_projetos_sociais
        foreign key(id_projeto) references projeto(id)
        on delete cascade
);

-- alter table
alter table projetos add collumn data_criacao date;