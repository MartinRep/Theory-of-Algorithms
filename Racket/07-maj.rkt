#lang racket

; Function takes 3 lists of equal lenght containing 0 and 1.
; Returns list of 0 1, where 1 is on the position where 2 or more list contain 1.
; uses cond a multiple option condition statement to determine element equality and recursively continue to do so.
; > (maj '(0 0 0 0 1 1 1 1) '(0 0 1 1 0 0 1 1) '(0 1 0 1 0 1 0 1))
; '(0 0 0 1 0 1 1 1)

(define (maj X Y Z)
  (cond [(null? X) null] 
        [(= (car X)(car Y))(cons (car X)(maj (cdr X)(cdr Y)(cdr Z)))] 
        [(= (car X)(car Z))(cons (car X)(maj (cdr X)(cdr Y)(cdr Z)))] 
        [(= (car Y)(car Z))(cons (car Y)(maj (cdr X)(cdr Y)(cdr Z)))] 
        [else (maj (cdr X)(cdr Y)(cdr Z))]))