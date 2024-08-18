fun lazy {Three} {Delay 1000} 3 end
{Three}+0
{Three}+0
{Three}+0

%traduçõa para facilitar leitura e analise

declare Three A B C
Three = proc {$ ?X} {Delay 1000} X=3 end
{ByNeed Three A}
A+0
{ByNeed Three B}
B+0
{ByNeed Three C}
C+0