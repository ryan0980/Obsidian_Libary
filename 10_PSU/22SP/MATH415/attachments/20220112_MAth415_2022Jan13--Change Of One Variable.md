# Packet 2: Functions of Random Variables 

## Chap 5.1 Function of One Random Variable 

 STAT 414 has introduced distributions that are meaningful and mathematically continent. 

_Motivation_ : 

- What if the distribution of a random variable is uncommon but some transformation     leads to a common distribution? 

- Sometimes, we can also apply simple tools to the transformed variable.     E.g. the time series of world population is as follows: 

 Year Pop Size (million) log(Size) (base 10) 1 170 8.23 400 190 8.28 800 220 8.34 1200 360 8.56 1600 545 8.74 1800 900 8.95 1850 1200 9.08 1900 1625 9.20 1950 2500 9.40 1975 3900 9.59 2000 6080 9.78 

---

- Change the support of the random variable, e.g. logit transformation on a proportion     variable. 

Question: After the distribution of transformed variable is estimated, how about the original one? Let us assume the distribution of a continuous random variable _X_ follows a common distribution, e.g. log income follows a normal distribution. What is the distribution of the income at the original scale, _Y_ = exp( _X_ )? 

So we need a theory to figure out the distribution of _Y_ = _u_ ( _X_ )for any transformation _u_ (_._ ) that is a 1-1 mapping. 

Qiestion: How do we uniquely define a distribution? 

---

Example 5.1-1 (p.g. 163) Let _X_ have a gamma distribution with p.d.f. 

 f ( x ) = 

### 1 

 Γ( α ) θα 

 xα −^1 e − x/θ, 

where 0 _< x <_ ∞, _α >_ 0 and _θ >_ 0. 

Question: what is the distribution of _Y_ = _eX_? 

---

_Shortcut for the change of variable (univariate case):_ 

 Let X be a continuous random variable with p.d.f. f( x ). When u (. )is a 1-1 mapping: 

- _Y_ = _u_ ( _X_ )is an strictly increasing function of X with inverse function _X_ = _v_ ( _Y_ ). 

- _Y_ = _u_ ( _X_ )is an strictly decreasing function of X with inverse function _X_ = _v_ ( _Y_ ). 

---

Whenu(.)is not a 1-1 mapping: 

 Example: X has a Cauchy distribution with p.d.f. 

 f(x) = 

### 1 

 x(1 +x^2 ) 

### , 

 where−∞< x <∞. 

 Question, what is the distribution ofY =X^2? 

---

 More examples 5.1-3, 5.1-5. 

 Practice: Is this a one-one mapping? 

1. Xhas p.d.f.f(x) =πe− _x_ 

(^2) _/_ 2 , 0 < x <∞. Find the p.d.f. ofY =X^2. 

2. Xhas p.d.f.f(x) = _e_ 

 − x (1+ e − x )^2 ,−∞< x <∞. Find the p.d.f. ofY = 

 1 1+ e − X. 

3. Xfollows the Uniform distributionU(− 1 ,3). Find the p.d.f. ofY =X^2. 

_A special case. Theorem 5.1-1:_ LetF(x) =P(X < x)have the properties of a c.d.f.: strictly increasing ona < x < b,F(a) = 0andF(b) = 1. IfY∼U(0,1)andY =F(X), then the random variableX=F−^1 (Y)will have c.d.f.F(x). 

---

## Chap 5.2 Function of Two Random Variables 

Question: What if two random variables are involved in the transformation? 

Answer: The rule is the same as that in the univariate case, with derivative being replaced by the Jacobian. (p.g. 171) 

---

Example 5.2-1: LetX 1 ,X 2 have the joint p.d.f.f(x 1 ,x 2 ) = 2for 0 < x 1 < x 2 < 1. 

Question 1: What is the joint distribution ofY 1 =X 1 /X 2 andY 2 =X 2? 

Question 2: AreX 1 andX 2 independent? How aboutY 1 andY 2? 

---

More examples: 5.2-2, 5.2-3. 

Example 5.2-4: Let two independent variablesU∼χ^2 (r 1 )V ∼χ^2 (r 2 ). 

Question: What is the distribution ofF= _U/rV/r_^12? 

