% Essa é a tradução para linguagem núcleo:

local P in
    P = Proc { $ X }
      local T in
        T=X>0
        if T then {P X-1} end
      end
    end
  end