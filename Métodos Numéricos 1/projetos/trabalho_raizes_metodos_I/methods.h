#include "TextTable.h"
#include <sstream>
#include <math.h>
#include "graphs.hpp"
#include <tuple>

#define e 2.7182
#define MAX_ITERATION 100
#define DECIMAL_PRECISION 4

double roundToNDecimals(double a, int n){
    return round(a*pow(10, n))/pow(10, n);
}

double f(double a, double d){
    return roundToNDecimals(a * pow(e, d) - 4* pow(d, 2), DECIMAL_PRECISION);
}

double fPrime(double a, double d){
    return roundToNDecimals(a*pow(e, d) - 8 * d, DECIMAL_PRECISION);
}

// a)
tuple<double, int, double> newtonRaphson(double a, double d, double precision, bool printPath){
    double h = roundToNDecimals(f(a, d) / fPrime(a, d), DECIMAL_PRECISION);
    int iteration = 0;
    TextTable t( "\u2500", "\u2503", "\u2542" );

    t.add( "    " );
    t.add( " d " );
    t.add( " f(d) " );
    t.endOfRow();

    while (abs(h) >= precision && iteration < MAX_ITERATION){
        ostringstream ss;
        h = roundToNDecimals(f(a, d)/fPrime(a, d), DECIMAL_PRECISION);
  
        d = roundToNDecimals(d - h, DECIMAL_PRECISION);

        t.add(to_string(iteration+1));
        ss << d;
        t.add(" " + ss.str() + " ");
        ss.str("");
        ss.clear();

        ss << f(a, d);
        t.add(" " + ss.str() + " ");
        ss.str("");
        ss.clear();
        t.endOfRow();

        ++iteration;
    }
    if(printPath) cout << t;
    return make_tuple(d, iteration, abs(h));
 
}

// b)
tuple<double, int, double> newtonRaphsonModificado(double a, double d, double precision, bool printPath){
    ostringstream ss;

    double fPrimeD0 = fPrime(a,d);
    double h = roundToNDecimals(f(a, d) / fPrimeD0, DECIMAL_PRECISION);
    int iteration = 0;
    TextTable t( "\u2500", "\u2503", "\u2542" );

    t.add( "    " );
    t.add( " d " );
    t.add( " f(d) " );
    t.endOfRow();

    while (abs(h) >= precision && iteration < MAX_ITERATION)
    {
        h = roundToNDecimals(f(a, d)/fPrimeD0, DECIMAL_PRECISION);
        d = roundToNDecimals(d - h, DECIMAL_PRECISION);
        t.add(to_string(iteration+1));
        ss << d;
        t.add(" " + ss.str() + " ");
        ss.str("");
        ss.clear();

        ss << f(a, d);
        t.add(" " + ss.str() + " ");
        ss.str("");
        ss.clear();
        t.endOfRow();

        ++iteration;
    }
    if(printPath) cout << t;
    return make_tuple(d, iteration, abs(h));

}


// c)
tuple<double, int, double> secant(double a, double dx, double dy, double precision, bool printPath){
    ostringstream ss;
    double aux, fa, fb;
    int iteration = 0;

    TextTable t( "\u2500", "\u2503", "\u2542" );

    t.add( "    " );
    t.add( " d " );
    t.add( " f(d) " );
    t.endOfRow();

    while(abs(dx - dy) >= precision && iteration < MAX_ITERATION){
        fa = f(a, dx); fb = f(a, dy);
        aux = dx;
        dx = dy;

        dy = roundToNDecimals((aux * fb - dy * fa) / (fb - fa), DECIMAL_PRECISION); 

        t.add(to_string(iteration+1));
        ss << dy;
        t.add(" " + ss.str() + " ");
        ss.str("");
        ss.clear();

        ss << f(a, dy);
        t.add(" " + ss.str() + " ");
        ss.str("");
        ss.clear();
        t.endOfRow();

        ++iteration;
    }
    if(printPath) cout << t;
    return make_tuple(dy, iteration, abs(dx - dy));
}

void calculateResults(double a, double d0, double d1, double precision){
    cout << "\n\033[1;43ma = " << a << "\033[0m" << endl;
    cout << "\n\033[1mMétodo Newton-Raphson\033[0m\n" << endl;
    newtonRaphson(a, d0, precision, true);
    cout << "\n\033[1mMétodo Newton-Raphson Modificado\033[0m\n" << endl;
    newtonRaphsonModificado(a, d0, precision, true);
    cout << endl;
    cout << "\n\033[1mMétodo da Secante\033[0m\n" << endl;
    secant(a, d0, d1, precision, true);
}

