Asem
====

Each assembly instruction maps more-or-less onto one machine instruction

It's important to note at this stage that most assemblers use a different syntax, 
even though they essentially do the same job.

ARM's RVCT includes an assembler that uses a different syntax to the GNU assembler in GCC, 
for example. Here, we use GCC syntax by default 
because the GCC tool-chain is readily available for free and for multiple platforms. 
In addition, the GNU assembler uses a different line-comment delimiter for each platform. 
On ARM, it is @. The GNU assembler also allows the use of C-style multi-line comments (such as "/* ... */").

Yes, You can use gcc to compile your asm code. Use -c for compilation like this: 
gcc -c file.S -o file.o

This will give object code file named file.o. To invoke linker perform following after above command: 
gcc file.o -o file
