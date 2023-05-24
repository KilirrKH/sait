#pragma once
#include <iostream>
using namespace std;

class PF {
public:
    int* pv;  // указатель на массив целых чисел
    int n;    // длина массива
    int cmp_count_; // счетчик операций сравнения символов

    // конструктор
    inline PF() : pv(nullptr), n(0) {}

    // конструктор с параметрами
    inline PF(int* pv_, int n_) : pv(pv_), n(n_) {}

    // деструктор
    inline ~PF() { delete[] pv; }

    // методы
    void Init(const char* s);
    operator int() const;
    int operator[](int i) const;
    int CmpCount() const {
        return cmp_count_;
    }
};

void PF::Init(const char* s) {
    // освобождаем память, если массив уже был создан
    delete[] pv;

    // выделяем новую память под массив целых чисел
    n = strlen(s);
    pv = new int[n];

    // заполняем массив значениями префикс-функции
    pv[0] = 0; // первый элемент всегда равен нулю
    for (int i = 1; i < n; ++i) {
        int j = pv[i - 1];
        while (j > 0 && s[i] != s[j]) {
            j = pv[j - 1];
        }
        if (s[i] == s[j]) {
            j++;
        }
        pv[i] = j;
    }
}

PF::operator int() const {
    return n;
}

int PF::operator[](int i) const {
    if (i < 0 || i >= n) {
        throw std::out_of_range("Index out of range");
    }
    return pv[i];
}

    //Если произойдет повторная
    //инициализация массива в методе Init,то это приведет к утечке памяти, так как память,
    //выделенная на первоначальный массив, не будет освобождена. 

