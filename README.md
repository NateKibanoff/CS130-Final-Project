# CS130 Final Project
Submitted by [Nathan John Kibanoff](http://github.com/NateKibanoff) and [Don Richson Que](http://github.com/Draqe)

## Files included in the submission 
- README.md
- .gitignore
- Analyzer.l
- Analyzer.h
- Analyzer.c
- Parser.y
- Parser.l

## Minimum required machine specifications 

1. Windows 10
2. Has flex and bison installed
3. Core i3
4. If all else fails, use the latest device

## How to recompile and run programs from source codes
*Lexical analyzer program*
1. Run the command ```flex Analyzer.l``` to produce a C program named ```lex.yy.c``` using the command prompt
2. Compile the final Analyzer program by running the command ```gcc Analyzer.c lex.yy.c -o Analyzer```. This should produce an executable named ```Analyzer.exe```
3. To run the program, input the command ```Analyzer < input.html > output.txt```

*Parser program*
1. Run the command ```bison -d Parser.y``` to produce two files: a C program named ```Parser.tab.c``` and a header file named ```Parser.tab.h```
2. Run the command ```flex Parser.l``` to produce a C program named ```lex.yy.c``` using the command prompt
3. Compile the final Parser program by running the command ```gcc lex.yy.c Parser.tab.c -o Parser```. This should produce an executable named ```Parser.exe```
4. To run the program, input the command ```Parser < input.html > output.csv```

## How to test the programs using the testing libraries used
After producing the output files, type the command ```FC [program_output] [expected_output]``` where ```[program_output]``` is the filename for the output file produced by the Analyzer or Parser, and ```[expected_output]``` is the filename for the correct output given input. After running this command, the console will display the lines where the two files differed. Otherwise, it will specify that no differences have been encountered.
