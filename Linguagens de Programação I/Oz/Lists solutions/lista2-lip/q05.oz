/* 

declare
proc {Test X}
  case X
  of a|Z then {Browse 'case'(1)}
  [] f(a) then {Browse 'case'(2)}
  [] Y|Z andthen Y==Z then {Browse 'case'(3)}
  [] Y|Z then {Browse 'case'(4)}
  [] f(Y) then {Browse 'case'(5)}
  else {Browse 'case'(6)} end
end

*/

declare
proc {Test2 X}
  case X of '|'(a Z) then {Browse 'case'(1)}
  else
    case X of f(a) then {Browse 'case'(2)}
    else
      case X of '|'(Y Z) then
        if Y==Z then {Browse 'case'(3)}
        else {Browse 'case'(4)}
        end
      else
        case X of f(Y) then {Browse 'case'(5)}
        else
          {Browse 'case'(6)}
        end
      end
    end
  end
end

% Para fazer os testes no exemplos dados,
% testei feed line em cada linha 

{Test2 [b c a]}
{Test2 f(b(3))} 
{Test2 f(a)} 
{Test2 f(a(3))} 
{Test2 f(d)} 
{Test2 [a b c]} 
{Test2 [c a b]} 
{Test2 a|a} 
{Test2 '|'(a b c)}