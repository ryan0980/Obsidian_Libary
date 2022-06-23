#lang racket
;shi qiu sbq5043



;1
(define remove-when
  (lambda (f l) ;put in the condition
    (cond ((null? l) l);done
          ((f (car l)) (remove-when f (cdr l)))(else (cons (car l) (remove-when f (cdr l)))))))
          

;2
(define (minInt x)
  (if (null? x) "null" (minInt_helper (list-ref x 0) x))
  )

(define (minInt_helper k x)
  (if (null? x) k 
      (if (> k (list-ref x 0)) 
          (begin
            ;(print "11")
            ;(print x)
            (set! k (list-ref x 0))
            (minInt_helper k (cdr x))
            )
          (begin
            ;(print " 22")
            ;(print x)
        
            (minInt_helper k (cdr x))
            )
          )
      )
  );k is int, x is list

;(list-ref (list "hop" "skip" "jump") 0)    ; extract by position



;3



(define (plusOne x)(+ 1 x))

(define (manycall n f x)
  (cond
    [(< n 2) x];return x
    [(even? n)(f (f(manycall(- n 2) f x)))]; if it is even, do 2 time and minues 2
    [else (manycall (- n 1) f x)]
    ))



;4

(define (to-words-one x) (cond
                           [(= 1 x)"one"]
                           [(= 2 x)"two"]
                           [(= 3 x)"three"]
                           [(= 4 x)"four"]
                           [(= 5 x)"five"]
                           [(= 6 x)"six"]
                           [(= 7 x)"seven"]
                           [(= 8 x)"eight"]
                           [(= 9 x)"nine"]
                           ))


(define (to-words-ten x)
  (cond
    [(= 0 (remainder x 10))
     (cond
       [(= 1 (/ x 10)) "ten"]
       [(= 2 (/ x 10)) "twenty"]
       [(= 3 (/ x 10)) "thirty"]
       [(= 4 (/ x 10)) "forty"]
       [(= 5 (/ x 10)) "fifty"]
       [(= 6 (/ x 10)) "sixty"]
       [(= 7 (/ x 10)) "seventy"]
       [(= 8 (/ x 10)) "eighty"]
       [(= 9 (/ x 10)) "ninety"]
       [else "error"])]
    [(and (< 1 (/ x 10)) (> 2 (/ x 10)))(cond
                                          [(= 1 (remainder x 10)) "eleven"]
                                          [(= 2 (remainder x 10)) "twelve"]
                                          [(= 3 (remainder x 10)) "thirteen"]
                                          [(= 4 (remainder x 10)) "fourteen"]
                                          [(= 5 (remainder x 10)) "fifteen"]
                                          [(= 6 (remainder x 10)) "sixteen"]
                                          [(= 7 (remainder x 10)) "seventeen"]
                                          [(= 8 (remainder x 10)) "eighteen"]
                                          [(= 9 (remainder x 10)) "nineteen"]
                                          [else "error"])]
    [(< 2 (/ x 10)) 
     (cond
       [(and (< 2 (/ x 10)) (> 3 (/ x 10))) 
        (begin(print "twenty")(to-words-one(remainder x 10)))]
       [(and (< 3 (/ x 10)) (> 4 (/ x 10))) 
        (begin(print "thirty")(to-words-one(remainder x 10)))]
       [(and (< 4 (/ x 10)) (> 5 (/ x 10))) 
        (begin(print "forty")(to-words-one(remainder x 10)))]
       [(and (< 5 (/ x 10)) (> 6 (/ x 10))) 
        (begin(print "fifty")(to-words-one(remainder x 10)))]
       [(and (< 6 (/ x 10)) (> 7 (/ x 10))) 
        (begin(print "sixty")(to-words-one(remainder x 10)))]
       [(and (< 7 (/ x 10)) (> 8 (/ x 10))) 
        (begin(print "seventy")(to-words-one(remainder x 10)))]
       [(and (< 8 (/ x 10)) (> 9 (/ x 10))) 
        (begin(print "eighty")(to-words-one(remainder x 10)))]
       [ (< 9 (/ x 10)) 
         (begin(print "ninety")(to-words-one(remainder x 10)))]
       )]
    [else "error"]
    )
  )



(define (to-words x)
  (cond
    [(= 0 (remainder x 100)) "one hundred"]
    [(< 1 (/ x 100)) 
     (begin
       (print "one hundred and")
       (to-words-ten (- x 100)))]
    [else (to-words-ten x)]
    ))

;5
(define (initialWIList x) (map (lambda(y) (list y (+ 1 (index-of x y)))) x)) ;set number to each list item

(define wordInList #f)      ;false initial
(define (mergeWI x y) (if (null? y)
                          (if (equal? wordInList #t) '() (list x))(if (equal? (car x) (car (car y)))
                                                                      (begin (set! wordInList #t) (cons (list (car x) (+ (car (cdr (car y))) 0)) (mergeWI x (cdr y))))(cons (car y) (mergeWI x (cdr y)))) ))



(define (mergeByWord x) (if (null? x)
                            '()
                            (begin
                              ;(print "---")
                              ;(print x)
                              ;(print (car x))
                              (set! wordInList #f)
                              (set! x (mergeWI (car x) (cdr x)))
                              ;(print x)
                              (cons (car x) (mergeByWord (cdr x)))
                              )))


(define (reduce f l v)
  (if (null? l) v
      (f (car l) (reduce f (cdr l) v))))

(define (wordMaxIndex x) (initialWIList x))

(print "--test------------------------------1")
(remove-when (lambda (x) (> x 3)) (list 2 6 8))
(remove-when (lambda (x) (< x 3)) (list 2 6 8))


(print "------------------------------------2")
(minInt (list 2 6 8))
(minInt '())
(minInt_helper 8 (list 7 6 9))
(print "------------------------------------3")
(manycall 2 plusOne 10)
(manycall 3 plusOne 10)

(manycall 8 plusOne 10)

(manycall 9 plusOne 10)
(print "------------------------------------4")
(to-words 100)
(to-words 111)
(to-words 115)
(to-words 119)
(to-words 121)
(to-words 135)
(to-words 148)
(to-words 199)
(to-words 10)

(print "------------------------------------5")
(initialWIList '(time is long but life is short))
(mergeWI '(life 4) '((time 0) (is 5)))
(mergeWI '(is 1) '((time 0) (is 5)))
(set! wordInList #f);reinitialize
(mergeWI '(life 4) '((time 0) (is 5)))
(set! wordInList #f);reinitialize
(mergeWI '(ia 1) '((ia 1) (ia 2) (is 5)))
(set! wordInList #f);reinitialize
;(mergeByWord '((time 1) (is 2) (long 3)(is 2)))

;(print"---0000---")
(wordMaxIndex '(time is long but life is short))
;https://www.geeksforgeeks.org/convert-number-to-words/