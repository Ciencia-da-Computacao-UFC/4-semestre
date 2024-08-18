create table unidade_academica(
Cod_UA int,
nome varchar(50),
endereco varchar(1000),
constraint ua_pk
	primary key(Cod_ua)
);

create table telefones_UA(
Num_fone varchar(20),
tipo_fone varchar(40),
Cod_UA int,
constraint telefones_UA_pk
	primary key(Num_fone, Cod_UA),
constraint unidade_academica_fk
	foreign key(Cod_UA) references unidade_academica
);


create table departamento(
Cod_dep int,
Cod_UA int,
nome varchar(50),
endereco varchar(100),
constraint departamento_pk
	primary key(Cod_dep),
constraint unidade_academica_dep_fk
	foreign key(Cod_UA) references unidade_academica
);

create table telefones_dep(
Num_fone varchar(20),
tipo_fone varchar(40),
Cod_dep int,
constraint telefones_dep_pk
	primary key(Num_fone, Cod_dep),
constraint dep_tel_fk
	foreign key(Cod_dep) references departamento
);

create table curso(
Cod_curso int,
nome varchar(50),
endereço varchar(100),
constraint cod_curso_pk
	primary key (Cod_curso)
);

create table dep_curso(
Cod_dep int,
Cod_curso int,
constraint cod_dep_dep_curso_fk
	foreign key(Cod_dep) references departamento,
constraint cod_curso_dep_curso_fk
	foreign key(Cod_curso) references curso,
constraint Cod_dep_dep_curso_pk
	primary key(Cod_dep, Cod_curso)
);

create table disciplina(
cod_disc int,
nome varchar(50),
quantidade_creditos int
constraint disciplina_pk
	primary key(cod_disc)
);

create table pre_requisito(
cod_disc int,
cod_pre_requisito int,
constraint cod_disc_pre_requisito_fk
	foreign key(cod_disc) references disciplina,
constraint cod_pre_requisito_pre_requisito_fk
	foreign key(cod_pre_requisito) references disciplina,
constraint pre_requisito_pk
	primary key(cod_disc, cod_pre_requisito)
);

create table cur_disc(
Cod_disciplina int,
Cod_curso int,
constraint cod_disciplina_cur_disc_fk
	foreign key(Cod_disciplina) references disciplina,
constraint cod_curso_cur_disc_fk
	foreign key(Cod_curso) references curso
);

create table aluno(
matr_aluno int,
curso_fk int,
nome varchar(50),
rg varchar(20),
cpf varchar(20),
endereco varchar(100),
constraint matr_aluno_pk
	primary key(matr_aluno),
constraint curso_aluno_fk 
foreign key(curso_fk) references curso
);

create table aluno_disc(
cod_disc int,
matr_aluno int,
semestre varchar(10),
af float,
ap1 float,
ap2 float,
constraint cod_disc_aluno_disc_fk
	foreign key(cod_disc) references disciplina,
constraint matr_aluno_aluno_disc_fk
	foreign key(matr_aluno) references aluno,
constraint aluno_disc_pk
	primary key(cod_disc, matr_aluno, semestre)
);

create table professor(
matr int,
nome varchar(50),
rg varchar(20),
cpf varchar(20),
salario float,
endereco varchar(100),
lotacao int,
diretor_cod_UA int,
chefe_cod_dep int,
coordenador_cod_curso int,
constraint matr_professor_pk
	primary key(matr),
constraint lotacao_professor_fk
	foreign key(lotacao) references departamento,
constraint diretor_cod_UA_professor_fk
	foreign key(diretor_cod_UA) references unidade_academica,
constraint chefe_cod_dep_professor_fk
	foreign key(chefe_cod_dep) references departamento,
constraint coordenador_cod_curso_professor_fk
	foreign key(coordenador_cod_curso) references curso
);

create table prof_disc(
Matr_prof int,
semestre varchar(10),
cod_disc int,
constraint matr_prof_prof_disc_fk
	foreign key(Matr_prof) references professor,
constraint cod_disc_prof_disc_fk
	foreign key(cod_disc) references disciplina,
constraint prof_disc_pk
	primary key(Matr_prof, cod_disc, semestre)
);