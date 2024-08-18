insert into unidade_academica values (1, 'Centro de Ciências', 'Rua Humberto Monte');
insert into unidade_academica values (2, 'Centro de Humanidades', 'Rua Humberto Monte');
insert into unidade_academica values (3, 'Centro de Tecnologia', 'Rua Humberto Monte');
insert into unidade_academica values (4, 'Faculdade de Direito', 'Rua Humberto Monte');
insert into unidade_academica values (5, 'Faculdade de Medicina', 'Rua Humberto Monte');



insert into telefones_UA values ('555-777', 'Comercial', 1);
insert into telefones_UA values ('988-887', 'Comercial', 1);
insert into telefones_UA values ('555-492', 'Comercial', 2);
insert into telefones_UA values ('15-777', 'Comercial', 3);
insert into telefones_UA values ('554-777', 'Comercial', 4);
insert into telefones_UA values ('534-787', 'Comercial', 5);


-- cod_dep, cod_UA
insert into departamento values (1, 1, 'Computação', 'Bloco 912');
insert into departamento values (2, 1, 'Departamento de Estatística e Matemática Aplicada', 'Bloco 910');
insert into departamento values (3, 1, 'Departamento de Biologia', 'Bloco 912');
insert into departamento values (4, 5, 'Departamento de Cirurgia', 'Rua Alexandre Baraúna');
insert into departamento values (5, 2, 'Design de Moda', 'Bloco 308');
insert into departamento values (6, 4, 'Departamento de Direito Público', 'Rua Meton de Alencar');
insert into departamento values (7, 3, 'Departamento de Arquitetura e Urbanismo e Design', 'Avenida da Universidade');
insert into departamento values (8, 3, 'Departamento de Engenharia Elétrica', 'Pici');


insert into telefones_dep values ('551-754', 'Comercial', 1);
insert into telefones_dep values ('881-784', 'Comercial', 1);
insert into telefones_dep values ('991-7554', 'Comercial', 2);
insert into telefones_dep values ('551-874', 'Comercial', 3);
insert into telefones_dep values ('551-754', 'Comercial', 4);
insert into telefones_dep values ('451-453', 'Comercial', 5);



-- cod_curso
insert into curso values (1, 'Ciência da Computação', 'Bloco 912' );
insert into curso values (2, 'Filosofia', 'Bloco 414' );
insert into curso values (3, 'Engenharia de Computação', 'Bloco 714' );
insert into curso values (4, 'Enfermagem', 'Porangabuçu' );
insert into curso values (5, 'Direito', 'Bloco 912' );
insert into curso values (6, 'Engenharia Elétrica', 'Bloco 512' );

-- cod_dep, cod_curso
insert into dep_curso values (1,1);
insert into dep_curso values (6,2);
insert into dep_curso values (5,4);
insert into dep_curso values (1,3);
insert into dep_curso values (6,5);
insert into dep_curso values (8,6);




insert into disciplina values (1, 'Fundamentos de Bancos de Dados', 96);
insert into disciplina values (2, 'Técnicas de Programação', 64);
insert into disciplina values (3, 'Física I', 64);
insert into disciplina values (4, 'Anatomia', 96);
insert into disciplina values (5, 'Psicanálise', 64);
insert into disciplina values (6, 'Biologia', 64);
insert into disciplina values (7, 'Direito Civil I', 96);
insert into disciplina values (8, 'Circuitos Digitais', 64);
insert into disciplina values (9, 'Ética', 64);
insert into disciplina values (10, 'Teoria do Conhecimento', 64);
insert into disciplina values (11, 'Física II', 64);
insert into disciplina values (12, 'Direito Civil II', 96);

-- disc, pre_requisito
insert into pre_requisito values (1, 2);
insert into pre_requisito values (11, 3);
insert into pre_requisito values (6, 4);
insert into pre_requisito values (12, 7);
insert into pre_requisito values (10, 9);


--cod_disc, cod_curso
insert into cur_disc values (1, 1);
insert into cur_disc values (2, 1);
insert into cur_disc values (8, 1);
insert into cur_disc values (10, 2);
insert into cur_disc values (9, 2);
insert into cur_disc values (3, 3);
insert into cur_disc values (8, 3);
insert into cur_disc values (11, 3);
insert into cur_disc values (4, 4);
insert into cur_disc values (6,4) ;
insert into cur_disc values (7, 5);
insert into cur_disc values (9, 5);
insert into cur_disc values (3, 6);
insert into cur_disc values (11, 6);
insert into cur_disc values (8, 6);


