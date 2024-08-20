#include <iostream>
#include <iomanip>
#include "math.h"
#include "./methods.h"
#include <string>
#include "TextTable.h"
#define NDECIMAL 6

using namespace std;

int main() {
    int n;
    double **A;
    bool run = true;
    bool menu_ops = true;
    int resp;
    
    double *b;
    double precision;    
    cout << setprecision(NDECIMAL) << fixed;


    
    //Exemplo de calibragem
    double **Exemplo;
    Exemplo = createMatrix<double>(3);
    double *bExemplo;
    Exemplo[0][0] = 5; Exemplo[0][1] = 3, Exemplo[0][2] = 1;
    Exemplo[1][0] = 5; Exemplo[1][1] = 6, Exemplo[1][2] = 1;
    Exemplo[2][0] = 1; Exemplo[2][1] = 6, Exemplo[2][2] = 7;
    
    bExemplo = new double[3];
    bExemplo[0] = 1, bExemplo[1] = 2, bExemplo[2] = 3;
    double precisionExemplo = 0.0000001;
    

    double** invExemploJacobi = invertMatrix(GaussJacobi, Exemplo, 3, precisionExemplo, false);
    double** invExemploSeidel = invertMatrix(GaussSeidel, Exemplo, 3, precisionExemplo, false);

    double *dExemploJacobi = multMatrizVetor(invExemploJacobi, bExemplo, 3);
    double *dExemploSeidel = multMatrizVetor(invExemploSeidel, bExemplo, 3);
    

       
    cout << endl << "Bem-vindo ao sistema de análise do fenômeno da natureza.\n";

    while (run)  {

        cout << "\nPara começar, digite o número de deslocamentos:" << endl;
        cin >> n;
    
        A = createMatrix<double>(n);

        cout << "Digite os termos da matriz A de coeficientes:" << endl;
        readMatrix(A, n);

        cout << "Agora digite os termos do vetor b dos termos independentes:" << endl;
        b = new double[n];
        readArray(b, n);

        cout << "Por fim, digite a precisão:" << endl;
        cin >> precision;

        double** invJacobi = invertMatrix(GaussJacobi, A, n, precision, false);
        double *dJacobi = multMatrizVetor(invJacobi, b, n);

        double** invSeidel = invertMatrix(GaussSeidel, A, n, precision, false);
        double *dSeidel = multMatrizVetor(invSeidel, b, n);

        double** invJacobiGraph;
        double** invSeidelGraph;


        menu_ops = true;
        while (menu_ops) {
            cout << "\nQual operação gostaria de realizar?\n";
            cout << "  -Entre 1 realizar a calibragem do sistema e analisar os resultados do vetor de deslocamentos.\n";
            cout << "  -Entre 2 para checar se a matriz A atende ao critérios das linhas e de Sassenfeld.\n";
            cout << "  -Entre 3 para calcular a inversa de A e o vetor de deslocamentos com o Método de Gauss-Jacobi. \n";
            cout << "  -Entre 4 para calcular a inversa de A e o vetor de deslocamentos com o Método de Gauss-Seidel.\n";
            cout << "  -Entre 5 para visualizar um gráfico da progressão de erros calculados a cada iteração (dados de entrada).\n";
            cout << "  -Entre 6 para visualizar um gráfico da progressão de erros calculados a cada iteração (caso padrão).\n";
            cout << "  -Entre 7 para usar dados diferentes.\n";
            cout << "  -Entre 8 para encerrar o programa.\n";
            cout << "Opção: ";
            cin >> resp;


            switch (resp) {
                case 1:
                    // Itens C e E
                    cout << endl;
                    cout << "\n\033[1;47;34mResultados para o caso de calibragem:\033[0m" << endl;
                    cout << "A matriz de calibragem é: \n"<< "[A] = \n";
                    printMatrix(Exemplo, 3);
                    cout << "{b} = \n";
                    printarVetor(bExemplo, 3);
                    
                    cout << "\nDeslocamentos com o método de Gauss-Jacobi: \n\n";
                    printResults(dExemploJacobi, 3);
                    cout << endl;
                    
                    cout << "\nDeslocamentos com o método de Gauss-Seidel: \n\n";
                    printResults(dExemploSeidel, 3);
                    cout << endl;

                    break;
                case 2:
                    if (critLinhas(A, n)) cout << "A matriz A atende ao critério das linhas.\n" << endl;
                    else cout << "A matriz A NÃO atende ao critério das linhas.\n" << endl;

                    if (critSassen(A, n)) cout << "A matriz A atende ao critério de Sassenfeld.\n" << endl;
                    else cout << "A matriz A NÃO atende ao critério de Sassenfeld.\n" << endl;

                    break;
                case 3:
                    // Item D.1
                    cout << "\n\033[1;47;34mResultados para os dados de entrada usando o Método de Gauss-Jacobi\033[0m" << endl;  
                    cout << "\nMatriz Invertida calculada:\n\n";
                    printMatrix<double>(invJacobi, n);
                    cout << "\nDeslocamentos:\n\n";
                    printResults(dJacobi, n);
                    cout << endl;
                    break;
                case 4:
                    // Item D.2
                    cout << "\n\033[1;47;34mResultados para os dados de entrada usando o Método de Gauss-Seidel\033[0m" << endl;  
                    cout << "\nMatriz Invertida calculada:\n\n";
                    printMatrix<double>(invSeidel, n);
                    cout << "\nDeslocamentos:\n\n";
                    printResults(dSeidel, n);
                    cout << endl;
                    break;
                case 5:
                    invJacobiGraph = invertMatrix(GaussJacobi, A, n, precision, true);
                    cout << endl;
                    invSeidelGraph = invertMatrix(GaussSeidel, A, n, precision, true);

                    break;
                case 6:
                    invExemploJacobi = invertMatrix(GaussJacobi, Exemplo, 3, precisionExemplo, true);
                    invExemploSeidel = invertMatrix(GaussSeidel, Exemplo, 3, precisionExemplo, true);
                    break;
                case 7:
                    menu_ops = false;
                    break;
                case 8:
                    menu_ops = false;
                    run = false;
                    break;
                default:
                    cout << "Entre um valor válido!\n";
            }





        //closing brackets do menu_ops
        }

    // Desaloca Matriz A
    for (int i = 0; i < n; ++i) {
        delete[] A[i];
    }
    delete[] A;

    // desaloca array b
    delete[] b;





    //closing brackets do run
    }
           

    
    









    return 0;
       
//closing brackets final
}