// d) Test Results
void testResults(){
    calculateResults(1, 0.5, 1, 0.0001);
}

// e)
void resultTable(double a, double d0, double d1, double precision){
    tuple<double, int, double> nr, nrm, sec;
    ostringstream ss;
    string d0_str, d1_str;

    nr = newtonRaphson(a, d0, precision, false);
    nrm = newtonRaphsonModificado(a, d0, precision, false);
    sec = secant(a, d0, d1, precision, false);

    cout << "\n\033[1;43ma = " << a  << "\033[0m" << endl;

    TextTable t( "\u2500", "\u2503", "\u2542" );
    t.add("");
    t.add(" Newton-Raphson ");
    t.add(" Newton-Raphson M ");
    t.add(" Secante ");
    t.endOfRow();


    t.add(" Dados Iniciais ");
    d0_str = to_string(d0);
    d1_str = to_string(d1);
    d0_str = d0_str.erase(d0_str.find_last_not_of('0') + 1, std::string::npos );
    d1_str = d1_str.erase(d0_str.find_last_not_of('0') + 1, std::string::npos );
    
    t.add(" x0 = " + d0_str + " ");
    t.add(" x0 = " + d0_str + " ");
    t.add(" x0 = " + d0_str + "; x1 = " + d1_str + " ");
    t.endOfRow();


    t.add(" d ");
    ss << get<0>(nr);
    t.add(" " + ss.str() + " ");
    ss.str("");
    ss.clear();

    ss << get<0>(nrm);
    t.add(" " + ss.str() + " ");
    ss.str("");
    ss.clear();
     
    ss << get<0>(sec);
    t.add(" " + ss.str() + " ");
    ss.str("");
    ss.clear();
    t.endOfRow();


    t.add(" f(d) ");
    ss << f(a, get<0>(nr));
    t.add(" " + ss.str() + " ");
    ss.str("");
    ss.clear();

    ss << f(a, get<0>(nrm));
    t.add(" " + ss.str() + " ");
    ss.str("");
    ss.clear();

    ss << f(a, get<0>(sec));
    t.add(" " + ss.str() + " ");
    ss.str("");
    ss.clear();
    t.endOfRow();

    t.add(" Erro em d ");
    ss << get<2>(nr);
    t.add(" " + ss.str() + " ");
    ss.str("");
    ss.clear();

    ss << get<2>(nrm);
    t.add(" " + ss.str() + " ");
    ss.str("");
    ss.clear();

    ss << get<2>(sec);
    t.add(" " + ss.str() + " ");
    ss.str("");
    ss.clear();
    t.endOfRow();



    t.add(" Iteracoes ");
    t.add(" " + ss.str() + to_string(get<1>(nr)) + " ");
    t.add(" " + ss.str() + to_string(get<1>(nrm)) + " ");
    t.add(" " + ss.str() + to_string(get<1>(sec)) + " ");
    t.endOfRow();

    cout << t;
        
}

