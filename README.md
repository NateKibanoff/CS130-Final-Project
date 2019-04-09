# CS130 Final Project
Submitted by [Nathan John Kibanoff](http://github.com/NateKibanoff) and [Don Richson Que](http://github.com/Draqe)

## Files included in the submission (to be updated)
- README.md
- .gitignore
- Analyzer.l
- Analyzer.h
- Analyzer.c
- Parser.c

## Minimum required machine specifications (to be added)

## Special cases handled (to be added)

## How to recompile and run programs from source codes (to be updated)
*Lexical analyzer program*
1. Run the command ```lex Analyzer.l``` to produce a C program named ```lex.yy.c```
2. Compile the final Analyzer program by running ```gcc Analyzer.c lex.yy.c -o Analyzer```. This should produce an executable named ```Analyzer.exe```
3. To run the program, input the command ```./Analyzer < input.html > output.txt```

*Parser program* (to be updated)
1. To run the program, input the command ```Parser < input.html > output.csv```

## How to test the programs using the testing libraries used (to be added)
