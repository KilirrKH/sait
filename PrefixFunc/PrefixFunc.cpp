#include <iostream>
#include <random>
#include <chrono>
#include <fstream>
#include "PF.h"
using namespace std;
const int N = 100;
int main() {

    const char* s = "rakaratrakarakarakatakarakara";
    PF pf;
    pf.Init(s);

    // выводим значения массива префикс-функции
    cout << "Prefix function array: ";
    for (int i = 0; i < static_cast<int>(pf); ++i) {
        cout << pf[i] << " ";//(00001201234563456340000123456).
    }
    cout << "\n#----------------------------------------------#" << endl;

//---------------------------------------------------------

    const int kNumStrings = 100; // количество строк для эксперимента
    const int kMaxStringLength = 10000; // максимальная длина строки для эксперимента

    mt19937 gen(chrono::system_clock::now().time_since_epoch().count());

    // генерируем случайные строки различной длины
    vector<string> rand_strings;
    for (int i = 0; i < kNumStrings; ++i) {
        int len = gen() % kMaxStringLength + 1;
        string s(len, 'a');
        for (char& c : s) {
            c = gen() % 26 + 'a';
        }
        rand_strings.push_back(s);
    }

    // вычисляем префикс-функцию для каждой строки и измеряем количество операций сравнения символов
    // вектор для хранения количества операций сравнения символов
    vector<int> cmp_counts;

    for (const auto& s : rand_strings) {
        PF pf;
        pf.Init(s.c_str()); // вычисляем префикс-функцию для текущей строки
        cmp_counts.push_back(pf.CmpCount()); // сохраняем количество операций сравнения символов
    }

    std::ofstream outfile("data.txt");
    // выводим результаты эксперимента
    cout << "String length\tOperation count\n";
    for (int i = 0; i < kNumStrings; ++i) {
        cout << rand_strings[i].length() << "\t\t" << cmp_counts[i] << "\n";
        outfile << rand_strings[i].length() << " " << cmp_counts[i] << endl;
    }
    outfile.close();
    // отображаем результаты эксперимента в виде графика
  


    return 0;
}