// f) 
void comparativeResultTable(int n, double* amplitudes, double d0, double d1, double precision){
    ostringstream ss;
    tuple<double, int, double> nr, nrm, sec;
    cout << "\n\033[1;43mMétodo Newton-Raphson:\033[0m\n" << endl;

    TextTable nrTable( "\u2500", "\u2503", "\u2542" );
    nrTable.add( " a " );
    nrTable.add( " d " );
    nrTable.add( " STATUS " );
    nrTable.endOfRow();

    for(int i = 0; i < n; ++i){
        double a = amplitudes[i];
        ss << a;
        nrTable.add(" " + ss.str() + " ");
        ss.str("");
        ss.clear();
        nr = newtonRaphson(a, d0, precision, false);
        ss << get<0>(nr);
        nrTable.add(" " + ss.str() + " ");
        ss.str("");
        ss.clear();
        if (get<0>(nr) > 0.7 || get<0>(nr) < -0.7) ss << "PERIGO";
        else ss << "Normal";
        nrTable.add(" " + ss.str() + " ");
        ss.str("");
        ss.clear();

        nrTable.endOfRow();        

    } 
    cout << nrTable << endl;

    cout << "\n\033[1;43mMétodo Newton-Raphson Modificado:\033[0m\n" << endl;

    TextTable nrmTable( "\u2500", "\u2503", "\u2542" );
    nrmTable.add( " a " );
    nrmTable.add( " d " );
    nrmTable.add( " STATUS " );
    nrmTable.endOfRow();

    for(int i = 0; i < n; ++i){
        double a = amplitudes[i];
        ss << a;
        nrmTable.add(" " + ss.str() + " ");
        ss.str("");
        ss.clear();
        nrm = newtonRaphsonModificado(a, d0, precision, false);
        ss << get<0>(nrm);
        nrmTable.add(" " + ss.str() + " ");
        ss.str("");
        ss.clear();
        if (get<0>(nrm) > 0.7 || get<0>(nrm) < -0.7) ss << "PERIGO";
        else if (get<0>(nrm) != get<0>(nrm)) ss << "Erro";   
        else ss << "Normal";
        nrmTable.add(" " + ss.str() + " ");
        ss.str("");
        ss.clear();

        nrmTable.endOfRow();        

    } 
    cout << nrmTable << endl;


    cout << "\n\033[1;43mMétodo da Secante:\033[0m\n" << endl;

    TextTable secTable( "\u2500", "\u2503", "\u2542" );
    secTable.add( " a " );
    secTable.add( " d " );
    secTable.add( " STATUS " );
    secTable.endOfRow();

    for(int i = 0; i < n; ++i){
        double a = amplitudes[i];
        ss << a;
        secTable.add(" " + ss.str() + " ");
        ss.str("");
        ss.clear();
        sec = secant(a, d0, d1, precision, false);
        ss << get<0>(sec);
        secTable.add(" " + ss.str() + " ");
        ss.str("");
        ss.clear();
        if (get<0>(sec) > 0.7 || get<0>(sec) < -0.7) ss << "PERIGO";
        else ss << "Normal";
        secTable.add(" " + ss.str() + " ");
        ss.str("");
        ss.clear();

        secTable.endOfRow();        

    } 
    cout << secTable << endl;

}

