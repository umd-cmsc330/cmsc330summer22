# Discussion 6: CFGs and Lexing


## CFGs
What are terminals, non-terminals, and productions?
What are the terminals, non-terminals, and productions of 
```
S -> bS|T
T-> aT|U
U -> cU|ε
```
### 1) Practice designing grammars
a) Write a CFG for a<sup>x</sup>b<sup>x</sup>c<sup>y</sup>|a<sup>x</sup>  
where x >=0 and y>=1

b) Write a CFG over the alphabet Σ = {0, 1} that recognizes strings that start with a 1, end with a 0, and have any number of 0s or 1s in between.

### 2) Practice derivations
Grammar: S -> S + S | 1 | 2 | 3

Leftmost derivation of 1 + 2 + 3
* Start w/ S and use the production rules on the LEFTMOST nonterminal ONE AT A TIME. (For a rightmost derivation, use the productions on the RIGHTMOST nonterminal.)
* ONE NONTERMINAL AT A TIME!!!! DON'T COMBINE STEPS!!!!
* S -> S + S -> S + S + S -> 1 + S + S -> 1 + 2 + S -> 1 + 2 + 3
* S -> S + S -> 1 + S -> 1 + S + S -> 1 + 2 + S -> 1 + 2 + 3 works too

Note: If there are 2 derivations for the same string, what does that mean? The grammar is ambiguous.
  * To show that a grammar is ambiguous, show 2 different derivations for the same string.
  * It's hard to know whether a grammar is ambiguous or not (it's an undecidable problem afaik). But be suspicious if you see something along the lines of S -> SS, S -> SSS, S -> S+S, etc.

a) Is the following CFG ambiguous? If it is prove so.
```
S -> S+T|T
T -> 1+T|1
```

b) Use the derivation of the string "aa" to show why the grammar below is ambiguous
```
S -> aSa | M 
M -> aM | T 
T -> Ta | ε
```

## Lexing
* Open `lexer.skeleton.ml`.
* Answer key in `lexer.ml`
* Notice the variant type `token` that we have defined.
* Maintain an index that keeps track of where we are in the string, and move forward as we keep tokenizing.
* In P4, you will have to worry about the order in which they have their  `if/else`  ...  `if/else`  (certain regexs should be checked before others).
* It's probably also a good idea to just define all the regex's and store in variables at the top. See `lexer_another_way.ml` for details