-- matr, cod_curso, nome, rg, cpf, endereço
insert into aluno values (1, 1, 'Douglas', '1234', '123456', 'Rua General');
insert into aluno values (2, 1, 'Fernanda', '124644', '128756', 'Rua Júnior');
insert into aluno values (3, 2, 'Luana', '14654', '16545640', 'Rua Antonieta');
insert into aluno values (4,2, 'Britney', '174574', '184556', 'Beverly Hills');
insert into aluno values (5, 3, 'Charlie', '16475', '1265856', 'Rua Aspartame');
insert into aluno values (6, 3, 'William', '16456655', '125766', 'Rua sol');
insert into aluno values (7, 4, 'João', '164644', '2244456', 'Rua x');
insert into aluno values (8, 4, 'Maria', '136456', '1226436756', 'Rua z');
insert into aluno values (9, 5, 'Ana Cláudia', '13547456', '12000656', 'Rua Marte');
insert into aluno values (10,5, 'Jerry', '134546', '12223656', 'Rua dois');
insert into aluno values (11, 6, 'Lourdes', '13600456', '12778443656', 'Rua zeus');
insert into aluno values (12, 6, 'Romildo', '1365456', '122643656', 'Rua Túlio 23');


-- cod-disc, matr_aluno, semestre, af, ap1, ap2
insert into aluno_disc values (1, 1, '2020.2', NULL, 9, 8);
insert into aluno_disc values (2, 1, '2019.2', 8, 6, 5);
insert into aluno_disc values (8, 1, '2019.1', NULL, 9, 9.5);
insert into aluno_disc values (1, 2, '2018.2', 8, 6, 7);
insert into aluno_disc values (2, 2, '2017.2', NULL, 9, 9);
insert into aluno_disc values (8, 2, '2018.1', NULL, 5, 10);
insert into aluno_disc values (2, 3, '2020.1', NULL, 7, 6);
insert into aluno_disc values (2, 4, '2019.2', 7, 5, 5);
insert into aluno_disc values (3, 5, '2019.1', NULL, 10, 10);
insert into aluno_disc values (3, 6, '2019.2', NULL, 9, 9);
insert into aluno_disc values (4, 7, '2020.2', 6, 3, 1);
insert into aluno_disc values (4, 8, '2020.2', NULL, 9, 8);
insert into aluno_disc values (5, 9, '2020.2', NULL, 2, 6);
insert into aluno_disc values (5, 10, '2019.2', NULL, 10, 8);
insert into aluno_disc values (6, 11, '2018.2', NULL, 4, 8);
insert into aluno_disc values (6, 12, '2020.2', NULL, 9, 7);






-- matr, nome, rg, cpf, salario, endereço, dep-lotação, diretor_cod_UA, chefe_cod_dep, coordenador_cod_curso
insert into professor values (1, 'Brayner', '987', '96351', 4569.85, 'Rua Aeroporto', 1, NULL, 1, NULL);
insert into professor values (2, 'Jonas', '94587', '3534596351', 4569.85, 'Rua Aeroporto', 2, NULL, NULL, 2);
insert into professor values (3, 'Abgail', '346987', '3534596351', 2569.85, 'Rua A', 3, NULL, NULL, 3);
insert into professor values (4, 'Pablo', '9835347', '53596351', 8569.85, 'Rua B', 1, NULL, NULL, 1);
insert into professor values (5, 'Neuman’', '92287', '9633543551', 5569.85, 'Rua porto', 5, NULL, NULL, 5);
insert into professor values (6,  'Valéria', '954357657', '967567424551', 7569.85, 'Rua Abc', 4, NULL, NULL, 4);
insert into professor values (7,  'Pedro', '53456577', '96475684551', 7569.85, 'Rua Abcde', 4, NULL, 4, NULL);
insert into professor values (8, 'Bonfim', '9543557', '9634224551', 7569.85, 'Rua stop', 5, NULL, 5, NULL);
insert into professor values (9, 'Patrícia', '9543557', '934551', 7569.85, 'Rua Parlor', 6, NULL, NULL, 6);
insert into professor values (10, 'Anderson', '213425557', '938761', 3569.85, 'Rua Bonifácio', 6, NULL, 6, NULL);
insert into professor values (11, 'Tatiane', '123557', '90008951', 2569.85, 'Rua Gloriana', 5, 5, NULL, NULL);
insert into professor values (12, 'Johnson', '21342557', '12313224551', 1569.85, 'Rua Borsua', 6, 3, NULL, NULL);



-- matr_profesor, semestre, cod_disc
insert into prof_disc values (1, '2020.2', 1 );
insert into prof_disc values (1, '2018.2', 2 );
insert into prof_disc values (2, '2019.2', 3 );
insert into prof_disc values (2, '2020.1', 4 );
insert into prof_disc values (3, '2020.1', 5 );
insert into prof_disc values (4, '2019.1', 6 );
insert into prof_disc values (5, '2018.1', 7 );
insert into prof_disc values (5, '2018.2', 8 );
insert into prof_disc values (6, '2019.2', 9 );
insert into prof_disc values (7, '2020.2', 10 );
insert into prof_disc values (8, '2020.2', 11 );
insert into prof_disc values (8, '2021.2', 12 );
insert into prof_disc values (9, '2018.2', 2);
insert into prof_disc values (10, '2019.2', 3 );
insert into prof_disc values (11, '2018.2', 4 );
insert into prof_disc values (11, '2020.2', 5 );
insert into prof_disc values (12, '2020.1', 6 );
insert into prof_disc values (12, '2019.2', 7 );