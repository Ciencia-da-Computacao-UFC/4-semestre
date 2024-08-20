#include <iostream>
#include <string>
#include "TextTable.h"
#include "util.h"
#include <list>
#include "graphs.hpp"

using namespace std;

#define MAX_ITERATION 100
enum Metodo{ GaussJacobi, GaussSeidel };


void plotErros(list<double> &erros, int metodo) {
    double** errosArr = new double*[erros.size()];

    for (int i = 0; i < erros.size(); i++)
        errosArr[i] = new double[2];

    double count = 1;
    int index = 0;
    for (double & val : erros) {
        errosArr[index][0] = count; 
        errosArr[index][1] = val; //multiplicação para que os valores não fiquem tão pequenos e o gráfico saia melhor.
        count=count+1;
        index++;
    }

    size_t height = 0;
	size_t width = 0;
    
    long double xmin = -2;
    if (metodo == 1) xmin = -10;
	long double xmax = erros.size();
	long double ymin = -0.1;       
	long double ymax = 2;
    size_t rows = erros.size();
    cout << endl << erros.size() << " erros";

    // Descomente para printar todos os valores do array
    //for (int i = 0; i < erros.size(); i++) {
    //    cout << errosArr[i][0] << "        " << errosArr[i][1] << endl;
    //}

    if (metodo == 1) cout << "\nGráfico Iteração VS Erro Calculado para o método de Gauss-Jacobi: \n\n";
    else cout << "\nGráfico Iteração VS Erro Calculado para o método de Gauss-Seidel: \n\n";
    graph(height, width, xmin, xmax, ymin, ymax, rows, errosArr, graphdefaultoptions);




    for (int i = 0; i < erros.size(); i++)
        delete[] errosArr[i];
    
    delete[] errosArr;


}




template <class T>
void mostrarSolucao(int n, T* S) {
    cout << "\nSolução: ";
    for (int i = 0; i < n - 1; ++i) {
        cout << "d" << i << " = " << S[i] << ", ";
    }
    if (n > 0)
        cout << "d" << n-1 << " = " << S[n-1] << endl;
}

void copiarVetor (double *x, double *nv, int n) {
    for(int i=0;i<n;i++) {
        nv[i] = x[i];
    }
}

double calcularErro (double *x, double *xc, int n, list<double> &erros) {
    double num, den;

    num = 0;
    den = 0;
    for(int i=0;i<n;i++) {
        double r = abs(x[i] - xc[i]);
        if(r > num) {
            num = r;
        }
        if(abs(x[i]) > den) {
            den = abs(x[i]);
        }
    }
    erros.push_back(num/den);
    return num/den;
}



double* gaussJacobi (double **A, double *b, int n, double precision, bool printPath, bool graphPath) {

    double *xc = new double[n];
    double *x = new double[n]();
    int it=0;
    list<double> erros;

    if (printPath) cout << endl << "Count\tx\t\ty\t\tz" << endl;

    do {
        copiarVetor(x, xc, n);

        for(int i=0;i<n;i++) {
            x[i] = b[i];
            for(int j=0;j<n;j++) {
                if(i!=j) {
                    // Multiplica sempre com iteracao passada
                    x[i] -= A[i][j]*xc[j];
                }
            }
            x[i] = x[i]/A[i][i];
        }

        it++;
    }while(calcularErro(x, xc, n, erros) > precision && it < MAX_ITERATION);
    if (printPath) mostrarSolucao(n, x);
    if (graphPath) plotErros(erros, 1);
    delete[] xc;

    return x;

}


double* gaussSeidel (double **A, double *b, int n, double precision, bool printPath, bool graphPath) {

    double *xc = new double[n];
    double *x = new double[n]();
    int it=0;
    list<double> erros;

    if (printPath) cout << endl << "Count\tx\t\ty\t\tz" << endl;

    do {
        copiarVetor(x, xc, n);

        for(int i=0;i<n;i++) {
            double xa;
            x[i] = b[i];
            for(int j=0;j<n;j++) {
                if(i!=j) {
                    xa = xc[j];
                    if(i>j) {
                        // Caso já tenha sido calculado iteracao atual
                        xa = x[j];
                    }
                    x[i] -= A[i][j]*xa;
                }
            }
            x[i] = x[i]/A[i][i];   
        }
        it++;
    }while(calcularErro(x, xc, n, erros) > precision && it < MAX_ITERATION);
    if (printPath) mostrarSolucao(n, x);
    if (graphPath) plotErros(erros,2);
    delete[] xc;

    return x;

}

void fillB(double *b, int n, int target){
    for(int i=0; i < n; ++i){
        if(i==target) b[i] = 1;
        else b[i] = 0;
    }
}
double** invertMatrix(Metodo m, double **A, int n, double precision, bool graphPath){
    double *aux;
    double *b = new double[n];
    double **inverse = createMatrix<double>(n);

    for(int i=0; i < n; ++i){
        fillB(b, n, i);
        if(m == GaussJacobi){
            aux = gaussJacobi(A, b, n, precision, false, graphPath);
        }else if(m == GaussSeidel){
            aux = gaussSeidel(A, b, n, precision, false, graphPath);
        }

        // preenche colunas de A inversa
        for(int j=0; j < n; ++j){
            inverse[j][i] = aux[j];
        }
    }
    delete[] b;
    return inverse;
}

double* multMatrizVetor(double **A, double *b, int n) {
    double *x = new double[n]();

    for(int i=0;i<n;i++) {
        for(int j=0;j<n;j++) {
            x[i] += A[i][j]*b[j];
        }
    }

    return x;
}

void printarVetor (double *b, int n) {
    cout << "{ ";
    for(int i=0;i < n;i++) {
        cout << b[i] << " ";
    }
    cout << "}\n";
}
