#include <iostream>
using namespace std;
#include "methods.h"

 
int main(int argc, char* argv[]){
    
    double d0 = 0.5, d1 = 0.6; 
    int n, resp;
    bool menu_ops;
    bool run = true;
    double precision;
    double* amplitudes;


    cout << "\nSistema de análise de fenômenos da natureza.\n";

    while (run) {

        cout << "\nPara começar, entre o número de valores de amplitude 'a' que deseja testar:\n";
        cin >> n;

        amplitudes = new double[n];

        cout << "\nInsira cada um dos valores de amplitude:\n";
        
        for (int i = 0; i<n; i++) {
            cout << "\nInsira o valor número " << i+1 << ":\n";
            cin >> amplitudes[i];
        }

        cout << "\nPor fim, insira o valor do épsilon:\n";
        cin >> precision;

        menu_ops = true;
        while (menu_ops) {
            cout << "\nQual operação gostaria de realizar?\n";
            cout << "  [1] - Para realizar a demonstração das iterações dos métodos para cada \"a\".\n";
            cout << "  [2] - Para testar os métodos para a = 1; d0 = 0.5 e E = 0.0001\n";
            cout << "  [3] - Para visualizar o Quadro Resposta com \"d\" para cada método.\n";
            cout << "  [4] - Para visualizar o Quadro Comparativo dos dados para cada método.\n";
            cout << "  [5] - Para visualizar a análise de variação do a para cada método.\n";
            cout << "  [6] - Para usar dados diferentes.\n";
            cout << "  [7] - Para encerrar o programa.\n";
            cout << "Opção: ";
            cin >> resp;

            switch (resp) {
                case 1:
                    // Itens A, B e C
                    cout << endl;   
                    cout << "\033[1;47;34mDemonstração das iterações dos métodos para cada \"a\", d0 = " << 
                    d0 << " e E = " << precision << ":\033[0m" << endl;
                    for(int i = 0; i < n; ++i){
                        double a = amplitudes[i];
                        calculateResults(a, d0, d1, precision);
                    }
                    break;
                case 2:
                    // Item D
                    cout << "\n\033[1;47;34mTestando métodos para a = 1, d0 = 0.5 e E = 0.0001:\033[0m" << endl;  
                    testResults();
                    break;
                case 3:
                    // Item E
                    cout << "\n\033[1;47;34mQuadro resposta com \"d\" para cada método:\033[0m" << endl;    
                    for(int i = 0; i < n; ++i) {
                        double a = amplitudes[i];
                        resultTable(a, d0, d1, precision);        
                    } 
                    break;
                case 4:
                    // Item F
                    cout << "\n\n\033[1;47;34mQuadro comparativo dos dados para cada método:\033[0m" << endl;
                    comparativeResultTable(n, amplitudes, d0, d1, precision);
                    break;
                case 5:
                    // Item G
                    cout << "\n\n\033[1;47;34mAnálise da variação de a para cada método:\033[0m" << endl; 
                    analiseVariacao(d0, d1, precision);
                    break;
                case 6:
                    menu_ops = false;
                    break;
                case 7:
                    menu_ops = false;
                    run = false;
                    delete[] amplitudes;
                    break;
                default:
                    cout << "Entre um valor válido!\n";
            }



        }

    }

    return 0;
}