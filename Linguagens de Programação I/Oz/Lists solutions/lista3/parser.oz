declare
fun {Stat S1 Sn}
   T|S2=S1 in
   case T
   of begin then
      {Sequence Stat fun {$ X} X=';' end S2 'end'|Sn} 

      
   [] 'if' then C X1 X2 S3 S4 S5 S6 in
      {Comp C S2 S3}
      S3='then'|S4
      X1={Stat S4 S5}
      S5='else'|S6
      X2={Stat S6 Sn}
      'if'(C X1 X2)
   [] while then C X S3 S4 in
      C={Comp S2 S3}
      S3='do'|S4
      X={Stat S4 Sn}
      while(C X)
   [] read then I in
      I={Id S2 Sn}
      read(I)
   [] write then E in
      E={Expr S2 Sn}
      write(E)
   elseif {IsIdent T} then E S3 in
      S2=':='|S3
      E={Expr S3 Sn}
      assign(T E)
   else
      S1=Sn
      raise error(S1) end
   end
end

% <Prog> ::= program <Identifier> ; <Statement> end
fun {Prog S1 Sn} 
   Y Z S2 S3 S4 S5 in
   S1=program|S2
   Y={Id S2 S3}
   S3=';'|S4
   Z={Stat S4 S5}
   S5='end'|Sn
   prog(Y Z)
end

fun {Sequence NonTerm Sep S1 Sn}
   X1 S2 T S3 in
   X1={NonTerm S1 S2} % use a função de função passada para analisar a primeira ocorrência não terminal
   S2=T|S3 % agora com o resto, pegue T como o novo chefe
   if {Sep T} then X2 in % se for o separador que estamos procurando, continue analisando recursivamente
      X2={Sequence NonTerm Sep S3 Sn}
      T(X1 X2) % criar registro aninhado dinamicamente
   else % este foi o último, sem separador
      S2=Sn % então sabemos o resto que devolver
      X1 % e retornamos a única coisa analisada nesta sequência
   end
end

% todos estes se referem à sequência para fazer o trabalho real
fun {Comp S1 Sn} {Sequence Expr COP S1 Sn} end
fun {Expr S1 Sn} {Sequence Term EOP S1 Sn} end
fun {Term S1 Sn} {Sequence Fact TOP S1 Sn} end

% estes apenas verificam se foram passados ​​os tokens corretos, -> Bool
fun {COP Y}
   Y=='<' orelse Y=='>' orelse Y=='=<' orelse Y=='>=' orelse Y=='==' orelse Y=='!='
end
fun {EOP Y} Y=='+' orelse Y=='-' end
fun {TOP Y} Y=='*' orelse Y=='/' end

fun {Fact S1 Sn}
   T|S2=S1 in % T é a cabeça, S1 a caulda
   if {IsInt T} orelse {IsIdent T} then % nós temos um int ou um átomo / identificador
      S2=Sn
      T
   else E S2 S3 in % expressão entre parênteses, precisamos analisar
      S1='('|S2
      E={Expr S2 S3}
      S3=')'|Sn
      E
   end
end

fun {IsIdent X} {IsAtom X} end % identificador é apenas um átomo de Oz

% você afirma algo apenas escrevendo it = true. Sn é o valor de retorno: lista restante, S1 é lista de entrada, retornamos o identificador analisado
fun {Id S1 Sn} X in S1=X|Sn true={IsIdent X} X end


% a main

declare A Sn in
A = {Prog
     [program foo ';'
      while a '+' 3 '<' b 'do' b ':=' b '+' 1 'end']
     Sn}
{Browse A}