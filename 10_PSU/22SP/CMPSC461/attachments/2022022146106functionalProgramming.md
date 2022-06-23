[[2022022146106functionalProgramming.pdf]]
## Programming Language 

## Concepts 

###### Gary Tan 

###### Computer Science and Engineering 

###### Penn State University 

 CS 461 

 * Some slides are adapted from those by Dr. Danfeng Zhang 

## Chap 11 Functional Languages 

# Supplementary Slides 

 2 

 3 

## Why Study Functional Programming (FP)? 

 Expose you to a new programming model 

- FP is drastically different 

- Scheme: no loops; recursion everywhere FP has had a long tradition 

- Lisp, Scheme, ML, Haskell, ... 

- The debate between FP and imperative programming FP continues to influence modern languages 

- Most modern languages are multi-paradigm languages 

- Delegates in C#: higher-order functions 

- Python: FP; OOP; imperative programming 

- Scala: mixes FP and OOP 

- C++11: added lambda functions 

- Java 8: added lambda functions in 2014 

- Erlang: behind WhatsApp^4 

## A Brief History of Functional Programming 

 Theoretical foundation: Lambda calculus 

- Alonzo Church (1930s) 

- Computability: Lambda calculus = Turing Machine 

- Church-Turing Thesis Lisp (McCarthy, 1950s) 

- Directly based on lambda calculus 

- Mostly used for symbolic computation (e.g., symbolic     differentiation) Scheme (Steele and Sussman, 1970s) 

- A relatively small language that provides constructs at the     core of Lisp 

- Racket is a variant of Scheme OCaml; Haskell; F#;... 

## Racket 

 5 6 

## Learning Functional Programming in Racket 

###### Follow the lectures 

###### Chap 11 in the textbook 

###### Online tutorials (links on the course website) 

- Racket guide: https://docs.racket-lang.org/guide/ 

- Especially chapter 2 

## 12 

## 34 

## 56 

---

 7 

### DrRacket 

###### An interactive, integrated, graphical programming 

###### environment for Racket 

###### Installation 

- You could install it on your own machines 

