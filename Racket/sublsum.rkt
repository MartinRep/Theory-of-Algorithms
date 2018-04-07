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


; Sums all the elements of the list and return list of the all the possible combinations of list elements
; that sums to 0.(combination l) returns list of all the possible combinations of elements, lambda function applies it to the if statement
; which calls mySum function to check if summary of elements is 0. The results are filtered out through filter function with condition pair?,
; this eliminates all the empty list.
; > (sublsum '(1 2 3 5 4 -5))
; '((2 3 -5) (5 -5) (1 4 -5))
(define (sublsum l)
  (filter pair?(myMap (lambda(subl) (if (= (mySum subl) 0)
                                        subl
                                        null))
                      (combinations l))))


