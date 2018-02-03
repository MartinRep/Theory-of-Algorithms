#lang racket

; Helper function. If m is a odd number multiplies it by 3 and add 1
; If m is even number divides it by 2
(define (collatz-helper m)
  (if (= (remainder m 2) 0)
  (/ m 2)
  (+ (* m 3) 1)))

; Recursive method to produce collatz sequence of a number m.
; Uses collatz-helper to determine next sequence number and assain it as n
; If n = 1 creates a list
; Else calls itself with number n and adds the result to created list
(define (collatz-list-old m)
  (let ([n (collatz-helper m)])
        (if (= n 1)
            (list m 1)
            (cons m (collatz-list-old n )))))

; Simplified version
(define (collatz-list m)
  (if (= m 1)
      (list m)
      (cons m (collatz-list (if (= (remainder m 2) 0)
                                (/ m 2)
                                (+ (* m 3) 1))))))