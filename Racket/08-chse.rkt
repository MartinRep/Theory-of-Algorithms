#lang racket

; Takes 3 list of equal lenght.
; Returns list containing element of list Y at the position where list X has 1
; and element of list Z at the position where list X has NOT 1
; Uses simple condition and recursion. Checks every element of list X and call recursively itself with
; the rest of the lists elements

(define (chse X Y Z)
  (if (null? X) null
      (if (= (car X) 1)
          (cons (car Y) (chse (cdr X) (cdr Y) (cdr Z)))
          (cons (car Z) (chse (cdr X) (cdr Y) (cdr Z))))))