- [http://racket-lang.org/](http://racket-lang.org/) 

###### Interactive environment 

- read-eval-print loop 

- try 3.14159, (* 2 3.14159) 

- Compare to typical Java/C development cycle 

 8 

### DrRacket: Configuration 

###### #lang racket 

###### Select View->Hide Definitions to focus on 

###### interpreter today 

## Functional Programming in 

## Racket 

 9 10 

## Racket Identifiers 

###### Identifiers 

- (define pi 3.14) 

- No need to declare types 

###### Identifier names are case sensitive 

- In contrast, Scheme identifiers are case insensitive 

 11 

## Racket Expressions 

###### Prefix notation (Polish notation): 

- _3+4_ is written in Racket as (+ 3 4) 

- Parentheses are necessary 

- Compare to the infix notation: (3 + 4) 

######  4+(5 * 7) is written as 

- (+ 4 (* 5 7)) 

- Parentheses are necessary 

###### Exercise: write the following in Racket 

- _(3 + 8) + 2_ 

- _3 + 8/2_     12 

## Racket Expressions 

###### General syntax: (E 1 E 2 ... Ek) 

- Applying the function E1 to arguments E2, ..., Ek 

- Examples: (+ 3 4), (+ 4 (* 5 7)) 

- Uniform syntax, easy to parse 

 Function arguments 

 Function to invoke 

#### 78 

#### 910 

#### 11 12 

---

## Built-in Functions 

###### +, * 

- take 0 or more parameters 

- applies operation to all parameters together 

- (+ 2 4 5) 

- (* 3 2 4) 

- zero or one parameter?     –(+)     –(*)     –(+ 5) 

- (* 8) 

 13 14 

## User-Defined Functions 

###### Mathematical functions 

- Take some arguments; return some value 

###### E.g., f(x) = x^2 

- _f(3) = 9; f(10) = 100_ 

###### Racket syntax 

- (define (square x) (* x x)) 

###### A two-argument function: f(x,y) = x + y^2 

- (define (f x y) (+ x (* y y))) 

- calling the function: (f 3 4) 

 15 

## Anonymous Functions 

###### Syntax based on Lambda Calculus:  x. x^2 

###### Anonymous functions 

- (lambda (x) (* x x)) 

- Can be used only once: ((lambda (x) (* x x)) 3) 

- Introduce names 

- (define square (lambda (x) (* x x))) 

- Same as (define (square x) (* x x)) 

## Racket Parenthesis 

###### Racket is very strict on parentheses 

- which is reserved for function call (function     invocation) 

- (+ 3 4) vs. (+ (3) 4) 

- (lambda (x) x) vs. (lambda (x) (x)) 

- the second treats (x) as a function call 

- (lambda (x) (* x x) vs. (lambda (x) (* (x) x)) 

## Defining Recursive Functions 

###### (define diverge (lambda (x) (diverge (+ x 1)))) 

- Call this a diverge function 

## Booleans 

###### Boolean values 

- \#t, \#f for true and false 

###### Predicates: funs that evaluate to true or false 

- convention: names of Racket predicates end in “?” 

- number?: test whether argument is a number •equal? 

- ex: (equal? 2 2), (equal? x (* 2 y)), (equal? \#t \#t) 

- =, >, <, <=, >= 

- = is only for numbers 

- (= \#t \#t) won’t work 

- and, or, not 

- (and (> 7 5) (< 10 20)) 

#### 13 14 

#### 15 16 

#### 17 18 

---

## If expressions 

###### If expressions 

- (if P E1 E2) 

- eval P to a boolean, if it’s true then eval E1, else eval E2 

- examples: max 

- (define (max x y) (if (> x y) x y)) 

- It does not evaluate both branches 

- (define (f x) (if (> x 0) 0 (diverge x)) 

- what is (f 1)? what is (f -1) 

## Mutual Rec. Functions 

- even = true, if n =0     odd(n-1), otherwise 

- odd = false, if n =0     even(n-1), otherwise 

###### (define myeven? 

###### (lambda (n) 

###### (if (= n 0) \#t (myodd? (n 1))))) 

###### (define myodd? 

###### (lambda (n) 

###### (if (= n 0) \#f (myeven? (n 1))))) 

## Multi-Case Conditionals 

 (cond [P 1 E 1 ] ... [PnEn] [else En+1]) •“If P E 1 E 2 ” is a syntactic sugar examples 

- Problem: Write a function to assign a grade based on the value of a test score. an A for a score of 90 or above, a B for a score of 80-89, a     C for a score of 70-79, a D for 60-69, a F otherwise. (define (testscore x)(cond [(>= x 90) 'A]     [(>= x 80) 'B]     [(>= x 70) 'C]     [(>= x 60) 'D]     [else 'F])) Discuss DrRacket “definition” panel Debugging support; set up break points Strings in Racket: “Hello” is case sensitive 22 

## Higher-Order Functions 

###### Functions that 

- take functions as arguments 

- return functions as results 

###### Example: 

- _g(f,x) = f(f(x))_ •if _f 1 (x) = x + 1_ ,     then _g(f 1 ,x) = f 1 (f 1 (x)) = f 1 (x+1) = (x+1) + 1 = x + 2_ •if _f 2 (x) = x_^2 ,     then _g(f 2 ,x) = f 2 (f 2 (x)) = f 2 (x_^2 _) = (x_^2 _)_^2 _= x_^4 

 23 

### Higher-Order Functions in Racket 

###### The ability to write higher-order functions 

###### Functions are first-class citizens in Racket 

###### Examples: 

 (define (twice f x) (f (f x))) (define (plusOne x) (+ 1 x)) (twice plusOne 2) (twice square 2) (twice (lambda (x) (+ x 2)) 3) 

 24 

### A Graphical Representation of Twice 

- (define (twice f x) (f (f x))) 

- It takes a function f and an argument x, and returns     the result of applying f to x twice 

### twice 

##### f 

##### x (f (f x)) 

###### Q: Would Racket accept (twice plusOne)? 

#### 19 20 

#### 21 22 

#### 23 24 

---

 25 

## Writing Twice in a Different Way 

###### (define (twiceV2 f) 

###### (lambda (x) (f (f x)))) 

### twiceV2 

##### f 

##### x 

##### (f (f x)) 

###### twiceV2 takes a function f as its argument, and 

###### returns a function, which takes x as its 

###### argument and returns (f (f x)) 

###### Q: Would Racket accept (twiceV2 plusOne)? 

## Let constructs 

###### (let ([x 1 E 1 ] [x 2 E 2 ] ... [xkEk]) E) 

 •Semantics –E 1 , ..., Ekare all evaled; then E is evaled, with xirepresenting the value of Ei. The result is the value of E 

- The scope of x 1 , ..., xk is E 

- Simultaneous assignment •examples 

- (* (+ 3 2) (+ 3 2)) is OK, but repetitive 

- writing (let ([x (+ 3 2)]) (* x x))) is better 

- (+ (square 3) (square 4)) to 

- (let ([three-sq (square 3)] [four-sq (square 4)]) (+ three-sq     four-sq)) –(define x 0) (let [(x 2) (y x)] y) to 0 

## Let* constructs 

 (let* ([x1 E1] [x2 E2] ... [xk Ek]) E) 

- binds x_i to the val of E_i before E_{i+1} is evaled 

- The scope of x 1 is E2, E3,... and Ekand E •example:     (define x 0)     (let ([x 2] [y x]) y) to 0     (let* ([x 2] [y x]) y) to 2 

- let* is a syntactic sugar 

- (let* ([x 2] [y x]) y) = (let ([x 2]) (let ([y x]) y) (define x 0) (define y 1) (let ([x y] [y x]) y) to 0 (let* ([x y] [y x]) y) to 1 

## Letrec constructs 

###### (letrec ([x1 E1] [x2 E2] ... [xk Ek]) E) 

- The scope of x 1 is E1, E2,... and Ekand E 

###### (letrec 

###### ([fact (lambda (n) 

###### (if (= n 0) 1 (* n (fact (n 1)))))]) 

###### (fact 3)) 

###### the let won’t work 

#### 25 26 

#### 27 28 

