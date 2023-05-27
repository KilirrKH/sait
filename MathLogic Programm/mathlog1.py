from sympy import symbols
from sympy.logic.boolalg import And, Or
from  sympy import simplify
from itertools import product


def get_truth_table(n):
    """Функция для получения таблицы истинности для функции с n переменными"""
    table = []
    for i in range(2 ** n):
        row = []
        for j in range(n):
            row.append((i // (2 ** j)) % 2)
        table.append(row)
    print(table)
    return table

def get_normal_forms(truth_table):
    n = len(truth_table[0]) - 1
    vars = symbols('x0:%d' % n)
    minterms = [i for i, row in enumerate(truth_table) if row[-1] == 1]
    maxterms = [i for i, row in enumerate(truth_table) if row[-1] == 0]
    dontcares = [i for i, row in enumerate(truth_table) if row[-1] == -1]
    dnf = []
    for term in minterms:
        literals = [vars[j] if (term >> j) & 1 else ~vars[j] for j in range(n)]
        dnf.append(And(*literals))
    cnf = []
    for term in maxterms:
        literals = [vars[j] if (term >> j) & 1 else ~vars[j] for j in range(n)]
        cnf.append(Or(*literals))
    if dontcares:
        for term in product([0, 1], repeat=n):
            if any(term[i] != truth_table[j][i] for i, j in enumerate(dontcares)):
                literals = [vars[j] if term[j] else ~vars[j] for j in range(n)]
                dnf.append(And(*literals))
                cnf.append(Or(*literals))
    dnf = simplify(Or(*dnf))
    cnf = simplify(And(*cnf))
    pnf = ''
    for row in truth_table:
        if row[-1] == 1:
            literals = [str(vars[j]) if row[j] else str(vars[j]) + "'" for j in range(n)]
            pnf += '(' + ' & '.join(literals) + ') | '
    pnf = pnf[:-3]
    return dnf, cnf, pnf

def count_ops(formula):
    op_count = formula.count('|') + formula.count('&')
    return op_count

def main():
    n = int(input("Введите количество переменных: "))
    truth_table = get_truth_table(n)
    dnf, cnf, pnf = get_normal_forms(truth_table)
    print("СДНФ:", dnf)
    print("СКНФ:", cnf)
    print("ПНФ:", pnf)
    dnf_ops = count_ops(dnf)
    cnf_ops = count_ops(cnf)
    pnf_ops = count_ops(pnf)
    if dnf_ops <= cnf_ops and dnf_ops <= pnf_ops:
        print("СДНФ имеет наименьшее количество бинарных операций")
    elif cnf_ops <= pnf_ops and cnf_ops <= dnf_ops:
        print("СКНФ имеет наименьшее количество бинарных операций")
    elif pnf_ops <= dnf_ops and pnf_ops <= cnf_ops:
        print("ПНФ имеет наименьшее количество бинарных операций")
    else:
        print("Нормальные формы имеют одинаковое количество бинарных операций")

if __name__ == '__main__':
    main()