// g)
void analiseVariacao(double d0, double d1, double precision) {

    cout << "\n\nPara todos os casos, tomando um d0 = 0.5 e d1 = 0.6\n\n";

    cout << "Para o método de Newton-Raphson\n"
    << "Para um a = 0, d convergiu para 0.0017, abaixo de 0.7cm\n"
    << "Para um a = 0.5, d convergiu para 0.4407, abaixo de 0.7cm\n"
    << "Para um a = 1, d convergiu para 0.7148, acima de 0.7cm\n"
    << "Para um a = 1.5, d convergiu para 1.0195, acima de 0.7cm\n"
    << "Para um a = 2, d convergiu para 2.6182, acima de 0.7cm\n\n";

    cout << "Para o método de Newton-Raphson Modificado\n"
    << "Para um a = 0, d convergiu para 0.0098, abaixo de 0.7cm\n"
    << "Para um a = 0.5, d convergiu para 0.4407, abaixo de 0.7cm\n"
    << "Para um a = 1, d convergiu para 0.7148, acima de 0.7cm\n"
    << "Para um a = 1.5, d não convergiu\n"
    << "Para um a = 2, d não convergiu\n\n";

    cout << "Para o método da Secante\n"
    << "Para um a = 0, d convergiu para 0.0026, abaixo de 0.7cm\n"
    << "Para um a = 0.5, d convergiu para 0.4407, abaixo de 0.7cm\n"
    << "Para um a = 1, d convergiu para 0.7148, acima de 0.7cm\n"
    << "Para um a = 1.5, d convergiu para 1.0195, acima de 0.7cm\n"
    << "Para um a = 2, d convergiu para 2.6182, acima de 0.7cm\n\n";

    cout << "Em geral, para valores de a menores que 1, aproximadamente, os métodos convergem" 
    << " com um d < 0.7cm, evitando a amplificação do fenômeno.\n";

    //Plotando gráficos:
    cout << "\n\033[1;43m As análises seguintes usam d0 = 0.5, d1 = 0.6 e a precisão dada pelo usuário. Os valores de a vão de 0 a 5, com incremento de 0.01.\033[0m" << endl;
    cout << "\nObservação: as linhas horizontais correspondem a y = 0.7 e y = -0.7" << endl;
    
    size_t height = 0;
	size_t width = 0;
	long double xmin = -2;
	long double xmax = 6;
	long double ymin = -2;
	long double ymax = 6;
    size_t rows = 1500;
    double **array;
    double amp;
    double dd;
    tuple<double, int, double> nr, nrm, sec;

    //Newton-Raphson:
    cout << "\n\033[1;43m Análise do Método Newton-Raphson:\033[0m" << endl;
    cout << "\nValores de amplitude que geram um deslocamento de 0.69 <= |d| <= 0.71: \n";
    array = new double*[1500];
    for(int i = 0; i < 1500; ++i) {
        array[i] = new double[2];
    }
    amp = 0;
    for (int i = 0; i < 500; ++i) {
        nr = newtonRaphson(amp, d0, precision, false);
        dd = get<0>(nr);
        array[i][0] = amp;
        array[i][1] = dd;
        if ((dd>=0.69 && dd<=0.71) || (dd<=-0.69 && dd>=-0.71)) cout << amp << '\n'; 
        amp+=0.01;
        
    }
    amp = 0;

    //plot y=0.7
    for (int i = 500; i < 1000; ++i) {
        array[i][0] = amp;
        array[i][1] = 0.7;
        amp+=0.01;
    }
    amp = 0;
    //plot y=-0.7
    for (int i = 1000; i < 1500; ++i) {
        array[i][0] = amp;
        array[i][1] = -0.7;
        amp+=0.01;
    }
    cout << "\n\033[1;43m Gráfico \"a VS d\" \033[0m\n" << endl;
    graph(height, width, xmin, xmax, ymin, ymax, rows, array, graphdefaultoptions);

    delete[] array;


    //Newton-Raphson Modificado:
    cout << "\n\033[1;43m Análise do Método Newton-Raphson Modificado:\033[0m" << endl;
    cout << "\nValores de amplitude que geram um deslocamento de 0.69 <= |d| <= 0.71: \n";
    array = new double*[1500];
    for(int i = 0; i < 1500; ++i) {
        array[i] = new double[2];
    }
    amp = 0;
    for (int i = 0; i < 500; ++i) {
        nrm = newtonRaphsonModificado(amp, d0, precision, false);
        dd = get<0>(nrm);
        array[i][0] = amp;
        array[i][1] = dd;
        if ((dd>=0.69 && dd<=0.71) || (dd<=-0.69 && dd>=-0.71)) cout << amp << '\n'; 
        amp+=0.01;
        
    }
    
    amp = 0;
    //plot y=0.7
    for (int i = 500; i < 1000; ++i) {
        array[i][0] = amp;
        array[i][1] = 0.7;
        amp+=0.01;
    }
    amp = 0;
    
    //plot y=-0.7
    for (int i = 1000; i < 1500; ++i) {
        array[i][0] = amp;
        array[i][1] = -0.7;
        amp+=0.01;
    }

    cout << "\n\033[1;43m Gráfico \"a VS d\" \033[0m\n" << endl;
    graph(height, width, xmin, xmax, ymin, ymax, rows, array, graphdefaultoptions);

    delete[] array;
    
            
    //Secante:
    cout << "\n\033[1;43m Análise do Método da Secante:\033[0m" << endl;
    cout << "\nValores de amplitude que geram um deslocamento de 0.69 <= |d| <= 0.71: \n";
    array = new double*[1500];
    for(int i = 0; i < 1500; ++i) {
        array[i] = new double[2];
    }
    amp = 0;
    for (int i = 0; i < 500; ++i) {
        sec = secant(amp, d0, d1, precision, false);
        dd = get<0>(sec);
        array[i][0] = amp;
        array[i][1] = dd;
        if ((dd>=0.69 && dd<=0.71) || (dd<=-0.69 && dd>=-0.71)) cout << amp << '\n'; 
        amp+=0.01;
        
    }
    amp = 0;
    //plot y=0.7
    for (int i = 500; i < 1000; ++i) {
        array[i][0] = amp;
        array[i][1] = 0.7;
        amp+=0.01;
    }
    amp = 0;
    //plot y=-0.7
    for (int i = 1000; i < 1500; ++i) {
        array[i][0] = amp;
        array[i][1] = -0.7;
        amp+=0.01;
    }
    cout << "\n\033[1;43m Gráfico \"a VS d\" \033[0m\n" << endl;
    graph(height, width, xmin, xmax, ymin, ymax, rows, array, graphdefaultoptions);

    delete[] array;

    

}