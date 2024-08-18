:- style_check(-singleton).
:- dynamic(feature/2).
:- dynamic(professor/12).
:- dynamic(clearBase/1).
:- dynamic(clearBase1/1).
:- dynamic(play/0).
:- dynamic(play/1).
:- dynamic(question_1/0).
:- dynamic(question_2/0).
:- dynamic(question_3/0).
:- dynamic(question_4/0).
:- dynamic(question_5/0).
:- dynamic(question_6/0).
:- dynamic(question_7/0).
:- dynamic(question_8/0).
:- dynamic(question_9/0).
:- dynamic(question_10/0).
:- dynamic(question_11/0).
:- dynamic(question_12/0).

%symbolic fact
feature(nothing, y_n).

clearBase(X):- clearBase1(X), fail.
  clearBase(X).

clearBase1(X):- retract(X).
  clearBase1(X).

% Main cast
% Name, Male, Brazilian, PHD, Tall, Blonde, IsParent, GameOfLithrones, Gym, Glasses, Vehicle, Tattoo
                              %  M  B  P  T  B  I  G  G  G  V
professor('Pablo Soares',        y, y, y, y, n, n, n, y, y, y, n). 
professor('Rosineide da Paz',    n, y, n, n, y, y, n, y, y, y, n).
professor('Alexandre Arruda',    y, y, y, y, n, y, y, y, y, n, n).
professor('Márcio Costa',        y, y, y, n, n, n, n, y, n, n, n).
professor('Bonfim Amaro',        y, y, y, y, n, y, y, n, n, y, n).
professor('Anderson Feitoza',            y, y, y, y, n, n, n, y, n, y, n).
professor('Tatiane Fernandes',   n, y, y, n, y, n, n, y, n, n, y).
professor('Alex Lima',                y, y, y, y, n, n, n, y, y, n, n).
professor('Gastão Frederico',              y, n, y, n, n, y, y, n, y, y, n).
professor('Daniel Siqueira',     y, y, n, y, y, y, n, n, y, y, n).
professor('Filipe Maciel',              y, y, n, y, n, n, n, y, y, y, n).
professor('Nilde',               n, n, y, n, n, y, n, n, n, y, n).
professor('Dmontier Aragão',     y, y, y, y, n, y, n, n, y, y, n).
professor('Eurinardo',           y, y, n, y, n, y, n, n, y, y, n).
professor('Jocksam',             y, y, n, n, n, n, n, n, n, y, n).
professor('Markos Oliveira',     y, y, y, y, n, n, n, n, y, y, n).
professor('Osvaldo Mesquita',    y, y, n, y, n, n, n, y, y, y, y).
professor('Anna Beatriz',        n, y, y, n, y, n, n, n, y, y, y).
professor('Marília Soares',      n, y, y, n, n, y, n, n, n, y, n).
professor('Rafael Ivo',          y, y, y, n, n, y, n, y, y, y, n).
professor('Gleison Carneiro',    y, y, y, y, n, n, n, n, y, n, n).
professor('Marcos Vinicius',     y, y, n, n, n, n, n, n, y, y, n).




play :-
  clearBase(feature(Feature, Yn)),
  nl, write('Bem-vindo ao Akinator dos professores!'), nl, nl,
  question_1.

play(y) :-
  play.

play(n) :-
  nl, write('Obrigado por utilizar o Akinator dos Professores!'), nl, nl, !.

new_round :-
  nl, nl, write('Você gostaria de adivinhar outro professor (y/n)? '),
	read(Desire),
	play(Desire).

