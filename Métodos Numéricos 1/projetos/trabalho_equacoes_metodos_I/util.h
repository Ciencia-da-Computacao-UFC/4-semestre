#include <iostream>
#include <string>
#include "TextTable.h"
#include <sstream>

using namespace std;

template <class T>
T** createMatrix(int n) {
    T** A = new T*[n];
    for (int i = 0; i < n; ++i) {
        A[i] = new T[n];
    }
    return A;
}

template <class T>
void printMatrix(T **M, int n) {
    TextTable t( "\u2508", "\u2502", "\u253C" );
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            t.add(to_string(M[i][j]));
        }
        t.endOfRow();
    }
    cout << t;
    cout << endl;
    
}

template <class T>
void printResults(T *M, int n) {
    TextTable t( "\u2500", "\u2503", "\u2542" );
    ostringstream ss;

    t.add( " d " );
    t.add( " Valor " );
    t.add( " STATUS " );
    t.endOfRow();


    for (int i = 0; i < n; ++i) {
        t.add(to_string(i+1));
        t.add(to_string(M[i]));
        if (abs(M[i])>0.4) ss << "PERIGO";
            else ss << "NORMAL";
        t.add(" " + ss.str() + " ");
        ss.str("");
        ss.clear();   
        t.endOfRow();
    }
    cout << t;
    cout << endl;
    
}

template <class T>
void printArray(T *A, int n) {
    for (int i = 0; i < n; ++i) {
        cout << A[i] << " ";
    }
    cout << endl;
}

template <class T>
void readArray(T *A, int n) {
    for (int i = 0; i < n; ++i) {
        cin >> A[i];
    }
}

template <class T>
void readMatrix(T **A, int n) {
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            cin >> A[i][j];
        }
    }
}

template <class T>
bool critLinhas(T **A, int n) {
    bool atende = true;
    T sum;
    T diag;
    for (int i = 0; i < n; ++i) {
        sum = 0;
        for (int j = 0; j < n; ++j) {
            if (i!=j) sum+=abs(A[i][j]);
            else diag = abs(A[i][j]);
        }
        if (sum>=diag) atende = false;
    }
    return atende;
}

template <class T>
bool critSassen(T **A, int n) {
    bool atende = true;
    T* Bvetor = new T[n];
    T sum;
    T diag;
    T max = 0;
    T B;
    for (int i = 0; i < n; ++i) {
        sum = 0;
        for (int j = 0; j < n; ++j) {
            if (j>i) sum+=abs(A[i][j]);
            else if (i>j) sum += abs(A[i][j]) * Bvetor[j];
            else diag = abs(A[i][j]);
        }
        Bvetor[i] = sum/diag;
        if (Bvetor[i]>max) max = Bvetor[i];
    }
    if (max >= 1) atende = false;


    delete[] Bvetor;
    return atende;
}