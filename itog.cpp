#include <cstdlib>
#include <locale>
#include <fstream>
#include <iostream>
using namespace std;
int main (int argc, char *argv[])
{
    setlocale (LC_ALL,"RUSSIAN");
    fstream F;
// заполняем массивы для записи нулями
    float Num[100000] = {0}; // коэффициенты фильтра
    float sin[100000] = {0}; // отсчеты входного сигнала
    float sv[100000] = {0};  // отсчеты выходного сигнала
    int i, z1, z2, q;
    i = 0;
    z1 = 0; // количество коэффициентов
    z2 = 0; // количество отсчетов  входного сигнала
    q = 0;
    
//открываем файл с коэффициентами    
    F.open("testNum.dat",ios::in); //если файл не был открыт или не существует
    if (!F.is_open())
      cout << "Не могу открыть файл\n";  //сообщить об этом
    else
    {       
        while (!F.eof())
        {            
        F >> Num[i];              
        cout << "Num[" << i+1 << "]=" << Num[i] << endl; //вывод на экран коэффициентов
        i++;
             }
}
    F.close();
    z1 = i; // записали количество элементов
    i = 0;
    
//Открытие второго массива
      F.open("testsin.dat",ios::in);
    if (!F.is_open())
      cout << "Не могу открыть файл\n";   
    else
    {       
        while (!F.eof())
        {            
        F >> sin[i];              
        cout << "sin[" << i+1 << "]=" << Num[i] << endl; //вывод на экран отсчетов входного сигнала
        i++;
             }
}
    F.close();
    z2 = i;
    i = 0;
    
// Свертка
     for (int i=0; i<(z1+z2-1); i++)
      {
            q = 0;
        for (int j=i; j>-1; j--)
        {
            sv[i] = sv[i] + Num[q]*sin[j]; //въезжает
             q++;
             if (q > (z1-1)) //если счетчик больше кол-ва коэффициентов фильтра
              {
               break; //закончить сворачивание
              }
        }
      } 
    for (int i=0; i<(z1+z2-1); i++) 
       {
      cout << "sv[" << i+1 << "]=" << sv[i] << endl;   // вывод отсчетов свернутого сигнала на экран
        }
    F.open("testsv.dat",ios::out);
    for (int i=0; i<(z1+z2-1); i++)  // запись выходных отсчетов в файл
    {
    F << sv[i] << endl; 
}
F.close();
    
       system("PAUSE");
}
