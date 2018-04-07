#lang racket

;Sums elements of the list L, if empty returns 0
(define (mySum L)
  (if (null? L) 0
      (+ (car L) (mySum (cdr L))))
  )

; My implementation of map function. Applies all the elements of list l to the function f.
(define (myMap F L)
  (if (null? L)
      null
      (cons (F (car L)) (myMap F (cdr L)))))

; Takes two lists L and M with equal lenght containing numbers.
; Returns the distance given by the sum of the square residuals between the numbers in the lists.
; d = E(li - mi)2
;     i
; Lamda function feeds elements of both lists to the function (Element of L - Element of M) squared.
; MyMap function combine the results into one list
; MySum function summarize the elements of the list of results.
; > (lstq (list 4.5 5.1 6.2 7.8) (list 1.1 -0.1 6.1 3.8))
; 54.61

(define (lstq L M)
  (mySum (map (lambda (X Y) (* (-  X  Y) (-  X  Y))) L M)))