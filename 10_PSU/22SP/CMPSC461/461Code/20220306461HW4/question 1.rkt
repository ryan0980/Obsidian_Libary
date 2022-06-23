;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |question 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


(define (sum x y)
  (if (= x y) x (+ x (sum (+ x 1) y)))
  )

(define (F x)
  (if (= x 0) 1 (- x (M (F (- x 1))))))
  

(define (M x)
  (if (= x 0) 0 (- x (F (M (- x 1))))))
  

(define (reward x)
  (cond
	[(< x 2000) (* x 0.01)]
	[(< x 4000) (+ (* (- x 2000) 0.015) 20)]
	[(< x 5500) (+ (* (- x 4000) 0.02) 50)]
	[else (+ (* (- x 5500) 0.025) 80)]
	)
  )

;test

(sum 1 5)
(sum 3 3)

(F 3)

(reward 11500)
(reward 10000)
(reward 100)
