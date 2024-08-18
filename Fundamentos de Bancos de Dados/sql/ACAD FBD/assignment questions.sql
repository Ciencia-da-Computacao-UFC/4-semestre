-- 2-)
--a)

/*
select ua.nome as 'Unidade Acad�mica', 
count(distinct d.Cod_dep) as 'N�mero de Departamentos',
count(distinct c.Cod_curso) as 'N�mero de Cursos', 
count(a.matr_aluno) as 'N�mero de Alunos'
from (((unidade_academica ua join departamento d on ua.Cod_UA = d.Cod_UA)
join dep_curso dc on dc.Cod_dep = d.Cod_dep)
join curso c on c.Cod_curso = dc.Cod_curso)
join aluno a on a.curso_fk = c.Cod_curso
group by ua.nome
order by 4 desc

*/
-- b)

/*
select a.nome as 'Aluno', 
d.nome as 'Disciplina', ad.semestre as 'Semestre',
ad.ap1 as '1� AP', ad.ap2 as '2� AP', isnull(cast(ad.af as char(2)), '--') as 'AF'
from ((aluno a join aluno_disc ad on a.matr_aluno = ad.matr_aluno)
join disciplina d on d.cod_disc = ad.cod_disc)
join curso c on c.Cod_curso = a.curso_fk
where c.nome = 'Ci�ncia da Computa��o'
order by a.nome, a.matr_aluno
*/

-- c)


/*
select p.nome
from (unidade_academica ua join departamento d on ua.Cod_UA = d.Cod_UA)
join professor p on p.lotacao = d.Cod_dep
where ua.nome = 'Centro de Ci�ncias' and p.matr <> all

(
select p.matr
from (((unidade_academica ua join departamento d on ua.Cod_UA = d.Cod_UA)
join professor p on p.lotacao = d.Cod_dep)
join prof_disc pd on pd.Matr_prof = p.matr)
join disciplina disc on disc.cod_disc = pd.cod_disc
where (pd.semestre = '2018.1')
group by p.matr, p.nome
having sum(disc.quantidade_creditos) >= 8

union

select p.matr
from (((unidade_academica ua join departamento d on ua.Cod_UA = d.Cod_UA)
join professor p on p.lotacao = d.Cod_dep)
join prof_disc pd on pd.Matr_prof = p.matr)
join disciplina disc on disc.cod_disc = pd.cod_disc
where pd.semestre = '2018.2'
group by p.matr, p.nome
having sum(disc.quantidade_creditos) >= 8
)
*/

-- d)
/*
select a.nome, case when ad.af <> NULL then 0 else 10 end
--if(ad.af > 1, (avg(ad.ap1) + avg(ad.ap2))/2), 5)
from aluno a join aluno_disc ad on a.matr_aluno = ad.matr_aluno
--group by a.matr_aluno, a.nome

select *
from aluno a join aluno_disc ad on a.matr_aluno = ad.matr_aluno
order by 1

*/
SELECT ad.matr_aluno from aluno,aluno_disc ad where (select max((ap1+ap2)/2))
union all
--lista alunos que n�o fizeram af
(SELECT *
FROM aluno a
	join aluno_disc ad on a.matr_aluno = ad.matr_aluno
WHERE  ad.af IS NULL))