question_1 :-
  write('O professor é do sexo masculino (y/n)? '),
  read(AnswerMale2),
  asserta(feature(male, AnswerMale2)),
  feature(male, MaleQuery),

  % cria lista L de todos os personagens X com a caracteristica de MaleQuery
  findall(X, professor(X, MaleQuery, _, _, _, _, _, _, _, _, _, _), L),
  length(L, N), N == 1,
  professor(Z, MaleQuery, _, _, _, _, _, _, _, _, _, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  question_2.

question_2 :-
  write('O(A) professor(a) é Brasileiro(a)  (y/n)? '),
  read(AnswerBrazilian),
  asserta(feature(brazilian, AnswerBrazilian)),
  feature(male, MaleQuery),
  feature(brazilian, BrazilianQuery),
  findall(X, professor(X, MaleQuery, BrazilianQuery, _, _, _, _, _, _, _, _, _), L),
  length(L, N), N == 1,
  professor(Z, MaleQuery, BrazilianQuery, _, _, _, _, _, _, _, _, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  question_3.

question_3 :-
  write('O(A) professor(a) concluiu o Doutorado (y/n)? '),
  read(AnswerPHD),
  asserta(feature(phd, AnswerPHD)),
  feature(male, MaleQuery),
  feature(brazilian, BrazilianQuery),
  feature(phd, PHDQuery),
  findall(X, professor(X, MaleQuery, BrazilianQuery, PHDQuery, _, _, _, _, _, _, _, _), L),
  length(L, N), N == 1,
  professor(Z, MaleQuery, BrazilianQuery, PHDQuery, _, _, _, _, _, _, _, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  question_4.

question_4 :-
  write('O(A) professor(a) é alto(a) (y/n)? '),
  read(AnswerTall),
  asserta(feature(tall, AnswerTall)),
  feature(male, MaleQuery),
  feature(brazilian, BrazilianQuery),
  feature(phd, PHDQuery),
  feature(tall, TallQuery),
  findall(X, professor(X, MaleQuery, BrazilianQuery, PHDQuery, TallQuery, _, _, _, _, _, _, _), L),
  length(L, N), N == 1,
  professor(Z, MaleQuery, BrazilianQuery, PHDQuery, TallQuery, _, _, _, _, _, _, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  question_5.

question_5 :-
  write('O(A) professor(a) é loiro(a) (y/n)? '),
  read(AnswerBlonde),
  asserta(feature(blonde, AnswerBlonde)),
  feature(male, MaleQuery),
  feature(brazilian, BrazilianQuery),
  feature(phd, PHDQuery),
  feature(tall, TallQuery),
  feature(blonde, BlondeQuery),
  findall(X, professor(X, MaleQuery, BrazilianQuery, PHDQuery, TallQuery, BlondeQuery, _, _, _, _, _, _), L),
  length(L, N), N == 1,
  professor(Z, MaleQuery, BrazilianQuery, PHDQuery, TallQuery, BlondeQuery, _, _, _, _, _, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  question_6.

question_6 :-
  write('O(A) professor(a) já teve filhos(as) (y/n)? '),
  read(AnswerIsParent),
  asserta(feature(parent, AnswerIsParent)),
  feature(male, MaleQuery),
  feature(brazilian, BrazilianQuery),
  feature(phd, PHDQuery),
  feature(tall, TallQuery),
  feature(blonde, BlondeQuery),
  feature(parent, ParentQuery),
  findall(X, professor(X, MaleQuery, BrazilianQuery, PHDQuery, TallQuery, BlondeQuery, ParentQuery, _, _, _, _, _), L),
  length(L, N), N == 1,
  professor(Z, MaleQuery, BrazilianQuery, PHDQuery, TallQuery, BlondeQuery, ParentQuery, _, _, _, _, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  question_7.

question_7 :-
  write('O(A) professor(a) foi para a Game of Litrones (y/n)? '),
  read(AnswerGameOfLitrones),
  asserta(feature(litrones, AnswerGameOfLitrones)),
  feature(male, MaleQuery),
  feature(brazilian, BrazilianQuery),
  feature(phd, PHDQuery),
  feature(tall, TallQuery),
  feature(blonde, BlondeQuery),
  feature(parent, ParentQuery),
  feature(litrones, LitronesQuery),
  findall(X, professor(X, MaleQuery, BrazilianQuery, PHDQuery, TallQuery, BlondeQuery, ParentQuery, LitronesQuery, _, _, _, _), L),
  length(L, N), N == 1,
  professor(Z, MaleQuery, BrazilianQuery, PHDQuery, TallQuery, BlondeQuery, ParentQuery, LitronesQuery, _, _, _, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  question_8.

question_8 :-
  write('O(A) professor(a) faz academia (y/n)? '),
  read(AnswerGoesToGym),
  asserta(feature(gym, AnswerGoesToGym)),
  feature(male, MaleQuery),
  feature(brazilian, BrazilianQuery),
  feature(phd, PHDQuery),
  feature(tall, TallQuery),
  feature(blonde, BlondeQuery),
  feature(parent, ParentQuery),
  feature(litrones, LitronesQuery),
  feature(gym, GymQuery),
  findall(X, professor(X, MaleQuery, BrazilianQuery, PHDQuery, TallQuery, BlondeQuery, ParentQuery, LitronesQuery, GymQuery, _, _, _), L),
  length(L, N), N == 1,
  professor(Z, MaleQuery, BrazilianQuery, PHDQuery, TallQuery, BlondeQuery, ParentQuery, LitronesQuery, GymQuery, _, _, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  question_9.

question_9 :-
  write('O(A) professor(a) usa óculus (y/n)? '),
  read(AnswerHasTattoo),
  asserta(feature(glasses, AnswerHasTattoo)),
  feature(male, MaleQuery),
  feature(brazilian, BrazilianQuery),
  feature(phd, PHDQuery),
  feature(tall, TallQuery),
  feature(blonde, BlondeQuery),
  feature(parent, ParentQuery),
  feature(litrones, LitronesQuery),
  feature(gym, GymQuery),
  feature(glasses, WearsGlassesQuery),
  findall(X, professor(X, MaleQuery, BrazilianQuery, PHDQuery, TallQuery, BlondeQuery, ParentQuery, LitronesQuery, GymQuery, WearsGlassesQuery, _, _), L),
  length(L, N), N == 1,
  professor(Z, MaleQuery, BrazilianQuery, PHDQuery, TallQuery, BlondeQuery, ParentQuery, LitronesQuery, GymQuery, WearsGlassesQuery, _, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  question_10.

question_10 :-
  write('O(A) professor(a) possui veículo próprio (y/n)? '),
  read(AnswerHasTattoo),
  asserta(feature(glasses, AnswerHasTattoo)),
  feature(male, MaleQuery),
  feature(brazilian, BrazilianQuery),
  feature(phd, PHDQuery),
  feature(tall, TallQuery),
  feature(blonde, BlondeQuery),
  feature(parent, ParentQuery),
  feature(litrones, LitronesQuery),
  feature(gym, GymQuery),
  feature(glasses, WearsGlassesQuery),
  feature(vehicle, OwnsVehicleQuery),
  findall(X, professor(X, MaleQuery, BrazilianQuery, PHDQuery, TallQuery, BlondeQuery, ParentQuery, LitronesQuery, GymQuery, WearsGlassesQuery, OwnsVehicleQuery, _), L),
  length(L, N), N == 1,
  professor(Z, MaleQuery, BrazilianQuery, PHDQuery, TallQuery, BlondeQuery, ParentQuery, LitronesQuery, GymQuery, WearsGlassesQuery, OwnsVehicleQuery, _),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  question_11.

  question_11 :-
  write('O(A) professor(a) tem tatuagem (y/n)? '),
  read(AnswerHasTattoo),
  asserta(feature(glasses, AnswerHasTattoo)),
  feature(male, MaleQuery),
  feature(brazilian, BrazilianQuery),
  feature(phd, PHDQuery),
  feature(tall, TallQuery),
  feature(blonde, BlondeQuery),
  feature(parent, ParentQuery),
  feature(litrones, LitronesQuery),
  feature(gym, GymQuery),
  feature(glasses, WearsGlassesQuery),
  feature(vehicle, OwnsVehicleQuery),
  feature(tattoo, HasTattooQuery),
  findall(X, professor(X, MaleQuery, BrazilianQuery, PHDQuery, TallQuery, BlondeQuery, ParentQuery, LitronesQuery, GymQuery, WearsGlassesQuery, OwnsVehicleQuery, HasTattooQuery), L),
  length(L, N), N == 1,
  professor(Z, MaleQuery, BrazilianQuery, PHDQuery, TallQuery, BlondeQuery, ParentQuery, LitronesQuery, GymQuery, WearsGlassesQuery, OwnsVehicleQuery, HasTattooQuery),
  write('Hmm... Eu acho que... '), write(Z), write('!'), new_round;
  write('Arghhh!!! Não!!!'), new_round.
  


