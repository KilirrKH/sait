#pragma once
#include <iostream>
using namespace std;

class PF {
public:
    int* pv;  // ��������� �� ������ ����� �����
    int n;    // ����� �������
    int cmp_count_; // ������� �������� ��������� ��������

    // �����������
    inline PF() : pv(nullptr), n(0) {}

    // ����������� � �����������
    inline PF(int* pv_, int n_) : pv(pv_), n(n_) {}

    // ����������
    inline ~PF() { delete[] pv; }

    // ������
    void Init(const char* s);
    operator int() const;
    int operator[](int i) const;
    int CmpCount() const {
        return cmp_count_;
    }
};

void PF::Init(const char* s) {
    // ����������� ������, ���� ������ ��� ��� ������
    delete[] pv;

    // �������� ����� ������ ��� ������ ����� �����
    n = strlen(s);
    pv = new int[n];

    // ��������� ������ ���������� �������-�������
    pv[0] = 0; // ������ ������� ������ ����� ����
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

    //���� ���������� ���������
    //������������� ������� � ������ Init,�� ��� �������� � ������ ������, ��� ��� ������,
    //���������� �� �������������� ������, �� ����� �����������. 

