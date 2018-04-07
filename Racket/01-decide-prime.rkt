; Adapted from https://docs.racket-lang.org/reference/pairs.html
; http://mathforum.org/library/drmath/view/57036.html

; A prime number is one with exactly two positive divisors, itself and one.
; 1 is neither a prime nor a composite number. Zero is not a prime or a composite number either. Zero has an infinite 
; number of divisors.
; By the usual definition of prime for integers, negative integers can not be prime.
; Negative integers can be prime. In fact the integer -p is prime whenever p,
; but since they are associates, we really do not have any new primes.
; So in this example we only cosider number n > 1.
#lang racket

; andmap return first #f from the lambda function.
; lamda return #f if remainder of n and div is 0. n is not prime number.
; List of dividers to feed the lambda function. Numbers from 2 until n/2. +1 had to be added for the case of '4'.
; in-range creates stream of integers.
; stream->list converts stream from into list, which feeds andmap
; Example: (prime? 7)
; Returns: #t
(define (isprime? n)
  (if (> n 1)
      (andmap (lambda (div) (if (= (remainder n div) 0) #f #t))
          (stream->list (in-range 2 (+ (/ n 2) 1))))
      #f))

; Helper function to calculate if the number is prime using recursion.
; Inputs m:Number to check n:Number to divide m to check if there is a remainer.
; Every recursion adds 1 to n.
; Keep recuring until n is m/2.
; Example: (prime-helper 12 2)
; Returns: #f
(define (prime-helper m n)
  (if (> n (/ m 2))
      #t ;end of the recursion. No dividers left
      (if (= (remainder m n) 0)
          #f ; Divided with 0 remainder. Divisor found.
          (prime-helper m (+ n 1)))))

; Recursive version with helper method. Using method prime-helper to calculate prime for each posible divisions.
; Check for positive number bigger than 1 and provide smallest divider for prime-helper.
; Example: (define (isprime? 7)
; Returns: #t
(define (decide-prime m)
  (if (> m 1)
      (prime-helper m 2)
      #f)) ; (0 1) are not prime numbers. 