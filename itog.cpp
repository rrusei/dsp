#include <cstdlib>
#include <locale>
#include <fstream>
#include <iostream>
using namespace std;
int main (int argc, char *argv[])
{
    setlocale (LC_ALL,"RUSSIAN");
    fstream F;
// ��������� ������� ��� ������ ������
    float Num[100000] = {0}; // ������������ �������
    float sin[100000] = {0}; // ������� �������� �������
    float sv[100000] = {0};  // ������� ��������� �������
    int i, z1, z2, q;
    i = 0;
    z1 = 0; // ���������� �������������
    z2 = 0; // ���������� ��������  �������� �������
    q = 0;
    
//��������� ���� � ��������������    
    F.open("testNum.dat",ios::in); //���� ���� �� ��� ������ ��� �� ����������
    if (!F.is_open())
      cout << "�� ���� ������� ����\n";  //�������� �� ����
    else
    {       
        while (!F.eof())
        {            
        F >> Num[i];              
        cout << "Num[" << i+1 << "]=" << Num[i] << endl; //����� �� ����� �������������
        i++;
             }
}
    F.close();
    z1 = i; // �������� ���������� ���������
    i = 0;
    
//�������� ������� �������
      F.open("testsin.dat",ios::in);
    if (!F.is_open())
      cout << "�� ���� ������� ����\n";   
    else
    {       
        while (!F.eof())
        {            
        F >> sin[i];              
        cout << "sin[" << i+1 << "]=" << Num[i] << endl; //����� �� ����� �������� �������� �������
        i++;
             }
}
    F.close();
    z2 = i;
    i = 0;
    
// �������
     for (int i=0; i<(z1+z2-1); i++)
      {
            q = 0;
        for (int j=i; j>-1; j--)
        {
            sv[i] = sv[i] + Num[q]*sin[j]; //��������
             q++;
             if (q > (z1-1)) //���� ������� ������ ���-�� ������������� �������
              {
               break; //��������� ������������
              }
        }
      } 
    for (int i=0; i<(z1+z2-1); i++) 
       {
      cout << "sv[" << i+1 << "]=" << sv[i] << endl;   // ����� �������� ���������� ������� �� �����
        }
    F.open("testsv.dat",ios::out);
    for (int i=0; i<(z1+z2-1); i++)  // ������ �������� �������� � ����
    {
    F << sv[i] << endl; 
}
F.close();
    
       system("PAUSE");
}
