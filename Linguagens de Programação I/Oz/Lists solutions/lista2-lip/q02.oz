% Dê um exemplo onde N não existe no
% ambiente no momento da chamada.


local A=10 B in
    local MulByN in
      local N=3 in
        proc {MulByN X ?Y}
          Y=N*X
        end
      end

      {MulByN A B}
      {Browse B}
      % Mostra 30
      {Browse N}
      % N não existe

    end
  end


  % Dê um exemplo em que N existe,
  % mas está vinculado a um valor diferente de 3.

    local A=10 B in
        local MulByN in
          local N=3 in
            proc {MulByN X ? Y}
              Y=N*X
            end
          end
          local N=10 in
            {MulByN A B}
            {Browse B} 
            {Browse N}
          end
        end
      end

