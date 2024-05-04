#include <iostream>
using namespace std;

int main()
{

    int arr[6]{2, 9, 1, 4, 10, 0};

    for (int i = 0; i < 5; ++i)
    {
        int min_idx = i;
        for (int j = i + 1; j < 5; ++j)
        {
            if (arr[min_idx] > arr[j])
            {
                min_idx = j;
            }
        }
        int temp = arr[i];
        arr[i] = arr[min_idx];
        arr[min_idx] = temp;
    }

    for (int i = 0; i < 5; ++i)
    {
        cout << arr[i] << " ";
    }
    cout << endl;
    int x = 4;

    for (int i = 0; i < 5; ++i)
    {
        if (arr[i] == x)
        {
            printf("%d \n", i);
            for (int i = 0; i < 5; ++i)
            {
                cout << arr[i] << " ";
            }
            return 0;
        }
    }
    int i = 5;
    for (; i >= 1; i--)
    {
        if (arr[i - 1] < x)
        {
            arr[i] = x;
            break;
        }
        arr[i] = arr[i - 1];
    }
    for (int i = 0; i < 6; ++i)
    {
        cout << arr[i] << " ";
    }
    cout << endl;

    return 0;
}