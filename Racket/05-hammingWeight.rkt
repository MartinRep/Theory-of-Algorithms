#lang racket

; Return number of non-zero elements in the list.
; > (hamming-weight '( 1 0 1 0 1 1 1 0))
; 5

(define (hamming-weight L)
  (if (null? L)
      0
      (+ (car L) (hamming-weight (cdr L)))))