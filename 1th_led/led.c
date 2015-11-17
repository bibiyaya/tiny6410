void delay(void)
{
	volatile int i = 0x10000;
	while (i--);
}

int main(void)
{	
	int i = 0;

	volatile unsigned long *gpkcon = (volatile unsigned long *)0x7F008800;
	volatile unsigned long *gpkdat = (volatile unsigned long *)0x7F008808;

	*gpkcon = 0x1111;

	while (1){
		*gpkdat = i;
		i++;
		if (i == 16)
			i = 0;
		delay();
	}

	return 0;
}
