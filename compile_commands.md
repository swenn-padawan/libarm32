Compiling:
```bash
arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -S -o add.s add.c
```

Then:
```bash
arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -c add.c -o add.o
arm-none-eabi-objdump -d add.o
```
