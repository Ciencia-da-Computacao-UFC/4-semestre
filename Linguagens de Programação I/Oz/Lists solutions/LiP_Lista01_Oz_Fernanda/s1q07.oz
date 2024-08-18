/** Para variáveis o Browse mostra 23. E para células ele mostra 44. 44 é um escopo diferente.
    Como idenficador, vai funcionaar aquele declarado ṕor último. Sobre as variáveis, 
     23 e 44 são armazenados em lugares diferentes. **/

    local X in
        X = 23
        local X in
           X=44
        end
        {Browse X} 
        % browse mostra o x que é colocado no mesmo escopo léxico (X = 23)
     end
     
     local X in
        X={NewCell 23}
        X:=44
        {Browse @X} 
        % mostra 44, porque := reatribuir a célula X para o valor 44
     end