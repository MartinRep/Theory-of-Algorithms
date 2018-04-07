; Adapted from https://en.wikipedia.org/wiki/Collatz_conjecture

; The Collatz conjecture is a conjecture in mathematics that concerns a sequence defined as follows:
; Start with any positive integer n. Then each term is obtained from the previous term as follows:
; If the previous term is even, the next term is one half the previous term.
; Otherwise, the next term is 3 times the previous term plus 1. The conjecture is that no matter what value of n,
; the sequence will always reach 1.


#lang racket

; Helper function. If m is a odd number multiplies it by 3 and add 1
; If m is even number divides it by 2
; Example: (collatz-helper 7) Returns: 22
; Example: (collatz-helper 22) Returns: 11
(define (collatz-helper m)
  (if (= (remainder m 2) 0)
  (/ m 2)
  (+ (* m 3) 1)))

; Recursive method to produce collatz sequence of a number m.
; Uses collatz-helper to determine next sequence number and assain it as n
; If n = 1 creates a list
; Else calls itself with number n and adds the result to created list
; Example: > (collatz-list-old 10)
; Returns: '(10 5 16 8 4 2 1)
(define (collatz-list-old m)
  (let ([n (collatz-helper m)])
        (if (= n 1)
            (list m 1)
            (cons m (collatz-list-old n )))))

; Simplified version
; Example: > (collatz-list-old 10)
; Returns: '(10 5 16 8 4 2 1)
(define (collatz-list m)
  (if (= m 1)
      (list m)
      (cons m (collatz-list (if (= (remainder m 2) 0)
                                (/ m 2)
                                (+ (* m 3) 1))))))