# Programming Language 

# Concepts 

## Gary Tan 

## Computer Science and Engineering 

## Penn State University 

 CS 461 

# Lambda Calculus 

 2 

# Readings 

## Ch11.7 of the supplemental materials of the 

## textbook 

- See the schedule page of the course website 

 3 

# History 

 History 

- Introduced by Alonzo Church 

- Greek letter lambda, which is used to introduce functions 

- No significance to the letter lambda 

- Calculus means there is a way to 

- calculate the result of applying functions to arguments Most PLs are rooted in lambda calculus 

- It provides a basic mechanism for function abstraction and     application 

- Functional PLs: Lisp, ML, Haskell, other languages 

- Java, C++, and C# all support lambda functions Important part of CS history and foundations Warning: 

- We’ll study formalism 

# Syntax 

## <term> ::= <var> | <var>.<term> | 

## <term> <term> 

## t ::= x | x. t | t1 t2 

- where x may be any variable 

- Function abstraction (function definition): x. t 

- Define a new function whose parameter is x and whose     body is t 

- Racket: (lambda (x) t) 

- Function application (function call): t1 t2 

- t1 should eval to a function; t2 is the argument to the     function 

- Racket: (t1 t2) –Math: t1(t2) 

# Examples 

 Function abstraction 

- x. x 

- there is no need to write explicit returns; x is the returning result 

- x. (x+3) 

- assume + is a built-in function 

- f. x. f (f x) 

- multi-parameter function, in curried notation 

- Only curried functions are supported in lambda calculus Function application •(x. x) 3 -> 3 •(x. (x+y)) 3 -> 3 + y •(x. y. (x+y)) 3 4 -> 3 + 4 •(z. (x + 2*y + z)) 5 -> x + 2*y + 5 

## 12 

## 34 

## 56 

---

# Parsing convention 

## The lambda-calculus grammar is 

## ambiguous 

- E.g., t1 t2 t3 can be parsed in different ways 

- We’ll use parentheses and associativity to     disambiguate 

## Convention 

- function abstraction: the scope of functions extends     as far to the right as possible (unless encountering     parentheses) 

- f. f x= f.(f x), not (f. f) x 

- function application is left associative 

- t 2 3 = ((t 2) 3), not t (2 3), suppose f = x. y. x + y 

# Reduction (Informally) 

 •(x. x) 3 = 3 

- using 3 to replace x •(y. (y+1)) 3 •(x. x) (z. z) •(x. x) (x. x) •(f. x. f (f x)) (y. y+1) = x. (y. y+1) ((y. y+1) x) = x. (y. y+1) (x+1) = x. (x+1)+1 •(f. x. f (f x)) (y. y*y) 

# Free and Bound Variables 

 “x. t” binds a new var x and its scope is t 

- Occurrences of x in t are said to be bound 

- Variable x is bound in x. (x+y) 

- A bound variable has a scope: In “x. t”, the scope of x is t 

- A bound variable is a “placeholder” and can be renamed 

- Function x. (x+y) is the same function as z. (z+y) Names of free (=unbound) variables matter 

- Variable y is free in x. (x+y) 

- Function x. (x+y) is not the same as x. (x+z) Example: x. ((y. y+2) x) + y 

- y in “y+2” is bound, while the second occurrence of y is free 

# Formal def. of free variables 

 Goal: define FV(t), the set of free variables of t 

 FV(x) = {x} FV(t 1 t 2 ) = FV(t 1 ) \/FV(t 2 ) FV(x. t) = FV(t) – {x} 

 FV(x. x) = FV(x) – {x} = {} FV(f. x. f (g x)) = FV(x. f (g x)) – {f} = FV(f (g x)) – {f,x} = {f,g,x} – {f,x} = {g} Exercise •FV((x. x) (y. y)) •FV(x. ((y. y+2) x) + y) 

## Alpha renaming (rename bound 

## variables) 

## x. t = y. [y/x] t () 

## when y is not free in t 

## x. x = y. y 

## x. ((y. y+2) x) + y, rename the first y to z 

- Becomes x. ((z. z+2) x) + y 

## x. y. x y = y. x. y – xrename x to y and 

## y to x 

# Capture-Avoiding Substitution 

 Notation: [t/x] t’ means using t to replace all free occurrences of x in t’ 

- Note: bound occurrences of x should not be affected Definition of [t/x] t’ [t/x] x = t, [t/x] y = y, where y is a variable different from x [t/x] (t1 t2) = ([t/x] t1) ([t/x] t2) [t/x] (x. t1) = x. t1 [t/x] (y. t1) = y. ([t/x] t1), where y is not free in t 

 [x. x / x] x = x. x [3/y] (x. x + y) = x. x + 3 [3/x] (x. x + y) = x. x + y [y/x] (y. x+y) = [y/x] (z. x+z) = z. y+z 

## 78 

## 910 

## 11 12 

---

# Reduction (Formal Semantics) 

## Basic computation rule is -reduction 

 (x. t’) t -> [t/x] t’ where substitution involves renaming as needed 

## Reduction sequence: 

- Apply the -reduction rule to any subterm 

- Repeat until no -reduction is possible 

## Normal form: a lambda-calculus term that 

## cannot be further reduced 

## Example: 

 •(f. x. f (f x)) (y. y+1) 3 

## Reduction Maybe Nonderterministic 

## An example of two beta-reduction sequences 

 •(y. y) ((y. y) 2) -> (y. y) 2 -> 2 

 •(y. y) ((y. y) 2) -> ((y. y) 2) -> 2 

## Confluence (Church-Rosser theorem): 

- Final result (if there is one) is uniquely determined 

# Reduction May Not Terminate 

