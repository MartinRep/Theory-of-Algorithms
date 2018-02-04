#lang racket

(define (rcycle-helper m n)
  (if (pair? m)
      (append m (rcycle-helper (car m) n))
       (list n)))

(define (rcycle m)
  (rcycle-helper (cdr m) (car m)))

