#lang racket

; Takes in 3 lists containing 0 and 1s.
; Returns list of 0 and 1s, 1 on the position where elements are odd and 0 otherwise
; Checks remainder of summary od element on position is equal 0. Even number of 1s on position.
; Adds 0 and call itself with remaining elements of the lists.
; Otherwise number of 1s is odd, adds 1 and call itself with remaining elements of the lists.

(define (sod2 X Y Z)
  (if (null? X)
      null
      (if (= (remainder (+ (car X) (car Y) (car Z)) 2) 0)
          (cons 0 (sod2 (cdr X) (cdr Y) (cdr Z)))
          (cons 1 (sod2 (cdr X) (cdr Y) (cdr Z))))))