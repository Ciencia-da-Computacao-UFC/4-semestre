% (a)
declare
C={NewCell 0}

thread I in
   I = @C
   C := I + 1
end

thread J in
   J = @C
   C := J + 1
end

{Browse @C}


% (b)

declare
Z={NewCell 0}

thread K in
   K = @Z
   {Delay 1000}
   Z := K + 1
end

thread L in
   L = @Z
   Z := L + 1
end

{Delay 1000}

{Browse @Z}

% c

declare
C={NewCell 0}
L={NewLock}
thread
   lock L then I in
      I=@C
      C:=I+1
   end
end

thread
   lock L then J in
      J=@C
      C:=J+1
   end
end

{Delay 2000}

{Browse @C}
% Não funciona