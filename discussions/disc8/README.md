# Discussion 8: Lambda Calculus

## Overview
### What is Lambda Calculus?
- core language
	- small but turing complete
- represent general ideas
   - semantics, proofs, algorithms
  - anonymous functions (lambdas)
 
 ## Making Parenthesis Explicit
 - Scope of a λ extends as far right as possible
   - λx. λy.x y => λx.(λy.(x y))
 - function application is left-associative 
   - x y z => (x y) z
## Free Variables
- Any variables that aren't binded to a lambda
   - λx. x y => y is free
## Beta Reduction
- Evaluate lambda expressions like functions calls
  - Replace bindings with arguments
- order you reduce in does not affect final value
- (λx.e1) e2 => e1[x:=e2] 
  - this is e1 with occurrences of x replaced by e2
- Eager/call by value evaluation
  -  evaluate arguments(e2) before performing beta-reduction
- Lazy/call by name
  - perform beta reduction without evaluating arguments(e2) 
## Alpha Conversion
- static scoping
- renaming bound variables consistently preserves meaning
- Consider
  -  (λx.x (λx.x)) z
  - rightmost x's refers to the second binding
  - function is the same as (λx.x((λy.y) z
- λx.x = λy.y = λz.z
- λy.λx.y = λz.λ
## Do problems on the worksheet!

Go over each problem on the worksheet
