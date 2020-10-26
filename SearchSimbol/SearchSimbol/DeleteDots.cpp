// SearchSimbol.cpp : Этот файл содержит функцию "main". Здесь начинается и заканчивается выполнение программы.
//
#include <locale>
#include <conio.h>
# include "stdlib.h"
extern "C" int __fastcall SearchString(char* str1, char* str2, int length1, int length2);

void main()
{
	setlocale(LC_ALL, "Rus");
	const int MaxSize = 256;
	int a = 0;
	char* str1 = new char[MaxSize];
	char* str2 = new char[MaxSize];
	printf_s("Enter the first string: ");
	gets_s(str1, MaxSize);
	printf_s("Enter the second string: ");
	gets_s(str2, MaxSize);
	int length1 = strlen(str1);
	int length2 = strlen(str2);

	if (length1 == 0) {
		printf_s("The 1st string is empty!");
	}
	else if(length2 == 0) {
		printf_s("The 2nd string is empty!");
	}
	else
	{
		a = SearchString(str1, str2, length1, length2);
		printf_s("Result: ");
		printf_s("%d", a);
	}

}
// Запуск программы: CTRL+F5 или меню "Отладка" > "Запуск без отладки"
// Отладка программы: F5 или меню "Отладка" > "Запустить отладку"

// Советы по началу работы 
//   1. В окне обозревателя решений можно добавлять файлы и управлять ими.
//   2. В окне Team Explorer можно подключиться к системе управления версиями.
//   3. В окне "Выходные данные" можно просматривать выходные данные сборки и другие сообщения.
//   4. В окне "Список ошибок" можно просматривать ошибки.
//   5. Последовательно выберите пункты меню "Проект" > "Добавить новый элемент", чтобы создать файлы кода, или "Проект" > "Добавить существующий элемент", чтобы добавить в проект существующие файлы кода.
//   6. Чтобы снова открыть этот проект позже, выберите пункты меню "Файл" > "Открыть" > "Проект" и выберите SLN-файл.
