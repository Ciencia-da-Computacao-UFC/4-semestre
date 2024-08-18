% declare [F]={Module.link ['/home/fer/workspace/ufc/lip/trabalho2/logicalGates.ozf']}
declare [C]= {Module.link ['/home/fer/workspace/ufc/lip/trabalho2/logicalCircuits.ozf']}

declare
Z0=0|0|0|_
X0=1|1|0|_ Y0=0|1|0|_ C0 S0
X1=0|0|1|_ Y1=1|1|1|_ C1 S1
X2=0|0|0|_ Y2=0|0|0|_ C2 S2
in
{C.circuit1 X0 Y0 Z0 C0 S0}
{C.circuit1 X1 Y1 C0 C1 S1}
{C.circuit1 X2 Y2 C1 C2 S2}
{Browse input}
{Browse X0#Y0}
{Browse X1#Y1}
{Browse X2#Y2}
{Browse output}
{Browse S0}
{Browse S1}
{Browse S0}
