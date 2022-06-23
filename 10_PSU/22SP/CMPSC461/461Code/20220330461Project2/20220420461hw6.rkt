#lang racket
(define al '())


(define ackermann
  (lambda (m n) ;put in m,n
    (cond ((= m 0) (+ 1 n));done
          ((> m 0) (if (= n 0) (ackermann (- m 1) 1) (ackermann (- m 1) (ackermann m (- n 1)))))
          (else "error")
          )))

;(define bind (lanbda(k v al)

(ackermann 0 1)
(ackermann 1 0)
(ackermann 1 1)
(ackermann -1 1)


;(bind k v al)
(define (lookup k al)
  (let ((tmp (assoc k al)))(cond
                             ((boolean? tmp) tmp)
                             (else (cdr tmp)))))

(define (bind k v al)
  (append (list (cons k v)) al))

(define ackermann_mem
  (lambda (m n) ;put in m,n
    (if (equal? #f (lookup (list m n) al))
        ;"memoization hit \n"
        (begin
          (set! al (bind (list m n) (ackermann m n) al))
          (lookup (list m n) al))
        (begin
          (display "memoization hit \n")
          (lookup (list m n) al))
        )))

(define (construct_mem f)
  (let ((al '()))
    (lambda (m n)
      (if (equal? #f (lookup (list m n) al))
          ;"memoization hit \n"
          (begin
            (set! al (bind (list m n) (f m n) al))
            (lookup (list m n) al))
          (begin
            (display "memoization hit \n")
            (lookup (list m n) al))
          ))))


