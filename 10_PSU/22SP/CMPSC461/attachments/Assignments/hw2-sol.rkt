#lang racket

; solution of problem 1
(define (funPower f n)
   (if (<= n 0)
       (lambda (x) x)
       (lambda (x) ((funPower f (- n 1)) (f x)))))

(define (encode n)
   (lambda (f) (lambda (z) ((funPower f n) z))))

(define (decode n)
   ((n (lambda (x) (+ 1 x))) 0))

(define (MULT n1 n2)
   (lambda (f) (n2 (n1 f))))

;;
; solution of problem 2
(define (merge lst1 lst2)
   (cond
      ((null? lst1) lst2)
      ((null? lst2) lst1)
      (#t (let ((e1 (car lst1)) (e2 (car lst2)))
           (if (< e1 e2) (cons e1 (merge (cdr lst1) lst2))
                         (cons e2 (merge lst1 (cdr lst2))))))))
;;
; solution of problem 3
(define (findMax lst)
    (if (null? lst) 0
        (if (list? (car lst))
            (max (findMax (car lst)) (findMax (cdr lst)))
            (max (car lst) (findMax (cdr lst))))))

;;
; solution of problem 4
(define (lstEvenSum lst)
  (cond ((null? lst) 0)
        ((null? (cdr lst)) 0)
        (else (+ (car (cdr lst)) (lstEvenSum (cdr (cdr lst)))))))
;;
; solution of problem 5
(define (trunc a b lst)
  (map (lambda (x) (cond ((< x a) a)
                         ((> x b) b)
                         (else x))) lst))

(define (lstOR lst)
  (foldl (lambda (ans e) (or ans e)) #f lst))

(define (geq lst1 lst2)
  (foldl (lambda (b1 b2) (and b1 b2)) #t (map >= lst1 lst2)))

