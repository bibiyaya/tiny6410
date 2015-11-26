#include <uart.h>

int main()
{
   char c;
   int a, b;

   init_uart();
   printf("Hello world\n\r");

   while (1)
   {   
       printf("Please input two number:\n\r");
       scanf("%d%d", &a, &b);
       printf("\n\r");
       printf("The sum is :%d\n\r", a+b);
   }
   return 0;
}
