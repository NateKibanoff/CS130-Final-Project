# CS130 Final Project
Submitted by [Nathan John Kibanoff](http://github.com/NateKibanoff) and [Don Richson Que](http://github.com/Draqe)

## Files included in the submission (to be updated)
- README.md
- .gitignore
- Analyzer.l
- Analyzer.h
- Analyzer.c
- Parser.y
- Parser.l

## Minimum required machine specifications (to be added)

## Special cases handled (to be added)

## How to recompile and run programs from source codes (to be updated)
*Lexical analyzer program*
1. Run the command ```flex Analyzer.l``` to produce a C program named ```lex.yy.c``` using the command prompt
2. Compile the final Analyzer program by running the command ```gcc Analyzer.c lex.yy.c -o Analyzer```. This should produce an executable named ```Analyzer.exe```
3. To run the program, input the command ```Analyzer < input.html > output.txt```

*Parser program*
1. Run the command ```bison -d Parser.y``` to produce two files: a C program named ```Parser.tab.c``` and a header file named ```Parser.tab.h```
2. Run the command ```flex Parser.l``` to produce a C program named ```lex.yy.c``` using the command prompt
3. Compile the final Parser program by running the command ```gcc lex.yy.c Parser.tab.c -o Parser```. This should produce an executable named ```Parser.exe```
4. To run the program, input the command ```Parser < input.html > output.csv```

## How to test the programs using the testing libraries used (to be added)
