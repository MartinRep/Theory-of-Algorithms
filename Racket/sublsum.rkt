#lang racket

(define (mySum L)
  (if (empty? L) 0
      (+ (car L) (mySum (cdr L))))
  )

(define (sublsum l)
  (map (lambda(subl) (if (= (mySum subl) 0)
                         subl
                         null))
       (combinations l)))

