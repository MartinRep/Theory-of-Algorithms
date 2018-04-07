#lang racket

; Return number of positions where the elements of lists differ.
; Simple condition with recursion. If elements differ add 1 to recursion call.
; To return number of positions where the elements of the list are equal, simply exchange 0 and 1 in condition
; > (hamming-distance '(1 0 1 0 1 1 1 0) '(1 1 1 1 0 0 0 0 ))
; 5

(define (hamming-distance L M)
  (if (null? L)
      0
      (if (= (car L) (car M))
          (+ 0 (hamming-distance (cdr L) (cdr M)))
          (+ 1 (hamming-distance (cdr L) (cdr M))))))