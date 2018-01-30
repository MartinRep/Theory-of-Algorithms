; Adapted from https://docs.racket-lang.org/reference/pairs.html
#lang racket

; andmap return first #f from the lambda function.
; lamda return #f if remainder of n and div is 0. n is not prime number.
; List of dividers to feed the lambda function. Numbers from 2 until n/2. +1 had to be added for the case of '4'.
(define (prime? n)
  (andmap (lambda (div) (if (= (remainder n div) 0) #f #t))
          (stream->list (in-range 2 (+ (/ n 2) 1)))))


; Helper function to calculate if the number is prime using recursion.
; Inputs m:Number to check n:Number to divide m to check if there is a remainer.
; Every recursion adds 1 to n.
; Keep recuring until n is m/2.
(define (prime-helper m n)
  (if (> n (/ m 2)) #t
   (if (= (remainder m n) 0)
       #f
       (prime-helper m (+ n 1))
       )))

; Recursive version with helper method. Using method prime-helper to calculate prime for each posible divisions.
; Provide smallest divider as second argument 2
(define (isprime? m)
      (prime-helper m 2))