## ΩCombinator: λ𝑥.ሺ𝑥 𝑥ሻ 

## Evaluate: Ω(λ𝑣.𝑣) ->(λ𝑥.ሺ𝑥 𝑥ሻ) (λ𝑣.𝑣) 

## ->(λ𝑣.𝑣) (λ𝑣.𝑣) ->(λ𝑣.𝑣) 

## Evaluate: ΩΩ->(λ𝑥.ሺ𝑥 𝑥ሻ) (λ𝑥.ሺ𝑥 𝑥ሻ) 

## ->(λ𝑥.ሺ𝑥 𝑥ሻ) (λ𝑥.ሺ𝑥 𝑥ሻ) ->... 

## Infinite loop! 

 15 

## Importance of Renaming Bound 

## Variables 

## Function application 

 (f. x. f (f x)) (y. y+x) 

 apply twice add x to argument 

## Substitute “blindly” and wrong result 

## [(y. y+x) / f ](x. f (f x)) 

## = x. [(y. y+x) ((y. y+x) x)]= x. x+x+x 

## Rename bound variables 

 (f. z. f (f z)) (y. y+x) 

## = z. ((y. y+x) ((y. y+x) z)))= z. z+x+x 

 Easy rule: always rename bound variables to be distinct 

 Wrong step 

# Programming in Lambda Calculus 

 17 

## Declarations as “Syntactic Sugar” 

 Informal Examples 

- let x = 3 in x + 4 

- let x = 3 let y = 4 in x + y + y •let f = x. x+1 in f(3) •let g = f. x. f(f (x)) in     let h = x. x+1        g h 2 Encoding of let 

- let x = N in M same as (x. M) N Syntactic sugar: the let is sweeter to write, but we can think of it as a syntactic magic 

## 13 14 

## 15 16 

## 17 18 

---

# Declarations as “Syntactic Sugar” 

 function f(x) return x+2 end; f(5); 

- same as let f =x. x+2 in (f 5) 

 block body declared function 

 (f. f(5)) (x. x+2) 

 Extra reading: Tennent, Language Design Methods Based on Semantics Principles.Acta Informatica, 8:97-112, 197 

# Encoding: Boolean 

## Booleans 

 Encoding “if” so that 

 Check IF TRUE t1 t2 = t1 and IF FALSE t1 t2 = t2 

 TRUE≜ λ𝑥. λ𝑦.𝑥 FALSE≜λ𝑥.λ𝑦.𝑦 

 Spec: IF 𝑏 𝑡 1 𝑡 2 ൌቊ𝑡1 when 𝑏 is TRUE 𝑡2 when 𝑏 is FALSE 

 Definition: IF ≜ λ𝑏. λ𝑡1.λ𝑡2.ሺ𝑏 𝑡 1 𝑡 2 ሻ 

# Encoding: Boolean 

## Booleans 

 Encoding of “and” 

 Check AND TRUE TRUE = TRUE and AND FALSE TRUE = FALSE 

 TRUE≜ λ𝑥. λ𝑦.𝑥 FALSE≜λ𝑥. λ𝑦.𝑦 

 Spec: AND 𝑏ଵ 𝑏ଶൌቊ TRUE when 𝑏ଵ,𝑏ଶ are both TRUE FALSE otherwise 

 Definition: AND≜ λ𝑏ଵ. λ𝑏ଶ. ሺ𝑏ଵ ሺ𝑏ଶ TRUE FALSEሻ FALSEሻ 

# Encoding: Boolean 

## Booleans 

 Encoding of “or” 

 Check OR TRUE TRUE = TRUE and OR FALSE FALSE = FALSE 

 TRUE≜ λ𝑥. λ𝑦.𝑥 FALSE≜λ𝑥. λ𝑦.𝑦 

 Spec: OR 𝑏ଵ 𝑏ଶൌቊ TRUE when 𝑒𝑖𝑡ℎ𝑒𝑟 𝑏ଵ 𝑜𝑟 𝑏ଶ is TRUE FALSE otherwise 

 Definition: OR≜ λ𝑏ଵ. λ𝑏ଶ. ሺ𝑏ଵ TRUE ሺ𝑏ଶ TRUE FALSEሻሻ 

# Church Encoding of Numbers 

## Natural numbers 

 Church numerals: n ≜ λ𝑓.λ𝑧.𝑓 𝑓 ...𝑓 𝑧... 

 0 ≜ λ𝑓.λ𝑧.𝑧 1 ≜ λ𝑓.λ𝑧.ሺ𝑓 𝑧ሻ 2 ≜ λ𝑓.λ𝑧.ሺ𝑓 ሺ𝑓 𝑧ሻሻ ... 

 n invocations of f 

# Church Numerals 

 Encoding of “൅1”: SUCC≜ λ𝑛.λ𝑓.λ𝑧. ሺ𝑓 ሺ𝑛 𝑓 𝑧ሻሻ 

 Check “SUCC 2”ൌ 3 

 Encoding of PLUS PLUS ≜ λ𝑛ଵ.λ𝑛ଶ. ሺ𝑛ଵ SUCC 𝑛 2 ሻ 

 Check “PLUS 1 2” ൌ 3 

 Multiplication and exponentiation can also be encoded. 

## 19 20 

## 21 22 

## 23 24 

---

# Pure vs. Applied λ-Calculus 

## Pure λ-Calculus: the calculus discussed so far 

## Applied λ-Calculus: 

- Built-in values and data structures 

- (e.g., 1, 2, 3, true, false, (1 2 3)) 

- Built-in functions 

- (e.g., +, ∗, /, and, or) 

- Named functions •Recursion 

## 25 

