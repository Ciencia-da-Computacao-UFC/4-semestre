% (a) A resposta desse item está no documento.

% (b)

declare
fun {OrElse BP1 BP2}
    if {BP1} then true else {BP2} end
  end
  {Browse {OrElse fun {$} false end fun {$} 'Isso é um teste!' end}}
  
  fun {Test EX1 EX2}
    EX1 orelse EX2
  end
  {Browse {Test false 'Isso é um teste!'}}
